<?php

// class Person{
//         public $name;
//         public $age;

//         public function __construct($name, $age){
//             $this->name = $name;
//             $this->age = $age;
//             echo"tworzę człowieka o imieniu $name\n";
//         }
//         public function __destruct() {
//             echo "Usuwam obiekt Person\n";
//         }
//     }
    
//     $person = new Person("Aleksander ", 15);
//     echo $person->name;
class Wojownik{
    public $poziom;
    public $nazwa;
    public $specialistyka;
    
    public function __construct($poziom, $nazwa, $specialistyka){
        $this->nazwa = $nazwa;
        $this->poziom = $poziom;
        $this->specialistyka = $specialistyka;
        echo"powstał wojownik o nazwie $nazwa\n, poziomie $poziom\n i specialistyce $specialistyka\n";
    }
}
$wojownik = new Wojownik("Snake", 10, "morska");
echo $wojownik->poziom;
echo get_class($wojownik);






