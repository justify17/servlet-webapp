package com.academy.servlet;

import com.academy.passenger.Passenger;
import com.academy.rollingStock.carriage.passengerCarriage.ComfortLevels;
import com.academy.service.passengerService.PassengerService;
import com.academy.service.passengerService.PassengerServiceImpl;
import com.academy.train.passengerTrain.PassengerTrain;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RegistrationServlet extends HttpServlet {
    private PassengerService passengerService = new PassengerServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/jsp/passengerRegistration.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        PassengerTrain train = (PassengerTrain) session.getAttribute("train");
        if (req.getParameter("action").equals("passengerRegistration")) {
            ComfortLevels comfort = ComfortLevels.valueOf(req.getParameter("comfortLevel"));
            int baggage = Integer.parseInt(req.getParameter("baggage"));
            Passenger passenger = new Passenger(comfort, baggage);
            if (passengerService.seatReservation(passenger, train)) {
                req.setAttribute("registrationResult", " Registration was successful!");
            } else {
                req.setAttribute("registrationResult", " Error while executing registration, " +
                        "check the correctness of the input data");
            }
            session.setAttribute("passengerService", passengerService);
        }
        req.getRequestDispatcher("/WEB-INF/jsp/passengerRegistration.jsp").forward(req, resp);
    }
}
