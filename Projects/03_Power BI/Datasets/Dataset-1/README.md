# 📊 Power BI – Dataset 1 Analytics Track

## 📌 Project Overview

This directory houses the end-to-end Power BI business intelligence workflow for **Dataset-1**. The project focuses on transforming raw transactional and operational records into an interactive, multi-page business intelligence dashboard.

---

## 🗂️ Pipeline Structure

```text
Dataset-1/
├── Analysis/       # Metric definitions, DAX blueprints, and business questions
├── Cleaned Data/   # Cleansed, normalized data tables ready for Power Query load
├── Dashboard/      # Power BI desktop files (.pbix) and visual report exports
└── Raw Data/       # Source input files
```

---

## 🎯 Analytical Stages

1. **Ingestion:** Load source files into Power Query editor from `Raw Data/`.
2. **Cleansing & Reshaping:** Remove duplicates, unpivot columns, and enforce correct data types in `Cleaned Data/`.
3. **Data Modeling:** Connect Fact and Dimension tables via star-schema relationships.
4. **Calculations:** Formulate DAX measures for YTD growth, YoY change, and margins.
5. **Visualization:** Build responsive report views in `Dashboard/`.
