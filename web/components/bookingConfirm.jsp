<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABC Cinema - Order Confirmation</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookingconfirm.css"/>
</head>
<body>
    <header></header>
    <div class="confirmation-container">
        <div class="confirmation-content">
            <h2>Booking Confirmed!</h2>
            <p class="success-message">Thank you for your booking. Enjoy the show!</p>
    
            <div class="order-summary">
                <h3>Order Details</h3>
                <div class="summary-content">
                    <ul class="details">
                        <li><strong>Movie:</strong> <span id="movieName"><%= request.getAttribute("movie_name") %></span></li>
                        <li><strong>Date & Time:</strong> <span id="showDateTime">JAN 15, 2024 - 7:30 PM</span></li>
                        <li><strong>Seats:</strong> <span id="seatNumbers"><%= request.getAttribute("selectedSeats") %></span></li>
                        <li><strong>Total Amount:</strong> <span id="totalAmount"><%= request.getAttribute("totalAmount") %></span></li>
                        <li><strong>Transaction ID:</strong> <span id="transactionId">ABC123456</span></li>
                    </ul>
                </div>
            </div>
    
            <p class="notification-message">
                A confirmation email has been sent to <strong><span id="userEmail"><%= request.getAttribute("userEmail") %></span></strong>.
            </p>
    
            <div class="buttons">
                <a href="${pageContext.request.contextPath}/index.jsp" class="button">Homepage</a>
                <a href="${pageContext.request.contextPath}/components/bookingSummary.jsp" class="button">My Bookings</a>
                <a href="${pageContext.request.contextPath}/components/feedback.jsp" class="button">Feedback</a>
            </div>
        </div>
    </div>
</body>
</html>
