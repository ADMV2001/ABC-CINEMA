package servlets;

import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import jakarta.servlet.http.Part; //to use Part
import java.io.InputStream; //to use InputStream
import jakarta.servlet.RequestDispatcher; //to use RequestDispatcher

import DAO.MovieDAO;
import jakarta.servlet.annotation.MultipartConfig;

@MultipartConfig(
    fileSizeThreshold = 1024 * 1024, // 1MB: Temporary file will be created if the uploaded file size exceeds this limit
    maxFileSize = 10 * 1024 * 1024, // 10MB: Max size of a single file
    maxRequestSize = 50 * 1024 * 1024 // 50MB: Max size for all files in a single request
)
public class AddMovieServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddMovieServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddMovieServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
        
        String movie_name = request.getParameter("movieName");
        String genre = request.getParameter("genre");
        String description = request.getParameter("description");
        String duration = request.getParameter("duration");
    
        Part imagePart = request.getPart("posterImage");
        String imageName = imagePart.getSubmittedFileName();
        InputStream imageInputStream = imagePart.getInputStream();
        byte[] imageBytes = imageInputStream.readAllBytes();

        // Save movie details to the database
        boolean isAdded = MovieDAO.addMovie(movie_name, genre, description, duration, imageName, imageBytes);

        if (isAdded) {
            request.setAttribute("succMessage", "Movie Added Successfully!");
        } else {
            request.setAttribute("errMessage", "Failed to Add Movie.");
        }

        RequestDispatcher dis = request.getRequestDispatcher("admin/AddMovie.jsp");
        dis.forward(request, response);
        }
}
