from functions import grade_system

std_list=[]
for ct in range(5):
    std={}
    std["name"]=input(f"{ct+1} Enter your name :")
    std["total"]=int(input("Enter your total marks: "))
    std["grade"]=grade_system(std["total"])
    std_list.append(std)
    
# print([print(std) for std in std_list])    

for std in std_list:
    print(std)
    