package servlets;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        
        UserDAO mdao = new UserDAO();
        boolean isDeleted = mdao.deleteUser(userId);
        
        if(isDeleted)
        {
            request.setAttribute("succMessage", "Movie Deleted!");
            request.getRequestDispatcher("displayAllUsers").forward(request, response);
        }
        else
        {
            request.setAttribute("errorMessage", "Delete Error!");
            request.getRequestDispatcher("displayAllUsers").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
