<?php

namespace App\Services\Mailer;

use Illuminate\Config\Repository as Config;
use Illuminate\Mail\Mailer as IlluminateMailer;
use Illuminate\Translation\Translator;


 
abstract class MailerAbstract
{
    /**
     * @var Config
     */
    protected $config;

    /**
     * @var Translator
     */
    protected $lan;

    /**
     * @var Illuminate\Mail\Mailer
     */
    protected $mailer;
    /**
     * @var type adminEmail
     */
    protected $adminMail;
    /**
     * @var type adminName
     */
    protected $adminName;

    protected $mailin;

    protected $settings;

    public function __construct(Translator $lan, IlluminateMailer $mailer, Config $config)
    {
        $this->lan = $lan;
        $this->config = $config;
        $this->mailin = null;
        $this->mailer = $mailer;
        $this->init();
    }
    public function init()
    {
        $this->adminMail = "admin@test.com";
        $this->adminName = "Admin";
    }
}
