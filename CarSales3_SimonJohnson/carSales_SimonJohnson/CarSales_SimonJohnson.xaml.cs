using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.WindowsRuntime;
using Windows.Foundation;
using Windows.Foundation.Collections;
using Windows.UI.Popups;
using Windows.UI.Xaml;
using Windows.UI.Xaml.Controls;
using Windows.UI.Xaml.Controls.Primitives;
using Windows.UI.Xaml.Data;
using Windows.UI.Xaml.Input;
using Windows.UI.Xaml.Media;
using Windows.UI.Xaml.Navigation;

// The Blank Page item template is documented at https://go.microsoft.com/fwlink/?LinkId=234238

namespace carSales_SimonJohnson
{
    /// Simon Johnson
    /// Tuesday 21st of June 2022
    /// assignment CarSalesV3
    
    public sealed partial class CarSales_SimonJohnson : Page
    {
        public CarSales_SimonJohnson()
        {
            this.InitializeComponent();
        }

        /// <summary>
        /// All arrays populated within the Page_Loaded event
        /// </summary>
        // Customer Names Array
        string[] customerNames = new string[10];

        // Customer Phone Numbers Array
        string[] customerPhoneNumbers = new string[10]; 

        // Vehicle Makes Array
        string[] vehicleMakes = new string[8];

        /// <summary>
        /// A sequential search to iterate through the cutomerNames Array to find an element/item
        /// input from the user.  Steps through each element in the array until either a match is found
        /// or the end of the array is reached (without a match found).
        /// Called in the searchNameButton_Click and deleteNameButton_Click event handlers
        /// </summary>
        /// <param name="criteria"></param>
        /// <returns>Index of array if found, or Not Found (-1)</returns>
        // Array search method (Sequential)
        private int searchArray(string criteria)
        {
            int counter = 0;
            bool found = false;
            while (!found && counter < customerNames.Length) // While not found and not end of the array
            {
                if (criteria == customerNames[counter].ToUpper())
                    found = true;
                else
                    counter++; // If no match, move on to next element in the array
            }
            if (counter < customerNames.Length)
                return counter; // Return index of array element found
            else
                return -1; // Return -1 if not found
        }

        /// <summary>
        /// Binary search method to search a sorted array by repeatedly dividing the search interval in half.
        /// Begins with an interval covering the entire array, then narrows the interval to
        /// either the upper or lower half of the interval depending on the value of the search key relative to the
        /// middle interval. Each repition halves the search interval until the value is either found or not found.
        /// Called in the binarySearchButton_Click event handler
        /// </summary>
        /// <param name="data"></param>
        /// <param name="item"></param>
        /// <returns>Found or Not Found (-1)</returns>
        // Array search method (Binary)
        public int binarySearchArray(string[] data, string item)
        {
            int min = 0;
            int max = data.Length - 1;
            int mid;
            item = item.ToUpper();
            do
            {
                mid = (min + max) / 2;
                if (data[mid].ToUpper() == item)
                    return mid;
                if (item.CompareTo(data[mid].ToUpper()) > 0)
                    min = mid + 1;
                else
                    max = mid - 1;
            }
            while (min <= max);
            return -1;
        }

        /// <summary>
        /// Method for calculating the warranty according to the option selected in the combobox, called in the summaryButton_Click_1 Event Handler
        /// </summary>
        /// <param name="vehicleCost"></param>
        /// <returns>warrantyCost</returns>
        private double calcVehicleWarranty(double vehicleCost)
        {
            const double ONE_YEAR = 0;
            const double TWO_YEAR = 0.05;
            const double THREE_YEAR = 0.10;
            const double FIVE_YEAR = 0.20;

            double warrantyCost= 0;
            
            if (vehicleWarrantyComboBox.SelectedValue.ToString() == "1 year warranty has no charge")
            {
                warrantyCost = vehicleCost * ONE_YEAR;
            }
            else if (vehicleWarrantyComboBox.SelectedValue.ToString() == "2 years at 5% of vehicle cost")
            {
                warrantyCost = vehicleCost * TWO_YEAR;
            }
            else if (vehicleWarrantyComboBox.SelectedValue.ToString() == "3 years at 10% of vehicle cost")
            {
                warrantyCost = vehicleCost * THREE_YEAR;
            }
            else if (vehicleWarrantyComboBox.SelectedValue.ToString() == "5 years at 20% of vehicle cost")
            {
                warrantyCost = vehicleCost * FIVE_YEAR;
            }
            return warrantyCost;
        }

        /// <summary>
        /// Method for calculating total cost of Optional Extras selected, called in the summaryButton_Click_1 Event Handler
        /// </summary>
        /// <returns>optionalExtras</returns>
        private double calcOptionalExtras()
        ///
        {
            const double WINDOW_TINTING = 150;
            const double DUCO_PROTECTION = 180;
            const double FLOOR_MATS = 320;
            const double DELUXE_SOUND = 350;

            double optionalExtras = 0;
            
            if (tintingCheckBox.IsChecked == true)
            {
                optionalExtras += WINDOW_TINTING;
            }
            if (protectionCheckBox.IsChecked == true)
            {
                optionalExtras += DUCO_PROTECTION;
            }
            if (matsCheckBox.IsChecked == true)
            {
                optionalExtras += FLOOR_MATS;
            }
            if (soundCheckBox.IsChecked == true)
            {
                optionalExtras += DELUXE_SOUND;
            }
            return optionalExtras;
        }

        /// <summary>
        /// Method for calculating insurance according to the radio button selected (if selected), called in the summaryButton_Click_1 Event Handler
        /// Radio buttons are activated using the toggle switch, which is controlled using the insuranceToggleSwitch_Toggled event handler 
        /// </summary>
        /// <param name="vehicleCost"></param>
        /// <param name="optionalExtras"></param>
        /// <returns>insuranceCost</returns>
        private double calcAccidentInsurance(double vehicleCost, double optionalExtras)
        ///
        {
            const double UNDER_25 = 0.20;
            const double OVER_25 = 0.10;
            double insuranceCost = 0;

            if (under25RadioButton.IsChecked == true)
            {
                insuranceCost = (vehicleCost + optionalExtras) * UNDER_25;
            }
            else if (over25RadioButton.IsChecked == true)
            {
                insuranceCost = (vehicleCost + optionalExtras) * OVER_25;
            }
            return insuranceCost;
        }

        private async void summaryButton_Click_1(object sender, RoutedEventArgs e)
        {
            const double GST_RATE = 0.1;
            double subAmount;
            double gstAmount;
            double finalAmount;
            double vehicleCost, tradeIn, warrantyCost, optionalExtras, insuranceCost;

            /*First try/catch code block to validate correct data input, i.e. input must be numeric.
            If the input is not numeric, the user will be directed via a message dialog box to re-input 
            a numeric value in the respective TextBox.  The program focuses on the appropriate TextBox, 
            and the contents is selected/highlighted as a call to action. */
            try
            {
                vehicleCost = double.Parse(vehiclePriceInputTextBox.Text);
            }
            catch (Exception ex)
            {
                var dialogMessage = new MessageDialog("Error! Please enter an integer number. " + ex.Message);
                await dialogMessage.ShowAsync();
                vehiclePriceInputTextBox.Focus(FocusState.Programmatic);
                vehiclePriceInputTextBox.SelectAll();
                return;
            }
            if (vehicleCost <= 0) // Validate vehicle price is greater than 0
            {
                var dialogMessage = new MessageDialog("Error! Vehicle price must be more than $0. Re-enter vehicle price.");
                await dialogMessage.ShowAsync();
                vehiclePriceInputTextBox.Focus(FocusState.Programmatic);
                vehiclePriceInputTextBox.SelectAll();
                return;
            }

            if (String.IsNullOrEmpty(valuePriceTextBox.Text)) // Check if the trade in field is empty and set to 0 as default
            {
                valuePriceTextBox.Text = "0";
            }
            try // Validate correct data input as numeric
            {
                tradeIn = double.Parse(valuePriceTextBox.Text);
            }
            catch (Exception ex) // Message and call to action for incorrect data types
            {
                var dialogMessage = new MessageDialog("Error! Please enter an integer number. " + ex.Message);
                await dialogMessage.ShowAsync();
                valuePriceTextBox.Focus(FocusState.Programmatic);
                valuePriceTextBox.SelectAll();
                return;
            }
            if (tradeIn < 0) // Validate trade-in is not less than 0
            {
                var dialogMessage = new MessageDialog("Error! Value of trade in cannot be less than $0. Re-enter value of trade in.");
                await dialogMessage.ShowAsync();
                valuePriceTextBox.Focus(FocusState.Programmatic);
                valuePriceTextBox.SelectAll();
                return;
            }
            if (tradeIn > vehicleCost) // Validate that the value of trade in is less than the vehicle price
            {
                var dialogMessage = new MessageDialog("Error! Value of trade in must be less than vehicle price. Re-enter value of trade in.");
                await dialogMessage.ShowAsync();
                valuePriceTextBox.Focus(FocusState.Programmatic);
                valuePriceTextBox.SelectAll();
                return;
            }
            // Calculations and corresponding OUTPUTS
            // Methods
            warrantyCost = calcVehicleWarranty(vehicleCost);

            optionalExtras = calcOptionalExtras();

            insuranceCost = calcAccidentInsurance(vehicleCost, optionalExtras);

            // Calculations
            subAmount = (vehicleCost + warrantyCost + optionalExtras + insuranceCost ) - tradeIn;
            subAmountTextBox.Text = subAmount.ToString("C");

            gstAmount = subAmount * GST_RATE;
            gstAmountTextBox.Text = gstAmount.ToString("C");

            finalAmount = subAmount + gstAmount;
            finalAmountTextBox.Text = finalAmount.ToString("C");

            // OUTPUT all summary data as strings to the 'Summary Details' section
            summaryTextBlock.Text = "Customer name: " + customerNameInputTextBox.Text 
                + "\nCustomer phone: " + customerPhoneInputTextBox.Text 
                + "\nVehicle price: " + vehicleCost.ToString("C") 
                + "\nValue of trade-in: " + tradeIn.ToString("C") 
                + "\nSub Amount: " + subAmount.ToString("C") 
                + "\nGST Amount: " + gstAmount.ToString("C")
                + "\nWarranty Cost: " + warrantyCost.ToString("C") 
                + "\nOptional Extras Cost: " + optionalExtras.ToString("C")
                + "\nInsurance Cost: " + insuranceCost.ToString("C")
                + "\nFINAL AMOUNT: " + finalAmount.ToString("C");
        }

        private async void saveDetailsButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(customerNameInputTextBox.Text)) // Validate that field is not left blank
            {
                var dialogMessage = new MessageDialog("Error! Customer name cannot be left blank. Re-enter customer name.");
                await dialogMessage.ShowAsync();
                customerNameInputTextBox.Focus(FocusState.Programmatic);
                customerNameInputTextBox.SelectAll();
                return;
            }
            if (String.IsNullOrEmpty(customerPhoneInputTextBox.Text)) // Validate that field is not left blank
            {
                var dialogMessage = new MessageDialog("Error! Customer phone number cannot be left blank. Re-enter customer phone number.");
                await dialogMessage.ShowAsync();
                customerPhoneInputTextBox.Focus(FocusState.Programmatic);
                customerPhoneInputTextBox.SelectAll();
                return;
            }
            // Disables Name and Phone inputs, sets focus and selects Price input
            customerPhoneInputTextBox.IsEnabled = false;
            customerNameInputTextBox.IsEnabled = false;
            vehiclePriceInputTextBox.Focus(FocusState.Programmatic);
            vehiclePriceInputTextBox.SelectAll();
        }

        private void resetDetailsButton_Click(object sender, RoutedEventArgs e)
        {
            /*Clears all input TextBoxes, Summary TextBox, unchecks all checkboxes, returns combobox, toggleswitch and radio buttons 
             * to default states, enables Name and Phone and sets focus to the Name input*/
            customerPhoneInputTextBox.Text = "";
            customerNameInputTextBox.Text = "";
            vehiclePriceInputTextBox.Text = "";
            valuePriceTextBox.Text = "";
            subAmountTextBox.Text = "";
            gstAmountTextBox.Text = "";
            finalAmountTextBox.Text = "";
            summaryTextBlock.Text = "";
            vehicleMakeTextBox.Text = "";
            vehicleWarrantyComboBox.SelectedValue = "1 year warranty has no charge";
            tintingCheckBox.IsChecked = false;
            protectionCheckBox.IsChecked = false;
            matsCheckBox.IsChecked = false;
            soundCheckBox.IsChecked = false;
            insuranceToggleSwitch.IsOn = false;
            customerPhoneInputTextBox.IsEnabled = true;
            customerNameInputTextBox.IsEnabled = true;
            customerNameInputTextBox.Focus(FocusState.Programmatic);
        }

        private void insuranceToggleSwitch_Toggled(object sender, RoutedEventArgs e) // Toggleswitch event handler
        {
            if (insuranceToggleSwitch.IsOn == false)
            {
                over25RadioButton.IsEnabled = false;
                under25RadioButton.IsEnabled = false;
                over25RadioButton.IsChecked = false;
                under25RadioButton.IsChecked = false;
            }
            else
            {
                over25RadioButton.IsEnabled = true;
                under25RadioButton.IsEnabled = true;
                under25RadioButton.IsChecked = true;
            }
            
            
        }

        private void displayCustomersButton_Click(object sender, RoutedEventArgs e)
        {
            // Output the Customer Names Array and the Customer Phone Numbers Array
            string outputMessage = "Customer Names: \n";
            for (int index = 0; index < customerNames.Length; index++)
            {
                outputMessage = outputMessage + customerNames[index] + "  " + customerPhoneNumbers[index] + "\n";
            }
            summaryTextBlock.Text = outputMessage.ToString();

        }

        private async void searchNameButton_Click(object sender, RoutedEventArgs e)
        {
            int counter = 0;
            if (String.IsNullOrEmpty(customerNameInputTextBox.Text)) // Validate that field is not left blank
            {
                var dialogMessage = new MessageDialog("Error! Customer name cannot be left blank. Re-enter customer name.");
                await dialogMessage.ShowAsync();
                customerNameInputTextBox.Focus(FocusState.Programmatic);
                customerNameInputTextBox.SelectAll();
                return;
            }

            displayCustomersButton_Click(sender, e); // Event handler called to display customers and phone numbers

            string criteria = customerNameInputTextBox.Text.ToUpper(); // Input search criteria from user and convert to uppercase

            // Method called to do sequential search of array
            counter = searchArray(criteria);
            
            // IF found
            if (counter == -1) // IF Not Found
            {
                var dialogMessage = new MessageDialog("Error! " + criteria + " does not exist. Re-enter customer name.");
                await dialogMessage.ShowAsync();
                customerNameInputTextBox.Focus(FocusState.Programmatic);
                customerNameInputTextBox.SelectAll();
                return;                
            }
            else // If Found
            {
                string outputMessage = "";
                outputMessage = outputMessage + customerPhoneNumbers[counter];
                customerPhoneInputTextBox.Text = outputMessage; 
            }
        }

        private async void deleteNameButton_Click(object sender, RoutedEventArgs e)
        {
            int counter = 0;
            if (String.IsNullOrEmpty(customerNameInputTextBox.Text)) // Validate that field is not left blank
            {
                var dialogMessage = new MessageDialog("Error! Customer name cannot be left blank. Re-enter customer name.");
                await dialogMessage.ShowAsync();
                customerNameInputTextBox.Focus(FocusState.Programmatic);
                customerNameInputTextBox.SelectAll();
                return;
            }

            // Delete a customer name and corresponding phone number from their repective Arrays
            string criteria = customerNameInputTextBox.Text.ToUpper();  // Input search criteria from user
            
            // Method called to do sequential search of array
            counter = searchArray(criteria);
            if (counter == -1) // IF Not Found
            {
                var dialogMessage = new MessageDialog(criteria + " does not exist to delete. Re-enter customer name");
                await dialogMessage.ShowAsync();
                customerNameInputTextBox.Focus(FocusState.Programmatic);
                customerNameInputTextBox.SelectAll();
            }
            else
            {
                // Identify phone number corresponding to criteria selected
                string criteriaPhone = "";
                criteriaPhone += customerPhoneNumbers[counter];

                for (int i = counter; i < customerNames.Length - 1; i++)                
                {
                    customerNames[i] = customerNames[i + 1]; // Copy the next item in the array to the previous position
                    customerPhoneNumbers[i] = customerPhoneNumbers[i + 1];
                }
                // Resize both arrays by -1
                Array.Resize(ref customerNames, customerNames.Length - 1);
                Array.Resize(ref customerPhoneNumbers, customerPhoneNumbers.Length - 1);

                // Event handler called to display now resized arrays
                displayCustomersButton_Click(sender, e);

                // Message output to alert user of customer details deleted from the arrays
                var dialogMessage = new MessageDialog("Customer details for " + criteria + " , " + criteriaPhone + " deleted. \ncustomerNames Array updated to length "
                    + customerNames.Length + "\ncustomerPhoneNumbers Array updated to length " + customerPhoneNumbers.Length);
                await dialogMessage.ShowAsync();
                customerNameInputTextBox.Focus(FocusState.Programmatic);
                customerNameInputTextBox.SelectAll();
                return;
            }
        }

        private void displayMakesButton_Click(object sender, RoutedEventArgs e)
        {
            // Sort the Array into alpha order and display in the Summary Details section
            Array.Sort(vehicleMakes); 
            string outputMessage = "Vehicle Makes: \n";
            for (int index = 0; index < vehicleMakes.Length; index++)
            {
                outputMessage = outputMessage + vehicleMakes[index] + "\n";
            }
            summaryTextBlock.Text = outputMessage.ToString();
        }

        private async void binarySearchButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(vehicleMakeTextBox.Text)) // Validate that field is not left blank
            {
                var dialogMessage = new MessageDialog("Error! Vehicle Make cannot be left blank. Re-enter Vehicle Make.");
                await dialogMessage.ShowAsync();
                vehicleMakeTextBox.Focus(FocusState.Programmatic);
                vehicleMakeTextBox.SelectAll();
                return;
            }
            
            // Search for the vehicle make within the vehicleMakes Array
            string criteria;
            criteria = vehicleMakeTextBox.Text.ToUpper();
            Array.Sort(vehicleMakes);
            
            // Method called to do binary search of the array
            int foundPos = binarySearchArray(vehicleMakes, criteria);
            if (foundPos == -1) // If not found
            {
                var dialogMessage = new MessageDialog(criteria + " not found ");
                await dialogMessage.ShowAsync();
                vehicleMakeTextBox.Focus(FocusState.Programmatic);
                vehicleMakeTextBox.SelectAll();
                return;
            }
            else
            {
                displayMakesButton_Click(sender, e); // Event handler called to display vehicle makes in alpha order
                var dialogMessage = new MessageDialog(criteria + " found at index " + foundPos);
                await dialogMessage.ShowAsync();
                return;
            }
            
        }

        private async void insertMakesButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(vehicleMakeTextBox.Text)) // Validate that field is not left blank
            {
                var dialogMessage = new MessageDialog("Error! Vehicle Make cannot be left blank. Re-enter Vehicle Make.");
                await dialogMessage.ShowAsync();
                vehicleMakeTextBox.Focus(FocusState.Programmatic);
                vehicleMakeTextBox.SelectAll();
                return;
            }

            int counter = 0;
            bool found = false;
            string criteria = vehicleMakeTextBox.Text.ToUpper();
            
            // Sequential search of vehicleMakes Array
            while(!found && counter < vehicleMakes.Length)
            {
                if (criteria == vehicleMakes[counter].ToUpper())
                    found = true;
                else
                    counter++;
            }
            if (counter < vehicleMakes.Length) // If vehicle make already exits, do not add to the array
            {
                var dialogMessage = new MessageDialog(criteria + " already exists. Re-enter Vehicle Make.");
                await dialogMessage.ShowAsync();
                vehicleMakeTextBox.Focus(FocusState.Programmatic);
                vehicleMakeTextBox.SelectAll();
                return;
            }
            else
            {
                Array.Resize(ref vehicleMakes, vehicleMakes.Length + 1); // Resize vehicleMakes array by 1
                var dialogMessage = new MessageDialog(criteria + " added to list. vehicleMakes Array updated to length " + vehicleMakes.Length);
                await dialogMessage.ShowAsync();
                vehicleMakes[vehicleMakes.Length - 1] = vehicleMakeTextBox.Text; // Assign vehicle make entered to the last element of the array
                displayMakesButton_Click(sender, e); // Method called to display the array
            }
        }

        /// <summary>
        /// Page loaded event populates each array - customerNames,customerPhoneNumbers, vehicleMakes 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            // Assign the values of the Customer Names Array
            customerNames[0] = "Simon Johnson";
            customerNames[1] = "Jamie Harrod";
            customerNames[2] = "Matthew Hocking";
            customerNames[3] = "Andrew Copley";
            customerNames[4] = "Anne-Marie Vozzo";
            customerNames[5] = "Zoe Condon";
            customerNames[6] = "Tristan Pope";
            customerNames[7] = "Vanessa Baro";
            customerNames[8] = "Adam Stapleton";
            customerNames[9] = "Andrew Deans";

            // Assign the values of the Customer Phone Number Array
            customerPhoneNumbers[0] = "0422 184 127";
            customerPhoneNumbers[1] = "0422 793 742";
            customerPhoneNumbers[2] = "0439 095 739";
            customerPhoneNumbers[3] = "0476 353 388";
            customerPhoneNumbers[4] = "0462 450 095";
            customerPhoneNumbers[5] = "0423 618 615";
            customerPhoneNumbers[6] = "0419 180 970";
            customerPhoneNumbers[7] = "0468 004 941";
            customerPhoneNumbers[8] = "0433 678 240";
            customerPhoneNumbers[9] = "0425 607 185";

            // Assign the values of the Vehicle Makes Array
            vehicleMakes[0] = "Toyota";
            vehicleMakes[1] = "Holden";
            vehicleMakes[2] = "Mitsubishi";
            vehicleMakes[3] = "Ford";
            vehicleMakes[4] = "BMW";
            vehicleMakes[5] = "Mazda";
            vehicleMakes[6] = "Volkswagen";
            vehicleMakes[7] = "Mini";
        }
    }
}
