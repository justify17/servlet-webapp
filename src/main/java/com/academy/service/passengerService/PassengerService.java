package com.academy.service.passengerService;

import com.academy.model.passenger.Passenger;
import com.academy.model.ticket.Ticket;
import com.academy.model.train.passengerTrain.PassengerTrain;

import java.util.List;

public interface PassengerService {
    boolean seatReservation(Passenger passenger, PassengerTrain train);

    List<Ticket> getStorage();
}
