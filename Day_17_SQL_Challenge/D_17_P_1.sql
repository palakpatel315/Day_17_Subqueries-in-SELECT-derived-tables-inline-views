-- D_17_P_1. Show each patient with their service's average satisfaction as an additional column.

SELECT p.patient_id, p.name, p.service, p.satisfaction,
  (SELECT ROUND(AVG(satisfaction), 2) 
           FROM patients p2
        WHERE p2.service = p.service) AS Avg_Satisfaction 
FROM patients p;           