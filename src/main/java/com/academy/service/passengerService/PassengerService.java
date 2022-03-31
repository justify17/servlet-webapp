package com.academy.service.passengerService;

import com.academy.passenger.Passenger;
import com.academy.train.passengerTrain.PassengerTrain;

import java.util.List;

public interface PassengerService {
    boolean seatReservation(Passenger passenger, PassengerTrain train);

    List<Ticket> getStorage();
}
