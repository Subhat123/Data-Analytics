# 🎓 Nova Console Application – Student Information & Management System

## 📌 Application Overview

The **Nova Console App** (`main.py`) is an 870-line, enterprise-style Command Line Interface (CLI) application built in Python. It serves as a comprehensive Student Information and Academic Management System designed for university administrative operations.

It demonstrates advanced procedural and defensive programming paradigms: robust input trapping, multi-level dictionary state management, academic performance modeling, business validation rules, and structured tabular reporting.

---

## 🗂️ File Manifest

| File | Lines of Code | Description |
| :--- | :---: | :--- |
| **`main.py`** | 870 | Complete standalone console application providing interactive menus for student registration, academic evaluation, course enrollment, records querying, and executive reporting. |

---

## ⚙️ Core Architecture & Features

### 1. Robust Defensive Input Validation
- `read_int(prompt, min, max)`: Loops until a valid integer within specified boundaries is received, catching `ValueError` gracefully.
- `read_float(prompt, min, max)`: Validates continuous numeric values (e.g., attendance percentages, scores).
- `read_phone()`: Validates that phone numbers are exactly 10 numeric digits.

### 2. Department & Course Management
- Supports structured departments: Computer Science (`CSE`), Information Technology (`IT`), Artificial Intelligence & Data Science (`AI&DS`), Electronics (`ECE`), and Business Administration (`BBA`).
- Course catalog: `Python`, `SQL`, `Excel`, and `Power BI`.

### 3. Student Record Operations (CRUD)
- **Registration:** Registers students with auto-validated ID uniqueness, department mapping, academic year, contact details, attendance, subject marks, and enrollment status.
- **Academic Grading Engine:** Implements BRD-compliant grading rules:
  - $A \ge 90\%$, $B \ge 80\%$, $C \ge 70\%$, $D \ge 60\%$, $E \ge 50\%$, and Fail $< 50\%$.
- **Status Tracking:** Tracks `Active` vs `Inactive` lifecycle states.
- **Reporting & Search:** Query by ID, filter by department, list honors students, and calculate cohort-level averages.

---

## 🚀 How to Run the Application

Execute directly in any terminal:
```bash
python main.py
```
Follow the interactive numbered on-screen menu prompts to navigate through system capabilities.
