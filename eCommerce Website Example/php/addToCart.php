<?php
// https://web.microsoftstream.com/video/e44bb452-b0cc-4d25-a567-53c0aa0300ea?referrer=https:%2F%2Flearn.tafesa.edu.au%2F
// Start the session
session_start();
include('cart.php'); // remember to include cart.php lol
//include('product.php');

// Get the productID and the qty
$productID = $_POST['productID']; // continue from 0:36:19 
$qty = $_POST['qty'];

// Store the number of products in the shoppingCart
$counter = $_SESSION['counter'];
$cart = new Cart();

// Unserialise the cart if the cart is not empty
if((isset($_SESSION['counter'])) && ($_SESSION['counter'] !=0))
{
    $counter = $_SESSION['counter'];

    // Unserialise convert the session object which is a string to a ShoppingCart object
    $cart = unserialize($_SESSION['cart']);
}
else
{
    $_SESSION['counter'] = 0;
    $_SESSION['cart'] = "";
}
if(($productID == "") or ($qty < 1)) // 0:40:40
{
    // Redirect user back to the product page
    //header("Location: ../html/productsDisplay.php");
    //exit();
    echo "Something didn't work, please try again".$productID;
}
else
{
    try
    {
    // Connect to the server and select database
    require_once("conn_guitarsdb.php");


    // Create a select query to retrieve the selected product
    $query = "SELECT * FROM product WHERE (productID = ?)";

    // Run the mysql query
    $stmt = $mysqli->prepare($query);
    $stmt->bind_param("i", $productID);
    $stmt->execute();
    $result = $stmt->get_result();

    // If there is a matching record, select productName & price
    if($result->num_rows == 1)
    {
        // Retrieve the details from the database
        $row = $result->fetch_assoc();
        $productName = $row["productName"];
        $price = $row["price"];
        
        // Add product to the cart
        $newProduct = new Product($productID, $productName, $productDescription, $manufacturer, $price, $qtyInStock);
        $newProduct->setImageList();
        $newProduct->setQtySelected($qty); 
        $cart->addProduct($newProduct);

        // Update the counter
        $_SESSION['counter'] = $counter+1;
        $_SESSION['cart'] = serialize($cart);

        // Redirect to the shoppingCart.php page
        //echo("Item successfully added to your cart!");
        //header("Location: ../html/shoppingCart.php"); // double check relative file path is correct
        header("Location: ../html/shoppingCart.php"); // double check relative file path is correct
        exit();

    }
    else
    {
        // Redirect back to the product page
        echo "Something didn't work, please try again".$productID;
        //header("Location: ../html/productInfoDisplay.php"); // double check relative file path is correct
        //exit();


    }
    }
    catch(Exception $e)
    {
        error_log($e->getMessage());
        echo $e;

    }

    $mysqli->close();




}

?>