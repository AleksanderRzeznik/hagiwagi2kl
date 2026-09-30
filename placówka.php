<?php
class Placowka {
    public $adres;
    public $rokutwkrzenia;
    protected $danezalozyciela;
    private $haslodoroutera;

    public function __construct($adres, $danezalozyciela, $haslodoroutera) {
        $this->adres = $adres;
        $this->rokutwkrzenia = mt_rand(1900, 2026);
        $this->danezalozyciela = $danezalozyciela;
        $this->haslodoroutera = $haslodoroutera;
    }
    public function getDanezalozyciela() {
        return $this->danezalozyciela;
    }
        public function getHaslodoroutera($login) {
            if  ($login === admin){
                return $this->haslodoroutera;
            }
    }

}

$plac = new Placowka("Brandonworks", "John Doe", "1984HQ");
echo $plac->adres;
echo $plac->rokutwkrzenia;
echo $plac->danezalozyciela;
echo $plac->haslodoroutera;