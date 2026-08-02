# EDA Insights Summary — Project 2: Exploratory Data Analysis

**Dataset:** `ecommerce_orders_cleaned.csv` (1,200 verified order records — output of Project 1)
**Analysis type:** Univariate distribution analysis, categorical breakdown, IQR outlier detection, correlation mapping

This report translates the statistical findings from the notebook into
plain-language, decision-ready insights — following the "So What?" test:
every number here is paired with a business implication.

## 1. Order Value is Right-Skewed

- **Mean order value:** ~$1,057 | **Median order value:** ~$895
- The mean sits well above the median, confirming a right-skewed
  distribution driven by a smaller number of high-value orders.
- **So what:** Report the **median**, not the mean, when communicating a
  "typical" order value — the mean overstates it.

## 2. Elevated Cancellation & Return Rate 🚩

- **Cancelled + Returned orders:** 497 of 1,200 (**~41.4%** of all orders)
- **Order value tied up in these statuses:** **~$519,674** (~40% of total recorded order value)
- **So what:** This is a systemic fulfillment/quality signal, not noise.
  Recommend a root-cause investigation into checkout friction, delivery
  reliability, or product-quality issues before scaling marketing spend on
  new customer acquisition.

## 3. Product Revenue Concentration

| Rank | Product | Total Revenue |
|---|---|---|
| 1 | Chair | ~$195,620 |
| 2 | Printer | ~$195,613 |
| 3 | Laptop | ~$192,127 |
| 4 | Tablet | ~$186,569 |
| 5 | Monitor | ~$175,651 |
| 6 | Desk | ~$167,460 |
| 7 | Phone | ~$151,722 |

- **So what:** Chair, Printer, and Laptop anchor the top of the revenue mix
  and warrant priority in inventory planning and supplier reliability
  reviews.

## 4. Payment Method & Average Order Value (AOV)

| Payment Method | Avg. Order Value |
|---|---|
| Credit Card | ~$1,128 |
| Gift Card | ~$1,071 |
| Cash | ~$1,056 |
| Online | ~$1,017 |
| Debit Card | ~$1,002 |

- **So what:** Credit Card orders carry the highest basket size; Debit Card
  the lowest. Worth investigating whether checkout limits or friction on
  lower-AOV methods are suppressing order size.

## 5. Marketing Channel Performance

| Referral Source | Total Revenue | Orders |
|---|---|---|
| Instagram | ~$275,285 | 259 |
| Email | ~$261,809 | 250 |
| Google | ~$250,441 | 241 |
| Facebook | ~$250,411 | 228 |
| Referral | ~$226,816 | 222 |

- **So what:** Instagram and Email are the top two revenue-generating
  channels and should be prioritized in the next marketing budget
  allocation review.

## 6. Outlier Analysis (IQR Method)

- `TotalPrice` has a small number (8 of 1,200 rows) of statistical outliers
  — all high-value orders above ~$3,330.
- `UnitPrice`, `Quantity`, and `ItemsInCart` show **no** statistical
  outliers.
- **So what:** The high-value `TotalPrice` outliers are treated as
  **signal, not noise** (likely bulk/premium orders) and are flagged for
  manual review rather than removed from the dataset.

## 7. Correlation Findings

| Relationship | Pearson r | Interpretation |
|---|---|---|
| `TotalPrice` ↔ `UnitPrice` | ~0.72 | Strong — expected, since `TotalPrice` is derived from `UnitPrice` |
| `TotalPrice` ↔ `Quantity` | ~0.62 | Moderate-strong — also expected by construction |
| `Quantity` ↔ `ItemsInCart` | ~0.65 | Moderate |
| `ItemsInCart` ↔ `TotalPrice` | ~0.39 | Weak |

- **So what:** Cart size (`ItemsInCart`) alone is a **weak predictor** of
  final order value — it should not be used in isolation to forecast
  revenue. Correlation here is a clue, not a causal claim.

## 8. Time Trend

- Monthly revenue and order volume (Jan 2023 – Jun 2025) fluctuate without
  a strong, consistent seasonal pattern in this sample.
- **So what:** Do not assume a fixed seasonal peak from this dataset alone
  when planning inventory or marketing campaigns — validate against a
  longer time series or external seasonality benchmarks first.

---
**Next step:** These findings (particularly the elevated cancellation/return
rate) are strong candidates for a deeper root-cause investigation or a
dashboard build in a future project.

**DecodeLabs | Data Analytics Internship — Project 2**
