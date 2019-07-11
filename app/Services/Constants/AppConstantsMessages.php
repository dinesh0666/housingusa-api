<?php

namespace App\Services\Constants;

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//use  App\Models\UserStatus;

class AppConstantsMessages
{
    public static function getMessagesByConstant($appConstant)
    {
        return trans('messages.'.$appConstant.'.message');
    }
}
