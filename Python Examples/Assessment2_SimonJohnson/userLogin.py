import os
import sqlite3
from SuperMarketDAO import SuperMarketDAO
import openpyxl
from product import Product
import hashlib

def Login():
    credentials = "simonjohnson_password123" # userName = "simonjohnson" and password = "password123"

    # Creation of bin file
    # with open("login.bin", "wb") as file:
    #     file.write(hashlib.sha512(credentials.encode('utf-8')).digest())
    #     file.close()

    with open('login.bin', 'rb') as file:
        userName = input("Please enter your User Name: ")
        password = input("Please enter your password: ")
        userCredentials = "".join([userName, '_', password])
        print(userCredentials)
        userCredentials = hashlib.sha512(userCredentials.encode('utf-8')).digest() # create hash
        if userCredentials == file.read(): # verify hash
            print("Login successful")
        else:
            print("Login failed")
            print("\n")
            Login()

