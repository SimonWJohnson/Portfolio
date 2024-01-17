<!--Wk07 products.php example from video-->
<!--Products Page HTML Example-->

<?php
    //Start the session
    session_start();
    
    // Connect to the db server and select db
    include_once("conn_guitarsdb.php");

    // Include the Product Class
    include_once("product.php");

    // Include the viewProduct.php file
    //include('viewCart.php');

    // Create a query to select all products
    $query = "SELECT * FROM product";
    $stmt = $mysqli -> prepare($query);
    $stmt -> execute();
    $result = $stmt -> get_result();

    // Display products
    //echo
    while($row = $result -> fetch_assoc())
    {
        // Use the while loop to populate table with all products
        //print_r($row);
        try
        {
        
        $product = new Product($row["productID"], $row["productName"], $row["productDescription"], $row["manufacturer"], $row["price"], $row["qtyInStock"], $row["image"]);
        echo "<div class='col-4'>";
        echo "<a href='../html/productInfoDisplay.php?id=".$product->getProductID()."'><img src='".$product->getImage()."'></a>";
        echo "<h4>".$product -> getProductName()."</h4>";
        echo "<div class='rating'>";
        echo   "<i class='fa fa-star'></i>";
        echo   "<i class='fa fa-star'></i>";
        echo   "<i class='fa fa-star'></i>";
        echo   "<i class='fa fa-star'></i>";
        echo   "<i class='fa fa-star'></i>";
        echo "</div>";
        echo "<p>$".$product->getPrice()."</p>";
        // Start the form
        echo "<form action='../php/addToCart.php' method='POST'>";
        echo "<button type='submit' name='btn' class='btn'>Add to Cart</button>";
        echo "<input name='productID' type='hidden' id='productNo' value='".$product->getProductID()."'>";
        echo "<input name='qty' type='hidden' id='productNo' value='1'>"; 
        echo "</form>";      
        echo "</div>";

        }
        catch(Exception $e)
        {
            error_log($e -> getMessage());
            echo $e;
        }

    }
    
    // Close the connection
    $mysqli -> close();
?>
