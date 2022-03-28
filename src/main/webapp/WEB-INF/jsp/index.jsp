<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>
			WebApp
		</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body class="w3-light-grey">
	    <div class="w3-selection w3-light-grey w3-padding">
	        <jsp:include page="menu.jsp"></jsp:include>
	        <p class="w3-container w3-center w3-green">Current train:</p>
            <% if(session.getAttribute("train") != null) { %>
                <%= session.getAttribute("train") %>
            <% } else { %>
                Train not created --> <a href="/servlet-webapp/train">New train<br><br></a>
            <% } %>
        </div>
        <div class="w3-selection w3-light-grey w3-padding">
            <p>Number of registered passengers:</p>
            <% if(session.getAttribute("passengerService") != null) { %>
                <%= session.getAttribute("totalPassenger") %>
                <p>Total baggage:</p>
                <%= session.getAttribute("totalBaggage") %><br><br>
                <form method="POST">
                    <button type="submit" name="action" value="sorting">
                        Sorting Carriages By Comfort Level
                    </button><br>
                    <% if(request.getAttribute("sortedTrain") != null) { %>
                        <br>Train successfully sorted!
                    <% } %>
                </form>
                <form method="POST">
                    <fieldset>
                        <legend>Search Carriages By Range Passengers</legend>
                        Passenger minimum:<br>
                        <input name="passMin"><br>
                        Passenger maximum:<br>
                        <input name="passMax"><br><br>
                        <button type="submit" name="action" value="search">Search</button><br><br>
                        <% if(request.getAttribute("searchResult") != null) { %>
                            Passenger minimum = <%= request.getParameter("passMin") %>
                            Passenger maximum = <%= request.getParameter("passMax") %>:<br>
                            <%= request.getAttribute("searchResult") %>
                        <% } %>
                    </fieldset>
                </form>
            <% } else { %>
                No Registered Passengers --> <a href="/servlet-webapp/passengerRegistration">Passenger registration<br><br></a>
            <% } %>
        </div>
	</body>
</html>