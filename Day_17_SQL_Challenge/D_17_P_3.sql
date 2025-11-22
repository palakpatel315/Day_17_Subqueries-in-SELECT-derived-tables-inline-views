-- D_17_P_3. Display staff with their service's total patient count as a calculated field.

SELECT s.staff_id, s.staff_name, s.role, s.service,
    ( SELECT COUNT(p.patient_id) FROM patients p
        WHERE p.service = s.service
    ) AS Total_Patients
FROM staff s;
