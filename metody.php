<?php
// 1---------------------------------------------------------------------------------------
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
//         public function greet(){
//             return"witaj $this->name\n, jak tam?";
        
//         }
//         }

    
//     $person = new Person("Aleksander ", 15);
//     echo $person->name;
//     echo $person->greet();
// 2---------------------------------------------------------------------------------------
// class Circle{
  

//     public function area($a , $b){
//         return $a * $b ** 2;
//     }
// }
// $calc = new Circle;
// echo $calc->area(3.14, 4);
// 3---------------------------------------------------------------------------------------
// class Person{
//             public $name;
//             public $age;
//             public function setAge($age){
//                 return "Witaj$this->name\n, masz $age\n lat";
                
//             }
// }
//     $person = new Person("Aleksander ", 15);
//     echo $person->name;
//     echo $person->setAge(mt_rand(1, 100));
// 4---------------------------------------------------------------------------------------
// class Person{
//         public $name;
//         public $age;
//         public function __construct($name, $age){
//                         $this->name = $name;
//                         $this->age = $age;
//                         echo"stworzono człowieka o imieniu $name\n i wieku $age\n <br>";
//         }

//         public function isAdult(){
//                 if($this->age > 18){
//                     echo"$this->name jest pełnoletni";
//                 }
//                 elseif($this->age < 18){
//                     echo"$this->name jest niepełnoletni";
//                 }
//         }
// }
// $person = new Person("Aleksander ",mt_rand(1, 100));
//     echo $person->name;
//     echo $person->isAdult();