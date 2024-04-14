<?php
    // AJAX, Topic 11
    // Start the session
    session_start();

    include_once("conn_guitarsdb.php");
    include_once("product.php");

    // Validate user input
    if (empty($_POST['productName']))
    {
        echo "Enter a product to search for...";
    }
    else
    {
    // Search query
    $productName = '%'.$_POST['productName'].'%'; // Pass this value to the query, wildcard at the start to seach for anything contained
    $query = "SELECT * FROM product WHERE productName LIKE ?"; // Find the closest match

    try
    {
        $stmt = $mysqli->prepare($query);
        $stmt->bind_param("s", $productName);
        $stmt->execute();
        $result = $stmt->get_result();

        while($row = $result->fetch_assoc())
        {
            $product = new Product($row["productID"], $row["productName"], $row["productDescription"], $row["manufacturer"], $row["price"], $row["qtyInStock"]);
            $product->setImageList();
            echo "<div class='col-4'>";
            echo "<a href='../html/productInfoDisplay.php?id=".$product->getProductID()."'><img src='".$product->getImage(0)."'></a>";
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
            echo "<input name='qty' type='hidden' id='productNo' value='".$product->getQtyInStock()."'>"; // why getQtyInStock
            echo "</form>";      
            echo "</div>";
        }

    }
    catch(Exception $e)
    {
        // Write to the error log
        error_log($e->getMessage());
        exit("Error connecting to the database");
    }

    }
    
    $mysqli->close();

?>