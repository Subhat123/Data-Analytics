import json


stds={
    1:{
        
    }
}


# with open(r"D:\Data Analystics\Projects\04_Python\File handling\data.json","r")as j_file:
#     student=json.load(j_file)
    
# print(student["attendance"])
# print(student["marks"]["Python"])   

with open(r"D:\Data Analystics\Projects\04_Python\File handling\data.json","r")as j_file:
    student=json.dumps(stds)
    
    print(student)