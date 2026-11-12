<?php
class Notification {
    public $message;

    public function __construct($message){
        $this->message = $message;
    }
    public function send(){
        return $message;
        }
}
class EmailNotification extends Notification{
    private $email;
    public function __construct($message,$email){
        $this->email = $email;
        return parent::__construct($message);
    }
    public function send(){
        return"$this->message - $this->email";
    }
}
class SMSNotification extends Notification{
    private $phoneNumber;
    public function __construct($message,$phoneNumber){
        $this->$phoneNumber = $phoneNumber;
        return parent::__construct($message);
    }
    public function send(){
        return"$this->message - $this->phoneNumber";
    }
}
$email = new EmailNotification("Witaj!", "test@example.com");
$sms = new SMSNotification("Witaj!", "123456789");

echo $email->email;
    

echo $email->send();
echo $sms->send();