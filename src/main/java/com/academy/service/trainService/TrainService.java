package com.academy.service.trainService;

import com.academy.service.passengerService.PassengerService;
import com.academy.train.passengerTrain.PassengerTrain;

public interface TrainService {
    long getTotalPassenger(PassengerService passengerService, PassengerTrain passengerTrain);

    int getTotalBaggage(PassengerService passengerService, PassengerTrain passengerTrain);

    void sortedCarriagesByComfortLevel(PassengerTrain passengerTrain);

    String searchCarriagesByRangePassengers(int min, int max, PassengerService passengerService, PassengerTrain passengerTrain);
}
