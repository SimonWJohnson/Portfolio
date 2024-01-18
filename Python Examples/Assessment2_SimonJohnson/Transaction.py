import datetime

class Transaction:
    def __init__(self, date, barcode, amount):
        self.date = date
        self.barcode = barcode
        self.amount = amount

    def getDate(self):
        return self.date

    def getBarcode(self):
        return self.barcode

    def getAmount(self):
        return self.amount

    def __str__(self):
        return self.datetime + " \t " + self.barcode + "\t" + self.amount
