package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;


public class PaymentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the form data from the request
        String movieName = request.getParameter("movie_name");
        String selectedSeats = request.getParameter("selected_seats");
        double totalAmount = Double.parseDouble(request.getParameter("total_amount"));

        // Get the user details from the request
        String userEmail = request.getParameter("email");
        String userName = request.getParameter("name");
        String userPhone = request.getParameter("phone");

        // Simulate payment processing (you can integrate a payment gateway here)
        // For the sake of this example, we'll assume the payment is successful.

        // You can store the payment transaction details in the database, if needed

        // Set the attributes to forward to the confirmation page
        request.setAttribute("movie_name", movieName);
        request.setAttribute("selectedSeats", selectedSeats);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("userEmail", userEmail);
        request.setAttribute("userName", userName);
        request.setAttribute("userPhone", userPhone);

        // Forward to the confirmation page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/components/bookingConfirm.jsp");
        dispatcher.forward(request, response);
        //processRequest(request, response);
    }

}
