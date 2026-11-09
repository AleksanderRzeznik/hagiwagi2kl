<?php
class Animal {
    public $name;
    public $age;

    public function __construct($name, $age){
        $this->name = $name;
        $this->age = $age;
    }


    public function eat(){
        return "Zwierzę je";
    }

    public function die(){
        return "Zwierzę umarło";
    }
}

class Cat extends Animal{
    
    public function __construct($name,$age){
        return parent::__construct($name,$age);
    }
    public function eat(){
        return "Mniam";
    }
}

class Dog extends Animal{
    public function __construct($name,$age){
        return parent::__construct($name,$age);
    }
    public function eat(){
        return "AmAm";
    }
}
$cat = new Cat("Felix", 7);
$dog = new Dog("Poter", 11);
echo $cat->name;
echo $cat->age;
echo $cat->eat();
echo $cat->die();

echo $dog->name; 
echo $dog->age;
echo $dog->eat();
echo $dog->die();
