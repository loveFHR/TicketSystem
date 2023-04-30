package com.service;

import com.pojo.Flight;

import java.util.List;

public interface FlightService {
    List<Flight> selectAllFlight(String page,String limit);
    int countFlight();

    void insertFlight(Flight flight);

    Flight selectFlightById(Integer flightId);
    void updateFlightById(Integer flightId,Flight flight);
    void deleteFlightById(Integer flightId);
}
