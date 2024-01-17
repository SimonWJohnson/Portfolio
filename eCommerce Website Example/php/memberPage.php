<?php
// Start the session
session_start();
if (isset($_SESSION['email']))
{
    // Read the values from the session
    $firstName = $_SESSION['firstName'];
    $lastName = $_SESSION['lastName'];
    $email = $_SESSION['email'];
    $telephone = $_SESSION['telephone'];

    // Display a welcome message
    echo"<h2> Welcome $firstName $lastName </h2>";
    echo"<p> Email: $email</p>";
    echo"<p> Telephone: $telephone</p>";
    echo"<h2><p><a href=logout.php>Logout</a></p></h2>";
}
else
{
    // Redirect back to Login form if not authorised
    header("Location: login.html");
    exit();
}

?>