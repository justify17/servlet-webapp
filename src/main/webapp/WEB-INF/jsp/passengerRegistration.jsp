<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
	<head>
		<title>
			Passenger Registration
		</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body class="w3-light-grey">
	    <jsp:include page="menu.jsp"></jsp:include>
        <form method="POST">
            <fieldset>
                <legend>Passenger registration:</legend>
                Train:<br>
                <% if(session.getAttribute("train") == null) { %>
                    Train not created --> <a href="/servlet-webapp/train">New train<br><br></a>
                <% } else { %>
                    Passenger Train<br><br>
                <% } %>
                Baggage:<br>
                <input name="baggage"><br>
                Comfort level:<br>
                <select name="comfortLevel">
                    <option>LUX</option>
                    <option>COUPE</option>
                    <option>ECONOMY</option>
                </select><br><br>
                <button type="submit" name="action" value="passengerRegistration">Registration</button>
                <%
                    if(request.getAttribute("registrationResult") != null) {
                        out.println(request.getAttribute("registrationResult"));
                    }
                %>
            </fieldset>
        </form>
	</body>
</html>