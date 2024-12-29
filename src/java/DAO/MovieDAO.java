package DAO;

import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;


import util.DBConnect;
import models.Movie;

public class MovieDAO {
    public static boolean addMovie(String movie_name, String genre,String description,String duration,String imageName, byte[] image)
    {
        boolean isAdded = false;
        
        String query = "INSERT INTO movies (movie_name, genre, description, duration, image_name, image)" +
                       "VALUES (?, ?, ?, ?, ?, ?)";
        
        // Use try-with-resources to automatically close resources
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            
            // Set the values in the PreparedStatement
            pstmt.setString(1, movie_name);
            pstmt.setString(2, genre);
            pstmt.setString(3, description);
            pstmt.setString(4, duration);
            pstmt.setString(5, imageName);
            pstmt.setBytes(6, image);
            
            
            // Execute the insert statement
            int rowsAffected = pstmt.executeUpdate();
            
            // Check if the insert was successful
            if (rowsAffected > 0) {
                isAdded = true;
            }
        } catch (Exception e) {
            // Handle exceptions (e.g., database connection issues, query issues)
            e.printStackTrace();
        }
        
        return isAdded;
    }
    
    public List<Movie> getAllMovies(){
        
        List<Movie> movies = new ArrayList<>();
        
        try{
            Connection con = DBConnect.getConnection();
            String query = "SELECT * FROM movies";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Movie movie = new Movie();
                movie.setMovieId(rs.getInt("movie_id"));
                movie.setMovieName(rs.getString("movie_name"));
                movie.setGenre(rs.getString("genre"));
                movie.setDescription(rs.getString("description"));
                movie.setDuration(rs.getString("duration"));
                movie.setImageName(rs.getString("image_name"));
                movie.setImage(rs.getBytes("image"));
                movies.add(movie);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return movies;
    }
    
    public Movie getMovieById(int id)
    {
        Movie movie = null;
        
        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT * FROM movies where movie_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                movie = new Movie();
                movie.setMovieId(rs.getInt("movie_id"));       
                movie.setMovieName(rs.getString("movie_name")); 
                movie.setGenre(rs.getString("genre")); 
                movie.setDescription(rs.getString("description"));      
                movie.setDuration(rs.getString("duration")); 
            }
            
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
        return movie;
    }
    
    public String getMovieNameById(int movieId) {
        String movieName = "";
        
        String query = "SELECT movie_name FROM movies WHERE movie_id = ?";
        
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, movieId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                movieName = rs.getString("movie_name");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return movieName;
    }
    
    public boolean updateMovie(Movie movie) {
        boolean isUpdated = false;

        if (movie.getMovieId() <= 0) {
            System.err.println("Invalid movie ID");
            return isUpdated;
        }

        try (Connection con = DBConnect.getConnection()) {
            String query = "UPDATE movies SET movie_name = ?, genre = ?, description = ?, duration = ? WHERE movie_id = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, movie.getMovieName());
            ps.setString(2, movie.getGenre());
            ps.setString(3, movie.getDescription());
            ps.setString(4, movie.getDuration());
            ps.setInt(5, movie.getMovieId());

            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0;
        }catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
            e.printStackTrace();
        }

        return isUpdated;
    }
    
    public boolean deleteMovie(int id)
    {
        boolean isDeleted = false;
        
        try(Connection con = DBConnect.getConnection())
        {
            String query = "DELETE FROM movies where movie_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            int rs = ps.executeUpdate();
            
            if(rs > 0)
            {
                isDeleted = true;
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return isDeleted;
    }
}
