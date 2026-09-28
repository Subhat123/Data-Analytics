# att=input("Enter attendance")
# print(att)

# decimal
# try:
#     att=float(input("Enter attendance"))
#     print(att)
# except ValueError:
#     print("Invalid attendance")


# business rule
# try:
#     att=float(input("Enter attendance"))
#     if not 0<=att<=100:
#         print("Kindly enter valid attendance between 0 and 100")
#     else:
#         print("Attendance",att)
# except ValueError:
#     print("Invalid attendance")

# repeated process
# while True:
#     try:
#         att=float(input("Enter attendance:"))
#         if not 0<=att<=100:
#            print("Kindly enter valid attendance between 0 and 100")
#         else:
#            print("Attendance",att)
#         break 
     
#     except ValueError:
#           print("Invalid attendance")

# using raisevalueerror

while True:
    try:
        att=float(input("Enter attendance:"))
        if not 0<=att<=100:
           raise ValueError("Kindly enter valid attendance between 0 and 100")
        else:
           print("Attendance",att)
        break 
     
    except ValueError:
          print("Invalid attendance")
    