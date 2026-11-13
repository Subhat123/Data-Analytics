# Nova University -- Student Management System

## About the Project

This is a simple Python console-based Student Management System
developed for the Nova University OOP Application Activity.

The application helps manage student and faculty details and provides
options to check attendance and view academic results. It is designed
using Object-Oriented Programming (OOP) concepts in Python.

## Features

The application displays the following main menu options:

1.  Add Student
2.  View All Students
3.  Search Student
4.  Update Student
5.  Delete Student
6.  Add Faculty
7.  View All Faculty
8.  Check Attendance
9.  View Academic Result
10. Exit

### Student Management

-   Add a student's details.
-   View the list of students.
-   Search for a student.
-   Update student information.
-   Delete a student record.
-   Check attendance eligibility.
-   View academic result details.

### Faculty Management

-   Add faculty details.
-   View all faculty details.

## OOP Concepts Used

-   **Class and Object:** Classes are used to represent the entities in
    the application, and objects are created to work with their details.
-   **Encapsulation:** Related data and operations are organized within
    classes.
-   **Inheritance:** A common parent class can be used to share basic
    person details between student and faculty classes, if implemented
    in the source code.
-   **Polymorphism:** The same method name can be used to display
    details in different ways for different types of people, if
    implemented in the source code.

> Note: Keep only the OOP concepts that are actually present in your
> `student_management.py` implementation. The last two bullets are
> included as a checklist and should be removed if your code does not
> implement them.

## Technologies Used

-   Python
-   Visual Studio Code
-   PowerShell / VS Code Terminal

## How to Run the Project

1.  Download or clone this repository.
2.  Open the project folder in Visual Studio Code.
3.  Open the VS Code Terminal.
4.  Make sure the terminal is opened in the folder that contains
    `student_management.py`.
5.  Run this command:

``` bash
python student_management.py
```

6.  The Student Management System main menu will appear.
7.  Enter the option number and follow the instructions shown in the
    terminal.

## Sample Screenshots

The screenshots below show the application running in the VS Code
terminal. Save your screenshots inside a folder named `screenshots` in
the project directory, using the same filenames shown below.

### 1. Main Menu

![Main Menu](<Screenshot 2026-11-11 125245.png>)

### 2. Add Student

![Add Student](<Screenshot 2026-11-11 124723.png>)
### 3. View All Students

![View All Students](<Screenshot 2026-11-11 125203.png>)

### 4. Search Student

![Search Student](screenshots/04_search_student.png)

### 5. Update Student

![Update Student](<Screenshot 2026-11-11 125210.png>)

### 6. Delete Student

![Delete Student](screenshots/06_delete_student.png)

### 7. Add Faculty

![Add Faculty](<Screenshot 2026-11-11 125233.png>))

### 8. View All Faculty

![View All Faculty](screenshots/08_view_all_faculty.png)

### 9. Check Attendance

![Check Attendance](<Screenshot 2026-11-11 125218.png>) 

### 10. View Academic Result

![Academic Result](<Screenshot 2026-11-11 124425.png>)

### 11. Input Validation

![Input Validation](screenshots/11_input_validation.p



The application should be tested with both valid and invalid inputs.
Examples include:

-   Entering a valid menu option.
-   Entering an invalid menu option.
-   Entering valid student and faculty details.
-   Searching for an existing and a non-existing student.
-   Entering attendance values at the allowed limits and outside the
    allowed range.
-   Entering text where a number is expected.

The program should display a suitable message for invalid input instead
of terminating unexpectedly. Add screenshots of the actual validation
messages in the Input Validation section above.

## Project Folder Structure

``` text
nova-university-oop/
│
├── student_management.py
├── README.md
└── screenshots/
    ├── 01_main_menu.png
    ├── 02_add_student.png
    ├── 03_view_all_students.png
    ├── 04_search_student.png
    ├── 05_update_student.png
    ├── 06_delete_student.png
    ├── 07_add_faculty.png
    ├── 08_view_all_faculty.png
    ├── 09_check_attendance.png
    ├── 10_academic_result.png
    └── 11_input_validation.png
```

## Notes

-   This is a console-based Python application.
-   Run the program using `student_management.py`.
-   The screenshots in this README must be replaced with the actual
    screenshots captured while testing your application.
-   If the application stores records only in program memory, the
    records will be cleared when the program is closed. Update this note
    if your code uses file or database storage.

## Conclusion

This project helped me practise Python programming and understand how
OOP concepts can be used to organize a small Student Management System.
It also gave me practice in handling student and faculty information,
checking attendance, and displaying academic results.
