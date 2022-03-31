package com.academy.model.train;

import com.academy.model.rollingStock.RailwayRollingStock;

public interface RailwayTransport {
    void addRollingStock(RailwayRollingStock rollingStock);

    void removeRollingStock(RailwayRollingStock rollingStock);
}