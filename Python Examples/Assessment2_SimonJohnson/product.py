
class Product:
    def __init__(self, barcode, productName, productPrice):
        self.__barcode = barcode
        self.__productName = productName
        self.__productPrice = productPrice

    # Method to return barcode
    def getBarcode(self):
        return self.__barcode

    # Method to return product name
    def getProductName(self):
        return self.__productName

     # Method to return product price
    def getProductPrice(self):
        return self.__productPrice


