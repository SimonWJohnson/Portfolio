# Read all data once from the products.txt file into a list of Product objects
# Use this list to populate  any three of the following data structures
# Stack, Queue, Linked List, Binary Tree, Hash Tables, Hash Map, Graph, Set
# Implement 3 diferent methods (one for each data structure) using the provided pseudocode as a guide
# The aim is to measure the performance in milliseconds of each data structure to add the Product objects from the list of Product instances

# Pseudocode
# Start clock
# For each product in the list
#   Add product to data structure
# End clock
# Print time elapsed

# Record in your documentation which data structure was the most efficient

from LinkedList_Module import LinkedList
from Queue_Module import Queue
from Stack_Module import Stack
from Product1 import Product
from Sorting_Metrics import bubbleSort, insertionSort
import collections
import time
products = []

def init():
    file = open('productsPofC.txt', 'rt')
    for each_line in file:
        barcode, name, desc, price = (each_line.strip()).split(',')
        products.append(Product(barcode, name, desc, float(price)))
    file.close()

# Section C Part 1 - Data Structure Efficiency
def linkedListDemo():
    #linkedList = collections.deque()
    linked_list = LinkedList()
    startTime = time.time() # get the start time
    for each_product in products:
        linked_list.add_first(each_product)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to add 1000 Product objects to LinkedList is {runTime} milliseconds")

def queueDemo():
    queue = Queue()
    startTime = time.time() # get the start time
    for each_product in products:
        queue.enqueue(each_product)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to add 1000 Product objects to queue is {runTime} milliseconds")

def stackDemo():
    stack = Stack()
    startTime = time.time() # get the start time
    for each_product in products:
        stack.push(each_product)
    endTime = time.time()
    runTime = float((endTime - startTime) * 1000)
    print(f"The time to add 1000 Product objects to stack is {runTime} milliseconds")

# Section C part 2 - Sorting Algorithms Efficiency
def insertion_sort_demo():
    print('Starting insertion sort......')
    startTime = time.time()  # gets start time
    insertionSort(products)
    endTime = time.time()
    runTime = float((endTime - startTime) )
    print(f"The time to sort 10000 Product objects using a Insertion Sort is {runTime} seconds")

def bubble_sort_demo():
    print('Starting bubble sort......')
    startTime = time.time()  # gets start time
    bubbleSort(products)
    endTime = time.time()
    runTime = float((endTime - startTime) )
    print(f"The time to sort 10000 Product objects using a Bubble Sort is {runTime} seconds")



# Section C Part 3 - Searching Algorithms Efficiency
def linear_search_demo(bar_code):
    print('Starting linear search......')
    found = False
    startTime = time.time()  # gets start time
    for product in products:
        if product.get_barcode() == bar_code:
            endTime = time.time()
            runTime = float((endTime - startTime))
            print(f"The time to linear search in a  10000 Product objects using a Linear Search is {runTime} seconds")
            return True
    endTime = time.time()
    runTime = float((endTime - startTime))
    print(f"The time to search a list of  10000 Product objects using a Linear Search is {runTime} seconds")
    return False

def binary_search_demo(bar_code, low, high):
    print('Starting binary search......')
    found = False
    startTime = time.time()  # gets start time
    low = 0
    high = len(products) -1
    middle = 0
    while low <= high:
        middle = (high + low) // 2
        # bar_code equals products[middle], return middle (index of target)
        # if products[middle] == products[middle[0]]:
        #     return middle
        # Take the upper half
        if int(products[middle].get_barcode()) < bar_code:
            low = middle + 1
        # Take the lower half
        elif int(products[middle].get_barcode()) > bar_code:
            high = middle - 1
        else:
            print("Found barcode", products[middle])
            break

    endTime = time.time()
    runTime = float((endTime - startTime))
    print(f"The time to search a list of  10000 Product objects using a Binary Search is {runTime} seconds")
    return False

init()

linkedListDemo()
queueDemo()
stackDemo()
print(insertion_sort_demo())
print(bubble_sort_demo())
print(linear_search_demo(3705))
binary_search_demo(3705, 0, len(products)-1)


