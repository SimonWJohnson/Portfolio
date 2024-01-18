from Product1 import Product
from time import time

products = []

def init():
    file = open('productsPofC.txt', 'rt')
    for each_line in file:
        barcode, name, desc, price = (each_line.strip()).split(',')
        products.append(Product(barcode, name, desc, float(price)))
    file.close()

def linear_search(list_of_products, bar_code):
    print('Starting linear search......')
    found = False
    startTime = time.time()  # gets start time
    for product in products:
        if product.get_barcode()== bar_code:
            endTime = time.time()
            runTime = float((endTime - startTime))
            print(f"The time to linear search in a  10000 Product objects using a ILinear Search is {runTime} seconds")
            return True
    endTime = time.time()
    runTime = float((endTime - startTime))
    print(f"The time to search a list of  10000 Product objects using a Linear Search is {runTime} seconds")
    return False
# aka Sequential Search
# Unsorted array
# Start from leftmost element of the array and one by one compare x with each element of the array
# If x matches with an element, return the index
# If x doesn't match with any of the elements, return -1

"""
C# Ex Code

"""

def binary_search(list_of_products,bar_code):
    low = 0
    high = len(bar_code)
    middle = 0

    while low <= high:
        middle = (high + low) // 2

        # bar_code equals products[middle], return middle (index of target)
        if bar_code == products[middle]:
            return middle

        # Take the upper half
        elif bar_code > products[middle]:
            low = middle + 1

        # Take the lower half
        else:
            high = middle - 1

    # if we reach this line, bar_code is not present in products
    return -1

# Sort first //
    # open the file (with)
    # .sort

# Compare x with the middle element
# If x matches with the middle element, return the mid index
# Else if x is greater than the mid element, search on right half
# Else if x smaller than the mid element, search on left half


