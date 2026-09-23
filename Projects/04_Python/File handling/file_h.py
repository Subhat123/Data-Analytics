# ct=3
# while ct>=0:
#     std=input("Enter your name:")
#     ct-=1
    
# file=open(r"D:\Data Analystics\Projects\04_Python\File handling\std_details.txt","w+") as file:

# with open(r"D:\Data Analytics\Projects\04_Python\File handling\std_details.txt", "w+") as file:
#     file.write("Pranav")
#     file.seek(0)
#     content = file.read()
#     print(content)
    
      
# with open("std_details.txt", "w+") as file:
#     file.write("Pranav")
#     file.seek(0)
#     content = file.read()
#     print(content)  

# with open(r"D:\Data Analytics\Projects\04_Python\std_details.txt", "a") as file:
#      file.write("\nLokesh")


 # File Handling using r, w, x, a, b

# w - Write
file = open("std_details.txt", "w")
file.write("Name: Subha\n")
file.write("Department: CSE\n")
file.write("Marks: 90\n")
file.close()

print("Student details written successfully.")


# r - Read
file = open("std_details.txt", "r")
print("\nStudent Details:")
print(file.read())
file.close()


# a - Append
file = open("std_details.txt", "a")
file.write("Grade: A\n")
file.close()

print("Grade added successfully.")


# x - Create
try:
    file = open("new_student.txt", "x")
    file.write("New student file created.")
    file.close()
    print("New file created successfully.")
except FileExistsError:
    print("File already exists.")


# b - Binary Read
file = open("std_details.txt", "rb")
data = file.read()
print("\nBinary data:")
print(data)
file.close()   