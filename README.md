# sql-challenge
This repository contains challenge files for UT DAV Bootcamp Module 9 SQL

# File Notes
* EmployeeSQL folder contains all the files required to complete the challenge as indicated by the Instructions below.
   * data folder contains all the csv files downloaded from BCS/Canvas that were imported into the SQL tables
      **Note** Some employees.first_names were "TRUE" but the instructions did not address this oddity; TA advised to treat these as a name.
   * resources folder contains all the schema files created in the QuickDBD tool linked in the references:
      * SchemaDiagram_QuickDBD.png is a picture of the ERD created in Quick DBD for the tables created in this challenge (Create an image file of your ERD.)
      * Schema_QuickDBD.pdf is the pdf of the text input to the QuickDBD tool to create the ERD
      * Schema_QuickDBD.sql is the file used to create each table within PostgreSQL (Create a .sql file of your table schemata.)
   * ChallengeSolutions.sql contains queries to view the tables after importing the csv files as well as the data analysis requested within the instructions (Create a .sql file of your queries.)
* Starter_Code folder contains the files provided in BCS/Canvas for completing the challenge.
   


# References
The following references were used in creating the solution within the PyCitySchools folder:
 * http://www.quickdatabasediagrams.com/ was used to create the ERD as well as SQL file to be used in PostgreSQL

# Instructions

**Data Modeling**
Inspect the CSV files, and then sketch an Entity Relationship Diagram of the tables. To create the sketch, feel free to use a tool like QuickDBD (linked in references) to an external site.

**Data Engineering**
1. Use the provided information to create a table schema for each of the six CSV files. Be sure to do the following:
   * Remember to specify the data types, primary keys, foreign keys, and other constraints.
   * For the primary keys, verify that the column is unique. Otherwise, create a composite keyLinks to an external site., which takes two primary keys to uniquely identify a row.
   * Be sure to create the tables in the correct order to handle the foreign keys.
2. Import each CSV file into its corresponding SQL table.

**Data Analysis**
1. List the employee number, last name, first name, sex, and salary of each employee.
2. List the first name, last name, and hire date for the employees who were hired in 1986.
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
6. List each employee in the Sales department, including their employee number, last name, and first name.
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).