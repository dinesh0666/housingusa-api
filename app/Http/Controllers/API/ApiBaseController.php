<?php
namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;

class ApiBaseController extends Controller
{
    /**
     * Parses json request and converts to array.
     *
     * @param \Illuminate\Http\Request $requestObject
     *
     * @return array \Illuminate\Http\Request
     */
    public function getContent($requestObject = null)
    {
        if (app()->environment('testing')) {
            return request()->all();
        }
        $request = $requestObject;
        if (!is_object($requestObject)) {
            $request = request();
        }
        return (array) json_decode($request->getContent());
    }
}
