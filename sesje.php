<?php
session_start();
$_SESSION["user_id"] = 07;
$_SESSION["username"] = "c00lkidd";
$_SESSION["email"] = "c00lmail.@example.com";
$_SESSION["dodatkowe"] = "cuś";
//-------------------------------------------------------------
// session_start();
$_SESSION["user_id"] = 07;
$_SESSION["username"] = "c00lkidd";
$_SESSION["email"] = "c00lmail.@example.com";
$_SESSION["dodatkowe"] = "cuś";
if (isset($_SESSION["username"]));
echo("witaj $_SESSION[username], jesteś zalogowany na koncie o id: $_SESSION[user_id] oraz twój e-mail to: $_SESSION[email] ");
//-------------------------------------------------------------
// session_start();
$_SESSION["user_id"] = 07;
$_SESSION["username"] = "c00lkidd";
$_SESSION["email"] = "c00lmail.@example.com";
$_SESSION["dodatkowe"] = "cuś";
unset($_SESSION["dodatkowe"]);
//-------------------------------------------------------------
$_SESSION["user_id"] = 07;
$_SESSION["username"] = "c00lkidd";
$_SESSION["email"] = "c00lmail.@example.com";
$_SESSION["dodatkowe"] = "cuś";
session_destroy();
//-------------------------------------------------------------
// session_start();
$_SESSION["user_id"] = 07;
$_SESSION["username"] = "c00lkidd";
$_SESSION["email"] = "c00lmail.@example.com";
$_SESSION["dodatkowe"] = "cuś";

