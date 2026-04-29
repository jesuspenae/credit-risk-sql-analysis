-- ============================================================
-- Credit Risk Analysis — SQL
-- Dataset: Credit Risk Dataset (32,581 records · 12 columns)
-- Tool: SQLite
-- Author: Jesús Peña
-- ============================================================

-- ------------------------------------------------------------
-- Query 1: Default rate by loan intent
-- Objective: Identify which loan purposes carry the highest
--            risk of default.
-- ------------------------------------------------------------
SELECT 
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate_pct
FROM credit_risk
GROUP BY loan_intent
ORDER BY default_rate_pct DESC;

-- ------------------------------------------------------------
-- Query 2: Default rate and average interest rate by loan grade
-- Objective: Analyze how credit grade correlates with default
--            risk and the interest rate charged by lenders.
-- ------------------------------------------------------------
SELECT 
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(loan_status) AS total_defaults,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate_pct,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade ASC;

-- ------------------------------------------------------------
-- Query 3: Average income, loan amount and debt burden
--          by home ownership type
-- Objective: Compare financial profiles across home ownership
--            categories and assess relative loan burden.
-- ------------------------------------------------------------
SELECT 
    person_home_owne,
    COUNT(*) AS total_applicants,
    ROUND(AVG(person_income), 2) AS avg_income,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(loan_amnt) / AVG(person_income) * 100, 2) AS loan_to_income_pct
FROM credit_risk
GROUP BY person_home_owne
ORDER BY avg_income DESC;

-- ------------------------------------------------------------
-- Query 4: Interest rate and loan amount by grade and
--          default status
-- Objective: Determine whether interest rates and loan amounts
--            differ between defaulters and non-defaulters
--            within the same credit grade.
-- ------------------------------------------------------------
SELECT 
    loan_grade,
    CASE WHEN loan_status = 1 THEN 'Default' ELSE 'No Default' END AS status,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM credit_risk
GROUP BY loan_grade, loan_status
ORDER BY loan_grade ASC, loan_status DESC;

-- ------------------------------------------------------------
-- Query 5: Risk segmentation by age group
-- Objective: Segment applicants by age group to identify
--            which demographic carries the highest default risk.
-- ------------------------------------------------------------
SELECT 
    CASE 
        WHEN person_age < 25 THEN 'Under 25'
        WHEN person_age BETWEEN 25 AND 35 THEN '25-35'
        WHEN person_age BETWEEN 36 AND 50 THEN '36-50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(*) AS total_applicants,
    ROUND(AVG(person_income), 2) AS avg_income,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate_pct
FROM credit_risk
GROUP BY age_group
ORDER BY default_rate_pct DESC;

-- ------------------------------------------------------------
-- Query 6: Employment length and default rate by loan grade
-- Objective: Test whether employment stability (years employed)
--            correlates with lower default rates across grades.
-- ------------------------------------------------------------
SELECT 
    loan_grade,
    ROUND(AVG(person_emp_lengt), 1) AS avg_emp_years,
    ROUND(AVG(person_income), 2) AS avg_income,
    ROUND(100.0 * SUM(loan_status) / COUNT(*), 2) AS default_rate_pct
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade ASC;
