package com.academy.servlet;

import com.academy.model.rollingStock.carriage.DiningCarriage;
import com.academy.model.rollingStock.carriage.passengerCarriage.ComfortLevels;
import com.academy.model.rollingStock.carriage.passengerCarriage.PassengerCarriage;
import com.academy.model.rollingStock.locomotive.EngineTypes;
import com.academy.model.rollingStock.locomotive.Locomotive;
import com.academy.model.train.passengerTrain.PassengerTrain;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class TrainServlet extends HttpServlet {
    private PassengerTrain train = new PassengerTrain();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/train.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if (req.getParameter("action").equals("addLocomotive")) {
            addLocomotive(req);
        } else if (req.getParameter("action").equals("addPassCarriage")) {
            addPassengerCarriage(req);
        } else if (req.getParameter("action").equals("addDinCarriage")) {
            addDiningCarriage(req);
        }
        session.setAttribute("train", train);
        req.getRequestDispatcher("/WEB-INF/jsp/train.jsp").forward(req, resp);
    }

    private void addLocomotive(HttpServletRequest req) {
        EngineTypes engine = EngineTypes.valueOf(req.getParameter("engineType"));
        int traction = Integer.parseInt(req.getParameter("traction"));
        int weight = Integer.parseInt(req.getParameter("weight"));
        train.addRollingStock(new Locomotive(engine, traction, weight));
    }

    private void addPassengerCarriage(HttpServletRequest req) {
        ComfortLevels comfort = ComfortLevels.valueOf(req.getParameter("comfortLevel"));
        int passengerCapacity = Integer.parseInt(req.getParameter("passengerCapacity"));
        int weight = Integer.parseInt(req.getParameter("weight"));
        train.addRollingStock(new PassengerCarriage(comfort, passengerCapacity, weight));
    }

    private void addDiningCarriage(HttpServletRequest req) {
        int quantityOfSeats = Integer.parseInt(req.getParameter("quantityOfSeats"));
        int weight = Integer.parseInt(req.getParameter("weight"));
        train.addRollingStock(new DiningCarriage(quantityOfSeats, weight));
    }
}
