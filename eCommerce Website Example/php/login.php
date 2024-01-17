<?php
//Start the new session
session_start();

//Read the email and the password
$email = $_POST['email'];
$password = $_POST['password'];

// Validate that both fields have been filled
if(($email == "") || ($password == ""))
{
    // Error message to the user
    echo"<h2> Please fill in the required fields </h2>";
    
    // Redirect the user back to the login page
    header("Location: ../html/login.html");
    exit();
}
else
{
    // Connect to the server and select the database
    try
    {
        require_once('conn_guitarsdb.php');
    }
    catch(Exception $e)
    {
        error_log($e -> getMessage());
        echo $e;
    }

    // Create a select query to select user details using the email and password
    $key = "123abc"; // Hash password
    $password = crypt($password, $key);
    // This part could be problematic - details need to come from customerlogin table
    // Changed this from customer to customerlogin table lol
    $query = "SELECT * FROM customerlogin WHERE (email = ?) AND (`password` = ?)"; 
    $stmt = $mysqli -> prepare($query); // ** Issues here **

    // Bind the parameters
    $stmt -> bind_param("ss", $email, $password);

    // Execute the query
    $stmt -> execute(); // This is where the issue might be happening 
    $result = $stmt -> get_result();

    // Retrieve the cutomerID attribute required to traverse the customer and customerlogin tables
    if($result -> num_rows == 1)
    {
        try{ 
        $row = $result -> fetch_array();
        // Retrieve the customerID value and assign it to a variable within the session
        $_SESSION['customerID'] = $row['customerID'];
        // Select the 
        $query = "SELECT * FROM customer WHERE (customerID = ?)";
        $stmt = $mysqli -> prepare($query);
        $stmt -> bind_param("i", $_SESSION['customerID']);
        $stmt -> execute(); // Issue here = Undefined variable $get_result
        $result = $stmt -> get_result(); 
        $stmt -> close();
        }
        catch(Exception $e)
        {
            error_log($e -> getMessage());
            echo $e;
        }

        if($result -> num_rows == 1)
        {
            // If authorised, get the value of firstName, lastName, email, and phone
            $row = $result -> fetch_array(); // Why not fetch_assoc()?

            // Save the values in session variables
            $_SESSION['customerID'] = $row['customerID'];
            $_SESSION['firstName'] = $row['firstName'];
            $_SESSION['lastName'] = $row['lastName'];
            $_SESSION['email'] = $row['email'];
            $_SESSION['telephone'] = $row['telephone'];

            // Display authentication message
            echo"<h2> Authentication Success!</h2>";
            echo"<a href=../index.php>Back to the Homepage! </a>";
        }
        else
        {
            echo"<h2>Can't get the customerID sorry :( </h2>";
        }
    }
    else
    {
        // Redirect the user back to the login page
        echo("Something didn't work, please try again");
        //header("Location: login.html");
        header("Location: ../html/login.html");
        exit(); 
    }
}
?>