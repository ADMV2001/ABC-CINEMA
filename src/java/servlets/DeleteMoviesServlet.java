package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import DAO.MovieDAO;
import jakarta.servlet.http.HttpSession;

public class DeleteMoviesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int movieId = Integer.parseInt(request.getParameter("movieId"));
        
        MovieDAO mdao = new MovieDAO();
        boolean isDeleted = mdao.deleteMovie(movieId);
        
        if(isDeleted)
        {
            request.setAttribute("succMessage", "Movie Deleted!");
            request.getRequestDispatcher("DisplayMovies").forward(request, response);
        }
        else
        {
            request.setAttribute("errorMessage", "Delete Error!");
            request.getRequestDispatcher("DisplayMovies").forward(request, response);
        }
    }

    

}
