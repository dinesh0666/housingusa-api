<?php
namespace App\Http\Controllers\API\Frontend;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Http\Controllers\API\ApiBaseController;
use App\User; 
use Illuminate\Support\Facades\Auth; 
use Validator;

use App\Services\ApiResponse\ApiResponse;
use App\Services\Constants\AppSuccessCodes;
use App\Transformers\UserTransformer;
use App\Services\Transformers\DataTransformer;
use App\Repositories\UserRepository;

class AuthController extends ApiBaseController 
{
     /**
     * @var DataTransformer
     */
    private $dataTransformer;

     /**
     * @var UserRepository
     */
    private $userRepository;


    public function __construct(UserRepository $userRepository, ApiResponse $apiResponse, DataTransformer $dataTransformer)
    {
        $this->userRepository = $userRepository;
        $this->apiResponse = $apiResponse;
        $this->dataTransformer = $dataTransformer;
       
    }







/** 
     * login api 
     * 
     * 
@return \Illuminate\Http\Response 
     */ 
    public function login(){ 
        $input = $this->getContent();
        if(Auth::attempt(['email' => $input['email'], 'password' => $input['password']])){ 
            $user = Auth::user(); 
            $token =  $user->createToken('MyApp')->accessToken; 
            $userObject = $this->userRepository->getById($user->id);
            $this->dataTransformer->addData($userObject, new UserTransformer(), 'item');
            $user = $this->dataTransformer->getTransformedData();
            return $this->apiResponse->response(['token' => $token, 'user' => $user], AppSuccessCodes::APP_LOGIN_SUCCESS);
        } 
        else{ 
            return response()->json(['error'=>'Unauthorised'], 401); 
        } 
    }
/** 
     * Register api 
     * 
     * 
@return \Illuminate\Http\Response 
     */ 
    public function register() 
    {   
        $input = $this->getContent();
        $validatData = ['name'=> $input['name'], 'email'=> $input['email'], 'password'=> $input['password'], 'c_password'=> $input['c_password']];
        $validator = Validator::make($validatData, [ 
            'name' => 'required', 
            'email' => 'required|email', 
            'password' => 'required', 
            'c_password' => 'required|same:password', 
            ]);
        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        $input['password'] = bcrypt($input['password']); 
        $user = User::create($input); 
        $token =  $user->createToken('MyApp')->accessToken; 
        $userObject = $this->userRepository->getById($user->id);
        $this->dataTransformer->addData($userObject, new UserTransformer(), 'item');
        $user = $this->dataTransformer->getTransformedData();
        return $this->apiResponse->response(['token' => $token, 'user' => $user], AppSuccessCodes::APP_REGISTER_SUCCESS);
    }
}