<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment - ABC Cinema</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="nav.css"/>
    <link rel="stylesheet" href="footer.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/payments.css"/>
</head>
<body>
    <header>
        <%@ include file="nav.jsp"%>
    <main>
        <section class="checkout-container">
            <div class="payment-details">
                <form action="${pageContext.request.contextPath}/components/cardDetails.jsp" method="POST">
                    <h2>Booking</h2>
                    <div class="form-section">
                        <label for="email">Email</label>
                        <input type="email" id="email" placeholder="Enter your email">
                    </div>
            
                    <div class="form-section">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" placeholder="Your Full Name">
                    
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" placeholder="Your Phone Number">
                    </div>
                    <br>

                    

                    <h2>Payment</h2>
                    <p>All transactions are secure and encrypted.</p>

                    <!-- Hidden Inputs for passing data -->
                    <input type="hidden" name="movie_name" value="<%= request.getAttribute("movie_name") %>">
                    <input type="hidden" name="selected_seats" value="<%= request.getAttribute("selectedSeats") %>">
                    <input type="hidden" name="total_amount" value="<%= request.getAttribute("total_amount") %>">
                    <input type="hidden" name="user_email" value="<%= request.getParameter("email") %>">
                    <input type="hidden" name="user_name" value="<%= request.getParameter("name") %>">
                    <input type="hidden" name="user_phone" value="<%= request.getParameter("phone") %>">

                    
                    <div class="pay-now-container">
                        <button class="p-button" type="submit">Proceed</button>
                    </div>
                </form>
            </div>

            <!-- Ticket Summary -->
            <div class="summary">
                <h2>Ticket Summary</h2>
                <div class="movie-summary">
                    <p style="font-size:20px;">Movie Name :</p>
                    <p style="font-size:20px;"><b><%= request.getAttribute("movie_name") %></b> </p> <!-- Display the movie name -->
                </div>
                
                <div class="movie-summary">
                    <p style="font-size:20px;">Seat Numbers :</p>
                    <p style="font-size:20px;"><b><%= request.getAttribute("selectedSeats") %></b> </p> <!-- Display the movie name -->
                </div>
                <br>

                <div class="summary-section">
                    <div class="summary-item">
                        <span>Subtotal</span>
                        <span id="subtotal"><span>LKR </span><b><%= request.getAttribute("total_amount") %></b></span> <!-- Display the total amount -->
                    </div>
                    <div class="summary-item">
                        <span>Discount</span>
                        <span id="discount">0</span>
                    </div>
                    <br>

                    <div class="summary-item total">
                        <span><b>Total</b></span>
                        <span id="total"><span>LKR </span><b><%= request.getAttribute("total_amount") %></b></span> <!-- Display the total amount -->
                    </div>
                </div>
            </div>
        </section>
    </main>
                    <%@ include file="footer.jsp" %>
</body>
</html>
