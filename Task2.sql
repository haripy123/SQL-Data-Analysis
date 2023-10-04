--How many females and how many male passengers traveled a minimum distance of 600 KMs?
SELECT * FROM passenger;
SELECT * FROM price;
SELECT gender,COUNT(*) FROM passenger 
  WHERE distance>=600 GROUP BY gender;
SELECT MIN(price) FROM price 
  WHERE bus_type='Sleeper';
SELECT * FROM passenger 
  WHERE passenger_name LIKE 'S%';
SELECT passenger_name,boarding_city,destination_city,pa.bus_type,price 
  FROM passenger pa
  JOIN price pr ON pa.distance=pr.distance AND pa.bus_type=pr.bus_type;
--Calculate price charged for each passenger displaying Passenger name, Boarding City, 
--Destination City, Bus_Type, Price in the output
SELECT passenger_name,boarding_city,destination_city,pa.bus_type,price 
  FROM passenger pa
  JOIN price pr ON pa.distance=pr.distance AND pa.bus_type=pr.bus_type
  WHERE pa.bus_type='Sitting' AND pa.distance>=1000;
--List the distances from the "Passenger" table which are unique (non-repeated distances) 
--in descending order.
SELECT bus_type,price FROM price 
  WHERE distance=(SELECT distance FROM passenger WHERE passenger_name='Pallavi');
--Display the passenger name and percentage of distance traveled by that passenger 
--from the total distance traveled by all passengers without using user variables
SELECT DISTINCT(distance) FROM passenger 
  ORDER BY distance DESC;
SELECT passenger_name,ROUND(distance/(SELECT SUM(distance) FROM passenger),2) as 'percent_distance' FROM passenger;
