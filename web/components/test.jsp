<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="DAO.SeatsDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Booked Seats</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1>Test Booked Seats</h1>
        <form method="GET" action="test.jsp" class="mb-4">
            <div class="mb-3">
                <label for="showtimeId" class="form-label">Enter Showtime ID:</label>
                <input type="number" id="showtimeId" name="showtime_id" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary">Get Booked Seats</button>
        </form>
        
        <div>
            <% 
            String showtimeIdParam = request.getParameter("showtime_id");
            if (showtimeIdParam != null) {
                int showtimeId = Integer.parseInt(showtimeIdParam);
                SeatsDAO seatsDAO = new SeatsDAO();
                List<Integer> bookedSeats = seatsDAO.getBookedSeats(showtimeId);

                if (bookedSeats.isEmpty()) {
            %>
                    <div class="alert alert-warning">No seats are booked for Showtime ID: <%= showtimeId %></div>
            <%
                } else {
            %>
                    <h3>Booked Seats for Showtime ID: <%= showtimeId %></h3>
                    <ul class="list-group">
                        <% for (int seat : bookedSeats) { %>
                            <li class="list-group-item">Seat Number: <%= seat %></li>
                        <% } %>
                    </ul>
            <%
                }
            }
            %>
        </div>
    </div>
</body>
</html>
