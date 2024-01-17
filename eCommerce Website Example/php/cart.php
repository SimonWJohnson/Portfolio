<?php
// WK 7
include("product.php");

class Cart {
    var $products;
    var $depth;

    // Need a 'guest' variable for a guestAccount
    // resolves issue of customer purchase without account

    // Construct the array
    function __construct()
    {
        $this -> products = array();
        $this -> depth = 0; // depth represents the product location within the array
    }

    function addProduct($product)
    {
        // For each new product ordered | 1:14:00
        foreach($this->products as $currentProduct) 
        {
            // If a new instance of a product is added to the cart containing an existing
            // instance of that product
            if($product->getProductID() == $currentProduct->getProductID())
            {
                // The cart is ammended to reflect that 2 of the same product are in the cart
                // as opposed to 2 separate instances
                $addToOrdered = $currentProduct->getQtySelected() + $product->getQtySelected();
                // Updates qtyOrdered in the cart
                $currentProduct->setQtySelected($addToOrdered);
                return;
            }
        }
        $this -> products[$this -> depth] = $product;
        $this-> depth++;
    }
    // $productNo represents the index location of the product to be deleted
    // NOT the productID :)
    function deleteProduct($productNo) 
    {
        unset($this -> products[$productNo]);
        $this -> products = array_values($this -> products);
        $this -> depth--;
    }

    function getDepth() // Returns how many elements within the array
    {
        return $this -> depth;
    }

    function getProduct($productNo) // Return a particular element within the array by index location
    {
        return $this -> products[$productNo];
    }

    function getSubTotal()
    {
        $total = 0;
        foreach($this->products as $product)
        {
            $total = $total + $product->getCostTotal();
        }

        return $total;
    }

    function getGST()
    {
        $total = floatval($this->getSubTotal()) * 0.1; 
        return $total;
    }

    function getOrderTotal()
    {

        $total = floatval($this->getSubTotal()); 
        return $total;
    }
}

?>