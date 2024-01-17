<?php
    session_start(); // start the session yo

    // Connect to the database server and select the database
    require_once("conn_guitarsdb.php");

    // Create a query to select all products
    $query = "SELECT * FROM product"; // may need to adjust this - check sql queries sheet
    $stmt = $mysqli->prepare($query);
    $stmt->execute();
    $result = $stmt->get_result();

    // Display products
    /*
    This section needs to combine php and html to populate each section of the required div with all products
    This will probably require a while loop
    */
    echo "<tr>
            <td><b>Product ID</b></td>
            <td><b>Product Name</b></td>
            <td><b>Product Description</b></td>
            <td><b>Manufacturer</b></td>
            <td><b>Price</b></td>
            <td><b>Qty In Stock</b></td>
        </tr>";


    while ($row = $result->fetch_assoc())
    {
        // Use the while loop to populate all products in a table
        $productID = $row['productID'];
        $productName = $row['productName'];
        $productDescription = $row['productDescription'];
        $manufacturer = $row['manufacturer'];
        $price = number_format($row['price'], 2); // number format to display price as float
        $qtyInStock = $row['qtyInStock'];

        // Test the connection to see everything is posting & retrieving properly
        echo "<tr><form action=addToCart.php method=POST>"; // Calls the addToCart.php file
        echo "<input name=productID type=hidden value=$productID>";
        echo "<td>$productName</td>";
        echo "<td>$productDescription</td>";
        echo "<td>$manufacturer</td>";
        echo "<td>$$price</td>"; // Dollar sign to display in dollars
        echo "<td>$qtyInStock</td>";
        echo "<td><input name=qty type=text value=1 size=2></td>";
        echo "<td><input name=add type=submit value=Add></td>";
        echo "</form></tr>";

    }

    // Close the connection
    $mysqli->close();
?>