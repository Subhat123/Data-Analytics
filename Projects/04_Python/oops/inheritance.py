from abc import ABC,abstractmethod

class Person(ABC):
    def __init__(self,name,email):
        self.name=name
        self.email=email
    @abstractmethod
    def display_role(self):
        return "University Person"
    @abstractmethod
    def display_dashboard(self):
        pass
    
class Student(Person):
    def __init__(self,name,email,dept):
        super().__init__(name,email)
        self.dept=dept
    def display_role(self):
        return "Student dashboard"
    
class Teacher(Student):
    def __init__(self,name,email,dept,sub_h):
    # inherit from Student class,
        super().__init__(name,email,dept)
    # and add a text instance variable - Subjects handled
        self.sub_h=sub_h
    
    def display_role(self):
         return "teacher"
    def display_dashboard(self):
         return  "Teacher dashboard"
    
class HOD(Person):
    def __init__(self,name,email):
        super().__init__(name,email)
    def display_role(self):
        return super().display_role
    def display_dashboard(self):
        return "teacher dashboard" 
    
hod1=HOD("hod","email")
print(hod1.display_dashboard())
              