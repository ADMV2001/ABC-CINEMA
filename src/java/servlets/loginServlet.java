package servlets;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import DAO.UserDAO;

public class loginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (email.equals("admin") && password.equals("123"))
        {
            UserDAO userDAO = new UserDAO();
            int userCount = userDAO.getUserCount(); //Assuming getUserCount() returns the number of users
            
            request.setAttribute("userCount", userCount);
            
            RequestDispatcher dis1 = request.getRequestDispatcher("admin/adminHome.jsp");
            dis1.forward(request, response);
        }
        
        UserDAO user = new UserDAO();
        
        if(user.isValidUser(email,password)){
            
            // Assuming getUserId() is a method that returns the user ID for the logged-in user
            UserDAO userDao = new UserDAO();
            int userId = userDao.getUserIdByEmail(email);

            // Store the user ID in the session
            HttpSession session = request.getSession();
            session.setAttribute("user_id", userId); // Storing the user_id in the session

            
            
            response.sendRedirect("index.jsp");
        }
        else{
            request.setAttribute("errorMessage", "Invalid email or password");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
