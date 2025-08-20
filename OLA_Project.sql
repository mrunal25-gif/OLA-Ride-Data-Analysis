Create database OLA;
use OLA;


#1. Retrieve all successful bookings:
Create view successful_bookings as 
select * from Bookings
where Booking_Status = 'Success';

select * from successful_bookings;



#2. Find the average ride distance for each vehicle type:
Create view ride_distance_for_each_vehicle as
select Vehicle_Type, avg(Ride_Distance)
as Avg_Distance from Bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;



#3. Get the total number of cancelled rides by customers:
Create view canceled_rides_by_customers as
select count(*) from Bookings
where Booking_Status = 'Canceled by Customer';

select * from canceled_rides_by_customers;



#4. List the top 5 customers who booked the highest number of rides:
Create view booked_the_highest_number_of_rides as
select Customer_ID, COUNT(Booking_ID) as Total_Rides
from Bookings
group by Customer_ID
order by Total_Rides desc limit 5;

select * from booked_the_highest_number_of_rides;



#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
Create view rides_cancelled_by_drivers as
select count(*) from Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from rides_cancelled_by_drivers;



#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create view maxi_and_min_driver_ratings_for_PS as
select max(Driver_Ratings) as max_ratings,
min(Driver_Ratings) as min_ratings
from Bookings where Vehicle_Type = 'Prime Sedan';

select * from maxi_and_min_driver_ratings_for_PS;



#7. Retrieve all rides where payment was made using UPI:
Create view rides_with_payment_method_UPI as 
select * from Bookings where Payment_Method = 'UPI';

select * from rides_with_payment_method_UPI;



#8. Find the average customer rating per vehicle type:
create view average_cust_rating_per_vehicle_type as
select Vehicle_Type, avg(Customer_Rating) as 'Avg_Customer_Rating' from bookings 
group by Vehicle_Type;

select * from average_cust_rating_per_vehicle_type;



#9. Calculate the total booking value of rides completed successfully:
Create view total_successful_value_of_rides as
select sum(Booking_Value) as Total_Successful_Value from Bookings
where Booking_Status = 'Success';

select * from total_successful_value_of_rides;



#10. List all incomplete rides along with the reason:
Create view incomplete_rides_with_reason as
select Booking_ID, Incomplete_Rides_Reason from Bookings Where Incomplete_Rides = 'Yes';

select * from incomplete_rides_with_reason;


