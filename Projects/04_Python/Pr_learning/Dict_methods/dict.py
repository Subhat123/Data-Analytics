student = {
    "name": "Pranav",
    "age": 20,
    "city": "Coimbatore"
}
# print(student)

# #Creating a dictionary using dict 
# b = dict(name="Sanjay", age=20, city="Coimbatore")
# print(b)


#print keys
# print(student.keys())


# #values
# print(student.values())


# #items
# print(student.items())


# #get 
# print(student.get("course","no"))

# #or

# print(student["course"])


# #add
# student["Course"] = "CSE"
# print(student)


# #update
# student.update({
#     "age": 21,
#     "city": "Chennai"
# })
# print(student)

# #or

# student["age"] = 29
# student["city"] = "Udumalpet"
# print(student)


# #delete 
# age = student.pop("age")
# print(student)

# #or

# d = {"a": 1, "b": 2}
# del d
# print(d)

# #remove the last inserted item
# student.popitem()
# print(student)

# #to remove all items 
# student.clear()
# print(student)

# #duplicate keys
# student = {
#     "name": "Arun",
#     "name": "Kumar"
# }
# print(student) 


# #to print the values
# for value in student.values():
#     print(value,end=" ")

# #for loop
# for key, value in student.items():
#     print(key, value)

# #copy
# new = student.copy()
# new["name"] = "Thanvi"
# print(student)
# print(new)

# # #or

# mydict = student
# mydict["name"] = "Thanvi"
# print(student)
# print(mydict)


# #fromkeys
# keys = ["name", "age", "city"]
# d = dict.fromkeys(keys, "Not Available")
# print(d)


# #setdefault
# course = student.setdefault("course", "AI")
# print(student)



# #Nested dictionary
student = {
    "student1": {
        "name": "Lokesh",
        "age": 20
    },

    "student2": {
        "name": "Subha",
        "age": 21
    },

    "student3": {
        "name": "Pranav",
        "age": 20
    }
}
# print(student.keys())
# print(student.values())




print(student["student1"]["name"])