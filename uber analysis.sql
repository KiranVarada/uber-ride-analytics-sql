CREATE DATABASE uber_analytics;
USE uber_analytics;
CREATE TABLE uber_bookings (
    booking_date DATE,
    booking_time TIME,
    booking_id VARCHAR(20),
    booking_status VARCHAR(50),
    customer_id VARCHAR(20),
    vehicle_type VARCHAR(30),
    pickup_location VARCHAR(100),
    drop_location VARCHAR(100),
    avg_vtat DECIMAL(5,2),
    avg_ctat DECIMAL(5,2),
    cancelled_rides_by_customer VARCHAR(10),
    reason_for_cancelling_by_customer VARCHAR(255),
    cancelled_rides_by_driver VARCHAR(10),
    driver_cancellation_reason VARCHAR(255),
    incomplete_rides VARCHAR(10),
    incomplete_rides_reason VARCHAR(255),
    booking_value DECIMAL(10,2),
    ride_distance DECIMAL(10,2),
    driver_ratings DECIMAL(3,2),
    customer_rating DECIMAL(3,2),
    payment_method VARCHAR(30)
);

#loading data using path

LOAD DATA LOCAL INFILE 'C:/Users/srini/OneDrive - St. Lawrence College/Desktop/uber data.csv'
INTO TABLE uber_bookings
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    @booking_date,
    @booking_time,
    booking_id,
    booking_status,
    customer_id,
    vehicle_type,
    pickup_location,
    drop_location,
    @avg_vtat,
    @avg_ctat,
    @cancelled_rides_by_customer,
    reason_for_cancelling_by_customer,
    @cancelled_rides_by_driver,
    driver_cancellation_reason,
    @incomplete_rides,
    incomplete_rides_reason,
    @booking_value,
    @ride_distance,
    @driver_ratings,
    @customer_rating,
    payment_method
)
SET
    booking_date = STR_TO_DATE(@booking_date, '%Y-%m-%d'),
    booking_time = @booking_time,
    avg_vtat = NULLIF(@avg_vtat, 'null'),
    avg_ctat = NULLIF(@avg_ctat, 'null'),
    cancelled_rides_by_customer = NULLIF(@cancelled_rides_by_customer, 'null'),
    cancelled_rides_by_driver = NULLIF(@cancelled_rides_by_driver, 'null'),
    incomplete_rides = NULLIF(@incomplete_rides, 'null'),
    booking_value = NULLIF(@booking_value, 'null'),
    ride_distance = NULLIF(@ride_distance, 'null'),
    driver_ratings = NULLIF(@driver_ratings, 'null'),
    customer_rating = NULLIF(@customer_rating, 'null');
    
#Total Records After Data Cleaning
#Purpose: Verify final row count after removing imported header row.   
    SELECT COUNT(*) AS total_rows
FROM uber_bookings;
#150000 rows


# Booking Status Distribution
#Purpose: Understand completed, cancelled, incomplete, and no-driver bookings.
SELECT 
    booking_status,
    COUNT(*) AS total_bookings,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM uber_bookings), 2) AS percentage
FROM uber_bookings
GROUP BY booking_status
ORDER BY total_bookings DESC;


# Completed Ride Revenue Summary
# Purpose: Calculate total revenue, average fare, highest fare, and lowest fare from completed rides.
SELECT
    ROUND(SUM(booking_value),2) AS total_revenue,
    ROUND(AVG(booking_value),2) AS avg_booking_value,
    MAX(booking_value) AS highest_booking,
    MIN(booking_value) AS lowest_booking
FROM uber_bookings
WHERE booking_status = 'Completed';



# Revenue by Vehicle Type
# Purpose: Identify which vehicle category generated the highest revenue.
SELECT
    vehicle_type,
    COUNT(*) AS completed_rides,
    ROUND(SUM(booking_value),2) AS total_revenue,
    ROUND(AVG(booking_value),2) AS avg_fare
FROM uber_bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY total_revenue DESC;


# Fare Range by Vehicle Type
# Purpose: Validate whether revenue differences are driven by fare value or ride volume.
SELECT
    vehicle_type,
    MIN(booking_value) AS min_fare,
    MAX(booking_value) AS max_fare,
    ROUND(AVG(booking_value),2) AS avg_fare
FROM uber_bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY avg_fare DESC;



# Completed Rides by Vehicle Type
# Purpose: Compare completed ride volume across vehicle categories.
SELECT
    vehicle_type,
    COUNT(*) AS rides
FROM uber_bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_type;



# Driver Cancellation Reasons
# Purpose: Identify the major reasons behind driver-side cancellations
SELECT
    driver_cancellation_reason,
    COUNT(*) AS cancellations
FROM uber_bookings
WHERE booking_status = 'Cancelled by Driver'
GROUP BY driver_cancellation_reason
ORDER BY cancellations DESC;



# Revenue by Payment Method
# Purpose: Understand customer payment preferences and revenue contribution by payment method.
SELECT
    payment_method,
    COUNT(*) AS rides,
    ROUND(SUM(booking_value),2) AS revenue
FROM uber_bookings
WHERE booking_status = 'Completed'
GROUP BY payment_method
ORDER BY revenue DESC;


#Top Pickup Locations
#Purpose: Identify locations with the highest booking demand.
SELECT
    pickup_location,
    COUNT(*) AS total_bookings
FROM uber_bookings
GROUP BY pickup_location
ORDER BY total_bookings DESC
LIMIT 10;



# Monthly Booking and Revenue Trend
# Purpose: Analyze monthly completed ride volume and revenue performance.
SELECT
    MONTH(booking_date) AS month_no,
    COUNT(*) AS bookings,
    ROUND(SUM(booking_value),2) AS revenue
FROM uber_bookings
WHERE booking_status = 'Completed'
GROUP BY MONTH(booking_date)
ORDER BY month_no;



# Customer and Driver Ratings by Vehicle Type
# Purpose: Compare customer satisfaction and driver rating trends across vehicle categories.
SELECT
    vehicle_type,
    ROUND(AVG(customer_rating),2) AS avg_customer_rating,
    ROUND(AVG(driver_ratings),2) AS avg_driver_rating
FROM uber_bookings
WHERE booking_status = 'Completed'
GROUP BY vehicle_type
ORDER BY avg_customer_rating DESC;


#end of queries