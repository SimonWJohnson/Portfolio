

/*
Simon Johnson
Friday 17th June 2022
Assignment Form Validation
*/


/*
Pseudocode
PROGRAM Validate Form
validateForm() function
INPUT First Name
    IF first name is blank
        Error
        INPUT
    END IF
INPUT Last Name
    IF last name is blank
        Error
        INPUT
    END IF
INPUT Address
    IF address is blank
        Error
        INPUT
    END IF
INPUT Phone
    IF phone is blank
        Error
        INPUT
    END IF
INPUT Postcode
    IF postcode length is not equal to 4
        Error
        INPUT
    END IF
INPUT Email
    IF email is length is less than 8 characters
        Error
        INPUT
    END IF
    IF email string does not contain the "@" character
        Error
        INPUT
    END IF
    IF email string does not contain the "." character
        Error
        INPUT
    END IF
INPUT (select) Credit Card
    IF card number length is not 16 digits
        Error
        INPUT
    END IF
INPUT CCV
    IF ccv number length is not 3 digits
        Error
        INPUT
    END IF
INPUT (select) Expiry Month
    IF expiry month selection (value) is blank / "month"
        Error
        INPUT
    END IF
INPUT (select) Expiry Year
    IF expiry year selection (value) is blank / "year"
        Error
        INPUT
    END IF
    IF expiry year is equal to current year
        IF expiry month is less than (before) current month
            Error
            INPUT
        END IF
    END IF
END
*/ 




// Userform styling  
var userform = document.getElementById("userForm");
userform.style.backgroundColor = "gold";
userform.style.textAlign = "left";
userform.style.maxWidth = "600px";

// Fieldset header (legend) styling
var legend1 = document.getElementById("legend1");
legend1.style.color = "red";
legend1.style.fontSize = "30px";
legend1.style.fontWeight = "500";
legend1.style.fontFamily = "";
legend1.style.textAlign = "center";

var legend2 = document.getElementById("legend2");
legend2.style.color = "red";
legend2.style.fontSize = "30px";
legend2.style.fontWeight = "500";
legend2.style.textAlign = "center";

// Fieldset 1 styling
var fieldset1 = document.getElementById("fieldset1");
fieldset1.style.borderStyle = "dotted";
fieldset1.style.borderColor = "purple";
fieldset1.style.margin = "10px";
fieldset1.style.padding = "10px";

var firstNameTextField = document.getElementById("fName");
firstNameTextField.style.marginLeft= "10px";

var lastNameTextField = document.getElementById("lName");
lastNameTextField.style.marginLeft= "10px";

var addressTextField = document.getElementById("address");
addressTextField.style.marginLeft= "27px";

var phoneTextField = document.getElementById("phone");
phoneTextField.style.marginLeft = "40px";

var postcodeTextField = document.getElementById("postcode");
postcodeTextField.style.marginLeft = "22px";

var emailTextField = document.getElementById("email");
emailTextField.style.marginLeft = "40px";

// Fieldset 2 styling
var fieldset2 = document.getElementById("fieldset2");
fieldset2.style.borderStyle = "dotted";
fieldset2.style.borderColor = "purple";
fieldset2.style.margin = "10px";
fieldset2.style.padding = "10px";

var creditCardSelect = document.getElementById("creditCard");
creditCardSelect.style.marginLeft = "23px";

var cardNumberTextField = document.getElementById("cardNumber");
cardNumberTextField.style.marginLeft = "10px";

var ccvTextField = document.getElementById("ccv");
ccvTextField.style.marginLeft = "65px";


// Div container button styling
var buttonSection = document.getElementById("buttonSection");
buttonSection.style.textAlign = "center";

// Button styling
var submitButton = document.getElementById("submit");
submitButton.style.color = "white";
submitButton.style.backgroundColor = "#18F71E";
submitButton.style.borderColor = "#18F71E";
submitButton.style.borderRadius = "5px";
submitButton.style.marginRight = "10px";

var helpButton = document.getElementById("help");
helpButton.style.color = "white";
helpButton.style.backgroundColor = "orange";
helpButton.style.borderColor = "orange";
helpButton.style.borderRadius = "5px";
helpButton.style.marginLeft = "10px";

var websiteButton = document.getElementById("website");
websiteButton.style.color = "white";
websiteButton.style.backgroundColor = "#CA5FF2";
websiteButton.style.borderColor = "#CA5FF2";
websiteButton.style.borderRadius = "5px";


// onFocus and onBlur function for textfields and drop-down menus
function changeBgd(textField){
    textField.style.background = "aqua";
}

function resetBgd(textField){
    textField.style.background = "white";
}

/*
Pseudocode
PROGRAM Go to another website
popup() function
INPUT onClick event
WHILE choice is less than one or greater than 3
    alert error
    INPUT
    ENDWHILE
IF choice is equal to one
    OUTPUT popup to google website
ELSE IF choice is equal to two
    OUTPUT popup to tafe website
ELSE IF choice is equal to three
    OUTPUT popup to learn website
    ENDIF
END
*/ 

function popup(){
    var choice = 0; // User INPUT
    choice = parseInt(prompt("Where do you want to go? \n1. Google \n2. TAFESA \n3. Learn", "1"));
    while (choice < 1 || choice > 3){ // Validate choice using a WHILE LOOP
        alert("Error! Please enter a number between 1 and 3");
        choice = parseInt(prompt("Where do you want to go? \n1. Google \n2. TAFESA \n3. Learn", "1"));
    }
    if (choice == 1){ // IF statement to determine action based on validated user input
     window.open("http://www.google.com", "myWindow", "status = 1, height = 800, width = 800, resizable = 0");
     return;
    }
    else if (choice == 2){
        window.open("https://www.tafesa.edu.au/", "myWindow", "status = 1, height = 800, width = 800, resizable = 0");
        return;
    }
    else if (choice == 3){
        window.open("https://learn.tafesa.edu.au/", "myWindow", "status = 1, height = 800, width = 800, resizable = 0");
     return;
    } // END IF
}

    // Opens the Help Window
function helpPage(){
    window.open("../html/helpWindow.html", "myWindow", "status = 1, height = 500, width = 500, resizable = 0");
    
}

// Onload function to generate the Help Window styling
function loadPage(){
    // Help Window Styling
    var helpDiv = document.getElementById("helpDiv");
    var customerDetailsSection = document.getElementById("customerDetailsSection");
    var paymentDetailsSection = document.getElementById("paymentDetailsSection");
    var fPHeader = document.getElementById("fPHeader");
    var header1 = document.getElementById("header1");
    var header2 = document.getElementById("header2");
    
    helpDiv.style.backgroundColor = "gold";
    fPHeader.style.color = "red";
    header1.style.color = "red";
    header2.style.color = "red";
    
    fPHeader.style.textAlign = "center";
    header1.style.marginLeft = "10px";
    header2.style.marginLeft = "10px";
    
    customerDetailsSection.style.marginLeft = "10px";
    customerDetailsSection.style.borderStyle = "dotted";
    customerDetailsSection.style.borderColor = "purple";
    customerDetailsSection.style.margin = "5px";
    customerDetailsSection.style.padding = "5px";
    
    paymentDetailsSection.style.marginLeft = "10px";
    paymentDetailsSection.style.borderStyle = "dotted";
    paymentDetailsSection.style.borderColor = "purple";
    paymentDetailsSection.style.margin = "5px";
    paymentDetailsSection.style.padding = "5px";


}

function validateForm(){
    // Define Variables
    var fName = document.getElementById("fName");
    var fNameError = document.getElementById("fNameError");
    var lName = document.getElementById("lName");
    var lNameError = document.getElementById("lNameError");
    var address = document.getElementById("address");
    var addressError = document.getElementById("addressError");
    var phone = document.getElementById("phone");
    var phoneError = document.getElementById("phoneError");
    var postcode = document.getElementById("postcode");
    var postcodeError = document.getElementById("postcodeError");
    var email = document.getElementById("email");
    var emailError = document.getElementById("emailError");
    var creditCard = document.getElementById("creditCard");
    var creditCardError = document.getElementById("creditCardError");
    var cardNumber = document.getElementById("cardNumber");
    var cardNumberError = document.getElementById("cardNumberError");
    var ccv = document.getElementById("ccv");
    var ccvError = document.getElementById("ccvError");
    var date = new Date();
    var month = date.getMonth()+1; // Get the current month
    var year = date.getFullYear(); // Get the current year
    var expiryMonth = document.getElementById("expiryMonth");
    var expiryMonthError = document.getElementById("expiryMonthError");
    var expiryYear = document.getElementById("expiryYear");
    var expiryYearError = document.getElementById("expiryYearError");

    // First Name - Validate not left blank
    if (fName.value == ""){
        fName.style.border = "2px solid red";
        fNameError.style.color = "red";
        fNameError.innerHTML = "* First Name required";
        fName.focus();
        return false;
    }
    else {
        fNameError.innerHTML = "";
        fName.style.border = "2px solid #18F71E";
    }
    
    // Last Name - Validate not left blank
    if (lName.value == ""){
        lName.style.border = "2px solid red";
        lNameError.style.color = "red";
        lNameError.innerHTML = "* Last Name required";
        lName.focus();
        return false;
    }
    else {
        lNameError.innerHTML = "";
        lName.style.border = "2px solid #18F71E";
    }
    
    // Address - Validate not left blank
    if (address.value == ""){
        address.style.border = "2px solid red";
        addressError.style.color = "red";
        addressError.innerHTML = "* Address required";
        address.focus();
        return false;
    }
    else {
        addressError.innerHTML = "";
        address.style.border = "2px solid #18F71E";
    }
    
    // Phone - Validate not left blank
    if (phone.value == ""){
        phone.style.border = "2px solid red";
        phoneError.style.color = "red";
        phoneError.innerHTML = "* Phone Number required";
        phone.focus();
        return false;
    }
    else {
        phoneError.innerHTML = "";
        phone.style.border = "2px solid #18F71E";
    }

    // Postcode - Validate not left blank, must be numeric, must be 4 digits
    if (postcode.value.length != 4){
        postcode.style.border = "2px solid red";
        postcodeError.style.color = "red";
        postcodeError.innerHTML = "* PostCode must be 4 digits";
        postcode.focus();
        return false;
    }
    else {
        postcodeError.innerHTML = "";
        postcode.style.border = "2px solid #18F71E";
    }

    // Email - Validate not left blank, must be at least 8 Characters, must contain both a "@" and "." symbol
    if (email.value.length < 8){
        email.style.border = "2px solid red";
        emailError.style.color = "red";
        emailError.innerHTML = "* Email must be at least 8 characters";
        email.focus();
        return false;
    }
    if (email.value.indexOf("@") == -1){
        email.style.border = "2px solid red";
        emailError.style.color = "red";
        emailError.innerHTML = "* Invalid Email - '@' required";
        email.focus();
        return false;
    }
    if (email.value.indexOf(".") == -1){
        email.style.border = "2px solid red";
        emailError.style.color = "red";
        emailError.innerHTML = "* Invalid Email - '.' required";
        email.focus();
        return false;
    }
    else {
        emailError.innerHTML = "";
        email.style.border = "2px solid #18F71E";
    }

    // Credit Card - Validate not left blank, CC must be selected
    if (creditCard.selectedIndex === 0){
        creditCardError.style.color = "red";
        creditCardError.innerHTML = "* Choose a Credit Card";
        creditCard.focus();
        return false;
    }
    else{
        creditCardError.innerHTML = "";
        creditCard.style.border = "2px solid #18F71E";
    }
        

    // Card Number - Validate not left blank, must be numeric, must be 16 digits
    if (cardNumber.value.length != 16){
        cardNumber.style.border = "2px solid red";
        cardNumberError.style.color = "red";
        cardNumberError.innerHTML = "* Card Number must be 16 digits";
        cardNumber.focus();
        return false;
    }
    else {
        cardNumberError.innerHTML = "";
        cardNumber.style.border = "2px solid #18F71E";
    }
        
    // CCV - Validate not left blank, must be numeric, must be 3 digits
    if (ccv.value.length != 3){
        ccv.style.border = "2px solid red";
        ccvError.style.color = "red";
        ccvError.innerHTML = "* CCV must be 3 digits";
        ccv.focus();
        return false;
    }
    else {
        ccvError.innerHTML = "";
        ccv.style.border = "2px solid #18F71E";
    }
    
    // Expiry Month - Validate not left blank, must be selected
    if (expiryMonth.selectedIndex === 0) {
        expiryMonth.style.border = "2px solid red";
        expiryMonthError.style.color = "red";
        expiryMonthError.innerHTML = "* Expiry month required";
        expiryMonth.focus();
        return false; 
    }
    else {
        expiryMonthError.innerHTML = "";
        expiryMonth.style.border = "2px solid #18F71E";
    }

    // Expiry Year - Validate not left blank, must be selected
    if(expiryYear.selectedIndex === 0){
        expiryYear.style.border = "2px solid red";
        expiryYearError.style.color = "red";
        expiryYearError.innerHTML = "* Expiry year required";
        expiryYear.focus();
        return false;
    }
    else {
        expiryYearError.innerHTML = "";
        expiryYear.style.border = "2px solid #18F71E";
    }

    // CC Validation - Validate month in context of year selected
    if(expiryYear.value == year){
        if(expiryMonth.selectedIndex < month){
            expiryMonth.style.border = "2px solid red";
            expiryMonthError.style.color = "red";
            expiryMonthError.innerHTML = "* Invalid expiry month";
            expiryMonth.focus();
            return false;
        }
        else {
            expiryMonthError.innerHTML = "";
            expiryMonth.style.border = "2px solid #18F71E";
            expiryYearError.innerHTML = "";
            expiryYear.style.border = "2px solid #18F71E";
        }
    }

    // Once all requirements have been met, the form is validated and submitted
    // An alert is triggered to let the user know the form has been submitted
    alert ("Your form has been successfully submitted. Thank you.")
    return true;
}