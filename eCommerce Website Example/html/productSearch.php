
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search Products - Guitars.com</title>
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
                <a href="shoppingCart.php"><img src="../images/cart.webp" width="30px" height="30px"></a>
                <img src="../images/_logo/menu_icon.png" class="menu-icon" onclick="menutoggle()">
            </div>
        </div>
        <!------ Display All Products --------->
        <div class="small-container">
            <div class="row row-2">
                <h2>Search For a Product</h2>
            </div>
            <div class="row">
            <!--php here-->    
                <form action="../html/productSearch.php" method="post">
                    <p>
                    Enter Product Name: <input type="text" name="productName">
                    <br>
                    <input class="btn" type="submit" name="search" value="search">
                    </p>               
                </form>
            </div>
            <div class="row"><!--new row 01-->
                <?php
                    include('../php/searchProducts.php');
                ?>
            </div>
            <!-- Pagination -->
            <div class="page-btn">
                <span>1</span>
                <span>2</span>
                <span>3</span>
                <span>4</span>
                <span>&#8594;</span>
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
    </body>
</html>