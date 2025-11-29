<p align="center">
  <img src="images/true_north_pizzeria_logo.png" width="300">
</p>

# True North Pizzeria Sales Analysis

Sales performance analysis for one year of pizza orders at True North Pizzeria, delivered as a stakeholder ready Power BI dashboard with supporting SQL validation.

## Project Overview

True North Pizzeria completed a full year of operations and wants to understand its sales performance across categories, sizes, products, and time periods. This project analyzes one year of transactional pizza order data to identify performance trends, evaluate menu items, and support data driven decisions in marketing, inventory planning, and daily operations.

The project delivers:
- A stakeholder ready Power BI dashboard summarizing sales performance
- SQL based KPI validation for accuracy and transparency
- Insights on category share, size performance, and product level trends
- Recommendations to guide menu optimization and operational planning

## Data Structure Overview

The analysis is based on a single clean transactional table containing one row per pizza item sold.  
Key fields include order identifiers, timestamps, pizza attributes, pricing, and quantity.

Below is the schema overview for the dataset:

<p align="center">
  <img src="images/schema_overview.png" width="250">
</p>

## Executive Summary

Across one year of operations, True North Pizzeria generated approximately **CAD 818K** in revenue from **21K** orders and **49K** pizzas sold. Customers typically spend about **CAD 38** per order and purchase around **2.3** pizzas per transaction, with order volume peaking on **Fridays** and remaining high on **Thursdays** and **Saturdays**, while **Sunday** experiences the lowest demand. Monthly trends show clear spikes in **July** and **January**.

**Classic** pizzas are the strongest performing category, and **Large** pizzas drive the highest share of revenue, indicating a clear customer preference for larger, classic style options. At the individual product level, pizzas such as **The Thai Chicken Pizza** and **The Classic Deluxe Pizza** consistently appear among the top sellers, while items like **The Brie Carre Pizza** underperform across revenue, quantity, and order counts.

These patterns highlight an opportunity to double down on high performing categories and sizes while reevaluating weaker items to improve overall menu efficiency and profitability.

<p align="center">
  <img src="images/dashboard_home.png" width="700">
</p>

<p align="center"><em>Main sales performance dashboard in Power BI</em></p>

## Insights Deep Dive
### Sales Trends Over Time

**Daily Patterns:**  
Order volume is highest on **Fridays**, reaching approximately **3.5K orders**. Thursdays and Saturdays follow with around **3.2K orders**. Midweek demand remains steady on Tuesdays and Wednesdays, while **Sunday** is the slowest day with about **2.6K orders**. This pattern suggests stronger customer activity near the end of the workweek.

**Monthly Patterns:**  
Sales peak during **July** and **January**, each generating around **1.9K orders**. Other months, such as March, April, and August, show stable performance at roughly **1.8K orders**. February and December see lower volume, with **1.6K** orders. These trends indicate seasonal fluctuations, likely influenced by holidays and customer behavior.

### Category and Size Performance

**Category Contribution:**  
Classic pizzas generate the highest share of total revenue at **26.9%**, followed closely by Supreme at **25.5%**, Chicken at **24.0%**, and Veggie at **23.7%**. The distribution is relatively balanced, but Classic pizzas maintain a clear lead, indicating strong customer preference for traditional flavors.

**Size Contribution:**  
Large pizzas are the strongest revenue driver, contributing **45.9%** of total sales. Medium sizes follow at **30.5%**, and Regular sizes contribute **21.8%**. X-Large and XX-Large sizes account for only **1.7%** and **0.1%**, showing minimal demand. The dominance of Large pizzas highlights a strong preference for larger portions and greater value items.

### Product Level Performance

<p align="center">
  <img src="images/dashboard_best_worst.png" width="700">
</p>

<p align="center"><em>Top and bottom pizza performers by revenue, quantity, and orders</em></p>


**Top Performing Pizzas:**  
Across revenue, quantity, and order counts, several pizzas consistently appear among the strongest performers.  
- **The Thai Chicken Pizza** generates the highest total revenue at **CAD 43.4K**.  
- **The Classic Deluxe Pizza** leads in total quantity sold with **2.45K pizzas** and also ranks highly in total orders.  
- Other strong contributors include **The Barbecue Chicken Pizza**, **The California Chicken Pizza**, and **The Spicy Italian Pizza**.

These products form the core of True North Pizzeria’s menu performance and should remain central to marketing and promotion strategy.

**Underperforming Pizzas:**  
Several pizzas show consistently low sales across all major KPIs.  
- **The Brie Carre Pizza** is the lowest performer in revenue (**CAD 11.6K**), quantity (**490 sold**), and total orders (**480 orders**).  
- Other weak performers include **The Mediterranean Pizza**, **The Spinach Supreme Pizza**, **The Calabrese Pizza**, and **The Chicken Pesto Pizza**.

These items may require targeted promotions, recipe changes, or removal from the menu to improve overall portfolio efficiency.

## Recommendations

- Strengthen promotions around **Classic** pizzas and **Large** sizes, which are the strongest contributors to revenue and order volume.
- Introduce targeted marketing or limited time offers to boost visibility of weaker products, especially **The Brie Carre Pizza** and other consistently low performers.
- Review menu design and ingredient cost structure to determine whether certain underperforming items should be updated or removed.
- Increase staffing and inventory levels on **Fridays**, **Thursdays**, and **Saturdays**, when order volume is highest.
- Use the dashboard for ongoing weekly monitoring of KPIs to quickly identify emerging trends or performance shifts.

## Technical Implementation

### Data Source and Storage
- The raw data file **pizza_sales_raw.csv** was imported into **SQL Server** using the flat file import wizard.
- A single clean table named **pizza_sales** was created, containing one row per pizza item sold.

### SQL Validation
- All key KPIs (revenue, orders, quantity, AOV, average pizzas per order) were calculated in SQL to ensure accuracy.
- Additional SQL queries were used to analyze:
  - Daily and monthly order patterns  
  - Category and size revenue contribution  
  - Top and bottom five pizzas by revenue, quantity, and order count  
- The complete SQL script is stored in **sql/pizza_sales_queries.sql**.

### Power Query Data Preparation
- Connected Power BI directly to the SQL Server database.
- Cleaned and enriched the dataset by:
  - Replacing abbreviated pizza sizes (S, M, L, XL, XXL) with full names  
  - Creating **Day Name** and **Month Name** columns  
  - Adding short codes (SUN, MON, JAN, FEB, etc.) for chart ordering  
  - Adding conditional columns to enforce weekday and month sorting  

### DAX Measures
Created the core DAX measures used across all visuals:
- **Total Revenue** = SUM(pizza_sales[total_price])   
- **Total Orders** = DISTINCTCOUNT(pizza_sales[order_id])   
- **Avg Order Value** = [Total Revenue] / [Total Orders] 
- **Total Pizzas Sold** = SUM(pizza_sales[quantity])   
- **Avg Pizzas Per Order** = [Total Pizzas Sold] / [Total Orders]

### Power BI Dashboard Design
- Developed two fully interactive pages:
  - **Home Page** showing KPIs, daily trend, monthly trend, category share, and size share  
  - **Best and Worst Sellers Page** highlighting top and bottom products across revenue, quantity, and orders  
- Added slicers for **pizza category** and **date range**.
- Included navigation buttons, text summaries, and clean visual formatting for stakeholder readability.

## Caveats and Assumptions

- The dataset covers **one year** of sales only, so trends should not be interpreted as long-term patterns.
- The data is at the **item level**, with no customer-level information, limiting analysis of customer behavior or repeat ordering.
- No promotional, marketing, or pricing event data is included, so seasonal variations are assumed rather than explicitly confirmed.
- Order timestamps reflect only completed transactions; canceled or modified orders are not represented.
- Ingredient cost data is not available, so profitability analysis is outside the scope of this project.

## Repository Structure

```
├── data
│   └── pizza_sales_raw.csv
├── sql
│   └── pizza_sales_queries.sql
├── docs
│   ├── pizza_sales_business_requirements.md
│   └── pizza_sales_sql_validation_report.docx
├── powerbi
│   └── pizza_sales_dashboard.pbix
├── images
│   ├── true_north_pizzeria_logo.png
│   ├── schema_overview.png
│   ├── dashboard_home.png
│   └── dashboard_best_worst.png
└── README.md
```
