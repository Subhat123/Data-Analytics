# 🧹 FreshMart – Cleaned Data & Analytical Dashboard Model

## 📌 Contents Overview

This directory contains the cleaned, transformed, and fully modeled Excel workbook that powers the executive reporting layer.

---

## 🗂️ Files

| File | File Size | Description |
| :--- | :--- | :--- |
| **`FreshMart_Business_Performance_Fina_Dashboard.xlsx`** | ~1.2 MB | Master cleaned spreadsheet containing transformed data tables, calculated metrics, Pivot Tables, dynamic formulas (`XLOOKUP`, `SUMIFS`), and the interactive sales dashboard. |

---

## ⚙️ Transformations Performed

1. **Schema Integration:** Joined customer, product, and store metadata with raw transaction rows.
2. **Data Normalization:** Formatted currency columns, unified date stamps (`YYYY-MM-DD`), and handled zero/negative anomalies.
3. **Derived Metrics:** Added columns for Profit Margin, Revenue Net of Discount, Basket Size, and Customer Age Groups.
4. **Interactive Controls:** Integrated Excel Slicers for Store Region, Year/Month, and Product Category.
