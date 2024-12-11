package servlets;

import DAO.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import models.Movie;

public class DisplayMoviesServlet extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get the list of all movies from the database
        MovieDAO movieDAO = new MovieDAO();
        List<Movie> movies = movieDAO.getAllMovies();

        if (movies == null || movies.isEmpty()) {
            request.setAttribute("errorMessage", "No movies found to display.");
        } else {
            request.setAttribute("movies", movies);
        }

        // Forward the request to displayMovies.jsp
        request.getRequestDispatcher("admin/displayMovies.jsp").forward(request, response);
   
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
