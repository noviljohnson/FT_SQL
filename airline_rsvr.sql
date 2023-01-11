

CREATE DATABASE IF NOT EXISTS airline_reservation_db;

CREATE Table IF NOT EXISTS Passenger (
    passenger_id
    first_name
    last_name
    phone_number 
    email
    passport_number
    country_code
    city
    pin code
);

CREATE Table IF NOT EXISTS Booking(
    passenger_id
    flight_time
    airport_code
    aircraft_id
    seat_id
    from_city_id
    to_city_id
    dropping_time
     
);

CREATE Table IF NOT EXISTS FlightSeatPrice(
    flight_time
    aircraft_id
    class_id
    seat_id
    price

);

CREATE Table IF NOT EXISTS Country(
    country_code
    country_name
);

CREATE Table Airport(
    airport_id
    name 
    city
    country_code

);

CREATE Table Flight(
    flight_id
    schedule_id
    flight_status

);

CREATE TABLE Schedule(
    schedule_id
    org_airport_code
    dest_airport_code
    dep_time
    arr_time
)

CREATE Table Aircraft(
    aircraft_id
    capacity
    model
    mfdby

);

CREATE Table AircraftManufacturer(
    mfdid
    name
);

CREATE Table TravelClass(
    travel_class_id
    name
    description_
);

CREATE Table AircraftSeat(
    aircraft_id
    seat_id
    travel_class_id
);

CREATE Flight