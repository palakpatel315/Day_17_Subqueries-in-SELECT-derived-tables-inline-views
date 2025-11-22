
# 📘 21 Days SQL Challenge – Day 17
### **Topic:** Subqueries in SELECT & FROM (Derived Tables)

---

## 🎯 Objective

Day 17 focused on using subqueries inside the SELECT and FROM clauses.
The goal was to learn how to create calculated columns and temporary derived tables that make complex logic easier to manage.

---

## 🧠 Key Learnings

- Subqueries in 'SELECT' help create dynamic calculated fields

- Subqueries in 'FROM' act like inline tables for multi-step logic

- Derived tables always need an alias

- 'SELECT' subqueries must return a single value

- Subqueries help compare service-level metrics with overall averages
--- 

## 🧩 Daily Challenge
### **Question:**
Create a report showing each service with:
'service name'
'total patients admitted'
'difference from overall average'
**a rank indicator: Above Average / Average / Below Average
Order by total patients admitted descending.**
---

### ✅ **SQL Query Used**

```sql
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
```

## 📸 **SQL Queries**

![Check_SQL Query File](https://github.com/palakpatel315/Day_17_Subqueries-in-SELECT-derived-tables-inline-views/tree/main/Day_17_SQL_Challenge)


---
Thank you [Indian Data Club](https://www.linkedin.com/company/indian-data-club/posts/?feedView=all) for starting this challenge and [DPDzero](https://www.linkedin.com/company/dpdzero/) the title sponsor of this challenge

---

## 👩‍💻 **About Me**
**Palak Patel**  
*Aspiring Data Analyst | Skilled in SQL, Power BI, Excel*  
📍 Passionate about turning data into insights and solving real-world business problems.  

🔗 [Connect with me on LinkedIn](https://www.linkedin.com/in/palak-patel-0711242a0/)

---
