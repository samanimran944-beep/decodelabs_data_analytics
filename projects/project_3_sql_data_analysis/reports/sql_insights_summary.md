# SQL Insights Summary — Project 3: SQL Data Analysis

**Database:** `database/ecommerce.db` (SQLite) — built from the verified
`ecommerce_orders_cleaned.csv` (1,200 rows, from Project 1)
**Technique:** `SELECT`, `WHERE`, `GROUP BY`, `HAVING`, aggregate functions
(`COUNT`, `SUM`, `AVG`), scalar subqueries, date functions

Every finding below is produced with pure SQL against the relational
database and cross-checked against the Project 2 Python-based EDA where
applicable.

## 1. High-Value Order Segment

- **34 orders** exceed $3,000 in value — every one of them is a 5-unit
  order of a premium-priced item (Tablet, Laptop, Monitor, Chair, Printer,
  or Phone).
- **So what:** This is a clean, queryable list for an account manager or
  loyalty program to follow up with directly.

## 2. Product Revenue Leaders

| Product | Orders | Total Revenue | Avg. Order Value |
|---|---|---|---|
| Chair | 178 | $195,620.11 | $1,098.99 |
| Printer | 181 | $195,612.61 | $1,080.73 |
| Laptop | 173 | $192,126.56 | $1,110.56 |
| Tablet | 179 | $186,568.95 | $1,042.28 |
| Monitor | 163 | $175,651.41 | $1,077.62 |
| Desk | 170 | $167,459.93 | $985.06 |
| Phone | 156 | $151,722.39 | $972.58 |

- **So what:** Chair and Printer are effectively tied for the top revenue
  spot — this independently confirms the Project 2 finding using SQL
  aggregation rather than pandas.

## 3. Order Status Distribution (Verified via SQL)

| Status | Orders | % of Total |
|---|---|---|
| Cancelled | 250 | 20.83% |
| Returned | 247 | 20.58% |
| Pending | 237 | 19.75% |
| Shipped | 235 | 19.58% |
| Delivered | 231 | 19.25% |

- **So what:** Cancelled + Returned = **41.4%** of all orders — the same
  fulfillment-risk figure surfaced in Project 2, now confirmed with a
  direct SQL query against the raw table.

## 4. Payment Method — Average Order Value

| Payment Method | Orders | Avg. Order Value |
|---|---|---|
| Credit Card | 234 | $1,127.55 |
| Gift Card | 230 | $1,070.97 |
| Cash | 246 | $1,056.04 |
| Online | 258 | $1,017.22 |
| Debit Card | 232 | $1,001.56 |

## 5. Referral Channel Performance

| Channel | Orders | Total Revenue | Avg. Order Value |
|---|---|---|---|
| Instagram | 259 | $275,285.45 | $1,062.88 |
| Email | 250 | $261,808.55 | $1,047.23 |
| Google | 241 | $250,441.48 | $1,039.18 |
| Facebook | 228 | $250,410.90 | $1,098.29 |
| Referral | 222 | $226,815.58 | $1,021.69 |

## 6. Repeat Customer Rate (New Finding — via `HAVING`) 🆕

- Only **11 of 1,189 unique customers** (~0.9%) placed more than one order.
- **So what:** Customer retention is a largely untapped opportunity — the
  order book is almost entirely driven by first-time/single-purchase
  customers. A loyalty or win-back campaign could meaningfully shift this.
- This finding was not surfaced in the Project 2 EDA — it emerged
  specifically from the `HAVING` analysis in this SQL pass, demonstrating
  the value of approaching the same dataset with a different technique.

## 7. Yearly Revenue Trend

| Year | Orders | Revenue |
|---|---|---|
| 2023 | 510 | $552,643.24 |
| 2024 | 459 | $480,235.87 |
| 2025 (partial — through June) | 231 | $231,882.85 |

- **So what:** 2023 → 2024 shows a real revenue decline, but **2025 is a
  partial year** (data only through June). Do not annualize or compare
  2025 directly to the two full years without adjusting for the missing
  half — doing so would overstate the apparent decline.

## 8. High-Value Orders at Risk (Subquery Finding)

- Cross-referencing `OrderStatus IN ('Cancelled', 'Returned')` with
  `TotalPrice > average order value` surfaces the costliest slice of the
  fulfillment-risk problem.
- **So what:** This targeted list (not just "any" cancelled/returned order)
  is the highest-priority starting point for a root-cause investigation,
  since it represents the largest revenue exposure per order.

## 9. Coupon Usage vs. Order Value

| Coupon Code | Orders | Avg. Order Value |
|---|---|---|
| Freeship | 313 | $1,070.41 |
| Save10 | 286 | $1,065.87 |
| Winter15 | 292 | $1,035.90 |
| Nocoupon | 309 | $1,043.37 |

- **So what:** Coupon-using orders trend slightly higher in average value
  than no-coupon orders — a correlational signal worth testing further, not
  a causal claim (order size could drive coupon eligibility rather than the
  reverse).

---
**Cross-verification note:** Every insight that overlaps with Project 2
(product revenue ranking, fulfillment-risk percentage, referral channel
ranking, payment method AOV ranking) matches within rounding — confirming
the data pipeline is consistent from raw file → cleaned CSV → SQL database.

**DecodeLabs | Data Analytics Internship — Project 3**
