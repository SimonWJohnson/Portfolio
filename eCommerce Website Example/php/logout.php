<?php
    // Start the session
    session_start();

    // Destroy the session
    unset($_SESSION['email']);
    session_destroy();

    // Redirect the user back to the login page
    header("Location: login.php");
    exit();
?>