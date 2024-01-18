class Product:
    def __init__(self, barcode = "None",_name="no name", desc = "Not defined", price = 0.0):
        self.__barcode = barcode
        self.__name = _name
        self.__desc = desc
        self.__price = price

    def get_barcode(self):
        return self.__barcode

    def get_desc(self):
        return self.__desc

    def get_price(self):
        return self.__price

    def set_barcode(self, barcode):
        self.__barcode = barcode

    def set_desc(self, desc):
        self.__desc = desc

    def set_price(self, price):
        self.__price = price

    def __str__(self):
        return f"{self.__barcode} {self.__name} {self.__desc}  {str(self.__price)}"
