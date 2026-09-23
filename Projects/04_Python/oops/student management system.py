# class Student:
#     university="Nova University"
#     def __init__(self,name,id,dept,marks,attendance):
#         self.name=name
#         self.id=id
#         self.dept=dept
#         self.marks=marks
        
# '''
# Name
# id
# dept
# Marks
# Attendance
# '''

# std1=Student("Pranav","CS101","CSE",[89,90,78],0)
# std2=Student("Lokesh","CS102","CSE",[99,88,95],0)
# std3=Student("Subha","CS103","CSE",[90,80,70],0)
# st4=Student("Sanjay","CS104","CSE",[80,70,60],0)
# st5=Student("Karthi","CS105","CSE",[70,60,50],0)
# # std1_name

# print(std1.university)
# print(std2.university)
# print(std3.university)
# print(st4.university)
# print(st5.university)

# create a method

# class Student:
#     university="Nova University"
#     def __init__(self,name,id,dept,marks,attendance):
#         self.name=name
#         self.id=id
#         self.dept=dept
#         self.marks=marks
#         self.attendance=attendance
#     def display(self):
#         return f"Name:{self.name} \n ID:{self.id} \n Department:{self.dept} \n Marks:{self.marks} \n Attendance:{self.attendance}"

# '''
# Name
# id
# dept
# Marks
# Attendance
# '''

# std1=Student("Pranav","CS101","CSE",[89,90,78],0)
# std2=Student("Lokesh","CS102","CSE",[99,88,95],0)
# std3=Student("Subha","CS103","CSE",[90,80,70],0)
# st4=Student("Sanjay","CS104","CSE",[80,70,60],0)
# st5=Student("Karthi","CS105","CSE",[70,60,50],0)
# # std1_name

# print(std1.display())
# print(std2.display())
# print(std3.display())
# print(st4.display())
# print(st5.display())

# marks as list and return average


# class Student:
#     university="Nova University"
#     def __init__(self,name,id,dept,marks,attendance):
#         self.name=name
#         self.id=id
#         self.dept=dept
#         self.marks=marks
#         self._attendance=attendance
#     def avg(self):
#         # self.average=sum(self.marks)/len(self.marks)
#         sum_=0
#         for mark in self.marks:
#             sum_=sum_+mark
#         self.average=sum_/len(self.marks)
#         return round(self.average, 2)

# '''
# Name
# id
# dept
# Marks
# Attendance
# '''

# std1=Student("Pranav","CS101","CSE",[89,90,78],0)
# std2=Student("Lokesh","CS102","CSE",[99,88,95],0)
# std3=Student("Subha","CS103","CSE",[90,80,70],0)
# st4=Student("Sanjay","CS104","CSE",[80,70,60],0)
# st5=Student("Karthi","CS105","CSE",[70,60,50],0)
# # std1_name

# print(std1.avg())
# print(std2.avg())
# print(std3.avg())
# print(st4.avg())
# print(st5.avg())

# encapsulation

# class Student:
#     def _init__(self,name,attendance):
#         self.name=name
#         # protect
#         self._attendance=attendance

# def attendance(self):
#     return self._attendance

#         # 0 to 100
# def attendance(self):
#     if 0<=value<=100:
#         self._attendance=value
#         else:
#     print("Enter valid attendance range from 0 to 100")

# # when neede,display(getter)
#     def display(self):
#         return f"Name:{self.name} \n Attendance:{self._attendance}"     

# std1=student("Subha",99) 
# print

#  encapuslation with getter and setter

# class Student:
#     university="Nova University"
#     def __init__(self,name,id,dept,marks,attendance):
#         self.name=name
#         self.id=id
#         self.dept=dept
#         self._marks=marks
#         self._attendance=attendance

#     # Getter
#     def get_marks(self):
#         sum_=0
#         for mark in self._marks:
#             sum_=sum_+mark
#         self.average=sum_/len(self._marks)
#         cgpa = self.average / 10
#         return round(cgpa, 2)

#     # Setter
#     def set_marks(self,marks):
#         self._marks=marks

# '''
# Name
# id
# dept
# Marks
# Attendance
# '''

# std1=Student("Pranav","CS101","CSE",[89,90,78],0)
# std2=Student("Lokesh","CS102","CSE",[99,88,95],0)
# std3=Student("Subha","CS103","CSE",[90,80,70],0)
# st4=Student("Sanjay","CS104","CSE",[80,70,60],0)
# st5=Student("Karthi","CS105","CSE",[70,60,50],0)


# print(std1.get_marks())
# print(std2.name, std2.id, std2.dept,"CGPA:",std2.get_marks())
# print(std3.get_marks())
# print(st4.name, st4.id, st4.dept,"CGPA:",st4.get_marks())
# print(st5.get_marks())


class Student:
    university="Nova University"
    def __init__(self,name,id,dept,marks,attendance):
        self.name=name
        self.id=id
        self.dept=dept
        self.marks=marks
        self.attendance=attendance
    def display(self):
        return f"Name:{self.name} \n ID:{self.id} \n Dept:{self.dept}"
    def avg(self):
        return round(sum(self.marks)/len(self.marks),2)
    
    #  sum_=0
    #  for mark in self.marks:
    #      sum_=sum_+mark
    #  self.average=sum_/len(self.marks)
    #  return round(self.average,2)
    
std1=Student("Subha",'ST101',"CSE",[98,97,95],1000)
std2=Student("Pranav",'ST102',"AI",[95,94,93],0)

print(std1.attendance)  