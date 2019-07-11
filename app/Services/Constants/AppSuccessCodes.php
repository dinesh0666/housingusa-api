<?php

namespace App\Services\Constants;

/**
 * Description of AppSuccessCodes.
 *
 * @author Suresh
 */
class AppSuccessCodes extends AbstractConstant
{
    
    const APP_LOGIN_SUCCESS = 1;
    const APP_REGISTER_SUCCESS = 2;

    protected function setMessages()
    {
        $this->messages = [
            self::APP_LOGIN_SUCCESS => "Logged In Successfully",
            self::APP_REGISTER_SUCCESS => "Registered Successfully",
             
        ];
    }
}
