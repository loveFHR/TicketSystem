package com.service.impl;

import com.dao.TicketDao;
import com.dao.impl.TicketDaoImpl;
import com.service.TicketService;

public class TicketServiceImpl implements TicketService {
    TicketDao ticketDao = new TicketDaoImpl();

    @Override
    public void insertById(Integer orderId) {
        ticketDao.insertById(orderId);
    }
}
