import unittest
from checkoutRegister import CheckoutRegister
from product import Product

# setUpModule and tearDownModule to make reading the testing output console easier
# Denotes the beginning of testing
def setUpModule():
    print("Running setUpModule")

# Denotes the ending of testing
def tearDownModule():
    print("Running tearDownModule")


# Test class for Product
class TestProduct(unittest.TestCase):
    # set up function to instantiate one instance of the Product class to be used in each test case to save memory
    def setUp(self):
        self.testProduct = Product('159', 'Cinnamon Gum', 1.99)
        print('Running setup - TestProduct')

    # Test case 1
    # calls and tests the getBarcode() method in the Product class
    # asserts that the barcode instantiated above is (equals) the barcode passed as comparison
    # returns True (passes)
    def testGetBarcode(self):
        barcode = self.testProduct.getBarcode()
        self.assertEqual('159', barcode)

    # Test case 2
    # calls and tests the getProductName method in the Product class
    # asserts that the product name instantiated above is (equals) the product name passed as comparison
    # returns True (passes)
    def testGetProductName(self):
        productName = self.testProduct.getProductName()
        self.assertEqual('Cinnamon Gum', productName)

    # Test case 3
    # calls and tests the getProductPrice method in the Product class
    # asserts that the product price instantiated above is (equals) the product price passed as comparison
    # returns True (passes)
    def testGetProductPrice(self):
        productPrice = self.testProduct.getProductPrice()
        self.assertEqual(1.99, productPrice)


# Test class for CheckoutRegister
class TestCheckoutRegister(unittest.TestCase):
    def testCheckoutSetup(self):
        self.testCheckout = CheckoutRegister()
        print('Running setup - testCheckout')

    # Test case 4
    # testInit
    # __receivedAmount (acceptPayment) and __totalPayment (getTotalPayment) are set to private variables by default
    # acceptPayment and getTotalPayment Methods are called in the testInit method to instantiate the CheckoutRegister class
    # asserts that all values are initialised to 0
    # returns True (passes)
    def testInit(self):
        testCheckout = CheckoutRegister()
        self.assertEqual(len(testCheckout.shoppingCart), 0)
        self.assertEqual(testCheckout.acceptPayment(amount=0.0), 0.0)
        self.assertEqual(testCheckout.getTotalPayment(), 0.0)

    # Test case 5
    # calls and tests the scanItem method in the CheckoutRegister class
    # Instantiates an instance of the Product Class
    # scans a valid product barcode and appends the product to the shoppingCart array
    # asserts that the shoppingCart has been appended with the selected product
    # returns True (passes)
    def testScanItem(self):
        testCheckout = CheckoutRegister()
        product = Product('159', 'Cinnamon Gum', 1.99)
        testCheckout.shoppingCart.append(product)
        self.assertTrue(testCheckout.scanItem, '159')

    # Test case 6
    # calls and tests the acceptPayment method
    # initialises the amount to 7.99
    # tests the method calculation (__receivedAmount += amount)
    # asserts that the final amount due will be 15.98
    # returns True (passes)
    def testAcceptPayment(self):
        testCheckout = CheckoutRegister()
        amount = 7.99 # Expected amount is 15.98 due to method calculation (__receivedAmount += amount)
        testCheckout.acceptPayment(amount)
        self.assertEqual(testCheckout.acceptPayment(amount), 15.98)

    # Test case 7
    # calls and tests the saveTransaction method
    # barcode is initialised to '123'
    # asserts that:
    # the transactions.txt file has been opened and can be appended
    # the product with barcode '123' has been appended to the transactions.txt file
    #   from the shoppingCart as a str representation
    # the transactions.txt file has been closed
    # returns True (passes)
    def testSaveTransaction(self):
        testCheckout = CheckoutRegister()
        barcode = '123'
        self.assertTrue(testCheckout.saveTransaction, barcode)


if __name__ == '__main__':
    unittest.main()
