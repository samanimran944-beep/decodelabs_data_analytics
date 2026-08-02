# 🧹 Project 1: Data Cleaning & Preparation

**DecodeLabs — Data Analytics Industrial Training Kit | Batch 2026**

> Poor data quality costs organizations an average of **$12.9M/year** and
> 15–25% of annual revenue. This project builds the foundational discipline
> every data analyst needs before touching a chart, model, or dashboard:
> turning a raw, messy dataset into a verified, "gold standard" source of truth.

---

## 📌 Overview

This project audits and cleans a **1,200-row e-commerce order transactions
dataset**, applying a structured 4-phase data integrity workflow:

| Phase | Focus | Outcome |
|---|---|---|
| **1. Strategic Imputation** | Handle missing values without blind deletion | `CouponCode` nulls resolved to explicit `'NoCoupon'` category |
| **2. Integrity Audit** | One truth, one record | 0 duplicate `OrderID` / full-row duplicates verified |
| **3. Standardization** | Speak one language | ISO 8601 dates, trimmed/title-cased text, 2-decimal numeric precision |
| **4. Verification Gate** | Prove it | 0% error rate on identifiers & date formats, asserted programmatically |

## 🎯 Goal

Clean a raw dataset by handling missing values, duplicates, and incorrect
data — producing an analysis-ready dataset that can safely feed into
downstream EDA, dashboards, or predictive modeling (Project 2+).

## 🗂️ Repository Structure

```
project_1_data_cleaning_preparation/
├── data/
│   ├── raw/
│   │   └── ecommerce_orders_raw.xlsx        # Original, untouched source data
│   └── cleaned/
│       └── ecommerce_orders_cleaned.csv     # Final, verified output dataset
├── notebook/
│   └── Data_Cleaning_and_Preparation.ipynb  # Full audit + cleaning pipeline (executed, outputs saved)
├── reports/
│   └── change_log.md                        # Auditable log of every transformation applied
├── requirements.txt
└── README.md
```

## 📊 Dataset

**Source:** `ecommerce_orders_raw.xlsx` (1,200 rows × 14 columns)

| Column | Description |
|---|---|
| `OrderID` | Unique order identifier (`ORD######`) |
| `Date` | Order date |
| `CustomerID` | Unique customer identifier (`C#####`) |
| `Product` | Product purchased |
| `Quantity` | Units ordered |
| `UnitPrice` | Price per unit (USD) |
| `ShippingAddress` | Delivery street address |
| `PaymentMethod` | Payment channel used |
| `OrderStatus` | Order lifecycle status |
| `TrackingNumber` | Shipment tracking ID (`TRK########`) |
| `ItemsInCart` | Total items in the customer's cart |
| `CouponCode` | Coupon applied at checkout (nullable) |
| `ReferralSource` | Marketing channel that drove the order |
| `TotalPrice` | `Quantity × UnitPrice` |

## 🔍 Key Findings (Audit)

- **Missing values:** `CouponCode` had 309 nulls (25.75%) — legitimate "no
  coupon used" cases, not data errors.
- **Duplicates:** 0 duplicate `OrderID` values, 0 full-row duplicates.
- **Formatting:** All identifiers, dates, and monetary values matched
  expected patterns — but the pipeline still applies defensive
  standardization so it stays correct on future, messier data pulls.
- **Business logic:** `TotalPrice` was consistent with `Quantity × UnitPrice`
  for all 1,200 rows; the field is now recalculated and locked as a
  self-healing safeguard.

Full before/after metrics and the verification gate results are in the
notebook (Sections 3, 5 & 6) and summarized in [`reports/change_log.md`](reports/change_log.md).

## 🛠️ Tech Stack

- **Python 3.12** · `pandas`, `numpy`, `openpyxl`
- **Jupyter Notebook** for the reproducible, documented pipeline

## ▶️ How to Run

```bash
# From the project_1_data_cleaning_preparation/ folder
pip install -r requirements.txt
jupyter notebook notebook/Data_Cleaning_and_Preparation.ipynb
```

Running all cells regenerates `data/cleaned/ecommerce_orders_cleaned.csv`
from the raw source and re-verifies the integrity gate.

## ✅ Verification Gate

Per the project brief's professional standard:

> *"Before you finish, you must prove there are zero duplicate IDs and zero
> incorrectly formatted dates."*

This is enforced programmatically in the notebook with an `assert` statement
— the notebook will not run cleanly unless every check passes with a 0%
error rate.

## 🔗 Key Skills Demonstrated

`Data Cleaning` · `Missing Value Imputation` · `Deduplication` ·
`Data Standardization` · `pandas` · `Data Validation & QA` ·
`Reproducible Analysis Pipelines`

---
**DecodeLabs | Data Analytics Internship — Project 1 of 4+ | Industrial Training Kit, Batch 2026**
