<%-- 
    Document   : bookingsummary.jsp
    Created on : Dec 15, 2024, 3:52:05 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View My Bookings</title>
    <link rel="stylesheet" href="bookings.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookingsummary.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
</head>
<body>
    <%@ include file="nav.jsp"%>
    <div class="container">

        <section class="bookings">
            <h2>Your Bookings Summary</h2>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Transaction ID</th>
                            <th>Movie</th>
                            <th>Showtime</th>
                            <th>Seats</th>
                            <th>Status</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>ABC123456</td>
                            <td>
                                <div class="movie-info">
                                    <img src="${pageContext.request.contextPath}/components/images/moana3.png" alt="Moana 2 Movie Poster" class="movie-image">
                                    <span>Moana 2</span>
                                </div>
                            </td>
                            <td>2025-01-15 18:30</td>
                            <td>2</td>
                            <td class="status confirmed">Confirmed</td>
                            <td>
                                <a href="#" class="cancel-button"><i class="fas fa-times"></i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>ABC012567</td>
                            <td>
                                <div class="movie-info">
                                    <img src="${pageContext.request.contextPath}/components/images/venom.png" alt="Venom Movie Poster" class="movie-image">
                                    <span>Venom: Last Dance</span>
                                </div>
                            </td>
                            <td>2024-12-26 18:30</td>
                            <td>3</td>
                            <td class="status confirmed">Confirmed</td>
                            <td>
                                <a href="#" class="cancel-button"><i class="fas fa-times"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        <div class="buttons">
            <a href="${pageContext.request.contextPath}/index.jsp" class="button">Go to Homepage</a>
        </div>

    </div>
        <%@ include file="footer.jsp" %>
</body>
</html>