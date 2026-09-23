class Student:
    def __init__(self,attendance):
        # protect
        if 0<=attendance<=100:
            self._attendance=attendance
        else:
            raise ValueError("Invalid entry")
        
    # 0 to 100
    #  When needed,display(getter)
    
    def get_attendance(self):
        return self._attendance
    
    def set_attendance(self,value):
        if 0<=value<=100:
            self._attendance=value
        else:
            raise ValueError("Invalid entry")
        
std11=Student(900)
print(std1.get_attendance()) 
std1.set_attendance(200)
print(std1.attendance)
       
        
                