package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.ShowtimesDAO;

public class ShowtimesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int movieId = Integer.parseInt(request.getParameter("movie_id"));
        String[] showDates = request.getParameterValues("show_date[]");
        String[] startTimes = request.getParameterValues("start_time[]");
        String[] endTimes = request.getParameterValues("end_time[]");

        // Loop through the arrays and insert showtimes into the database
        for (int i = 0; i < showDates.length; i++) {
            String showDate = showDates[i];
            String startTime = startTimes[i];
            String endTime = endTimes[i];

            // Insert each showtime into the showtimes table
            boolean isTrue = ShowtimesDAO.addShowtime(movieId, showDate, startTime, endTime);
            if(isTrue)
            {
                response.sendRedirect("admin/adminHome.jsp");
            }
        }       
    }


}
