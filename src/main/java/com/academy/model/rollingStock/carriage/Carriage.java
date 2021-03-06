package com.academy.model.rollingStock.carriage;

import com.academy.model.rollingStock.RailwayRollingStock;

public abstract class Carriage implements RailwayRollingStock {
    protected int weight;

    public Carriage(int weight) {
        this.weight = weight;
    }

    @Override
    public int getWeight() {
        return weight;
    }

    @Override
    public void setWeight(int weight) {
        this.weight = weight;
    }
}