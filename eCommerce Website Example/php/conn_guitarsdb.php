<?php
// Data access class/script for guitarsdb
$server = "localhost:3307"; // Double check this for home XAMMP server
$user = "root";
$password = "";
$database = "guitars.com";

// Connect to the MySQL server/db
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try
{
    $mysqli = new mysqli($server, $user, $password, $database);
}
catch(Exception $ex)
{
    error_log($ex -> getMessage());
    exit("Error connecting to the database");
}

?>