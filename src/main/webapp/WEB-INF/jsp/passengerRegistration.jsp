<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <c:if test="${train == null}">
                    Train not created --> <a href="/servlet-webapp/train">New train<br><br></a>
                </c:if>
                <c:if test="${train != null}">
                    Passenger Train<br><br>
                </c:if>
                Baggage:<br>
                <input name="baggage"><br>
                Comfort level:<br>
                <select name="comfortLevel">
                    <option>LUX</option>
                    <option>COUPE</option>
                    <option>ECONOMY</option>
                </select><br><br>
                <button type="submit" name="action" value="passengerRegistration">Registration</button>
                <c:if test="${registrationResult != null}">
                    ${registrationResult}
                </c:if>
            </fieldset>
        </form>
	</body>
</html>