<?php
    
    // Start the session
    session_start();
    include("cart.php"); // Check relative file path is correct
    $cart = new Cart();

    // orderTotal is initialised to '0'
    $totalPrice = 0;
    $orderTotal = 0;
    $shipping = 100;
    
    // There is nothing in the cart, first time customer has accessed the cart
    if(!isset($_SESSION['counter']))
    {
        $_SESSION['counter'] = 0;
    }
    $counter = $_SESSION['counter'];

    // Check whether the cart is empty or not
    if($counter == 0) // if empty
    {

        echo"<h1>Your Shopping Cart is empty!</h1>";
        echo"<p><a href=../html/productsDisplay.php class='btn'>Back to the Products page</p></a>";
    }
    else
    {
        $cart = unserialize($_SESSION['cart']);

        // Get the depth of the cart instance
        $depth = $cart->getDepth();

        $orderTotal = $cart->getOrderTotal() + $shipping;

        $gst = $cart->getGST();

        // Start of cart table goes here: 
        echo "<table>";
        echo "<tr>";
        echo "<th>Product</th>";    
        echo "<th>Qty</th>";    
        echo "<th>Subtotal</th>";        
        //echo "<th>GST</th>";        
        echo "<th>Product Total</th>";
        echo "</tr>";
        // Use a for loop to iterate through the cart
        // Take each element out of the session
        // Initialise at index pos 0, while array has items, increment forward
        for($i=0; $i < $depth; $i++)
        {
            // Retrieve the values of each product in the cart instance
            $product = $cart->getProduct($i);
            $productID = $product->getProductID();
            $productName = $product->getProductName();      
            $price = $product->getPrice();
            $qtySelected = $product->getQtySelected();
            $image = $product->getImage();

            // Calculations
            $subTotal = $product->getCostTotal();
            $totalPrice = $subTotal;

            // Display in the cart
            echo "<tr>";        
            echo "<td>";   
            echo "<div class='cart-info'>"; 
            echo "<img src='".$image."'>"; // image associated with selected product
            echo "<div>";           
            echo "<p>".$productName."</p>";   
            echo "<small>Price: $".number_format($price, 2)."</small>";
            echo "<br>";
            // Remove method form wraps here
            echo "<form action='../php/removeFromCart.php' method='POST'>";
            echo "<input name='productNo' type='hidden' id='productNo' value='$i'>";   
            echo "<button type='submit' name='remove' class='btn' id='remove' value='remove'>Remove</button>";
            echo "</form>";   
            echo "</div>";   
            echo "</div>";   
            echo "</td>";   
            echo "<td><input type='number' value='".$qtySelected."'></td>";
            echo "<td>$ ".number_format($subTotal, 2)."</td>"; 
            echo "<td>$ ".number_format($totalPrice, 2)."</td>"; 
            echo "</tr>";
        }

        // Split the table   
        echo "</table>";   
        echo "<div class='total-price'>";   
        echo "<table>";
        echo "<tr>";   
        echo "<td>GST</td>";   
        echo "<td>$ ".number_format($gst, 2)."</td>"; // Shipping - hardcode?
        echo "</tr>";   
        echo "<tr>";   
        echo "<td>Shipping</td>";   
        echo "<td>$ ".number_format($shipping, 2)."</td>"; // Shipping - hardcode?
        echo "</tr>";
        echo "<td>Order Total</td>";   
        echo "<td>$ ".number_format($orderTotal, 2)."</td>"; // Method to calc order total   // .number_format($orderTotal, 2).
        echo "</tr>";
        echo "<td></td>";  // Proceed to Payment
        //echo "<td><button type='submit' name='checkout' class='btn' id='checkout' value='submit'>Checkout</button></td>";
        echo "<td><a href='../html/paymentForm.php' class='btn'>Checkout</a></td>";
        //echo "<td></td>"; 
        echo "</table>";
        echo "</div>"; 

    }



?>
