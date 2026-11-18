<?php
interface Render{
    public function sonsferatu($sonsferatu);
}

interface Json{
    public function cos($jeden, $dwa);
}

class Renderer implements Render{
    public function sonsferatu($sonsferatu){
        return $sonsferatu;
    }
}

class Product implements Json{
    public function cos($jeden, $dwa){
        print_r($data = [$jeden,$dwa]);
    }
}

$renderer = new Renderer();
echo $renderer->kotek("kotek");

$data = new Product();
echo $data->cos("Uno","Dos");




interface Drivable{
public function drive(){
    return"jadymy";
}
}

class Car implements Drivable{
    public function drive(){
        return "samochód działaju";
    }
}

class Bike implements Drivable{
    public function drive(){
        return "motor nie działaju";
    }
}