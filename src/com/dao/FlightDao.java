package com.dao;

import com.pojo.Flight;

import java.util.List;

public interface FlightDao {
    List<Flight> selectAllFlight(String page, String limit);
    int countFlight();
    void insertFlight(Flight flight);
    Flight selectFlightById(Integer flightId);
    void updateFlightById(Integer flightId,Flight flight);
    void deleteFlightById(Integer flightId);
    List<String> selectstartAdd();
    int countAdd(String address);
    List<Flight> selectFlightByAddAndDate(String startAdd,String targetAdd, String date,String page, String limit);
    void updateSeats(Integer flightId, String option);
}