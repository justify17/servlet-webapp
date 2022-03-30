<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title>
			Train constructor
		</title>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	</head>
	<body class="w3-light-grey">
	    <jsp:include page="menu.jsp"></jsp:include>
        <form method="POST">
            <fieldset>
                <legend>Add locomotive:</legend>
                Weight:<br>
                <input name="weight"><br>
                Traction:<br>
                <input name="traction"><br>
                Engine type:<br>
                <select name="engineType">
                    <option>STEAM_ENGINE</option>
                    <option>COMBUSTION_ENGINE</option>
                    <option>ELECTRICAL_ENGINE</option>
                </select><br><br>
                <button type="submit" name="action" value="addLocomotive">Add</button>
            </fieldset>
        </form>
        <form method="POST">
            <fieldset>
                <legend>Add passenger carriage:</legend>
                Weight:<br>
                <input name="weight"><br>
                Passenger capacity:<br>
                <input name="passengerCapacity"><br>
                Comfort level:<br>
                <select name="comfortLevel">
                    <option>LUX</option>
                    <option>COUPE</option>
                    <option>ECONOMY</option>
                </select><br><br>
                <button type="submit" name="action" value="addPassCarriage">Add</button>
            </fieldset>
        </form>
        <form method="POST">
            <fieldset>
                <legend>Add dining carriage:</legend>
                Weight:<br>
                <input name="weight"><br>
                Quantity of seats:<br>
                <input name="quantityOfSeats"><br><br>
                <button type="submit" name="action" value="addDinCarriage">Add</button>
            </fieldset>
        </form>
        <c:if test="${train != null}">
            Train:
            ${train}
        </c:if>
	</body>
</html>