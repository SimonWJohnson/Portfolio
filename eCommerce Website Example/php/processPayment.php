<?php
    // Start the session
    session_start();

    require_once('phpCreditCard.php'); // cc validation $_POST['']

    // Validate the text fields and the credit card  
    if(($_POST['cardNo'] == "") or ($_POST['cardName'] == "") or ($_POST['expMonth'] == "") or ($_POST['expYear'] == "") or ($_POST['cardType'] == "") or($_POST['cvv'] == "") or
        ($_POST['firstName'] == "") or ($_POST['lastName'] == "") or ($_POST['email'] == "") or ($_POST['telephone'] == "") or
        ($_POST['street'] == "") or ($_POST['suburb'] == "") or ($_POST['city'] == "") or ($_POST['state'] == "") or ($_POST['country'] == "") or ($_POST['postcode'] == ""))
        {
            //header('Location: ../html/paymentForm.php');
            echo "<h2>Required fields not entered</h2>";
            echo "<a href='../html/paymentForm.php' class='btn'>Return to Payment Form &#x279C;</a>";
        }
        // Validate the email address
        elseif(!(strstr($_POST['email'], "@")) or !(strstr($_POST['email'], ".")))
        {
            echo "<p>Please enter a valid email address</p>";
            echo "<a href='../html/paymentForm.php' class='btn'>Return to Payment Form &#x279C;</a>";
        }
       else
       {
            // Read the values from the form
            // Credit Card Info
            $cardNo = $_POST['cardNo'];
            $cardName = $_POST['cardName'];
            $expMonth = $_POST['expMonth'];
            $expYear = $_POST['expYear'];
            $cardType = $_POST['cardType'];
            $cvv = $_POST['cvv'];

            // Customer Info - customer table
            $firstName = $_POST['firstName'];
            $lastName = $_POST['lastName'];
            $email = $_POST['email'];
            $telephone = $_POST['telephone'];

            // Customer Address info - address table
            $street = $_POST['street'];
            $suburb = $_POST['suburb'];
            $city = $_POST['city'];
            $state = $_POST['state'];
            $country = $_POST['country'];
            $postcode = $_POST['postcode'];

            include('cart.php');
            $cart = new Cart();
            $counter = $_SESSION['counter'];
            require_once('conn_guitarsdb.php'); // connect to the db
            require_once('generateID.php'); // generate an orderID

            // CC validation
            // Call checkCreditCard function from phpCreditCard.php
            if(checkCreditCard($cardNo, $cardType, $ccerror, $ccerrortext) != true)
            {
                echo $ccerrortext;
                echo "<a href='../html/paymentForm.php' class='btn'>Return to Payment Form &#x279C;</a>";
            }
            else
            {
                if($counter == 0)
                {
                    echo "<br><br><p><b> Your Shopping Cart is empty !!! </b></p>";
                }
                else
                {
                    // Convert the cart string to a cart object
                    $cart = unserialize($_SESSION['cart']);
                    $depth = $cart->getDepth();

                    // Generate the order ID
                    $orderID = gen_ID(1); // 

                    $subtotal = $cart->getSubTotal();
                    $gst = $cart->getGST();
                    $orderTotal = $cart->getOrderTotal();
                    $dateOfOrder = strval(date('d/m/Y'));
                    $noOfItems = $_SESSION['counter'];
                    $orderStatus = "Pending";
                    $customerID = $_SESSION['customerID'];

                    // Add the record to the order table
                    $query = "INSERT INTO `order` VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                    try
                    {
                        // Prepare the statement
                        $stmt = $mysqli->prepare($query);
                        // Bind parameters
                        $stmt->bind_param('idddsisi', $orderID, $subtotal, $gst, $orderTotal, $dateOfOrder, $noOfItems, $orderStatus, $customerID);
                        // Execute the query
                        $stmt->execute(); // ISSUE HERE querymysqli_sql_exception: Duplicate entry '2147483647-1012' for key 'PRIMARY'

                        $_SESSION['orderID'] = $orderID;
                        header('Location: ../html/thankYou.php');
                        //echo "<p>Order Placed!</p>";

                    }
                    catch(Exception $e)
                    {
                        error_log($e->getMessage());
                        echo "Error with order query";
                        echo $e;
                    }

                    // Use a for loop to iterate through the cart
                    for($i = 0; $i < $depth; $i++)
                    {
                        $product = $cart->getProduct($i);
                        $productID = $product->getProductID();
                        $qtySelected = $product->getQtySelected();

                        // Add the record to the order_product table
                        $query = "INSERT INTO order_product VALUES (?, ?, ?)";

                        try
                        {
                            // Prepare the statement
                            $stmt = $mysqli->prepare($query);
                            // Bind parameters
                            $stmt->bind_param('iii', $qtySelected, $orderID, $productID);
                            // Execute the query
                            $stmt->execute();
                        }
                        catch(Exception $ex)
                        {
                            error_log($e->getMessage());
                            echo "Error with order_product query";
                            echo $e;
                        }
                    }               
                }
            }
        }
?>