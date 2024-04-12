<?php

// Reference code snippets - where they fit, what the connect to and what they interact with
class Product
{
    private $productID;
    private $productName;
    private $productDescription;
    private $manufacturer;
    private $price;
    private $qtyInStock;
    private $imageList = [];
    private $qtySelected = 0;

    // Calculate total price of products (if a customer buys more than 1 of the same Product)
    function getCostTotal() // * rename this *
    {
        return $this -> qtySelected * $this -> price;
    }

    // Constructor
    function __construct($productID, $productName, $productDescription, $manufacturer, $price, $qtyInStock)
    {
        $this -> productID = $productID;
        $this -> productName = $productName;
        $this -> productDescription = $productDescription;
        $this -> manufacturer = $manufacturer;
        $this -> price = $price;
        $this -> qtyInStock = $qtyInStock;
        $this -> imageList = [];
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


    function getImage($arrayLocation)
    {
        return $this->imageList[$arrayLocation];   
    }
    

    function getImageList()
    {
        return $this -> imageList;
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

    /* IMAGE LIST*/
    function setImageList()
    {
        try
        {
            //Connect to the db
            //require_once('conn_guitarsdb.php');
            include('conn_guitarsdb.php');
            
            //select images associated with the product id passed in
            $imageQuery = 'SELECT * FROM images WHERE (productID = ?)';
            //prepare
            $stmt = $mysqli->prepare($imageQuery);
            //bind
            $stmt->bind_param('i', $this->productID);
            //execute
            $stmt->execute();
            $result = $stmt->get_result(); 
            
            while($row = $result->fetch_assoc())
            {
                array_push($this->imageList, $row["imagePath"]);
            }

        }
        catch(Exception $e)
        {
            error_log($e -> getMessage());
            echo $e;
        }
    }


    // toString Method
    public function toString()
    {
        return $this -> productID."<br/>".$this -> productName."<br/>".$this -> productDescription."<br/>".
        $this -> manufacturer."<br/>".$this -> price."<br/>".$this -> qtyInStock."<br/>";
    }



}
?>