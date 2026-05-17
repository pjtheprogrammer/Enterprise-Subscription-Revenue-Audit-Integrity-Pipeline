SELECT * FROM Integrity_Check;

CREATE OR REPLACE VIEW revenue_inflation_audit AS
WITH dates_interval AS (
SELECT 
	subscription_id,
	start_date,
	end_date,
	EXTRACT(YEAR FROM AGE(CURRENT_DATE, end_date::date)) * 12
		+
	EXTRACT(MONTH FROM AGE(CURRENT_DATE, end_date::date)) AS months_since_last_payment
FROM integrity_check
WHERE is_trial = FALSE AND churn_flag = TRUE
)
SELECT
	i.subscription_id,
	i.account_id,
	i.start_date,
	i.end_date,
	i.plan_tier, 
	i.mrr_amount,
	d.months_since_last_payment
FROM integrity_check i
JOIN dates_interval d ON i.subscription_id = d.subscription_id
WHERE i.is_trial = FALSE AND i.churn_flag = TRUE;

CREATE OR REPLACE VIEW true_revenue_report AS
SELECT
	subscription_id,
	account_id,
	plan_tier,
	is_trial,
	auto_renew_flag,
	churn_flag,
	CASE
		WHEN churn_flag = TRUE THEN 0
		ELSE mrr_amount
	END AS true_monthly_revenue,
	CASE
		WHEN churn_flag = TRUE THEN 0
		ELSE arr_amount
	END AS true_annual_revenue
FROM integrity_check
