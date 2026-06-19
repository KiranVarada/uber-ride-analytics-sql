# Uber Ride Analytics Using SQL

## Project Overview

This project analyzes 150,000 Uber ride bookings using MySQL to uncover operational, financial, and customer behavior insights. The analysis focuses on ride completion rates, cancellations, revenue performance, vehicle utilization, payment preferences, customer satisfaction, and booking trends.

The objective was to demonstrate practical SQL skills, data cleaning techniques, and business-oriented analytical thinking through real-world ride-sharing data.

---

## Tools Used

* MySQL
* SQL
* Data Cleaning
* Business Analytics
* Data Analysis

---

## Dataset Overview

The dataset contains 150,000 ride booking records with information including:

* Booking Date & Time
* Booking Status
* Customer ID
* Vehicle Type
* Pickup & Drop Locations
* Booking Value
* Ride Distance
* Customer Ratings
* Driver Ratings
* Payment Methods
* Cancellation Reasons

---

## Data Preparation

Before analysis, the dataset was prepared by:

* Importing CSV data into MySQL
* Creating appropriate data types
* Handling NULL values
* Removing import-related header records
* Validating row counts and data quality
* Organizing data for analysis

---

## Analysis Performed

### Booking Status Analysis

* Ride completion rate
* Cancellation rate
* No-driver-found analysis
* Incomplete ride analysis

### Revenue Analysis

* Total revenue generated
* Average booking value
* Highest and lowest booking value

### Vehicle Performance Analysis

* Revenue by vehicle type
* Completed rides by vehicle category
* Fare comparison across vehicle types

### Cancellation Analysis

* Driver cancellation reasons
* Operational performance evaluation

### Payment Analysis

* Revenue by payment method
* Customer payment preferences

### Location Analysis

* Top pickup locations
* Booking demand patterns

### Monthly Trend Analysis

* Monthly completed rides
* Monthly revenue performance

### Customer Satisfaction Analysis

* Customer ratings by vehicle type
* Driver ratings by vehicle type

---

## Key Findings

### Operational Insights

* Total Bookings Analyzed: 150,000
* Completed Rides: 93,000 (62%)
* Unsuccessful Rides: 57,000 (38%)

Driver-side cancellations represented the largest share of unsuccessful bookings.
<img width="420" height="165" alt="total bookings" src="https://github.com/user-attachments/assets/dff0c51d-a3e9-479a-bd5e-3c4b2ad5faf7" />

### Revenue Insights

* Total Revenue: ₹47.26 Million
* Average Booking Value: ₹508
* Highest Booking Value: ₹4,277

### Vehicle Insights

* Auto generated the highest revenue.
* Revenue differences were primarily driven by booking volume rather than fare variation.
<img width="447" height="137" alt="revenue by vehicle" src="https://github.com/user-attachments/assets/6046a1b9-2322-4be9-a6be-fff5ae885c15" />

### Payment Insights

* UPI was the most preferred payment method.
* UPI generated approximately ₹21.27 Million in revenue.
* Digital payments dominated overall transactions.
<img width="317" height="137" alt="payment method analysis" src="https://github.com/user-attachments/assets/5cff5ee2-0651-4dc3-a11a-d9da6943e3d7" />

### Customer Satisfaction

* Customer ratings remained consistently high across all vehicle categories.
* Average customer rating was approximately 4.4/5.

---

## Business Recommendations

* Reduce driver-side cancellations through improved driver engagement and operational support.
* Increase driver availability in areas with frequent "No Driver Found" incidents.
* Promote digital payment adoption through targeted incentives.
* Monitor ride completion rates as a primary operational KPI.
* Focus on high-demand pickup locations to improve service efficiency.

---

## Skills Demonstrated

* SQL Querying
* Data Cleaning
* Data Validation
* Aggregation Functions
* Group By Analysis
* Business Intelligence
* Revenue Analysis
* Customer Analytics
* Operational Analytics
* Data-Driven Decision Making

---

## Project Outcome

This project demonstrates how SQL can be used to transform raw ride-booking data into meaningful business insights that support operational improvements, revenue optimization, and customer experience enhancement.
