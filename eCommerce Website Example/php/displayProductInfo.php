<?php
    
    include_once("product.php");

    if(isset($_GET['id']))
    {
        $productID = htmlspecialchars($_GET['id']);
    }
    else
    {
        echo "<p>Invalid request</p>";
    }

    // Connect to the database
    require_once("conn_guitarsdb.php");

    // Prepare the query
    $query = "SELECT * FROM product WHERE (productID = ?)";
    $stmt = $mysqli -> prepare($query);

    // Prepare the statement
    $stmt -> bind_param("i", $productID);

    // Execute the statement
    $stmt -> execute();
    
    // Get the result
    $result = $stmt -> get_result();

    // Print out the details of the product
    if($result -> num_rows == 1)
    {
        $row = $result -> fetch_assoc();
        $product = new Product($row["productID"], $row["productName"], $row["productDescription"], $row["manufacturer"], $row["price"], $row["qtyInStock"], $row["image"]);
        
        // Product Image Gallery
        echo "<div class='col-2'>";
        echo "<img src='".$product->getImage()."' width='100%' id='ProductImg'>";
        echo "<div class='small-img-row'>";
        echo "<div class='small-img-col'>";
        echo "<img src='".$product->getImage()."' width='100%' class='small-img'>";
        echo "</div>";
        echo "<div class='small-img-col'>";
        echo "<img src='".$product->getImage()."' width='100%' class='small-img'>";
        echo "</div>";
        echo "<div class='small-img-col'>";
        echo "<img src='".$product->getImage()."' width='100%' class='small-img'>";
        echo "</div>";
        echo "<div class='small-img-col'>";
        echo "<img src='".$product->getImage()."' width='100%' class='small-img'>";
        echo "</div>";
        echo "</div>";
        echo "</div>";

        // Product Description
        echo "<div class='col-2'>";
        echo "<p>Home / Guitars</p>";
        echo "<h1>".$product->getProductName()."</h1>";
        echo "<h4>$".$product->getPrice()."</h4>";
        // Add to cart section, form starts here
        echo "<form action='../php/addToCart.php' method='POST'>";
        echo"<input name='qty' type='number' value='1'>"; // select the qty
        echo "<button type='submit' name='btn' class='btn'>Add to Cart</button>";
        echo "<input name='productID' type='hidden' id='productNo' value='".$product->getProductID()."'>";
        //echo "<input name='qty' type='hidden' id='productNo' value='".$product->getQtyInStock()."'>";//
        echo "</form>"; 
        // Form ends
        echo "<h3>Product Details <i class='fa fa-indent'></i></h3>";
        echo "<br>";
        echo "<p>".$product->getProductDescription()."</p>";
        echo "</div>";
    }
    else
    {
        echo("Something didn't work, please try again");
        exit(); 
    }

?>