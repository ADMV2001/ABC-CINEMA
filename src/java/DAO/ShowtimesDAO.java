package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Date;  // java.sql.Date is used for SQL Date types
import java.sql.Time;  // java.sql.Time for SQL Time types
import java.time.LocalDate;  // For LocalDate to handle Date
import java.time.LocalTime;  // For LocalTime to handle Time

import util.DBConnect;
import models.Showtimes;

public class ShowtimesDAO {
    public static boolean addShowtime(int movieId, String showDate, String startTime, String endTime) {
        
        boolean isAdded = false;
        
        String query = "INSERT INTO showtimes (movie_id, show_date, start_time, end_time) VALUES (?, ?, ?, ?)";
        
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, movieId);
            statement.setString(2, showDate);
            statement.setString(3, startTime);
            statement.setString(4, endTime);
            
            int rowsAffected = statement.executeUpdate();
            
            // Check if the insert was successful
            if (rowsAffected > 0) {
                isAdded = true;
            }
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isAdded;
    }
    
    public List<Showtimes> getShowtimesForMovie(int movieId) {
        List<Showtimes> showtimes = new ArrayList<>();
        String query = "SELECT * FROM showtimes WHERE movie_id = ? ORDER BY show_date, start_time";

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, movieId);  // Set the movieId parameter in the SQL query
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Showtimes showtime = new Showtimes();

                // Retrieve show_date as java.sql.Date and convert it to LocalDate
                Date showDate = resultSet.getDate("show_date");
                if (showDate != null) {
                    showtime.setShowDate(showDate.toLocalDate());  // Convert java.sql.Date to LocalDate
                }

                // Retrieve start_time and end_time as java.sql.Time and convert to LocalTime
                Time startTime = resultSet.getTime("start_time");
                Time endTime = resultSet.getTime("end_time");

                // Convert java.sql.Time to LocalTime
                showtime.setStartTime(startTime != null ? startTime.toLocalTime() : null);  
                showtime.setEndTime(endTime != null ? endTime.toLocalTime() : null);  

                // Set other properties from the ResultSet
                showtime.setShowtimeId(resultSet.getInt("showtime_id"));
                showtime.setMovieId(resultSet.getInt("movie_id"));

                // Add to the list of showtimes
                showtimes.add(showtime);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return showtimes;  // Return the list of showtimes
    }
    

}
