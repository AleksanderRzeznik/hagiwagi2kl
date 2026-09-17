<?php
function sayHello($name){
echo "witaj, $name!";
}
sayHello("Aleksander");
echo"<br>";
// ------------------------------------------------------
function multiply($a, $b) {
    echo $a * $b;
}
multiply($a = mt_rand(1, 100), $b = mt_rand(1, 100,));
echo "<br>";

// ------------------------------------------------------
function isEven($n) {
    if ($n * 2) {
        echo 'TRUE';
    } else {
        echo 'FALSE';
    }
}
isEven($n = mt_rand(1, 100));
echo "<br>";
// ------------------------------------------------------
function formatPrice($price) {
    echo number_format($price, 2, ',', ' '); 
}
formatPrice($price = mt_rand(1, 100));
echo "<br>";

// ------------------------------------------------------
function greetUser($name, $age) {
    echo "My name is " . $name . " and I'm " . $age . " years old. "; 
}
greetUser($name = "John", $age = mt_rand(30, 50));