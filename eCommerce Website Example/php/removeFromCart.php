<?php
    // 1:05:02
    // Remember - $productNo is the index position of the product being removed from the cart,
    // NOT the productID :)

    // Start the session
    session_start();
    include('cart.php');

    $productNo = $_POST['productNo'];

    // Remove selected product from the cart, mark as deleted
    
    // If the productNo is NOT empty
    if($productNo !=  "")
    {
        $counter = $_SESSION['counter']; // Get the value from the counter
        $cart = new Cart(); // Create a new cart
        $cart = unserialize($_SESSION['cart']);

        // Delete selected product from the cart
        $cart->deleteProduct($productNo);

        // Update the counter & decrement the counter by 1
        $_SESSION['counter'] = $counter -1;

        // Serialise and add back to the session
        $_SESSION['cart'] = serialize($cart);

        // Redirect to the viewCart.php file
        header('Location: ../html/shoppingCart.php');
        exit();

    }


?>