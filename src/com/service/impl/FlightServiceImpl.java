package com.service.impl;

import com.dao.FlightDao;
import com.dao.impl.FlightDaoImpl;
import com.pojo.Flight;
import com.service.FlightService;

import java.util.List;

public class FlightServiceImpl implements FlightService {
    FlightDao flightDao = new FlightDaoImpl();
    @Override
    public List<Flight> selectAllFlight(String page, String limit) {
        return flightDao.selectAllFlight(page,limit);
    }

    @Override
    public int countFlight() {
        return flightDao.countFlight();
    }

    @Override
    public void insertFlight(Flight flight) {
        flightDao.insertFlight(flight);
    }

    @Override
    public Flight selectFlightById(Integer flightId) {
        return flightDao.selectFlightById(flightId);
    }

    @Override
    public void updateFlightById(Integer flightId, Flight flight) {
        flightDao.updateFlightById(flightId,flight);
    }

    @Override
    public void deleteFlightById(Integer flightId) {
        flightDao.deleteFlightById(flightId);
    }
}
