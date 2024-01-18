import os
import sqlite3
from product import Product
from openpyxl import Workbook
from openpyxl.chart import BarChart, Reference
import datetime
from Transaction import Transaction
import os
import datetime

class SuperMarketDAO():

    def __init__(self):
        self.db = ""

    def setup_db(self):

        # Create a table
        try:
            self.db = sqlite3.connect('checkout_db.db')
            cursor = self.db.cursor()
            query = "CREATE TABLE products(barcode CHAR(5) NOT NULL PRIMARY KEY, productName CHAR(20) NOT NULL, productPrice FLOAT(5,2) NOT NULL);"
            cursor.execute(query)

            products = [('123', 'Milk 2l', 3.5),
                        ('456', 'Bread 500g', 2.5),
                        ('789', 'Coca-Cola 375ml', 1.99),
                        ('147', 'Soap 300g', 2.78),
                        ('258', 'Cinnamon Gum 15 sticks', 0.99),
                        ('369', 'Chicken Schnitzel 500g', 6.99),
                        ('159', 'Chili Bean Salsa', 3.78),
                        ('357', 'Salted Tortilla Chips', 4.85),
                        ('156', 'Up & Go - Ice Choc', 4.99),
                        ('348', 'Spaghetti', 2.85)
                        ]
            query = "INSERT INTO products (barcode, productName, productPrice) VALUES (?,?,?)"
            cursor.executemany(query, products)
            self.db.commit()

            # Transactions table
            transactions = [('29/11/2022', '123', 3.5),
                            ('29/11/2022', '123', 3.5),
                            ('29/11/2022', '123', 3.5),
                            ('29/11/2022', '456', 10.5),
                            ('29/11/2022', '456', 10.5),
                            ('29/11/2022', '789', 7.5)] # Create table transactions
            query = "CREATE TABLE IF NOT EXISTS transactions(date CHAR(10), barcode CHAR(5) NOT NULL, amount FLOAT(5,2) NOT NULL);"
            cursor.execute(query)
            query = "INSERT INTO transactions (date, barcode, amount) VALUES (?, ?, ?)"
            cursor.executemany(query, transactions) # ***
            self.db.commit()
        except Exception as ex:
            print("Unable to create table {}".format(ex))
            self.db.rollback()

        finally:
            self.db.close()

    def listAllProducts(self):
        # Create a table
        # List in ascending order by barcode
        #Use a separate private method to sort the product list and call it in this method
        try:
            self.db = sqlite3.connect('checkout_db.db')
            cursor = self.db.cursor()
            query = "SELECT * FROM products"
            cursor.execute(query)
            rows = cursor.fetchall()

        except Exception as ex:
            print("Unable to open table {}".format(ex))

        finally:
            self.db.close()
            return rows


    def addProductToDB(self, product):
        # Topic 8
        # ** user input??? **
        # Error for product already exists?
        try:
            self.db = sqlite3.connect('checkout_db.db')
            cursor = self.db.cursor()
            query = "INSERT INTO products(barcode, productName, productPrice) VALUES (?,?,?)"
            cursor.execute(query, (product.getBarcode(), product.getProductName(), float(product.getProductPrice())))
            self.db.commit()
        except Exception as ex:
            print("Unable to insert into table {}".format(ex))
            self.db.rollback()
        finally:
            self.db.close()


    def findProduct(self, barcode):
        # search / iteration
        # Topic 8
        # error message for product not exists
        try:
            self.db = sqlite3.connect('checkout_db.db')
            cursor = self.db.cursor()
            query = "SELECT * FROM products WHERE barcode = '" + barcode + "'"
            cursor.execute(query)
            rows = cursor.fetchall()

        except Exception as ex:
            print("Unable to open table {}".format(ex))
        finally:
            self.db.close()
            return rows

    def listAllTransactions(self):
        try:
            self.db = sqlite3.connect('checkout_db.db')
            cursor = self.db.cursor() # Checks connection with the database
            query = "SELECT * FROM transactions"
            cursor.execute(query)
            rows = cursor.fetchall()

        except Exception as ex:
            print("Unable to open table {}".format(ex))
        finally:
            self.db.close()
            return rows

    """MODIFIED THIS  _ KEEP AN EYE OUT!"""
    def addTransactionToDB(self, transaction):
        # Topic 8 ** Modify ** error for product already exists?
        try:
            self.db = sqlite3.connect('checkout_db.db')
            cursor = self.db.cursor()
            query = "INSERT INTO transactions(date, barcode, amount) VALUES (?,?,?)"
            #print(transaction.getBarcode())
            cursor.execute(query,
                           (transaction.getDate(), transaction.getBarcode(), float(transaction.getAmount())))
            self.db.commit()
        except Exception as ex:
            print("Unable to insert into table {}".format(ex))
            self.db.rollback()
        finally:
            self.db.close()


    def displayBarChart(self):
        # Read all transactions from the database into a list and create a barchart using the x-axis as the product name
        # and y-axis as the sum of the qty sold
        # Use a dictionary to implement this method
        try:
            self.db = sqlite3.connect('checkout_db.db')
            cursor = self.db.cursor()
            query = "SELECT * FROM transactions"
            cursor.execute(query)
            rows = cursor.fetchall()
            unique_transactions = {}

            for row in rows:
                if row[1] not in unique_transactions:
                    unique_transactions[row[1]] = 1
                else:
                    unique_transactions[row[1]] += 1

            cells = list(unique_transactions.items())
            cells.insert(0, ["Barcode", "Count"])
            print(unique_transactions)
            print(cells)

            #Write to an Excel File
            wb = Workbook()
            sheet = wb.active
            for row in cells:
                sheet.append(row)
            wb.save('chart1.xlsx')

            #Barchart
            chart = BarChart()
            data = Reference(worksheet=sheet,
                              min_row=1,
                              max_row=8,
                              min_col=2,
                              max_col=3)
            chart.add_data(data, titles_from_data=True)
            chart.x_axis.title = "Product"
            chart.y_axis.title = "Qty Sold"

            sheet.add_chart(chart, "A10") # Specify location of the chart
            wb.save('chart1.xlsx') # Save the workbook

            os.system(r"chart1.xlsx") # Automatically open and display barchart


        except Exception as ex:
            print("Unable to open table {}".format(ex))
            #self.db.rollback()
        finally:
            self.db.close()

    def displayExcelReportOfTransaction(self):
        # Get all transactions from the Transactions table in the DB
        # Call the listAllTransactions() method here
        # Use this data to generate an Excel workbook
        # List all transactions according to date order
        try:
            transactionReportList = self.listAllTransactions()
            #print(transactionReportList)
            cells = transactionReportList
            cells.insert(0, ["Date", "Barcode", "Amount"])
            print(cells)

        #Write to an Excel File
            wb = Workbook()
            sheet = wb.active
            for row in cells:
                sheet.append(row)
                wb.save('transactions_report.xlsx')
            os.system(r"transactions_report.xlsx")  # Automatically open and display report

        except Exception as ex:
            print("Unable to open table {}".format(ex))
            #self.db.rollback()
        finally:
            self.db.close()



# dao = SuperMarketDAO()
# #print(dao.setup)
# dao.setup_db()
# item_list = dao.listAllProducts()
# obj_list = []
# for product in item_list:
#     print(product)
#     obj_list.append(Product(product[0], product[1], float(product[2])))

#dao.listAllProducts()
