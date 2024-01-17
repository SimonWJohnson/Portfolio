
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mock Website</title>
        <link rel="Stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;500;600;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/8655a96161.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <img src="images/_logo/logo_01.png" width="125px">
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
                        <li><a href="index.php">Home</a></li>
                        <li><a href="html/productsDisplay.php">Products</a></li>
                        <li><a href="html/productSearch.php">Search</a></li>
                        <li><a href="html/login.html">Login</a></li>
                    </ul>
                </nav>
                <a href="html/shoppingCart.php"><img src="images/cart.webp" width="30px" height="30px"></a>
                <img src="images/_logo/menu_icon.png" class="menu-icon" onclick="menutoggle()">
            </div>
            <div class="row">
                <div class="col-2">
                    <h1>Guitars Rule!</h1>
                    <p>Guitar playing is awesome; learning new songs, playing your favourite songs, 
                        chilling out, and having fun is what it's all about.
                    </p>
                    <a href="html/productsDisplay.php" class="btn">Getchya Pull &#x279C;</a>
                </div>
                <div class="col-2">
                    <img src="images/hetfield.jpg"><!-- Maybe a slideshow / carousel here -->
                </div>
            </div>
        </div>
        </div>
        <!------ Featured Catagory --------->
        <div class="categories">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <img src="images/_esp/espmx220.jpg">
                    </div>
                    <div class="col-3">
                        <img src="images/_esp/esp_mx250.jpg">
                    </div>
                    <div class="col-3">
                        <img src="images/_esp/ironCross.jpg">
                    </div>
                </div>
            </div>          
        </div>
        <!------ Featured Products --------->
        <div class="small-container">
            <h2 class="title"> Featured Products</h2>
            <div class="row">
                <div class="col-4">
                    <a href="html/productInfoDisplay.php?id=1"><img src="images/_gibson/gibsonLPSup.png"></a>
                    <h4>Gibson Les Paul Supreme</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <p>$3,999.00</p>      
                </div>
                <div class="col-4">
                    <a href="html/productInfoDisplay.php?id=3"><img src="images/_gibson/gibsonEx.png"></a>
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
                    <a href="html/productInfoDisplay.php?id=2"><img src="images/_gibson/gibsonFV.png"></a>
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
                <div class="col-4">
                    <a href="html/productInfoDisplay.php?id=6"><img src="images/_gibson/gibsonFV_Custom.png"></a>
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
                <a href="html/productInfoDisplay.php?id=10"><img src="images/_gibson/gibsonFV_58ReissueWhite.png"></a>
                    <h4>Gibson CS Flying V</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$9,999.00</p>
                </div>
                <div class="col-4">
                    <a href="html/productInfoDisplay.php?id=9"><img src="images/_gibson/gibsonFB_63Reissue.png"></a> 
                    <h4>Gibson 1963 Firebird V</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$9,799.00</p>
                </div>
            </div>
            <!-- Latest Products -->
            <h2 class="title"> Latest Products</h2>
            <div class="row">
                <div class="col-4">
                    <a href="html/productInfoDisplay.php?id=4"><img src="images/_gibson/gibsonHUM.png"></a>
                    <h4>Gibson Dove - Cherry</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </div>
                    <p>$3,999.00</p>      
                </div>
                <div class="col-4">
                <a href="html/productInfoDisplay.php?id=7"><img src="images/_gibson/gibsonHUM_Sunburst.png"></a>
                    <h4>Gibson Hummingbird - Sunburst</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$3,999.00</p>
                </div>
                <div class="col-4">
                <a href="html/productInfoDisplay.php?id=8"><img src="images/_gibson/gibsonES_Chuck.jpg"></a>
                    <h4>Gibson Chuck Berry</h4>
                    <div class="rating"> 
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                    </div>
                    <p>$4,699.00</p>
                </div>
            </div>
        </div>
        <!----------- Offer ---------->
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <img src="images/_esp/espKH_GoldSparkle_Ex.png" class="offer-img">
                    </div>
                    <div class="col-2">
                        <p>New Instore - Online Exclusive</p>
                        <h1>ESP KH-V</br>METALLIC GOLD</h1>
                        <small>
                        As the lead guitarist for Metallica, the biggest heavy metal band of all time, 
                        Kirk Hammett has inspired generations of musicians over the past 40+ years. 
                        Kirk's solos are a crucial part of Metallica's dominating sound, and he has relied 
                        on ESP for decades to make guitars that meet his every need. 
                        The LTD KH-V is the newest addition to the Kirk Hammett Signature Series.
                        </small></br>
                        <a href="" class="btn">Yeah Boi &#x279C;</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Brands -->
        <div class="brands">
            <div class="small-container">
                <div class="row">
                    <div class="col-5">
                        <img src="images/_logo/gibson_Guitar_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images/_logo/fender_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images/_logo/esp_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\mesa_boogie_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\marshall_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\vox_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\FAS_logo_full.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\friedman_amplification_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\dean_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\edwards_guitars_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\mxr_logo.png">
                    </div>
                    <div class="col-5">
                        <img src="images\_logo\tc-electronic_logo.png">
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
                            <img src="images/_logo/playstore_logo.webp">
                            <img src="images/_logo/App_Store_(iOS).png">
                        </div>
                    </div>
                    <div class="footer-col-2">
                        <img src="images/_logo/logo_04.png"> <!-- image to be placed here-->
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