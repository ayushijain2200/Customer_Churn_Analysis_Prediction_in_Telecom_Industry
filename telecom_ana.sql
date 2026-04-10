--Total Number of Customers
SELECT COUNT(*) AS total_customers
FROM Telecom;


--Count of Customers Who Churned
SELECT COUNT(*) AS churned_customers
FROM Telecom
WHERE Churn = 1;


--Churn by Contract Type
SELECT Contract, COUNT(*) AS total_customers
FROM Telecom
GROUP BY Contract;


--Average Monthly Charges
SELECT churn, round(AVG(MonthlyCharges),2) AS average_monthly_charge
FROM Telecom group by churn;


--Churn by Internet Service
SELECT InternetService, COUNT(*) AS customers
FROM Telecom
GROUP BY InternetService;


--Customers with Highest Monthly Charges
SELECT top 10 customerID, round (MonthlyCharges,2) as monthly_charges
FROM Telecom
ORDER BY MonthlyCharges DESC;


--Tenure Analysis
SELECT 
    CASE 
        WHEN Tenure < 12 THEN '0-1 Year'
        WHEN Tenure BETWEEN 12 AND 24 THEN '1-2 Years'
        WHEN Tenure BETWEEN 24 AND 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END AS tenure_group,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn= 1 then 1 else 0 END) AS churned
FROM Telecom
GROUP BY 
CASE 
        WHEN Tenure < 12 THEN '0-1 Year'
        WHEN Tenure BETWEEN 12 AND 24 THEN '1-2 Years'
        WHEN Tenure BETWEEN 24 AND 48 THEN '2-4 Years'
        ELSE '4+ Years'
    END;



