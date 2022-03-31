package com.academy.servlet;

import com.academy.service.passengerService.PassengerService;
import com.academy.service.trainService.TrainService;
import com.academy.service.trainService.TrainServiceImpl;
import com.academy.service.passengerService.PassengerServiceImpl;
import com.academy.train.passengerTrain.PassengerTrain;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MainServlet extends HttpServlet {
    private TrainService trainService = new TrainServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        PassengerTrain train = (PassengerTrain) session.getAttribute("train");
        PassengerService passengerService = (PassengerServiceImpl) session.getAttribute("passengerService");
        if (train != null && passengerService != null) {
            long totalPassenger = trainService.getTotalPassenger(passengerService, train);
            session.setAttribute("totalPassenger", totalPassenger);
            int totalBaggage = trainService.getTotalBaggage(passengerService, train);
            session.setAttribute("totalBaggage", totalBaggage);
        }
        req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        PassengerTrain train = (PassengerTrain) session.getAttribute("train");
        PassengerService passengerService = (PassengerServiceImpl) session.getAttribute("passengerService");
        if (req.getParameter("action").equals("sorting")) {
            trainService.sortedCarriagesByComfortLevel(train);
            req.setAttribute("sortedTrain", true);
        } else if (req.getParameter("action").equals("search")) {
            int passMin = Integer.parseInt(req.getParameter("passMin"));
            int passMax = Integer.parseInt(req.getParameter("passMax"));
            String result = trainService.searchCarriagesByRangePassengers(passMin, passMax, passengerService, train);
            req.setAttribute("searchResult", result);
        }
        req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
    }
}
