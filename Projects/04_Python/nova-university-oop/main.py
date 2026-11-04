
class Person:
    def __init__(self, name, email, phone):
        self.name = name
        self.email = email
        self.phone = phone

    def display_info(self):
        print(f"Name: {self.name}")
        print(f"Email: {self.email}")
        print(f"Phone: {self.phone}")


class Student(Person):
    def __init__(self, student_id, name, email, phone,
                 department, attendance, python_marks,
                 sql_marks, excel_marks):
        super().__init__(name, email, phone)

        self.student_id = student_id
        self.department = department
        self.attendance = attendance
        self.python_marks = python_marks
        self.sql_marks = sql_marks
        self.excel_marks = excel_marks

    @property
    def attendance(self):
        return self._attendance

    @attendance.setter
    def attendance(self, value):
        if not 0 <= value <= 100:
            raise ValueError("Attendance must be between 0 and 100.")
        self._attendance = value

    @staticmethod
    def validate_marks(marks):
        if not 0 <= marks <= 100:
            raise ValueError("Marks must be between 0 and 100.")

    def total_marks(self):
        return (self.python_marks + self.sql_marks
                + self.excel_marks)

    def average_marks(self):
        return self.total_marks() / 3

    def result(self):
        return "PASS" if self.average_marks() >= 50 else "FAIL"

    def grade(self):
        average = self.average_marks()

        if average >= 90:
            return "A"
        elif average >= 80:
            return "B"
        elif average >= 70:
            return "C"
        elif average >= 60:
            return "D"
        elif average >= 50:
            return "E"
        return "F"

    def check_attendance(self):
        return self.attendance >= 75

    def display_info(self):
        print("\n--- Student Information ---")
        super().display_info()
        print(f"Student ID: {self.student_id}")
        print(f"Department: {self.department}")
        print(f"Attendance: {self.attendance}%")

    def display_result(self):
        print("\n--- Academic Result ---")
        print(f"Student ID: {self.student_id}")
        print(f"Python Marks: {self.python_marks}")
        print(f"SQL Marks: {self.sql_marks}")
        print(f"Excel Marks: {self.excel_marks}")
        print(f"Total: {self.total_marks()}/300")
        print(f"Average: {self.average_marks():.2f}")
        print(f"Result: {self.result()}")
        print(f"Grade: {self.grade()}")


class Faculty(Person):
    def __init__(self, faculty_id, name, email, phone, department):
        super().__init__(name, email, phone)
        self.faculty_id = faculty_id
        self.department = department

    def display_info(self):
        print("\n--- Faculty Information ---")
        super().display_info()
        print(f"Faculty ID: {self.faculty_id}")
        print(f"Department: {self.department}")


class StudentManagementSystem:
    def __init__(self):
        self.students = {}
        self.faculty_members = {}

    @staticmethod
    def get_text(prompt):
        while True:
            value = input(prompt).strip()
            if value:
                return value
            print("Input cannot be empty. Try again.")

    @staticmethod
    def get_number(prompt, minimum, maximum):
        while True:
            try:
                value = float(input(prompt))

                if not minimum <= value <= maximum:
                    print(f"Enter a value between {minimum} and {maximum}.")
                    continue

                return value
            except ValueError:
                print("Invalid input. Please enter a number.")

    def add_student(self):
        student_id = self.get_text("Student ID: ")

        if student_id in self.students:
            print("Student ID already exists.")
            return

        name = self.get_text("Name: ")
        email = self.get_text("Email: ")
        phone = self.get_text("Phone: ")
        department = self.get_text("Department: ")
        attendance = self.get_number("Attendance (%): ", 0, 100)
        python_marks = self.get_number("Python marks: ", 0, 100)
        sql_marks = self.get_number("SQL marks: ", 0, 100)
        excel_marks = self.get_number("Excel marks: ", 0, 100)

        student = Student(
            student_id, name, email, phone, department,
            attendance, python_marks, sql_marks, excel_marks
        )

        self.students[student_id] = student
        print("Student added successfully!")

    def view_students(self):
        if not self.students:
            print("No student records found.")
            return

        for student in self.students.values():
            student.display_info()

    def check_attendance(self):
        student = self.find_student()
        if student is None:
            return

        if student.check_attendance():
            print("Eligible for examination.")
        else:
            print("Not eligible for examination.")

    def view_result(self):
        student = self.find_student()
        if student is not None:
            student.display_result()

    def find_student(self):
        student_id = self.get_text("Enter Student ID: ")
        student = self.students.get(student_id)

        if student is None:
            print("Student not found.")

        return student

    def add_faculty(self):
        faculty_id = self.get_text("Faculty ID: ")

        if faculty_id in self.faculty_members:
            print("Faculty ID already exists.")
            return

        name = self.get_text("Name: ")
        email = self.get_text("Email: ")
        phone = self.get_text("Phone: ")
        department = self.get_text("Department: ")

        self.faculty_members[faculty_id] = Faculty(
            faculty_id, name, email, phone, department
        )
        print("Faculty added successfully!")

    def view_faculty(self):
        if not self.faculty_members:
            print("No faculty records found.")
            return

        for faculty in self.faculty_members.values():
            faculty.display_info()

    def run(self):
        while True:
            print("\n===== NOVA UNIVERSITY =====")
            print("1. Add Student")
            print("2. View Students")
            print("3. Check Attendance Eligibility")
            print("4. View Academic Result")
            print("5. Add Faculty")
            print("6. View Faculty")
            print("7. Exit")

            choice = input("Enter your choice: ").strip()

            try:
                if choice == "1":
                    self.add_student()
                elif choice == "2":
                    self.view_students()
                elif choice == "3":
                    self.check_attendance()
                elif choice == "4":
                    self.view_result()
                elif choice == "5":
                    self.add_faculty()
                elif choice == "6":
                    self.view_faculty()
                elif choice == "7":
                    print("Thank you for using Nova University System!")
                    break
                else:
                    print("Invalid choice. Select 1 to 7.")

            except (ValueError, EOFError, KeyboardInterrupt):
                print("\nInvalid input or operation cancelled. Returning to menu.")


if __name__ == "__main__":
    app = StudentManagementSystem()
    app.run()
