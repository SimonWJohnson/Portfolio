<?php

class Product
{
    private $productID;
    private $productName;
    private $productDescription;
    private $manufacturer;
    private $price;
    private $qtyInStock;
    private $image;
    private $qtySelected = 0;

    // Calculate total price of products (if a customer buys more than 1 of the same Product)
    function getCostTotal() // * rename this *
    {
        return $this -> qtySelected * $this -> price;
    }

    // Constructor
    function __construct($productID, $productName, $productDescription, $manufacturer, $price, $qtyInStock, $image)
    {
        $this -> productID = $productID;
        $this -> productName = $productName;
        $this -> productDescription = $productDescription;
        $this -> manufacturer = $manufacturer;
        $this -> price = $price;
        $this -> qtyInStock = $qtyInStock;
        $this -> image = $image; 
        $this -> qtySelected = 0;
    }

    // Getters
    function getProductID()
    {
        return $this -> productID;
    }

    function getProductName()
    {
        return $this -> productName;
    }

    function getProductDescription()
    {
        return $this -> productDescription;
    }

    function getManufacturer()
    {
        return $this -> manufacturer;
    }

    function getPrice()
    {
        return $this -> price;
    }

    function getQtyInStock()
    {
        return $this -> qtyInStock;
    }

    function getImage()
    {
        return $this -> image;
    }

    function getQtySelected()
    {
        return $this->qtySelected;
    }

    function getGST()
    {
        $total = $this->getCostTotal() * 0.1;
        return $total;
    }

    // Setter
    function setQtySelected($qtySelected)
    {
        $this->qtySelected = $qtySelected;
    }


    // toString Method
    public function toString()
    {
        return $this -> productID."<br/>".$this -> productName."<br/>".$this -> productDescription."<br/>".
        $this -> manufacturer."<br/>".$this -> price."<br/>".$this -> qtyInStock."<br/>".$this -> image."<br/>";
    }



}
?>