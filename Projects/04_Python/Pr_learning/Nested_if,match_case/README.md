# 🔀 Nested Conditionals & Match-Case Statements

## 📌 Overview

This directory demonstrates advanced decision-making constructs in Python, contrasting multi-level nested conditionals against flat `elif` ladders and modern structural pattern matching (`match-case`).

---

## 🗂️ Script Catalog

| Script | Flow Control Paradigms | Description |
| :--- | :--- | :--- |
| **`Nested_if.py`** | Nested `if`, `elif` Ladder, `match-case` | Explores hierarchical multi-level decisions (e.g., marks thresholds, age bracket categorization), sequential `if-elif-else` evaluation, and switch-case style branching with `match-case`. |

---

## 💡 Syntax Patterns Demonstrated

### 1. Nested Decision Tree
```python
if marks >= 50:
    if marks >= 60:
        print("Passed with First Class")
    else:
        print("Passed")
else:
    print("Failed")
```

### 2. Structural Pattern Matching (`match-case`)
```python
match choice:
    case 1:
        print("Pizza selected")
    case 2:
        print("Burger selected")
    case 3:
        print("Pasta selected")
    case _:
        print("Invalid selection")
```

---

## 🚀 Execution

```bash
python Nested_if.py
```
