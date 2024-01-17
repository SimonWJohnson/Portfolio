
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
                        <li><a href="">About</a></li>
                        <li><a href="login.html">Login</a></li>
                    </ul>
                </nav>
                <img src="../images/_logo/menu_icon.png" class="menu-icon" onclick="menutoggle()">
            </div>
        </div>
        <!-- Cart Item Details -->
        <div class="small-container cart-page">
            <!-- Insert PHP HERE -->
            <?php
                include('../php/viewCart.php')
            ?>
        <!-- END PHP HERE -->
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
        <!----JS for the Toggle Menu in NavBar----->
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