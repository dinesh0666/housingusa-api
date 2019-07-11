<?php
namespace App\Http\Controllers\API\Frontend;
use Illuminate\Http\Request; 
use App\Http\Controllers\Controller; 
use App\Http\Controllers\API\ApiBaseController;
use App\User; 
use Illuminate\Support\Facades\Auth; 
use Validator;
class AuthController extends ApiBaseController 
{
public $successStatus = 200;
/** 
     * login api 
     * 
     * 
@return \Illuminate\Http\Response 
     */ 
    public function login(){ 
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user(); 
            $success['token'] =  $user->createToken('MyApp')->accessToken; 
            return response()->json(['success' => $success], $this->successStatus); 
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
        //$input = $request->all(); 
        $input['password'] = bcrypt($input['password']); 
        $user = User::create($input); 
        $success['token'] =  $user->createToken('MyApp')->accessToken; 
        $success['name'] =  $user->name;
        return response()->json(['success'=>$success], $this->successStatus); 
    }
/** 
     * details api 
     * 
     * 
@return \Illuminate\Http\Response 
     */ 
    public function details() 
    { 
        $user = Auth::user(); 
        return response()->json(['success' => $user], $this->successStatus); 
    } 
}