<?php
// Capture the user inputs from the form
// ** Customer Table **
$firstName = $_POST['firstName'];
$lastName = $_POST['lastName'];
$email = $_POST['email'];
$telephone = $_POST['telephone'];

// ** Customer_Login Table **
$password = $_POST['password'];
$repeatPassword = $_POST['repeatPassword'];

// ** Address Table **
$street = $_POST['street'];
$suburb = $_POST['suburb'];
$city = $_POST['city'];
$state = $_POST['state'];
$country = $_POST['country'];
$postcode = $_POST['postcode'];

// Validate the user inputs - each field must have an entry
if(($firstName == "") or ($lastName == "") or ($email == "") or ($telephone == "") 
or ($password == "") or ($street == "") or ($suburb == "") or ($city == "") or 
($state == "") or ($country == "") or ($postcode == ""))
{
    // Error message to the user
    echo("Please fill in required fields");
}
// Validate that the email field contains both an "@" and "."
elseif(!(strstr($email, "@")) or !(strstr($email, ".")))
{
    // Error message to the user
    echo("Please enter a valid email address");
}
// Validate the the telephone entry is a numeric string (assigned as Varchar in the db)
elseif(! is_numeric($telephone))
{
    echo("Please enter a valid telephone number");
}
// Validate that the password entered matches the repeated password entered
elseif($password != $repeatPassword)
{
    // Error message to the user
    echo("Please enter a valid password");
}
else
{
    // Connect to the server and add a new record
    require_once('conn_guitarsdb.php');

    // Define the insert query
    $key = "123abc"; // Hash password
    $password = crypt($password, $key);
    $query1 = "INSERT INTO customer (firstName, lastName, email, telephone) VALUES(?,?,?,?)";
    $query2 = "SELECT customerID FROM customer WHERE email LIKE ?";
    $query3 = "INSERT INTO customerlogin VALUES(?,?,?)"; // may present issue regarding customer ID **
    $query4 = "INSERT INTO `address` VALUES(?,?,?,?,?,?,?)";

    // Run the queries
    // Query1 - customer Table
    try
    {
        $stmt1 = $mysqli -> prepare($query1);

        // Bind the parameters
        // Error here - Could be a customerID issue
        $stmt1 -> bind_param("ssss", $firstName, $lastName, $email, $telephone);

        // Execute query1
        $stmt1 -> execute();

    }
    catch(Exception $ex)
    {
        error_log($ex -> getMessage());
        exit("Error inserting records into the database #1". $ex->getMessage());
    }
    // Query2 - Search query for customer_login table
    try
    {
        $stmt2 = $mysqli -> prepare($query2);
        
        // Bind the parameters ** Circle back to this ** 
        $stmt2 -> bind_param("s", $email);
        // Needs to retrieve customerID from the cutomer table to match via email attribute

        // Execute query2
        $stmt2 -> execute();

        $result = $stmt2 -> get_result();

        while($row = $result -> fetch_assoc())
        {
            $customerID = $row['customerID'];
        }
    
    }
    catch (Exception $ex)
    {
        error_log($ex -> getMessage());
        exit("Error retrieving records from the database #2". $ex->getMessage());
    }
    // Query3 * Insert record into customer_login table
    try
    {
        $stmt3 = $mysqli -> prepare($query3);
        
        // Bind the parameters * $customerID needs to come from $query2
        $stmt3 -> bind_param("ssi", $email, $password, $customerID);

        // Execute query3
        $stmt3 -> execute();
    
    }
    catch(Exception $ex)
    {
        error_log($ex -> getMessage());
        exit("Error inserting records into the database #3". $ex->getMessage());
    }
    // Query4 * Insert record into address table
    try
    {
        $stmt4 = $mysqli -> prepare($query4);

        // Bind the parameters
        $stmt4 -> bind_param("ssssssi", $street, $suburb, $city, $state, $country, $postcode, $customerID);

        // Execute query4
        $stmt4 -> execute();
        
        // Close the connection
        $mysqli -> close();

        // Registration Confirmation Message
        $registrationMessage = "Thank you for registering with Guitars.Com\nYour details are:
            \nName: $firstName $lastName \nEmail: $email \nTelephone: $telephone";
        //echo $registrationMessage;
        echo "<h2>Thank you for registering with Guitars.Com!</h2>";
        //echo "<br>";
        echo "<h3>Your details are:</h3>";
        echo "<h3>Name: ".$firstName." ".$lastName."</h3>";
        echo "<h3>Email: ".$email."</h3>";
        echo "<h3>Telephone: ".$telephone."</h3>";
        echo"<p><a href=../html/login.html>Login to Member Page</a></b></p>";

    }
    catch(Exception $ex)
    {
        error_log($ex -> getMessage());
        exit("Error inserting records into the database #4". $ex->getMessage());
    }
}

?>