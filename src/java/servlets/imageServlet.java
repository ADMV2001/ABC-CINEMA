package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


// For handling output streams
import java.io.OutputStream;
import java.io.IOException;

import util.DBConnect;


public class imageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String movieId = request.getParameter("id"); // Get movie ID from query parameters

        try (Connection connection = DBConnect.getConnection()) {
            String query = "SELECT image FROM movies WHERE movie_id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, movieId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                byte[] imageData = resultSet.getBytes("image");

                response.setContentType("image/jpeg"); // Set appropriate content type for the image
                OutputStream out = response.getOutputStream();
                out.write(imageData);
                out.flush();
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND); // Send 404 if no image is found
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
        
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
