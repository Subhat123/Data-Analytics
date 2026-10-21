# 🚪 Day 2 – Flow Control & Student Service Portal

## 📌 Overview

This directory contains Day 2 practical implementations focusing on conditional execution (`if-elif-else`), validation loops (`while True`), and structural pattern matching (`match-case`).

---

## 🗂️ Script Catalog

| Script | Primary Topic | Description |
| :--- | :--- | :--- |
| **`student_service_portal.py`** | Interactive Console Service Portal | A complete menu-driven student self-service portal application that allows students to check exam eligibility based on attendance percentages, view academic grades across a 6-tier grading scale (A through F), and select degree departments using Python's modern `match-case` syntax. |

---

## ⚙️ Key Program Features

- **Continuous Menu Loop:** Runs inside a `while True` loop with an exit option.
- **Attendance Validation:** Validates input range ($0 \le \text{attendance} \le 100$) and enforces a 75% threshold for exam eligibility.
- **Academic Grading Scale:** Evaluates student scores against Pass ($\ge 40$) and assigns grades ($A \ge 90, B \ge 80, C \ge 70, D \ge 60, E \ge 50, F < 50$).
- **Department Selection via `match-case`:** Maps choices to CSE, IT, AI&DS, ECE, and BBA departments.

---

## 🚀 Execution

```bash
python student_service_portal.py
```
