# Change Log — Project 1: Data Cleaning & Preparation

**Dataset:** `ecommerce_orders_raw.xlsx` → `ecommerce_orders_cleaned.csv`
**Rows (raw → cleaned):** 1,200 → 1,200
**Columns:** 14
**Status:** ✅ Verification gate passed — 0% error rate

Stakeholders need to know *what* was changed and *why*. Every transformation
applied in the notebook is logged here for full auditability.

| Change ID | Description | Rationale | Rows Affected | Status |
|-----------|--------------|-----------|----------------|--------|
| CR001 | Imputed missing `CouponCode` values with explicit category `'NoCoupon'` | A blank coupon field is ambiguous (unknown vs. none applied). Filling with a named category preserves 100% of rows and removes ambiguity — no listwise deletion was used, since that would have reduced statistical power. | 309 | Resolved |
| CR002 | Checked for full-row duplicates and duplicate `OrderID` (primary key) | Guarantee "one truth, one record" per the Phase 2 integrity audit standard. | 0 found / removed | Resolved (verified clean) |
| CR003 | Standardized `Date` to ISO 8601 (`YYYY-MM-DD`) | Enforces a single, unambiguous, sortable date format across the dataset. | 1,200 | Resolved |
| CR004 | Trimmed whitespace and applied consistent Title Case to `Product`, `PaymentMethod`, `OrderStatus`, `ReferralSource`, `CouponCode` | Prevents silent grouping errors downstream (e.g. `"mumbai"` vs `"MUMBAI"` vs `"Mumbai"` being treated as three categories). | 1,200 | Resolved |
| CR005 | Normalized `OrderID`, `CustomerID`, `TrackingNumber` to trimmed, uppercase identifiers | Identifiers must match a fixed pattern (`ORD######`, `C#####`, `TRK########`) with zero variance for reliable joins/lookups. | 1,200 | Resolved |
| CR006 | Rounded `UnitPrice` and `TotalPrice` to 2 decimal places | Enforces numeric precision standard for currency fields. | 1,200 | Resolved |
| CR007 | Recalculated `TotalPrice` as `Quantity × UnitPrice` for every row | Defensive self-healing step — locks the derived field to its source columns so the pipeline stays correct even if a future data pull introduces calculation drift. | 1,200 (0 actual mismatches found) | Resolved |

## Verification Gate Results (Section 5 of the notebook)

| Check | Error Count | Status |
|---|---|---|
| Duplicate `OrderID` | 0 | PASS |
| Full-row duplicates | 0 | PASS |
| Malformed `OrderID` | 0 | PASS |
| Malformed `CustomerID` | 0 | PASS |
| Malformed `TrackingNumber` | 0 | PASS |
| Unparseable / non-ISO dates | 0 | PASS |
| Remaining nulls (any column) | 0 | PASS |
| `TotalPrice` calculation mismatches | 0 | PASS |

**Result: 0% error rate on unique identifiers and date formats — threshold for Project 2 met.**
