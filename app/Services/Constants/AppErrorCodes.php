<?php

namespace App\Services\Constants;

/**
 * Description of AppErrorCodes.
 *
 * @author Suresh
 */
class AppErrorCodes extends AbstractConstant
{

    const ERROR_CODE = 1;

    protected function setMessages()
    {
        $this->messages = [
            self::ERROR_CODE => "Error Message"
        ];
    }
}
