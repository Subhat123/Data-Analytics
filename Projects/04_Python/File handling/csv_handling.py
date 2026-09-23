import csv

# with open(r"D:\Data Analystics\Projects\04_Python\File handling\data.csv","r") as file:
#     reader = csv.reader(file)
#     for line in file:  
#         print(line)
        
with open(r"D:\Data Analystics\Projects\04_Python\File handling\data.csv","a",newline="") as file:
    # reader=csv.reader(file)
    # for row in file:  
    #     print(row)
    # # print(file)
    
    # reader = csv.DictReader(file)
    # for row in reader:
    #     print(row["Department"])  
        
        
    # writer=csv.writer(file)
    # writer.writerow(["Lokesh","Cyber Security"])     
    
 header_rows=["Name","Department"]   
 writer=csv.DictWriter(file,fieldnames=header_rows)
 writer.writeheader()
 writer.writerow({"Name":"Subha","Department":"cse"})
    
             