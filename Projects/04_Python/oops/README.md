# 🏛️ Object-Oriented Programming (OOP) in Python

## 📌 Overview

This directory contains practical implementations illustrating the core pillars of Object-Oriented Programming in Python: Class & Object Creation, Encapsulation, Inheritance, Polymorphism, and Abstract Base Classes (ABCs).

---

## 🗂️ Script Catalog

| Script | OOP Principles Demonstrated | Highlights & Implementation Details |
| :--- | :--- | :--- |
| **`student management system.py`** | Classes, Constructors & Methods | Defines a `Student` class with class variables (`university = "Nova University"`), instance variables (`name`, `id`, `dept`, `marks`, `attendance`), and formatted display methods. |
| **`encapsulation.py`** | Data Hiding & Property Validation | Implements protected attributes (`_attendance`), getter methods (`get_attendance()`), and setter methods (`set_attendance()`) enforcing range constraints ($0 \le \text{val} \le 100$) via `raise ValueError`. |
| **`inheritance.py`** | Inheritance, Hierarchy & ABCs | Uses `from abc import ABC, abstractmethod` to define an abstract `Person` base class, with specialized subclasses `Student`, `Teacher`, and `HOD` utilizing `super().__init__()` and method overriding. |
| **`functions.py`** | Reusable Logic & Helpers | Demonstrates modular functional decomposition supporting OOP workflows. |
| **`std.py`** | Object Instantiation Scratchpad | Compact script testing class instantiation and attribute access. |

---

## 💡 Code Patterns Highlight

### Abstract Base Class & Inheritance
```python
from abc import ABC, abstractmethod

class Person(ABC):
    def __init__(self, name, email):
        self.name = name
        self.email = email

    @abstractmethod
    def display_role(self):
        pass

class Student(Person):
    def __init__(self, name, email, dept):
        super().__init__(name, email)
        self.dept = dept

    def display_role(self):
        return f"Student: {self.name} ({self.dept})"
```

---

## 🚀 Execution

```bash
python "student management system.py"
python encapsulation.py
python inheritance.py
```
