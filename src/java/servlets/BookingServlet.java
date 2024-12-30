package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import java.util.List;

import DAO.BookingDAO;
import models.Booking;

public class BookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int showtimeId = Integer.parseInt(request.getParameter("showtime_id"));
        String showDate = request.getParameter("selected_date");

        // Get booked seats for the given date and showtime
        BookingDAO bookingDAO = new BookingDAO();
        List<String> bookedSeats = bookingDAO.getBookedSeats(showtimeId, showDate);

        // Set the booked seats in the request attribute
        request.setAttribute("bookedSeats", bookedSeats);

        // Forward to the seatBooking.jsp page to show the booked seats
        RequestDispatcher dispatcher = request.getRequestDispatcher("seatBooking.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Extract parameters from the form
        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        int showtimeId = Integer.parseInt(request.getParameter("showtime_id"));
        String showDate = request.getParameter("selected_date");
        String showTime = request.getParameter("selected_time");
        String[] seats = request.getParameterValues("seats[]");
        double totalAmount = Double.parseDouble(request.getParameter("total_amount"));

        Integer userIdObj = (Integer) request.getSession().getAttribute("user_id");
        if (userIdObj == null) {
            // Redirect to login if user_id is not found in session
            response.sendRedirect("login.jsp");
            return;
        }
        int userId = userIdObj; // Now we have a valid userId

        // Create a new booking object
        Booking booking = new Booking();
        booking.setMovieId(movieId);
        booking.setShowtimeId(showtimeId);
        booking.setShowDate(showDate);
        booking.setShowTime(showTime);
        booking.setSeats(String.join(",", seats)); // Store seats as a comma-separated string
        booking.setTotalAmount(totalAmount);
        booking.setUserId(userId); // Set the user_id

        // Add the booking to the database
        BookingDAO bookingDAO = new BookingDAO();
        boolean bookingAdded = bookingDAO.addBooking(booking);

        if (bookingAdded) {
            // Forward to the confirmation page
            request.setAttribute("booking", booking);
            RequestDispatcher dispatcher = request.getRequestDispatcher("confirmation.jsp");
            dispatcher.forward(request, response);
        } else {
            // Forward to the error page
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
