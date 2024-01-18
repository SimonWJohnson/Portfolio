import sqlite3
from datetime import datetime
from product import Product
from Transaction import Transaction
from SuperMarketDAO import SuperMarketDAO

# Default constructor
class CheckoutRegister:
    def __init__(self): # Initialises / intanstiates an instance of the CheckoutRegister class
        self.shoppingCart = [] # Array to store scanned items
        self.__receivedAmount = 0.0 # Initialises the received amount to 0.0 (float), set to private by default
        self.__totalPayment = 0.0 # Initialises the total payment to 0.0 (float), set to private by default

    # Method for scanning item
    # Passes through scannedItem (input from user)
    # iterates through the product.txt file to find a matching barcode
    # calls the getProductPrice method from the Product class
    # totalPayment is calculated based on scanned item
    # totalPayment is increased with each scanned item (totalPayment = totalPayment + scannedItem)
    # scanned items are appended to the shoppingCart array
    def scanItem(self, scannedItem):
        self.__totalPayment += scannedItem.getProductPrice()
        self.shoppingCart.append(scannedItem)
        #print(self.shoppingCart)
    # Method for total payment
    # returns the total amount to be paid based on scanned items added to the shoppingCart array
    # since __totalPayment is a private variable, this method is called in the test harness (testInit)
    def getTotalPayment(self):
        return self.__totalPayment

    # Method for accepting payment
    # passes through amount (input from user, float)
    # receivedAmount (initialised to 0.0) is calculated as receivedAmount = receivedAmount + amount (input from user)
    # returns the amount received from the user
    # since __receivedAmount is a private variable, this method is called in the test harness (testInit, testAcceptPayment)
    def acceptPayment(self, amount):
        self.__receivedAmount += amount
        return self.__receivedAmount

    # Method for printing receipt
    # Prints a string representation of:
    #   the total amount due
    #   the total amount received from the user
    #   the calculation of the amount received minus the total amount due (rounded to 2 decimal places)
    # returns a series of formatted messages as one message
    def printReceipt(self):
        message = '\n---*** RECEIPT ***---'
        message += '\n'
        message += 'Total amount due: $' + str(self.__totalPayment) + '\n'
        message += 'Amount received: $' + str(self.__receivedAmount) + '\n'
        message += 'Change dispensed: $' + str(round(self.__receivedAmount - self.__totalPayment, 2)) + '\n'
        return message

    # Method for saving transaction
    # calls the datetime function to record the datetime of the transaction
    # uses a for loop to iterate through each element in the shoppingCart array
    # calls the getBarcode method from the Product class to return the barcode
    # uses a with statement as a content manager to open the transactions.txt file as appendable
    # uses the write function to append a string representation of each transaction to the transactions.txt file
    # once the file has been appended, it is closed
    def saveTransaction(self):
        # create a Transaction instance that is saved in the database, by passing it as parameter to the
        # addTransactionToDB(transaction_object) method of the SupermarketDAO object
        #date = datetime.today()
        # transaction = Transaction(datetime.date(), product.getBarcode(), product.getProductPrice())
        # dao = SuperMarketDAO()
        # dao.addTransactionToDB(transaction)
        #Error Message
        #checkout.saveTransaction()
        #TypeError: saveTransaction() missing 3 required positional arguments: 'date', 'barcode', and 'amount'
        for product in self.shoppingCart:
            date = datetime.now()
            barcode = product.getBarcode()
            amount = str(self.__totalPayment)
            transaction = Transaction(date, barcode, amount)
        dao = SuperMarketDAO()
        dao.addTransactionToDB(transaction)
        # with open("transactions.txt", "a") as transaction:
        #     transaction.write("Transaction Date: " + str(date) + ", " + "Barcode: " + str(barcode) + ", " + "Total: $" + str(self.__totalPayment) + '\n')
        #     transaction.close()




