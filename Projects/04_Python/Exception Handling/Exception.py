# using exception
# try:
#     age=int(input("Enter age "))
#     print(age)
# except ValueError:
#     print("Please enter a valid number")
    
# try:
#     file=open("std.py")
#     print(file)
# except FileNotFoundError:
#     print("Please enter a valid file")    
    
# try:
#     file=open("std.py")
#     print(file)
# except:
#     print("Something went wrong")

# file not found error

# file=open("std.py")
# print(file)

# try:
#     a=int(input(" "))
# except:
#     print("Enter valid number")    
# else:
#     print("Valid number",a)       
   
   
#  file not found error   
# try:
#     file = open("std.py")
#     print(file)
# except FileNotFoundError:
#     print("File not found")
# except PermissionError:
#     print("Permission denied")
   
 
#  Using raise ValueError
# raise is used when you want to create/trigger an error yourself.

# age = int(input("Enter your age: "))
# if age < 0:
#     raise ValueError("Age cannot be negative")
#     print(age)

# both together raiseValueError and except

# try:
#     age = int(input("Enter your age: "))
#     if age < 0:
#         raise ValueError("Age cannot be negative")
#     print("Age:", age)
# except ValueError as e:
#     print("Error:", e)















