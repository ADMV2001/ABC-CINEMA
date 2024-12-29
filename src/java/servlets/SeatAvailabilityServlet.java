
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.SeatDAO;
import com.google.gson.Gson;
import models.Seat;

import java.util.Map;
import java.util.List;

public class SeatAvailabilityServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int showtimeId = Integer.parseInt(request.getParameter("showtime_id"));
        SeatDAO seatDAO = new SeatDAO();

        List<Seat> availableSeats = seatDAO.getAvailableSeats(showtimeId);
        List<Seat> bookedSeats = seatDAO.getBookedSeats(showtimeId);

        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(Map.of(
            "availableSeats", availableSeats,
            "bookedSeats", bookedSeats
        )));
        
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

}
