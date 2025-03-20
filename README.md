This repository contains an end-to-end SQL project focused on analyzing pizza sales data. The project demonstrates how to create an SQL database, import data, and perform various data analysis tasks using SQL queries.
## Project Description
The goal of this project is to showcase SQL skills by analyzing a dataset related to pizza sales. The project covers:
- Creating a database
- Importing CSV files into SQL
- Writing basic to advanced SQL queries
- Generating insights from the data

## Data Sources
The dataset used in this project includes the following CSV files:
1. **Orders** - Contains order details.
2. **Pizza Types** - Lists different types of pizzas.
3. **Pizzas** - Contains information about each pizza.
4. **Order Details** - Provides details about each order including quantities.

You can find the dataset in the repository.

## Setup Instructions
To set up the project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/pizza-sales-sql.git
   cd pizza-sales-sql
Install MySQL: Ensure you have MySQL installed on your machine. You can download it from MySQL's official website.
Create a Database: Open MySQL Workbench or your preferred SQL client and run the following command to create a new database:
```sql
CREATE DATABASE pizza_sales;
```
Import Data: Use the MySQL Workbench Data Import Wizard to import the CSV files into the corresponding tables in your database.
SQL Queries
The project includes several SQL queries that perform various analyses, including:
Retrieving total number of orders
Calculating total revenue from pizza sales
Identifying the most ordered pizza types
Analyzing order distribution by hour of the day
Example Queries
Here are a few example queries from the project:
Total Number of Orders:
```sql
SELECT COUNT(order_id) AS total_orders FROM orders;

Total Revenue:
sql
SELECT SUM(p.price * od.quantity) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

Most Ordered Pizza Types:
sql
SELECT pt.name, SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_quantity DESC
LIMIT 5;
```
Key Features
Comprehensive SQL project covering basic to advanced queries.
Practical examples of data analysis using SQL.
Ability to showcase SQL skills through a real-world dataset.



































   
