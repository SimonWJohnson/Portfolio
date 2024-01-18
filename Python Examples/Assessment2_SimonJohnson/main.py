from checkoutRegister import CheckoutRegister
from product import Product
from datetime import datetime
from SuperMarketDAO import SuperMarketDAO
from userLogin import Login
from Transaction import Transaction

def main():
    # Comment out
    """itemList = []
    with open("product.txt", 'rt') as productList:
        for eachLine in productList:
            barcode, productName, productPrice = eachLine.strip().split(",")
            itemList.append(Product(int(barcode), productName, float(productPrice)))"""
    # Login
    Login()

    # Read from DB
    dao = SuperMarketDAO()
    dao_list = dao.listAllProducts()
    product_list = []
    for product in dao_list:
        #print(product)
        product_list.append(Product(product[0], product[1], float(product[2])))

    # Admin menu
    while True:
        # Starting the program
        print()
        print("----- Welcome Admin -----")
        print("1. Add Product to DataBase")
        print("2. List all Products in Database")
        print("3. Find Product in DataBase")
        print("4. List all Transactions")
        print("5. Display Bar Chart of Products Sold by Qty")
        print("6. Display Excel Report of all Transactions")
        print("7. Exit")

        choice = int(input("Enter choice 1 - 7"))

        if(choice == 1): #call addProductToDB method
            print("Add Product")
            barcode = input("Enter Barcode: ")
            productName = input("Enter Product Name:")
            productPrice = float(input("Enter Product Price: "))
            product = Product(barcode, productName, productPrice)
            dao.addProductToDB(product)

        elif(choice == 2):
            print(dao.listAllProducts()) # use a loop and print each item

        elif(choice == 3): #call findProduct method
            print("Find Product")
            barcode = input("Enter barcode: ")
            dao.findProduct(barcode)

        elif(choice == 4): #call listAllTransactions method
            print(dao.listAllTransactions())

        elif(choice == 5): #call displayBarchartOfProductsSold
            dao.displayBarChart()

        elif(choice == 6): #call displayExcelReportOfTransaction method
            dao.displayExcelReportOfTransaction()

        elif(choice == 7):
            break

    #Customer Menu


    while True:
        print()
        print("---*** Welcome to Simons' Food Mart ***---")
        print()

        checkout = CheckoutRegister()

        # While loop for scanning
        while True:
            try: # Try Except error handling to validate input as an integer
                #barcode = int(input("Please enter barcode / scan your item: "))
                barcode = input("Please enter barcode / scan your item: ")
                found = False  # Initialise found to False

                for product in product_list: # For loop to iterate through product list to find a matching barcode
                    if product.getBarcode() == barcode:
                        found = True
                        selectedProduct = product

                if found:
                    print("\n{} - {} - {}\n".format(selectedProduct.getBarcode(),
                                                    selectedProduct.getProductName(),
                                                    selectedProduct.getProductPrice()))
                    checkout.scanItem(selectedProduct)

                else:
                    print("\nProduct does not exist in inventory.\n")

                response = input("Would you like to scan another product? (Y/N) ").upper()
                print()
                if (response == 'N'):
                    break
                elif (response != 'N' and response != 'Y'):
                    print("Invalid input - Try again")
            except Exception:
                print("Error - Barcode must be numeric")

        # Variables for accepting payment while loop
        amountDue = checkout.getTotalPayment()
        paid = False
        balancePaid = 0

        # While loop for accepting payment
        # validates inputs
        while not paid:
            amount = float(input("Payment due: ${0}. Please enter an amount to pay: ".format(amountDue)))
            if float(amount) < 0:
                print("Negative values not accepted - Please enter a valid amount to pay")

            elif amount < amountDue:
                print("Insufficient funds - Please pay remaining balance: $ {}".format(amountDue - amount))
                amountDue -= amount
                balancePaid += amount
            else:
                balancePaid += amount
                paid = True
        amount = balancePaid

        totalPayment = checkout.acceptPayment(float(amount))
        amountDue = float(amount)
        if (amountDue <= 0):
            break

        # Print receipt
        print(checkout.printReceipt())

        # This section (Quit) works as intended - when the user quits the program, the transactions.txt file is appended
        next = input("(N)ext customer or (Q)uit? ").upper()
        if next == "Q":
            print("Thank you for shopping at Simons' Food Mart")
            break
        # For some reason, when 'Next' is selected, it won't append the transactions.txt file until after the next customer quits the program
        else:
            checkout.saveTransaction()

    checkout.saveTransaction()

main()
