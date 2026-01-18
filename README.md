HR Analytics Project (SQL & Power BI)

Project Overview
This project demonstrates an end-to-end HR Analytics solution using PostgreSQL for data analysis and Power BI for data visualization. 
The goal is to analyze employee data to understand attrition trends, workforce demographics, job satisfaction, and departmental performance, helping organizations make informed HR decisions.

Tools & Technologies
- Database: PostgreSQL (PgAdmin)
- Query Language: SQL
- Visualization Tool: Power BI
- Data Format: CSV

Repository Structure
- HR_Analytics_Data.csv – Dataset used for analysis
- HR_Analytics_Queries.sql – SQL queries for analysis
- HR_Analytics_Dashboard.pbix – Power BI dashboard
- Dashboard_Background.png – Dashboard background
- README.docx – Project documentation

Database Setup
1. Create a new database named “HR Analytics” in PgAdmin.
2. Create the hrdata table using the provided SQL script.
3. Verify table creation using SELECT queries.
4. Import the CSV data into the table.

Key Analysis Performed
- Employee count analysis by department, education, and age group
- Attrition analysis and attrition rate calculations
- Department-wise and gender-wise attrition insights
- Active employee calculation
- Average age calculation
- Job satisfaction rating matrix

Power BI Dashboard
The Power BI dashboard provides interactive visualizations including attrition trends, demographic breakdowns, job satisfaction metrics, 
and department-level insights. Filters allow users to explore data dynamically.

Key Insights
- Identification of high-attrition departments
- Relationship between education, age, and attrition
- Gender-based attrition trends
- Job roles with lower satisfaction scores

How to Use
1. Load the CSV data into PostgreSQL.
2. Execute SQL queries from the queries file.
3. Open the Power BI dashboard to explore insights.

Future Enhancements
- Predictive attrition modeling
- Advanced DAX measures
- Time-based trend analysis
