from Product1 import Product

def bubbleSort(list_of_products):
    n = len(list_of_products)

    # Traverse through all array elements
    for i in range(n - 1):
        # range(n) also work but outer loop will
        # repeat one time more than needed.

        # Last i elements are already in place
        for j in range(0, n - i - 1):

            # traverse the array from 0 to n-i-1
            # Swap if the element found is greater
            # than the next element
            if (list_of_products[j]).get_barcode() > (list_of_products[j+1]).get_barcode():
                list_of_products[j], list_of_products[j + 1] = list_of_products[j + 1], list_of_products[j]

def insertionSort(list_of_products):
    # Traverse through 1 to len(arr)
    for i in range(1, len(list_of_products)):

        key = (list_of_products[i]).get_barcode()

        # Move elements of arr[0..i-1], that are
        # greater than key, to one position ahead
        # of their current position
        j = i - 1
        while j >= 0 and key < (list_of_products[j]).get_barcode():
            list_of_products[j + 1] = list_of_products[j]
            j -= 1
        (list_of_products[j + 1]).set_barcode(key)
