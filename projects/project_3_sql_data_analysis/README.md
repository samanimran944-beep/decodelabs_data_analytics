# 🗄️ Project 3: SQL Data Analysis

**DecodeLabs — Data Analytics Industrial Training Kit | Batch 2026**

> SQL is a **declarative** language: you describe the result you want, and
> the database engine decides how to get it — filtering, bucketing, and
> aggregating raw rows into business intelligence. This project bridges
> the gap between a massive dataset and specific answers through pure
> relational logic.

---

## 📌 Overview

This project loads the **1,200-row, verified e-commerce order dataset**
(output of [Project 1](../project_1_data_cleaning_preparation/)) into a
SQLite relational database, then answers a series of real business
questions using structured SQL queries — filtering, grouping, and
aggregating data with `SELECT`, `WHERE`, `GROUP BY`, `HAVING`, and
aggregate functions.

| Technique | Applied To |
|---|---|
| `SELECT` + `WHERE` + `ORDER BY` | Isolating high-value orders (>$3,000) |
| `GROUP BY` + `SUM`/`AVG`/`COUNT` | Revenue and AOV by product, payment method, referral channel |
| `GROUP BY` + scalar subquery | Order status distribution with % share |
| `HAVING` | Identifying repeat customers (post-aggregation filter) |
| Date functions + `GROUP BY` | Yearly revenue trend |
| Subquery in `WHERE` | High-value orders that are also Cancelled/Returned |

## 🎯 Goal

Use SQL queries to extract insights from a dataset — writing `SELECT`
statements, filtering with `WHERE`, sorting with `ORDER BY`, grouping with
`GROUP BY`, and performing aggregations (`COUNT`, `SUM`, `AVG`) to turn raw
rows into actionable business intelligence.

## 🗂️ Repository Structure

```
project_3_sql_data_analysis/
├── data/
│   └── ecommerce_orders_cleaned.csv     # Verified input (from Project 1)
├── database/
│   └── ecommerce.db                     # SQLite database (built by the notebook)
├── sql/
│   ├── schema.sql                       # Table structure reference
│   └── queries.sql                      # All 12 queries, documented, standalone
├── notebook/
│   └── SQL_Data_Analysis.ipynb          # Full pipeline: DB build + all queries executed with real results
├── reports/
│   └── sql_insights_summary.md          # Plain-language, decision-ready findings
├── requirements.txt
└── README.md
```

## 📊 Key Findings

- 💰 **34 orders exceed $3,000** — all 5-unit bulk orders of premium items;
  a clean list for account-manager follow-up.
- 🏆 **Chair and Printer are effectively tied** as the top revenue products
  ($195,620 vs. $195,613) — confirms the Project 2 finding via independent
  SQL aggregation.
- 🚩 **41.4% of orders are Cancelled or Returned** — re-verified directly
  against the database.
- 🆕 **Only ~0.9% of customers are repeat buyers** (11 of 1,189) — a new
  finding surfaced specifically through `HAVING`, not seen in the Project 2
  Python EDA. Strong signal for a retention/loyalty initiative.
- 📉 Revenue trend across 2023–2025 shows a decline, but **2025 is a
  partial year** (data through June only) — flagged to avoid a misleading
  annualized comparison.
- 🎯 A targeted subquery isolates **high-value orders that are also
  Cancelled/Returned** — the highest-priority slice of the fulfillment-risk
  problem.

Full narrative and all query results: [`reports/sql_insights_summary.md`](reports/sql_insights_summary.md)

## 🛠️ Tech Stack

- **SQL:** SQLite (via Python's built-in `sqlite3`)
- **Python 3.12** · `pandas` (for running/displaying query results)
- **Jupyter Notebook** for the reproducible, documented analysis

> **Note on SQL dialect:** Queries use SQLite syntax (e.g. `strftime()` for
> date functions). On PostgreSQL/MySQL, the date query in Section 10 of the
> notebook would use `EXTRACT(YEAR FROM "Date")` instead.

## ▶️ How to Run

```bash
# From the project_3_sql_data_analysis/ folder
pip install -r requirements.txt
jupyter notebook notebook/SQL_Data_Analysis.ipynb
```

Running all cells rebuilds `database/ecommerce.db` from the source CSV and
re-executes every query in [`sql/queries.sql`](sql/queries.sql) with live
results.

To run the raw queries directly against the database with any SQLite
client:
```bash
sqlite3 database/ecommerce.db < sql/queries.sql
```

## 🔗 Key Skills Demonstrated

`SQL Fundamentals` · `SELECT / WHERE / GROUP BY / HAVING / ORDER BY` ·
`Aggregate Functions (COUNT, SUM, AVG)` · `Scalar & Correlated Subqueries` ·
`Relational Database Design (SQLite)` · `Query Execution Order` ·
`Business Insight Synthesis`

---
**DecodeLabs | Data Analytics Internship — Project 3 of 4+ | Industrial Training Kit, Batch 2026**
