# 🛡️ Exception Handling & Defensive Input Validation

## 📌 Overview

This directory demonstrates Python's defensive error-handling paradigms. It explores built-in exception interception, the distinction between syntactic and runtime errors, and custom exception triggers to enforce business logic.

---

## 🗂️ Script Catalog

| Script | Concept Demonstrated | Key Code Elements |
| :--- | :--- | :--- |
| **`Exception.py`** | Core Exception Mechanisms | Demonstrates `try-except`, `else`, and `finally` blocks; catching specific exceptions (`ValueError`, `FileNotFoundError`, `PermissionError`); and raising intentional exceptions via `raise ValueError(...)`. |
| **`final.py`** | Defensive Input Loop Pattern | Implements a production-style user validation loop that prompts repeatedly until valid numeric input within the allowable business range ($0 \le \text{attendance} \le 100$) is provided, handling non-numeric characters gracefully without crashing. |

---

## 💡 Key Patterns Illustrated

### 1. Robust Input Loop
```python
while True:
    try:
        att = float(input("Enter attendance: "))
        if not 0 <= att <= 100:
            raise ValueError("Kindly enter valid attendance between 0 and 100")
        print("Attendance:", att)
        break
    except ValueError:
        print("Invalid attendance")
```

### 2. Specific Exception Trapping
Catching precise exceptions (`FileNotFoundError`, `ValueError`) rather than generic bare `except:` clauses to preserve system traceability.
