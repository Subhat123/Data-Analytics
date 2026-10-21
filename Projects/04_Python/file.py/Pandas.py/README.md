# 🐼 Pandas Analytics & Web Scraping

## 📌 Overview

This directory contains practical labs on tabular data analysis using Python's `pandas` library, alongside web data extraction using `requests` and `BeautifulSoup`.

---

## 🗂️ Files Manifest

| File | Type | Description |
| :--- | :--- | :--- |
| **`panda practice.ipynb`** | Jupyter Notebook (~219 KB) | In-depth notebook covering Pandas DataFrames, Series, slicing, indexing (`loc`, `iloc`), filtering, grouping, missing data handling, and aggregation methods. |
| **`web.py`** | Python Script | Web scraping script that queries the online bookstore `books.toscrape.com` using the `requests` library and parses HTML structures via `BeautifulSoup` to extract book titles and pricing data. |

---

## 🛠️ Required Libraries

To execute the scripts and notebooks in this folder:
```bash
pip install pandas requests beautifulsoup4 jupyter
```

---

## 🚀 Execution

Run the web scraping script:
```bash
python web.py
```
Open the Pandas practice notebook:
```bash
jupyter notebook "panda practice.ipynb"
```
