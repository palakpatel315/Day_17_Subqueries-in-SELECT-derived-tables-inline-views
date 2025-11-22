-- D_17_Challenge_Question: Create a report showing each service with: service name, total patients admitted, 
-- the difference between their total admissions and the average admissions across all services, and a rank indicator 
-- ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.

SELECT t.service, t.Total_Patients_Admitted, ROUND(Total_Patients_Admitted - Overall_Avg) AS Admission_Diff,
CASE WHEN Total_Patients_Admitted > Overall_Avg THEN 'Above Average'
     WHEN Total_Patients_Admitted = Overall_Avg THEN 'Average'
     ELSE 'Below Average' END AS Rank_Indicator
     
FROM (SELECT service, SUM(patients_admitted) AS Total_Patients_Admitted
	  FROM services_weekly GROUP BY service) AS t
CROSS JOIN ( SELECT AVG(service_total) AS Overall_Avg
    FROM ( SELECT SUM(patients_admitted) AS service_total
        FROM services_weekly
        GROUP BY service ) x
) AS a
ORDER BY Total_Patients_Admitted DESC;