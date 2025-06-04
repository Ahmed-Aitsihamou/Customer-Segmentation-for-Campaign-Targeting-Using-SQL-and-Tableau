/*============================================================
 🧠 RFM Segmentation Query for Customer Targeting – OJAR Perfume
 Author: Ahmed Ait Si Hamou
 Role: Data Analyst
 Purpose: Segment customers using Recency, Frequency, and Monetary values
============================================================*/

/*------------------------------------------------------------
 Step 1: Create Final Table for RFM Segmentation Results
------------------------------------------------------------*/
CREATE TABLE RFM_Segment_Data (
	customer_id VARCHAR(50),
	recency INT,
	frequency INT,
	monetary FLOAT,
	R_score INT,
	F_score INT,
	M_score INT,
	rfm_score INT,
	segment VARCHAR(50)
);


/*------------------------------------------------------------
 Step 2: Insert RFM Scores and Segment Labels into Final Table
------------------------------------------------------------*/
INSERT INTO RFM_Segment_Data
SELECT 
	customer_id,
	recency,
	frequency,
	monetary,
	R_score,
	F_score,
	M_score,

	-- Generate Composite RFM Score (e.g., 555, 423)
	CAST(R_score AS VARCHAR) + CAST(F_score AS VARCHAR) + CAST(M_score AS VARCHAR) AS rfm_score,

	-- Assign Customer Segment Based on RFM Pattern
	CASE
		WHEN R_score = 5 AND F_score = 5 AND M_score = 5 THEN 'Champions'
		WHEN R_score >= 4 AND F_score >= 4 THEN 'Loyal Customers'
		WHEN R_score = 5 AND F_score <= 2 THEN 'New Customers'
		WHEN R_score <= 2 AND F_score >= 4 THEN 'At Risk'
		WHEN M_score = 5 THEN 'Big Spenders'
		ELSE 'Others'
	END AS segment

FROM (
	SELECT
		customer_id,

		-- 🟢 Recency: Days since last purchase (lower is better)
		DATEDIFF(DAY, MAX(transaction_date), '2024-06-01') AS recency,

		-- 🔵 Frequency: Number of transactions
		COUNT(transaction_id) AS frequency,

		-- 🟣 Monetary: Total spend
		ROUND(SUM(amount), 2) AS monetary,

		-- 🧮 Create RFM Score Buckets using NTILE (1 = lowest, 5 = best)
		NTILE(5) OVER (ORDER BY DATEDIFF(DAY, MAX(transaction_date), '2024-06-01') DESC) AS R_score,
		NTILE(5) OVER (ORDER BY COUNT(transaction_id) ASC) AS F_score,
		NTILE(5) OVER (ORDER BY ROUND(SUM(amount), 2) ASC) AS M_score

	FROM Transactions_Data
	GROUP BY customer_id
) AS Ranked
ORDER BY customer_id;


/*------------------------------------------------------------
 Step 3: Segment Distribution – Count and Percentage
------------------------------------------------------------*/
SELECT
	segment,
	COUNT(customer_id) AS customer_count,
	ROUND(
		CAST(COUNT(customer_id) AS FLOAT) / 
		(SELECT COUNT(customer_id) FROM RFM_Segment_Data) * 100, 2
	) AS Percentage
FROM RFM_Segment_Data
GROUP BY segment
ORDER BY customer_count DESC;


/*------------------------------------------------------------
 Step 4: Segment Profiling – Average RFM Metrics per Segment
------------------------------------------------------------*/
SELECT 
	segment,
	ROUND(AVG(CAST(recency AS FLOAT)), 2) AS Avg_Recency,
	ROUND(AVG(CAST(frequency AS FLOAT)), 2) AS Avg_Frequency,
	ROUND(AVG(CAST(monetary AS FLOAT)), 2) AS Avg_Monetary
FROM RFM_Segment_Data
GROUP BY segment
ORDER BY Avg_Monetary DESC;


/*------------------------------------------------------------
 Step 5: Merge RFM Segments with Customer Demographics
------------------------------------------------------------*/
SELECT 
	C.customer_id,
	C.name,
	CASE
		WHEN C.gender = 'M' THEN 'Male'
		WHEN C.gender = 'F' THEN 'Female'
	END AS gender,
	C.birth_date,
	DATEDIFF(YEAR, C.birth_date, '2024-06-01') AS age,
	C.country,
	C.signup_date,
	RFM.recency,
	RFM.frequency,
	RFM.monetary,
	RFM.R_score,
	RFM.F_score,
	RFM.M_score,
	RFM.rfm_score,
	RFM.segment
FROM Customers_Data AS C
LEFT JOIN RFM_Segment_Data AS RFM
	ON C.customer_id = RFM.customer_id;
