# E-Commerce Order Analysis Dashboard

## 1. Project Overview

This project explores e-commerce order activity using MySQL and Microsoft Excel.

The objective is to examine monthly order trends, understand order-status distribution, and identify data-quality issues that may affect the reliability of business reporting.

The project includes SQL queries, data-quality validation checks, and an Excel dashboard.

## 2. Tools Used

- **MySQL:** Data exploration, SQL queries, aggregations and validation checks.
- **MySQL Workbench:** SQL query execution and database analysis.
- **Microsoft Excel:** Dashboard development and visualization.
- **GitHub:** Project documentation and portfolio presentation.

## 3. Project Objectives

- Analyze monthly order trends.
- Examine order-status distribution.
- Count unique customers and orders.
- Identify inconsistencies in product ID relationships.
- Validate payment-type records.
- Present reliable findings through an Excel dashboard.

## 4. Dataset Overview

The analysis uses five database tables:

- `customers`
- `orders`
- `order_items`
- `products`
- `payments`

### Verified Dataset Metrics

| Metric | Result |
|---|---:|
| Unique Customers | 21,640 |
| Total Orders | 5,158 |
| Order Records | 5,158 |
| Order Items | 8,318 |
| Payment Records | 36,674 |
| Order Date Range | September 2016 – September 2018 |

These figures describe the available database tables. They should not be interpreted as evidence that all tables contain complete or mutually consistent records.

## 5. SQL Analysis

### Monthly Order Trend

Monthly order counts were calculated using the order purchase timestamp and distinct order IDs.

The analysis found that November 2017 recorded the highest monthly order volume, with 418 orders.

### Order Status Distribution

Order records were grouped by status to understand the distribution of delivered, shipped, invoiced, processing, unavailable and canceled orders.

Delivered orders represented the largest category.

### Average Order Value

An exploratory SQL query calculates average order value by first aggregating payment amounts at the order level.

However, payment-data inconsistencies were identified. Therefore, the calculated AOV is treated as provisional and excluded from the final dashboard.

## 6. Data Quality Validation

Data-quality checks were performed to identify inconsistencies affecting the reliability of the analysis.

### Product ID Matching

| Validation Metric | Result |
|---|---:|
| Total Order-Item Records | 8,318 |
| Matched Product Records | 39 |
| Unmatched Product Records | 8,279 |

The high number of unmatched product IDs indicates that product-category analysis cannot be considered reliable using the current database tables.

For this reason, product-category sales and revenue charts were excluded from the final dashboard.

### Payment Type Validation

| Validation Metric | Result |
|---|---:|
| Total Payment Records | 36,674 |
| Valid Payment Types | 32,246 |
| Blank Payment Types | 20 |
| Unexpected Payment Types | 4,408 |

Unexpected payment-type values were identified, including order-status labels and numeric values.

Payment-method distribution was excluded from the final dashboard because of these inconsistencies.

## 7. Excel Dashboard

The final Excel dashboard is titled **E-Commerce Order Analysis Dashboard**.

It includes:

**Key Performance Indicators**
- Total Customers: 21,640
- Total Orders: 5,158

**Visualizations**
- Monthly Orders Trend
- Order Status Distribution

**Key Insights**
1. The dataset contains 5,158 orders recorded between September 2016 and September 2018.
2. Monthly order volume peaked in November 2017, with 418 orders.
3. Delivered is the largest order-status category.

The dashboard focuses on verified order activity rather than presenting unreliable financial or product-level results.

## 8. Business Insights

- Monthly order volumes varied across the reporting period, with November 2017 showing the highest recorded activity.
- Delivered orders accounted for the largest share of order statuses.
- Product and payment data inconsistencies limit the reliability of certain sales and financial analyses.
- Data validation is necessary before using inconsistent datasets for business reporting.

## 9. Recommendations

- Investigate unmatched product IDs and verify product-master completeness.
- Review unexpected payment-type values against the original source records.
- Establish validation rules for product identifiers and payment categories.
- Reconcile order, product and payment tables before producing financial reports.
- Use verified metrics for dashboards and clearly disclose unresolved data-quality limitations.

## 10. Project Limitations

- Product ID mismatches prevent reliable product-category reporting.
- Payment-type anomalies reduce confidence in payment-related analysis.
- Revenue and average order value were excluded from the final dashboard because their reliability was not established.
- The analysis reflects the available imported dataset and does not establish the underlying cause of its inconsistencies.

## 11. AI Assistance Disclosure

This is a guided learning and portfolio project developed with assistance from ChatGPT.

AI assistance was used for SQL query guidance, debugging, validation approaches, interpretation and project documentation.

The project demonstrates practical exposure to SQL-based analysis, Excel reporting and data-quality investigation. It does not represent independent production-level database work.

## 12. Repository Files

- `Ecommerce_SQL_Analysis_Script.sql` — SQL queries and validation checks.
- `Ecommerce_SQL_Analysis_Dashboard.xlsx` — Excel dashboard and supporting worksheets.
- `dashboard_preview.jpg` — Dashboard screenshot.
- `README.md` — Project documentation.

## 13. Conclusion

This project demonstrates the use of MySQL and Excel to examine e-commerce order activity and investigate data-quality issues.

A key learning outcome was recognizing that reliable reporting requires validating source data before presenting business conclusions.
