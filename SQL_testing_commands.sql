SELECT * FROM ACTIVITY;
SELECT * FROM CUSTOMER;
SELECT * FROM EMPLOYEE;
SELECT * FROM HOTEL;
SELECT * FROM LIST;
SELECT * FROM THEATER;
SELECT * FROM RENTALCAR;
SELECT * FROM HOTEL WHERE HOTEL_CURRCAPACITY < HOTEL_MAXCAPACITY;
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEE;
SELECT AVG(RESTAURANT_RATING) FROM RESTAURANT;
SELECT 
EMPLOYEE.EMPLOYEE_ID, 
EMPLOYEE_FNAME, 
EMPLOYEE_LNAME, 
COUNT(CUST.EMPLOYEE_ID) AS “TOTAL CUSTOMERS”
FROM EMPLOYEE, CUSTOMER
WHERE CUSTOMER.EMPLOYEE_ID = EMPLOYEE.EMPLOYEE_ID
GROUP BY CUSTOMER.EMPLOYEE_ID;
SELECT 
    CUSTOMER.CUST_ID,
    CUST_FNAME,
    CUST_LNAME,
    CUST_AREACODE,
    CUST_PHONE,
    CUST_ADDRESS,
    CUST_ZIP,
    HOTEL.HOTEL_ID,
    HOTEL_NAME,
    HOTEL_ADDR,
    HOTEL_ZIP,
    HOTEL_NIGHTLYCOST,
    HOTEL_CURRCAPACITY,
    HOTEL_MAXCAPACITY,
    RENT.RC_VIN,
    RC_MAKE,
    RC_MODEL,
    RC_COLOR,
    RC_COSTPERDAY,
    RC_PICKUP_ADDR,
    RC_PICKUP_ZIP,
    RENT_STARTDATE,
    RENT_ENDDATE,
    RC_RENTAL_COMPANY,
    RC_SEATS,
    RC_TRANSMISSION,
    EMPLOYEE.EMPLOYEE_ID,
    EMPLOYEE_FNAME,
    EMPLOYEE_LNAME,
    EMPLOYEE_TITLE,
    EMPLOYEE_EMAIL,
    EMPLOYEE_AREACODE,
    EMPLOYEE_PHONE,
    LIST.LIST_ID,
    LIST_NAME,
    ACTIVITY.ACTIVITY_ID,
    ACTIVITY_NAME,
    ACTIVITY_TYPE,
    ACTIVITY_URL,
    ACTIVITY_OPENTIME,
    ACTIVITY_CLOSETIME,
    HIKE_NAME,
    HIKE_DIFFICULTY,
    HIKE_LENGTH,
    HIKE_STREET,
    HIKE_ZIP,
    HIKE_TOPO_GAIN,
    RESTAURANT_NAME,
    RESTAURANT_CUISINE,
    RESTAURANT_PRICE_RANGE,
    RESTAURANT_RATING,
    RESTAURANT_STREET,
    RESTAURANT_ZIP,
    MOVIE_NAME,
    MOVIE_GENRE,
    MOVIE_DIRECTOR,
    MOVIE_PARENT_RATING,
    MOVIE_RATING,
    MOVIE_RELEASE_DATE,
    SHOWING.SHOW_TIME,
    THEATER.THEATER_ID,
    THEATER_NAME,
    THEATER_TICK_COST,
    THEATER_STREET,
    THEATER_ZIP
    FROM CUSTOMER 
	INNER JOIN HOTEL ON HOTEL.HOTEL_ID = CUSTOMER.HOTEL_ID
	INNER JOIN EMPLOYEE ON EMPLOYEE.EMPLOYEE_ID = CUSTOMER.EMPLOYEE_ID
    INNER JOIN LIST ON LIST.CUST_ID = CUSTOMER.CUST_ID
    INNER JOIN ENROLL ON ENROLL.LIST_ID = LIST.LIST_ID
    INNER JOIN ACTIVITY ON ENROLL.ACTIVITY_ID = ACTIVITY.ACTIVITY_ID
    INNER JOIN RENT ON RENT.CUST_ID = CUSTOMER.CUST_ID
    INNER JOIN RENTALCAR ON RENT.RC_VIN = RENTALCAR.RC_VIN
    LEFT JOIN HIKE ON HIKE.ACTIVITY_ID = ACTIVITY.ACTIVITY_ID
    LEFT JOIN RESTAURANT ON RESTAURANT.ACTIVITY_ID = ACTIVITY.ACTIVITY_ID
    LEFT JOIN MOVIE ON MOVIE.ACTIVITY_ID = ACTIVITY.ACTIVITY_ID
    LEFT JOIN SHOWING ON SHOWING.ACTIVITY_ID = MOVIE.ACTIVITY_ID
    LEFT JOIN THEATER ON THEATER.THEATER_ID = SHOWING.THEATER_ID
    ORDER BY CUST_ID;
    SELECT 
    RENT.CUST_ID,
    CUST_FNAME,
    CUST_LNAME,
    CUST_AREACODE,
    CUST_PHONE,
    CUST_ADDRESS,
    CUST_ZIP,
    RENT.RC_VIN,
    RC_MAKE,
    RC_MODEL,
    RC_COLOR,
    RC_COSTPERDAY,
    RENTALCAR_PICKUP_ADDR,
    RENTAL_PICKUP_ZIPCODE,
    RENT_STARTDATE,
    RENT_ENDDATE,
    RENTALCAR_RENTAL_COMPANY,
    RENTALCAR_SEATS,
    RENTALCAR_TRANSMISSION
    FROM CUSTOMER 
    INNER JOIN RENT ON RENT.CUST_ID = CUSTOMER.CUST_ID
    INNER JOIN RENTALCAR ON RENT.RC_VIN = RENTALCAR.RC_VIN
    ORDER BY CUST_ID;
SELECT 
    LIST.LIST_ID,
    LIST_NAME,
    ACTIVITY.ACTIVITY_ID,
    ACTIVITY_NAME,
    ACTIVITY_TYPE,
    ACTIVITY_URL,
    ACTIVITY_OPENTIME,
    ACTIVITY_CLOSETIME
    FROM LIST 
    INNER JOIN ENROLL ON ENROLL.LIST_ID = LIST.LIST_ID
    INNER JOIN ACTIVITY ON ENROLL.ACTIVITY_ID = ACTIVITY.ACTIVITY_ID
    ORDER BY LIST.LIST_ID;
SELECT 
    ACTIVITY.ACTIVITY_ID,
    ACTIVITY_NAME,
    ACTIVITY_TYPE,
    ACTIVITY_URL,
    ACTIVITY_OPENTIME,
    ACTIVITY_CLOSETIME,
    MOVIE_NAME,
    MOVIE_GENRE,
    MOVIE_DIRECTOR,
    MOVIE_PARENT_RATING,
    MOVIE_RATING,
    MOVIE_RELEASE_DATE,
    SHOWING.SHOW_TIME,
    THEATER.THEATER_ID,
    THEATER_NAME,
    THEATER_TICK_COST,
    THEATER_STREET,
    THEATER_ZIP
    FROM ACTIVITY
    RIGHT JOIN MOVIE ON MOVIE.ACTIVITY_ID = ACTIVITY.ACTIVITY_ID
    LEFT JOIN SHOWING ON SHOWING.ACTIVITY_ID = MOVIE.ACTIVITY_ID
    LEFT JOIN THEATER ON THEATER.THEATER_ID = SHOWING.THEATER_ID
    ORDER BY ACTIVITY_ID;