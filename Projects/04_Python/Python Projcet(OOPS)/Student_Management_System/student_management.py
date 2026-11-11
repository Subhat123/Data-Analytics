# Student Management System
# Improved beginner-friendly OOP console application

class Person:
    def __init__(self, name, email, phone):
        self.name = name
        self.email = email
        self.phone = phone


class Student(Person):
    PASS_MARK = 50
    MIN_ATTENDANCE = 75

    def __init__(self, name, email, phone, student_id, department,
                 attendance, python_mark, sql_mark, excel_mark):
        super().__init__(name, email, phone)
        self.student_id = student_id
        self.department = department
        self.attendance = attendance
        self.python_mark = python_mark
        self.sql_mark = sql_mark
        self.excel_mark = excel_mark

    def total_mark(self):
        return self.python_mark + self.sql_mark + self.excel_mark

    def average_mark(self):
        return self.total_mark() / 3

    def grade(self):
        average = self.average_mark()
        if average >= 80:
            return "A"
        elif average >= 70:
            return "B"
        elif average >= 60:
            return "C"
        elif average >= 50:
            return "D"
        elif average >= 40:
            return "E"
        return "F"

    def result(self):
        # A student must pass every subject to pass overall.
        marks = [self.python_mark, self.sql_mark, self.excel_mark]
        return "Pass" if all(mark >= self.PASS_MARK for mark in marks) else "Fail"

    def attendance_status(self):
        if self.attendance >= self.MIN_ATTENDANCE:
            return "Eligible for Examination"
        return "Not Eligible for Examination"

    def display_details(self):
        print("\n---------- STUDENT DETAILS ----------")
        print("Student ID       :", self.student_id)
        print("Name             :", self.name)
        print("Email            :", self.email)
        print("Phone            :", self.phone)
        print("Department       :", self.department)
        print("Attendance       :", f"{self.attendance}%")
        print("Python Mark      :", self.python_mark)
        print("SQL Mark         :", self.sql_mark)
        print("Excel Mark       :", self.excel_mark)
        print("Total Mark       :", self.total_mark(), "/ 300")
        print("Average Mark     :", round(self.average_mark(), 2))
        print("Grade            :", self.grade())
        print("Academic Result  :", self.result())
        print("Attendance Status:", self.attendance_status())
        print("-------------------------------------")


class Faculty(Person):
    def __init__(self, name, email, phone, faculty_id, department, designation):
        super().__init__(name, email, phone)
        self.faculty_id = faculty_id
        self.department = department
        self.designation = designation

    def display_details(self):
        print("\n---------- FACULTY DETAILS ----------")
        print("Faculty ID  :", self.faculty_id)
        print("Name        :", self.name)
        print("Email       :", self.email)
        print("Phone       :", self.phone)
        print("Department  :", self.department)
        print("Designation :", self.designation)
        print("-------------------------------------")


students = {}
faculties = {}


def read_non_empty(prompt):
    while True:
        value = input(prompt).strip()
        if value:
            return value
        print("This field cannot be empty. Please try again.")


def read_number(prompt, minimum=None, maximum=None, allow_decimal=False):
    while True:
        try:
            value = float(input(prompt)) if allow_decimal else int(input(prompt))
            if minimum is not None and value < minimum:
                print(f"Enter a value greater than or equal to {minimum}.")
                continue
            if maximum is not None and value > maximum:
                print(f"Enter a value less than or equal to {maximum}.")
                continue
            return value
        except ValueError:
            print("Invalid input. Please enter a valid number.")


def add_student():
    print("\n========== ADD STUDENT ==========")
    student_id = read_non_empty("Enter Student ID: ")

    if student_id in students:
        print("This Student ID already exists.")
        return

    name = read_non_empty("Enter Student Name: ")
    email = read_non_empty("Enter Email: ")
    phone = read_non_empty("Enter Phone Number: ")
    department = read_non_empty("Enter Department: ")
    attendance = read_number("Enter Attendance Percentage: ", 0, 100, True)
    python_mark = read_number("Enter Python Mark (0-100): ", 0, 100)
    sql_mark = read_number("Enter SQL Mark (0-100): ", 0, 100)
    excel_mark = read_number("Enter Excel Mark (0-100): ", 0, 100)

    students[student_id] = Student(
        name, email, phone, student_id, department,
        attendance, python_mark, sql_mark, excel_mark
    )
    print("Student added successfully!")


def view_students():
    print("\n========== STUDENT LIST ==========")
    if not students:
        print("No student records found.")
        return

    for student in students.values():
        student.display_details()


def search_student():
    print("\n========== SEARCH STUDENT ==========")
    student_id = read_non_empty("Enter Student ID to search: ")
    student = students.get(student_id)

    if student:
        student.display_details()
    else:
        print("Student not found.")


def update_student():
    print("\n========== UPDATE STUDENT ==========")
    student_id = read_non_empty("Enter Student ID to update: ")
    student = students.get(student_id)

    if not student:
        print("Student not found.")
        return

    print("Press Enter to keep the current value.")
    new_name = input(f"Name [{student.name}]: ").strip()
    new_email = input(f"Email [{student.email}]: ").strip()
    new_phone = input(f"Phone [{student.phone}]: ").strip()
    new_department = input(f"Department [{student.department}]: ").strip()

    if new_name:
        student.name = new_name
    if new_email:
        student.email = new_email
    if new_phone:
        student.phone = new_phone
    if new_department:
        student.department = new_department

    print("Student details updated successfully!")


def delete_student():
    print("\n========== DELETE STUDENT ==========")
    student_id = read_non_empty("Enter Student ID to delete: ")

    if student_id not in students:
        print("Student not found.")
        return

    confirmation = input("Are you sure you want to delete this record? (yes/no): ").strip().lower()
    if confirmation == "yes":
        del students[student_id]
        print("Student record deleted successfully.")
    else:
        print("Delete operation cancelled.")


def check_attendance():
    print("\n========== CHECK ATTENDANCE ==========")
    student_id = read_non_empty("Enter Student ID: ")
    student = students.get(student_id)

    if student:
        print("Student Name :", student.name)
        print("Attendance   :", f"{student.attendance}%")
        print("Status       :", student.attendance_status())
    else:
        print("Student not found.")


def view_result():
    print("\n========== ACADEMIC RESULT ==========")
    student_id = read_non_empty("Enter Student ID: ")
    student = students.get(student_id)

    if student:
        print("Student Name  :", student.name)
        print("Total Marks   :", student.total_mark(), "/ 300")
        print("Average Marks :", round(student.average_mark(), 2))
        print("Grade         :", student.grade())
        print("Result        :", student.result())
    else:
        print("Student not found.")


def add_faculty():
    print("\n========== ADD FACULTY ==========")
    faculty_id = read_non_empty("Enter Faculty ID: ")

    if faculty_id in faculties:
        print("This Faculty ID already exists.")
        return

    name = read_non_empty("Enter Faculty Name: ")
    email = read_non_empty("Enter Email: ")
    phone = read_non_empty("Enter Phone Number: ")
    department = read_non_empty("Enter Department: ")
    designation = read_non_empty("Enter Designation: ")

    faculties[faculty_id] = Faculty(
        name, email, phone, faculty_id, department, designation
    )
    print("Faculty added successfully!")


def view_faculties():
    print("\n========== FACULTY LIST ==========")
    if not faculties:
        print("No faculty records found.")
        return

    for faculty in faculties.values():
        faculty.display_details()


def main_menu():
    while True:
        print("\n========================================")
        print("       STUDENT MANAGEMENT SYSTEM")
        print("========================================")
        print("1.  Add Student")
        print("2.  View All Students")
        print("3.  Search Student")
        print("4.  Update Student")
        print("5.  Delete Student")
        print("6.  Add Faculty")
        print("7.  View All Faculty")
        print("8.  Check Attendance")
        print("9.  View Academic Result")
        print("10. Exit")
        print("========================================")

        choice = input("Enter your choice (1-10): ").strip()

        if choice == "1":
            add_student()
        elif choice == "2":
            view_students()
        elif choice == "3":
            search_student()
        elif choice == "4":
            update_student()
        elif choice == "5":
            delete_student()
        elif choice == "6":
            add_faculty()
        elif choice == "7":
            view_faculties()
        elif choice == "8":
            check_attendance()
        elif choice == "9":
            view_result()
        elif choice == "10":
            print("Thank you for using Student Management System!")
            break
        else:
            print("Invalid choice. Please enter a number from 1 to 10.")


if __name__ == "__main__":
    main_menu()
