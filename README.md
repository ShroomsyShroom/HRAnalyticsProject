<H1>HR Analytics Project (SQL & Power BI)</H1>

Project Overview
This project demonstrates an end-to-end HR Analytics solution using PostgreSQL for data analysis and Power BI for data visualization. 
The goal is to analyze employee data to understand attrition trends, workforce demographics, job satisfaction, and departmental performance, helping organizations make informed HR decisions.

<H2>Tools & Technologies</H2>
- Database: PostgreSQL (PgAdmin)
- Query Language: SQL
- Visualization Tool: Power BI
- Data Format: CSV

<H2>Repository Structure</H2>
- hrdata.csv – Dataset used for analysis
- Project_10_Queries.sql – SQL queries for analysis
- HR Dshbrd.pbix – Power BI dashboard
- Bg.avif – Dashboard background
- README.docx – Project documentation

<H2>Database Setup</H2>
1. Create a new database named “HR Analytics” in PgAdmin.
2. Create the hrdata table using the provided SQL script.
3. Verify table creation using SELECT queries.
4. Import the CSV data into the table.

<H2>Key Analysis Performed</H2>
- Employee count analysis by department, education, and age group
- Attrition analysis and attrition rate calculations
- Department-wise and gender-wise attrition insights
- Active employee calculation
- Average age calculation
- Job satisfaction rating matrix

<H2>Power BI Dashboard</H2>
The Power BI dashboard provides interactive visualizations including attrition trends, demographic breakdowns, job satisfaction metrics, 
and department-level insights. Filters allow users to explore data dynamically.

<H2>Key Insights</H2>
- Identification of high-attrition departments
- Relationship between education, age, and attrition
- Gender-based attrition trends
- Job roles with lower satisfaction scores

<H2>How to Use</H2>
1. Load the CSV data into PostgreSQL.
2. Execute SQL queries from the queries file.
3. Open the Power BI dashboard to explore insights.

<H2>Future Enhancements</H2>H2>
- Predictive attrition modeling
- Time-based trend analysis
