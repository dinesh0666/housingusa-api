<?php

namespace App\Services\ApiResponse;

use Symfony\Component\HttpKernel\Exception\HttpExceptionInterface;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Services\Constants\AppSuccessCodes;

/*
 * Description of ApiResponse
 *
 * @author Suresh
 */
class ApiResponse
{
    /**
     * @var AppSuccessCodes
     */
    private $appSuccessCodes;

    public function __construct(AppSuccessCodes $appSuccessCodes)
    {
        $this->appSuccessCodes = $appSuccessCodes;
    }
    public function response($data = null, $successCode = 0, $httpResponseCode = 200)
    {
        $message = $this->appSuccessCodes->getMessageForCode($successCode);
        $response['data'] = $data;
        $response['status'] = ['success' => true, 'http_code' => 200, 'message' => $message];

        return new JsonResponse($response, $httpResponseCode, ['Access-Control-Allow-Origin' => '*']);
    }
    /**
     * Generates custom error responses.
     *
     * @param Exception $exception
     *
     * @return \Illuminate\Http\Response
     */
    public function handleException($exception)
    {
        $errorCode = null;
        $httpResponseCode = null;
        $errorMsg = [];
        $errorArray = null;
        if ($exception instanceof \App\Exceptions\AppException) {
            $errorCode = $exception->getCode();
            $errorMsg = $exception->getMessage();
            $httpResponseCode = $exception->getHttpResponseCode();
            $errorArray = $exception->getErrors();
        } elseif ($exception instanceof HttpExceptionInterface) {
            $errorCode = $exception->getStatusCode();
            $httpResponseCode = $exception->getHeaders();
            $errorMsg = $exception->getHeaders();
        } elseif ($exception instanceof \ErrorException) {
            $errorCode = $exception->getCode();
            $httpResponseCode = $exception->getCode();
            $errorMsg = $exception->getMessage();
        } else {
            $errorCode = $exception->getCode();
            $httpResponseCode = $exception->getCode();
            $errorMsg = $exception->getMessage();
        }
        $httpResponseCode = (empty($httpResponseCode)) ? 200 : $httpResponseCode;
        $responseArray = $this->createErrorResponse($errorCode, $httpResponseCode, $errorMsg, $errorArray);

        return response($responseArray, $httpResponseCode);
    }

    public function createErrorResponse($errorCode, $httpResponseCode, $errorMsg, \Illuminate\Support\MessageBag $errorMsgs = null)
    {
        $response['error'] = [
            'error_code' => $errorCode,
            'message' => $errorMsg,
            'field_errors' => $errorMsgs ? $errorMsgs->all() : [],
        ];
        $response['status'] = ['success' => false, 'http_code' => $httpResponseCode, 'message' => $errorMsg];

        return $response;
    }
}
