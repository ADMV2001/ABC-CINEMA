<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="DAO.ShowtimesDAO" %>
<%@ page import="models.Showtimes" %>

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
</head>
<body>
    <header>
        <%@ include file="nav.jsp"%>
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
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd"); // Adjust the pattern if needed

                        for (Showtimes showtime : showtimes) {
                            String showDateStr = showtime.getShowDate().format(formatter); // Convert LocalDate to String
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
                    <!-- Seats will be dynamically populated -->
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
                    <input type="hidden" name="seats[]" id="selected-seats" value=""/>
                    <input type="hidden" name="total_amount" id="total-amount" value=""/>
                    <button type="submit" id="proceed-btn" class="hidden">Proceed to Checkout</button>
                </form>
            </div>
        </div>
    </div>  

    <%@ include file="footer.jsp" %>

    <script>
        const dateContainer = document.querySelector('.date-container');
        const timeContainer = document.querySelector('.time-container');
        const seatContainer = document.querySelector('.seat-container');
        const proceedButton = document.getElementById('proceed-btn');

        const ticketPriceElement = document.getElementById('ticket-price');
        const quantityElement = document.getElementById('summary-quantity');
        const totalAmountElement = document.getElementById('summary-total');
        const totalAmountInput = document.getElementById('total-amount');

        const seatPrice = 550;
        let selectedDate = null;
        let selectedTime = null;
        let selectedSeats = [];
        let selectedSeatsCount = 0;

        // Handle date selection and show relevant showtimes
        dateContainer.addEventListener('click', (event) => {
            if (event.target.classList.contains('date')) {
                selectedDate = event.target.dataset.date;
                document.querySelectorAll('.date').forEach(date => date.classList.remove('selected'));
                event.target.classList.add('selected');

                const times = document.querySelectorAll('.time');
                times.forEach(time => {
                    if (time.dataset.date === selectedDate) {
                        time.style.display = 'block';
                    } else {
                        time.style.display = 'none';
                    }
                });

                document.getElementById('selected-date').value = selectedDate;
            }
        });

        // Handle showtime selection and trigger seat loading
        timeContainer.addEventListener('click', (event) => {
            if (event.target.classList.contains('time')) {
                selectedTime = event.target.dataset.time;
                const showtimeId = event.target.dataset.id;
                document.getElementById('showtime-id').value = showtimeId;
                document.getElementById('selected-time').value = selectedTime;

                document.querySelectorAll('.time').forEach(time => time.classList.remove('selected'));
                event.target.classList.add('selected');

                loadSeats(showtimeId);
            }
        });

        // Fetch and render seats dynamically
        function loadSeats(showtimeId) {
            fetch(`${window.location.origin}/SeatAvailability?showtime_id=${showtimeId}`)
                .then(response => response.json())
                .then(data => {
                    const { availableSeats, bookedSeats } = data;

                    seatContainer.innerHTML = '';

                    availableSeats.forEach(seat => {
                        const seatDiv = document.createElement('div');
                        seatDiv.className = 'seat';
                        seatDiv.textContent = seat.seat_number;
                        seatDiv.dataset.id = seat.seat_id;

                        seatDiv.addEventListener('click', () => {
                            seatDiv.classList.toggle('selected');
                            selectedSeats = Array.from(document.querySelectorAll('.seat.selected')).map(seat => seat.textContent);
                            selectedSeatsCount = selectedSeats.length;
                            updatePaymentSummary();
                        });

                        seatContainer.appendChild(seatDiv);
                    });

                    bookedSeats.forEach(seat => {
                        const seatDiv = document.createElement('div');
                        seatDiv.className = 'seat disabled';
                        seatDiv.textContent = seat.seat_number;
                        seatContainer.appendChild(seatDiv);
                    });
                }); 
        }

        function updatePaymentSummary() {
            quantityElement.textContent = selectedSeatsCount;
            totalAmountElement.textContent = selectedSeatsCount * seatPrice;
            totalAmountInput.value = selectedSeatsCount * seatPrice;
            document.getElementById('selected-seats').value = selectedSeats.join(',');
            proceedButton.classList.toggle('hidden', selectedSeatsCount === 0);
        }
    </script>

</body>
</html>
