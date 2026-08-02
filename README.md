# 🔍 Project 2: Exploratory Data Analysis (EDA)

**DecodeLabs — Data Analytics Industrial Training Kit | Batch 2026**

> "You are the translator between data and decision." — This project moves
> beyond cleaning into diagnosis: interrogating a verified dataset to
> uncover hidden patterns, trends, and outliers, then translating every
> statistic into a business-relevant insight.

---

## 📌 Overview

This project performs a full exploratory analysis on the **1,200-row,
verified e-commerce order dataset** produced in
[Project 1](../project_1_data_cleaning_preparation/), applying the
**Forensic EDA framework** defined in the project brief:

| Stage | Focus | Outcome |
|---|---|---|
| **Descriptive Statistics** | Five-number summary, mean vs. median | Confirmed `TotalPrice` is right-skewed — median is the reliable "typical order" metric |
| **Univariate Analysis** | Distribution shape of key numeric fields | Visualized skew and spread across price and quantity fields |
| **Categorical Breakdown** | Composition by product, status, payment, channel | Quantified an elevated 41.4% Cancelled/Returned rate |
| **Outlier Detection (IQR)** | Robust outlier flagging | Identified 8 high-value orders as signal (not noise) for manual review |
| **Correlation Analysis** | Pearson correlation mapping | Confirmed cart size is a weak predictor of final order value |
| **Business Synthesis** | The "So What?" test | Every finding translated into an actionable recommendation |

## 🎯 Goal

Analyze a cleaned dataset to understand patterns, trends, and distributions
— calculating basic statistics, identifying trends and outliers, and
summarizing key observations as an executive-ready narrative.

## 🗂️ Repository Structure

```
project_2_exploratory_data_analysis/
├── data/
│   └── ecommerce_orders_cleaned.csv         # Verified input (from Project 1)
├── notebook/
│   └── Exploratory_Data_Analysis.ipynb      # Full EDA pipeline (executed, outputs + charts saved)
├── visuals/                                  # Exported chart images (PNG)
│   ├── 01_univariate_distributions.png
│   ├── 02_categorical_breakdown.png
│   ├── 03_outlier_boxplots.png
│   ├── 04_correlation_heatmap.png
│   ├── 05_revenue_by_product.png
│   └── 06_monthly_trend.png
├── reports/
│   └── eda_insights_summary.md              # Plain-language, decision-ready findings
├── requirements.txt
└── README.md
```

## 📊 Key Findings

- 📉 **Order value is right-skewed** — mean (~$1,057) sits above median
  (~$895); use the median when reporting a "typical" order.
- 🚩 **41.4% of orders are Cancelled or Returned**, tying up ~$519,674 in
  order value — flagged as a systemic fulfillment risk worth a dedicated
  investigation.
- 🏆 **Chair, Printer, and Laptop** are the top 3 products by total revenue.
- 💳 **Credit Card** orders have the highest average order value; **Debit
  Card** the lowest.
- 📣 **Instagram and Email** are the top two revenue-generating referral
  channels.
- 🔗 **Cart size weakly predicts order value** (r ≈ 0.39) — should not be
  used alone for revenue forecasting.
- 📦 Only `TotalPrice` shows statistical outliers (8 high-value orders) —
  treated as signal, not noise.

Full narrative and supporting numbers: [`reports/eda_insights_summary.md`](reports/eda_insights_summary.md)

## 🛠️ Tech Stack

- **Python 3.12** · `pandas`, `numpy`
- **Visualization:** `matplotlib`, `seaborn`
- **Jupyter Notebook** for the reproducible, documented analysis

## ▶️ How to Run

```bash
# From the project_2_exploratory_data_analysis/ folder
pip install -r requirements.txt
jupyter notebook notebook/Exploratory_Data_Analysis.ipynb
```

Running all cells regenerates every chart in `visuals/` from the source
data.

## 🔗 Key Skills Demonstrated

`Exploratory Data Analysis` · `Descriptive Statistics` ·
`Distribution Analysis` · `Outlier Detection (IQR)` · `Correlation Analysis` ·
`Data Visualization` (`matplotlib`/`seaborn`) · `Business Insight Synthesis`

---
**DecodeLabs | Data Analytics Internship — Project 2 of 4+ | Industrial Training Kit, Batch 2026**
