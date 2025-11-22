-- D_17_P_2. Create a derived table of service statistics and query from it.

SELECT Service, Total_Admitted, Total_Refused, Avg_Satisfaction
FROM ( SELECT service,
        SUM(patients_admitted) AS Total_Admitted,
        SUM(patients_refused) AS Total_Refused,
        ROUND(AVG(patient_satisfaction), 2) AS Avg_Satisfaction
    FROM services_weekly
    GROUP BY service
) AS Service_Stats;
