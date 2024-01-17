
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Product Info - Guitars.com</title>
        <link rel="Stylesheet" href="../css/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;500;600;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/8655a96161.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="../images/_logo/logo_01.png" width="125px">
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li>
                        <div class="box">
                            <input type="checkbox" id="check">
                            <div class="search-box">
                                <input type="text" placeholder="Search...">
                                <label for="check" class="icon">
                                    <i class="fas fa-search"></i>
                                </label>
                            </div>   
                        </div>
                        </li>
                        <li><a href="../index.php">Home</a></li>
                        <li><a href="productsDisplay.php">Products</a></li>
                        <li><a href="productSearch.php">Search</a></li>
                        <li><a href="login.html">Login</a></li>
                    </ul>
                </nav>
                <img src="../images/cart.webp" width="30px" height="30px">
                <img src="../images/_logo/menu_icon.png" class="menu-icon" onclick="menutoggle()">
            </div>
        </div>
        <!------ Display Product Info | Single Product Details --------->
        <div class="small-container single-product">
            <div class="row">
                <!-- php here for selected product display --> 
                <?php
                        include('../php/displayProductInfo.php'); 
                ?>
            </div>
        </div>
        <!-- Title -->
            <div class="small-container">
                <div class="row row-2">
                    <h2>Related Products</h2>
                    <!--<a href="productsDisplay.php"><p>View More...</p></a>-->
                    <a href="productsDisplay.php" class="btn">View More &#x279C;</a>
                </div>
            </div>
        <!-- Related Products -->
        <div class="small-container">
            <div class="row"><!--new row 01-->
                <div class="col-4">
                    <a href="productInfoDisplay.php?id=6"><img src="../images/_gibson/gibsonFV_Custom.png"></a>
                    <h4>Gibson CS Flying V</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$5,499.00</p>
                </div>
                <div class="col-4">
                <a href="productInfoDisplay.php?id=3"><img src="../images/_gibson/gibsonEx.png"></a>
                    <h4>Gibson 70s Explorer</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$2,499.00</p>
                </div>
                <div class="col-4">
                <a href="productInfoDisplay.php?id=2"><img src="../images/_gibson/gibsonFV.png"></a>
                    <h4>Gibson 70s Flying V</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$2,499.00</p>
                </div>
            </div>
        </div>
        <!-- Brands -->
        <div class="brands">
            <div class="small-container">
                <div class="row">
                    <div class="col-5">
                        <img src="../images/_logo/gibson_Guitar_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images/_logo/fender_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images/_logo/esp_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\mesa_boogie_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\marshall_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\vox_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\FAS_logo_full.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\friedman_amplification_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\dean_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\edwards_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\mxr_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="../images\_logo\tc-electronic_logo.png">
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer -->
        <div class="footer">
            <div class="container">
                <div class="row">
                    <div class="footer-col-1">
                        <h3>Download Our App</h3>
                        <p>Download App for Android and iOS Mobile</p>
                        <div class="app-logo">
                            <img src="../images/_logo/playstore_logo.webp">
                            <img src="../images/_logo/App_Store_(iOS).png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="../images/_logo/logo_04.png"> <!-- image to be placed here-->
                        <p>Sustainability Statement - We're doing our best</p>
                    </div>
                    <div class="footer-col-3">
                        <h3>Useful Links</h3>
                        <ul>
                            <li>Contact Us</li>    
                            <li>Delivery & Returns</li>
                            <li>Privacy Policy</li>
                            <li>Repairs</li>
                        </ul>
                    </div>
                    <div class="footer-col-4">
                        <h3>Follow Us</h3>
                        <ul>
                            <li>Facebook</li>    
                            <li>Instagram</li>
                            <li>YouTube</li>
                            <li>Twitter</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <p class="copyright">Copyright 2023 - Simon Johnson, 000608675</p>
            </div>
        </div>
        <!----JS for the Toggle Menu----->
        <script>
            var MenuItems = document.getElementById("MenuItems");
            MenuItems.style.maxHeight = "0px";
            function menutoggle()
            {
                if(MenuItems.style.maxHeight == "0px")
                {
                    MenuItems.style.maxHeight = "200px";
                }
                else
                {
                    MenuItems.style.maxHeight = "0px";
                }
            }
        </script>
    <!----JS for the product gallery ----->
        <script>
            var ProductImg = document.getElementById("ProductImg");
            var SmallImg = document.getElementsByClassName("small-img");

            // Loop through each small image and attach an Event Handler
            for (var i=0; i < SmallImg.length; i++)
            {
                SmallImg[i].addEventListener('click', function()
                {
                    ProductImg.src = this.src; // Use 'this' to refer to the current small-img
                })
            }
        </script>
    </body>
</html>