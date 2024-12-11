package servlets;

import DAO.MovieDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Movie;

public class UpdateMoviesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
            //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            int movieId = Integer.parseInt(request.getParameter("movieId"));
            String movieName = request.getParameter("movieName");
            String genre = request.getParameter("genre");
            String description = request.getParameter("description");
            String duration = request.getParameter("duration");

            Movie movie = new Movie();
            movie.setMovieId(movieId);
            movie.setMovieName(movieName);
            movie.setGenre(genre);
            movie.setDescription(description);
            movie.setDuration(duration);

            MovieDAO dao = new MovieDAO();
            boolean isUpdated = dao.updateMovie(movie);

            HttpSession session = request.getSession();
            if (isUpdated) {
                session.setAttribute("succMessage", "Movie updated successfully!");
                response.sendRedirect("admin/updateMovies.jsp?id=" + movieId);
            } else {
                session.setAttribute("errorMessage", "Movie update failed!");
                response.sendRedirect("admin/updateMovies.jsp?id=" + movieId);
            }

    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
        
        //processRequest(request, response);
    }

}
