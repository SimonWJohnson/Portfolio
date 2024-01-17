
<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mock Website</title>
        <link rel="Stylesheet" href="../css/style.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;500;600;700&display=swap" rel="stylesheet">
        <script src="https://kit.fontawesome.com/8655a96161.js" crossorigin="anonymous"></script>
    </head>
    <body>     
        <!-- Payment Form -->
        <div class="payment-div">
            <div class="payment-container">
                <!-- Card Image -->
                <div class="card-container">
                    <div class="front">
                        <div class="image">
                            <img src="../images/_logo/cvv_vector.jpg" alt="">
                            <img src="../images/_logo/visaLogo.jpg" alt="">
                        </div>
                        <div class="card-number-box">################</div>
                        <div class="payment-flexbox">
                            <div class="box">
                                <span>Card Holder</span>
                                <div class="card-holder-name">Full Name</div>
                            </div>
                            <div class="box">
                                <span>Expiration</span>
                                <div class="expiration">
                                    <span class="exp-month">MM</span>
                                    <span class="exp-year">YY</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="back">
                        <div class="stripe">
                            <div class="box">
                                <span>CVV</span>
                                <div class="cvv-box"></div>
                                <img src="../images/_logo/visaLogo.jpg" alt="Visa Card Logo">
                            </div>
                        </div>
                    </div>
                </div>
                <form action="../php/processPayment.php" method="POST">
                    <div class="inputBox">
                        <span>Card Number:</span>
                        <input name="cardNo" type="text" maxlength="16" class="card-number-input">
                    </div>
                    <div class="inputBox">
                        <span>Name on Card:</span>
                        <input name="cardName" type="text" class="card-name-input">
                    </div>
                    <div class="payment-flexbox">
                        <div class="inputBox">
                            <span>Expiration MM</span>
                            <select name="expMonth" id="" class="month-input">
                                <option value="month" selected disabled>Month</option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                        <div class="inputBox">
                            <span>Expiration YY</span>
                            <select name="expYear" id="" class="year-input">
                                <option value="year" selected disabled>Year</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                                <option value="2026">2026</option>
                                <option value="2027">2027</option>
                            </select>
                        </div>
                    </div>
                    <div class="payment-flexbox">
                        <div class="inputBox">
                            <span>Card Type</span>
                            <select name="cardType" id="" class="card-type-input">
                                <option value="year" selected disabled>Card...</option>
                                <option value="Visa">Visa</option>
                                <option value="Master Card">Master Card</option>
                                <option value="American Express">American Express</option>
                            </select>
                        </div>        
                        <div class="inputBox">
                            <span>CVV:</span>
                            <input name="cvv" type="text" maxlength="3" class="card-cvv-input">
                        </div>
                    </div>
                    <div class="payment-flexbox">
                        <div class="inputBox">
                            <span>First Name:</span>
                            <input name="firstName" type="text" class="first-name-input">
                        </div>
                        <div class="inputBox">
                            <span>Last Name:</span>
                            <input name="lastName" type="text" class="last-name-input">
                        </div>
                    </div>
                    <div class="inputBox">
                        <span>Email:</span>
                        <input name="email" type="text" class="email-input">
                    </div>
                    <div class="inputBox">
                        <span>Telephone:</span>
                        <input name="telephone" type="text" class="email-input">
                    </div>
                    <div class="inputBox">
                        <span>Street Address:</span>
                        <input name="street" type="text" class="street-address-input">
                    </div>
                    <div class="payment-flexbox">
                        <div class="inputBox">
                            <span>Suburb:</span>
                            <input name="suburb" type="text" class="suburb-input">
                        </div>
                        <div class="inputBox">
                            <span>City:</span>
                            <input name="city" type="text" class="city-input">
                        </div>
                    </div>
                    <div class="payment-flexbox">
                        <div class="inputBox">
                            <span>State:</span>
                            <input name="state" type="text" class="state-input">
                        </div>
                        <div class="inputBox">
                            <span>Country:</span>
                            <input name="country" type="text" class="country-input">
                        </div>
                        <div class="inputBox">
                            <span>Postcode:</span>
                            <input name="postcode" type="text" class="postcode-input">
                        </div>
                    </div>
                    <input type="submit" value="SUBMIT" class="btn">
                </form>
                <div class="payment-flexbox">
                    <a href="productsDisplay.php" class="btn">Back to Products Page</a>
                </div>
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
        <script>
            /* Dynamic Card content */
            /* CC Number */
            document.querySelector('.card-number-input').oninput = () => 
            {
                document.querySelector('.card-number-box').innerText = 
                    document.querySelector('.card-number-input').value;
            }
            /* Card holder name */
            document.querySelector('.card-name-input').oninput = () =>
            {
                document.querySelector('.card-holder-name').innerText = 
                    document.querySelector('.card-name-input').value;
            }
            /* Expiration month */
            document.querySelector('.month-input').oninput = () =>
            {
                document.querySelector('.exp-month').innerText = 
                    document.querySelector('.month-input').value;
            }
            /* Expiration year */
            document.querySelector('.year-input').oninput = () =>
            {
                document.querySelector('.exp-year').innerText = 
                    document.querySelector('.year-input').value;
            }
            /* CVV input */
            document.querySelector('.card-cvv-input').onmouseenter = () => 
            {
                document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(-180deg)';
                document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(0deg)';
            } 
            document.querySelector('.card-cvv-input').onmouseleave = () => 
            {
                document.querySelector('.front').style.transform = 'perspective(1000px) rotateY(0deg)';
                document.querySelector('.back').style.transform = 'perspective(1000px) rotateY(180deg)';
            }
            document.querySelector('.card-cvv-input').oninput = () => 
            {
                document.querySelector('.cvv-box').innerText = 
                    document.querySelector('.card-cvv-input').value;
            }  
        </script>
    </body>
</html>