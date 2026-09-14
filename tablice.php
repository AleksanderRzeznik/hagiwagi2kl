<?php
$kolor = ["fiolet","róż","czerń"];
echo $kolor[0];
//--------------------------------------------------------------------------------
$produkt = [
    'name' => 'John',
    'price' => 3,
    'in_stock' => 18
];
echo $produkt['name'];
//--------------------------------------------------------------------------------
$numery = [1, 2, 3, 4];
array_push($numery, 5, 6);
echo $numery[4];
//--------------------------------------------------------------------------------
$owoce = ["pomarańcz", "japuszko", "banan", "smoczy owoc"];
if (in_array("Banan", $owoce)){
    echo "Banan jest";
} else {
    echo "";
}
//--------------------------------------------------------------------------------
$user = [
    'name' => 'John',
    'age' => 34,
    'city' => 'Robloxia'
];

print_r(array_keys($user));