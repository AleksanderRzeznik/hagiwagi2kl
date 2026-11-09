<?php
$prawo = 18;

if ($prawo <= 17) {
    echo "Masz $prawo lat i nie posiadasz prawo głosu";
} 
elseif ($prawo >= 18){
    echo "Masz $prawo lat i posiadasz prawo głosu";
}
//--------------------------------------------------------------------------------

$liczba = 0;

if ($liczba <= -1) {
    echo "Liczba ujemna";
} elseif ($liczba >= 1) {
    echo "liczba dodatnia";
} elseif ($liczba == 0) {
    echo "liczba jest równa zero";
}
//--------------------------------------------------------------------------------

$color = 3;
switch ($color) {
    case 1:
        echo "Czerwony";
        break;
    case 2:
        echo "Zielony";
        break;
    case 3:
        echo "Niebieski";
        break;
    default:
        echo "Inny kolor";
        break;
}
//--------------------------------------------------------------------------------

$grade = 20 ;
if ($grade >= 50) {
    echo "Masz $grade punktów co oznacza że zdałeś";
}
else {
    echo "Masz $grade punktów co oznacza że głupi jesteś";
}
//--------------------------------------------------------------------------------

$nickname = "Abyssai" ;
if ($nickname == " " || $nickname == ""){
    $nickname = "guest";
    echo $nickname;
}
else {
    echo $nickname;
}