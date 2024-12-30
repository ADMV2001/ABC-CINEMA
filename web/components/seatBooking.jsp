<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="DAO.ShowtimesDAO" %>
<%@ page import="models.Showtimes" %>
<%@ page import="DAO.BookingDAO" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Seat Booking</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/seatBooking.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        .selected {
            background-color: #4CAF50; /* Green for selection */
            color: white;
        }
        .disabled {
            background-color: #ccc; /* Grey for booked seats */
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <header>
        <%@ include file="nav.jsp" %>
    </header>

    <div class="seat-body-div">
        <div class="container">
            <div class="left-section">
                <h2>Select Date</h2>
                <div class="date-container">
                    <% 
                    String movieId = request.getParameter("movie_id");
                    if (movieId != null) {
                        int selectedMovieId = Integer.parseInt(movieId);
                        ShowtimesDAO dao = new ShowtimesDAO();
                        List<Showtimes> showtimes = dao.getShowtimesForMovie(selectedMovieId);
                        List<String> uniqueDates = new ArrayList<>();
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

                        for (Showtimes showtime : showtimes) {
                            String showDateStr = showtime.getShowDate().format(formatter);
                            if (!uniqueDates.contains(showDateStr)) {
                                uniqueDates.add(showDateStr);
                    %>
                    <div class="date" data-date="<%= showDateStr %>">
                        <%= showDateStr %>
                    </div>
                    <% 
                            }
                        }
                    } 
                    %>
                </div>

                <h2>Select Show Timing</h2>
                <div class="time-container">
                    <% 
                    if (movieId != null) {
                        int selectedMovieId = Integer.parseInt(movieId);
                        List<Showtimes> showtimes = new ShowtimesDAO().getShowtimesForMovie(selectedMovieId);
                        for (Showtimes showtime : showtimes) {
                    %>
                    <div class="time" 
                         data-id="<%= showtime.getShowtimeId() %>" 
                         data-time="<%= showtime.getStartTime() %>" 
                         data-date="<%= showtime.getShowDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) %>">
                        <%= showtime.getStartTime() %>
                    </div>
                    <% 
                        }
                    }
                    %>
                </div>
            </div>

            <div class="center-section">
            <h1>Choose Your Seats</h1>
                <div class="seat-container">
                    <%
                        // Get the booked seats from the request attribute
                        List<String> bookedSeats = (List<String>) request.getAttribute("bookedSeats");

                        for (int i = 1; i <= 60; i++) {
                            boolean isBooked = false;
                            if (bookedSeats != null && bookedSeats.contains(String.valueOf(i))) {
                                isBooked = true;
                            }
                    %>
                    <button 
                        class="seat <%= isBooked ? "disabled" : "" %>" 
                        id="seat-<%= i %>" 
                        data-id="<%= i %>" 
                        <%= isBooked ? "disabled" : "" %> >
                        Seat <%= i %>
                    </button>
                    <% } %>
                </div>
            </div>

            <div class="right-section">
                <h2>Payment Summary</h2>
                <div class="summary-item">
                    <p>Ticket Price:</p>
                    <span>LKR <span id="ticket-price">550</span>.00</span>
                </div>
                <div class="summary-item">
                    <p>Seats Selected:</p>
                    <span><span id="summary-quantity">0</span></span>
                </div>
                <div class="summary-item">
                    <p>Total:</p>
                    <span>LKR <span id="summary-total">0</span>.00</span>
                </div>
                <form id="booking-form" action="${pageContext.request.contextPath}/Booking" method="POST">
                    <input type="hidden" name="movie_id" id="movie-id" value="<%= request.getParameter("movie_id") %>">
                    <input type="hidden" name="showtime_id" id="showtime-id" value=""/>
                    <input type="hidden" name="selected_date" id="selected-date" value=""/>
                    <input type="hidden" name="selected_time" id="selected-time" value=""/>
                    <input type="hidden" name="seats[]" id="seats-input" value=""/>
                    <input type="hidden" name="total_amount" id="total-amount" value=""/>
                    <button type="submit" id="submit-btn" class="disabled" disabled>Proceed to Checkout</button>
                </form>
            </div>
        </div>
    </div>

    <footer>
        <%@ include file="footer.jsp" %>
    </footer>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
    const seatButtons = document.querySelectorAll('.seat');
    const quantityElement = document.getElementById('summary-quantity');
    const totalAmountElement = document.getElementById('summary-total');
    const totalAmountInput = document.getElementById('total-amount');
    const submitButton = document.getElementById('submit-btn');
    const seatPrice = 550;

    let selectedSeats = [];

    // Handle seat selection
    seatButtons.forEach(button => {
        button.addEventListener('click', () => {
            if (!button.classList.contains('disabled')) {
                button.classList.toggle('selected');
                const seatId = button.dataset.id;
                if (button.classList.contains('selected')) {
                    selectedSeats.push(seatId);
                } else {
                    selectedSeats = selectedSeats.filter(id => id !== seatId);
                }
                updatePaymentSummary();
            }
        });
    });

    // Update payment summary
    function updatePaymentSummary() {
        const selectedSeatsCount = selectedSeats.length;
        quantityElement.textContent = selectedSeatsCount;
        totalAmountElement.textContent = selectedSeatsCount * seatPrice;
        totalAmountInput.value = selectedSeatsCount * seatPrice;
        document.getElementById('seats-input').value = selectedSeats.join(',');
        
        // Enable or disable the submit button based on the selections
        if (selectedSeatsCount > 0 && selectedDateElement.value && selectedTimeElement.value) {
            submitButton.classList.remove('disabled');
            submitButton.disabled = false;
        } else {
            submitButton.classList.add('disabled');
            submitButton.disabled = true;
        }
    }

    // Handle date selection
    const dateElements = document.querySelectorAll('.date');
    const timeElements = document.querySelectorAll('.time');
    const selectedDateElement = document.getElementById('selected-date');
    const selectedTimeElement = document.getElementById('selected-time');

    // Handle date selection
    dateElements.forEach(dateElement => {
        dateElement.addEventListener('click', function () {
            // Mark the selected date
            dateElements.forEach(date => date.classList.remove('selected'));
            this.classList.add('selected');

            // Set the selected date in the hidden input field
            selectedDateElement.value = this.dataset.date;

            // Show available showtimes for the selected date
            updateShowtimesForDate(this.dataset.date);
        });
    });

    // Handle time selection
    timeElements.forEach(timeElement => {
        timeElement.addEventListener('click', function () {
            // Mark the selected time
            timeElements.forEach(time => time.classList.remove('selected'));
            this.classList.add('selected');

            // Set the selected time in the hidden input field
            selectedTimeElement.value = this.dataset.time;
            document.getElementById('showtime-id').value = this.dataset.id;
        });
    });

    // Function to show the available showtimes for the selected date
    function updateShowtimesForDate(date) {
        timeElements.forEach(time => time.style.display = 'none');
        timeElements.forEach(time => {
            if (time.dataset.date === date) {
                time.style.display = 'block';
            }
        });
    }
});

    </script>
</body>
</html>
