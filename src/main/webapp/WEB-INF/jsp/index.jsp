<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title>
			WebApp
		</title>
		<style type="text/css">
            <%@ include file="../css/w3.css" %>
        </style>
	</head>
	<body class="w3-light-grey">
	    <div class="w3-selection w3-light-grey w3-padding">
	        <jsp:include page="menu.jsp"></jsp:include>
	        <p class="w3-container w3-center w3-green">Current train:</p>
	        <c:choose>
	            <c:when test="${train == null}">
	                Train not created --> <a href="/servlet-webapp/train">New train<br><br></a>
	            </c:when>
	            <c:otherwise>
	                ${train}
	            </c:otherwise>
	        </c:choose>
        </div>
        <div class="w3-selection w3-light-grey w3-padding">
            <p>Number of registered passengers:</p>
            <c:choose>
                <c:when test="${passengerService != null}">
                    ${totalPassenger}
                    <p>Total baggage:</p>
                    ${totalBaggage}<br><br>
                    <form method="POST">
                        <button type="submit" name="action" value="sorting">
                            Sorting Carriages By Comfort Level
                        </button><br>
                        <c:if test="${sortedTrain != null}">
                            <br>Train successfully sorted!
                        </c:if>
                    </form>
                    <form method="POST">
                        <fieldset>
                            <legend>Search Carriages By Range Passengers</legend>
                            Passenger minimum:<br>
                            <input name="passMin"><br>
                            Passenger maximum:<br>
                            <input name="passMax"><br><br>
                            <button type="submit" name="action" value="search">Search</button><br><br>
                            <c:if test="${searchResult != null}">
                                Passenger minimum = ${param.passMin}
                                Passenger maximum = ${param.passMax}:<br>
                                ${searchResult}
                            </c:if>
                        </fieldset>
                    </form>
                </c:when>
                <c:otherwise>
                    No Registered Passengers --> <a href="/servlet-webapp/passengerRegistration">Passenger registration<br><br></a>
                </c:otherwise>
            </c:choose>
        </div>
	</body>
</html>