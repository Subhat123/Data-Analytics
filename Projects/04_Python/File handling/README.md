# 📁 File Handling – Text, CSV & JSON Operations

## 📌 Overview

This directory contains practical scripts and sample data files demonstrating file input/output (I/O) operations in Python across plain text, comma-separated values (CSV), and JavaScript Object Notation (JSON) formats.

---

## 🗂️ Files Manifest

| File | Type | Description |
| :--- | :--- | :--- |
| **`file_h.py`** | Python Script | Explores core Python file modes: write (`w`), read (`r`), append (`a`), create exclusive (`x`), and binary/seek operations (`seek(0)`, `read()`) using both raw file handles and `with open(...)` context managers. |
| **`csv_handling.py`** | Python Script | Demonstrates reading and writing tabular records using Python's standard `csv` module, including `csv.reader`, `csv.writer`, `csv.DictReader`, and `csv.DictWriter`. |
| **`json_program.py`** | Python Script | Demonstrates serializing and deserializing nested data structures with `json.load()` and `json.dumps()`. |
| **`data.csv`** | CSV Data | Sample comma-delimited file containing student names and departments. |
| **`data.json`** | JSON Data | Sample hierarchical JSON file containing student academic records, marks, and attendance details. |
| **`std_details.txt`** | Text Data | Sample generated text file storing formatted student records. |
| **`student_details.txt`** | Text Data | Sample text file storing student record entries. |
| **`new_student.txt`** | Text Data | Output file created using Python's exclusive creation mode (`x`). |

---

## 🚀 Execution Examples

```bash
python file_h.py
python csv_handling.py
python json_program.py
```
