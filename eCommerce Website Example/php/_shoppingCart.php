<!-- * EWD Session07: Creating an online storefront * -->
<!-- Setting up db, setting up classes, displaying products, adding/removing from shopping cart, view shopping cart -->
<!--https://web.microsoftstream.com/video/e44bb452-b0cc-4d25-a567-53c0aa0300ea?referrer=https:%2F%2Flearn.tafesa.edu.au%2F-->
<?php
class ShoppingCart
{
    private $itemName = "";
    private $itemPrice = "";
    private $quantity = "";
    private $totalPrice = "";

    // Constructor
    public function __construct($n, $p, $qty, $tp)
    {
        $this -> itemName = $n;
        $this -> itemPrice = $p;
        $this -> quantity = $qty;
        $this -> totalPrice = $tp;
    }

    // Setters
    public function setItemName($n)
    {
        $this -> itemName = $n;
    }

    public function setItemPrice($p)
    {
        $this -> itemPrice = $p;
    }

    public function setQuantity($qty)
    {
        $this -> quantity = $qty;
    }

    public function setTotalPrice($tp)
    {
        $this -> totalPrice = $tp;
    }

    // Getters
    public function getItemName()
    {
        return $this -> itemName;
    }

    public function getItemPrice()
    {
        return $this -> itemPrice;
    }

    public function getQuantity()
    {
        return $this -> quantity;
    }

    public function getTotalPrice()
    {
        return $this -> totalPrice;
    }

    

    // Calculate the total
    public function calculateTotal()
    {
        $this -> totalPrice = $this -> itemPrice * $this -> quantity;   
    }

    // toString Method
    public function toString()
    {
        return $this -> itemName."<br/>".$this->itemPrice."<br/>".$this->quantity."<br/>".$this->totalPrice."<br/>";
    }

}
?>