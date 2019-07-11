<?php

namespace App\Services\Constants;

use Illuminate\Translation\Translator;

/**
 * Description of AbstractConstant.
 *
 * @author Suresh
 */
class AbstractConstant
{
    /**
     * @var Translator
     */
    protected $lan;

    public function __construct(Translator $lan)
    {
        $this->lan = $lan;
        $this->setMessages();
    }
    public function getMessageForCode($code)
    {
        return array_has($this->messages, $code) ? $this->messages[$code] : null;
    }
}
