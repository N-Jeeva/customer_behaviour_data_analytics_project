# CUSTOMER PURCHASING BEHAVIOUR DATA ANALYTICS PROJECT
      This project analyzes customer purchasing behavior using data from a CSV file. The process involves data cleaning and preprocessing using Python, data analysis and querying in MySQL, and interactive visualizations created in Power BI. The main goal is to uncover insights about customer segments, purchase patterns, and the relationship between shipping types, product categories, and buying frequency.

## TOOLS USED
    1. Python - for data cleaning and preparation
    2. MySQL - for data storage, querying, and analysis
    3. Power BI - for building dashboards and visualizing key insights

## PROJECT FLOW

  ### 1️. Data Collection
          Source data imported from a CSV file (e.g., customer_data.csv).

  ### 2️. Data Cleaning (Python)
          - Removed duplicates and null values.
          - Standardized column names and data types.
          - Handled missing or inconsistent entries.
          - Exported the cleaned data into a new file for database loading.
          
  ### 3. Data Analysis (MySQL)
          Loaded the cleaned dataset into a MySQL database. Created SQL queries to analyze:
          - It found the top spending age–gender groups and the best-performing categories by season.
          - The queries compared purchases with and without discounts, and across shipping types.
          - It analyzed subscribed vs non-subscribed customers, top discounted products, and customer segments (new, returning, loyal).
          - It also identified the top products, repeat buyer subscription trends, and purchase frequency by category and shipping type.
    
  ### 4. Data Visualization (Power BI)
          The dashboard includes the following visuals that highlight key insights:
          - Revenue by category to show which product categories generate the most income.
          - Previous purchases by status to understand how often customers return to buy again.
          - Consumers by subscription and discount to analyze how offers and subscriptions influence purchases.
          - Key metrics displaying total revenue, total purchases, total customers, and average order value for overall performance tracking.
