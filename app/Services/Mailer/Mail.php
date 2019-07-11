<?php

namespace App\Services\Mailer;

class Mail extends MailerAbstract
{



    public function send($toEmail, $toName, $subject, $view, $dataForView = null, $fromEmail = null, $fromName = null)
    {
        if(!$this->mailin)
            return 0;

        $fromEmailNotBlank = $fromEmail ? $fromEmail : $this->adminMail;
        $fromNameNotBlank = $fromName ? $fromName : $this->adminName;
        $html = $v = View($view, $dataForView)->__toString();
        $data = [
            "to" => [$toEmail=>$toName],
            "from" => [$fromEmailNotBlank, $fromNameNotBlank],
            "subject" => $subject,
            "html" => $html,
        ];
        return $this->mailin->send_email($data);
    }

    public function sendRawText($toEmail, $toName = '', $subject, $dataRawText = null, $fromEmail = null, $fromName = null)
    {
        if(!$this->mailin)
            return 0;
        $fromEmailNotBlank = $fromEmail ? $fromEmail : $this->adminMail;
        $fromNameNotBlank = $fromName ? $fromName : $this->adminName;
        $data = [
            "to" => [$toEmail=>$toName],
            "from" => [$fromEmailNotBlank, $fromNameNotBlank],
            "subject" => $subject,
            "html" => $html,
        ];
        return $this->mailin->send_email($data);
    }

    public function sendTestMail($toEmail, $html, $subject = null)
    {
        return $this->mailer->raw($html,function($message) use($toEmail, $subject, $html){
            $message->to($toEmail)->subject($subject);
            $message->setBody($html, 'text/html');
        } );


    }
}
