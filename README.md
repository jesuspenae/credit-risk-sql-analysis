# 💳 Credit Risk Analysis — SQL

SQL analysis of credit risk patterns across 32,581 loan applicants — identifying default drivers by loan grade, intent, demographics and employment profile.

---

## ✅ Key Metrics

| KPI | Value |
|---|---|
| Total Records | 32,581 |
| Default Rate | 21.82% |
| Loan Grades | 7 (A–G) |
| Loan Intents | 6 categories |
| Age Range | 20–144 years |
| Max Interest Rate | 23.22% |

---

## 🔍 Main Insights

- **Debt consolidation** loans have the highest default rate (28.59%) — applicants already in financial distress.
- **Grade G** loans default at 98.44% — almost no repayment at the highest risk tier.
- **Interest rates are well-calibrated to grade** — from 7.33% (Grade A) to 20.25% (Grade G).
- **Renters carry the highest loan-to-income ratio** (16.11%) despite lower average income.
- **Employment length does not predict default** — Grade G applicants average 6.1 years employed, yet default at 98.44%.
- **Over-50 applicants** have the highest income but also the highest default rate (25.35%) among age groups.

---

## 📋 Queries

| # | Query | Concepts |
|---|---|---|
| 1 | Default rate by loan intent | `GROUP BY`, `SUM`, `ROUND` |
| 2 | Default rate and interest rate by loan grade | `GROUP BY`, `AVG`, `ORDER BY` |
| 3 | Income, loan amount and debt burden by home ownership | `GROUP BY`, ratio calculation |
| 4 | Interest rate and loan amount by grade and default status | `CASE WHEN`, multi-column `GROUP BY` |
| 5 | Risk segmentation by age group | `CASE WHEN`, age binning |
| 6 | Employment length and default rate by loan grade | `AVG`, correlation analysis |

---

## 📁 Files

| File | Description |
|---|---|
| `credit_risk_analysis.sql` | All 6 queries with objectives and comments |
| `credit_risk_dataset.csv` | Raw dataset from Kaggle |

> 🗒️ **Note:** Queries run on SQLite. Import the CSV into [sqliteonline.com](https://sqliteonline.com) using **First line** as column name setting before running the queries.

---

## 🛠️ Tools

SQL · SQLite · SQLiteOnline
