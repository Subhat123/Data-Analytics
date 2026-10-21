# 📖 Python Dictionary Methods & Operations

## 📌 Overview

This directory provides comprehensive examples and practice scripts exploring Python's built-in `dict` data type, including creation, retrieval, mutation, traversal, and deletion operations.

---

## 🗂️ Script Catalog

| Script | Methods Covered | Description |
| :--- | :--- | :--- |
| **`dict.py`** | `keys()`, `values()`, `items()`, `get()`, `update()`, `pop()`, `del` | Demonstrates dictionary instantiation (literal `{}` and `dict()` constructor), safe key lookup with fallback values via `get()`, in-place updates via `update()`, and removal with `pop()` and `del`. |
| **`key_values_example.py`** | Key-Value Iteration | Explores looping techniques over dictionary components (`for k, v in dict.items()`) and nested mapping access. |

---

## 💡 Code Highlights

```python
# Safe key access with default fallback
course = student.get("course", "Not Enrolled")

# In-place dictionary update
student.update({"age": 21, "city": "Chennai"})

# Key removal with returned value
removed_age = student.pop("age", None)
```

---

## 🚀 Execution

```bash
python dict.py
python key_values_example.py
```
