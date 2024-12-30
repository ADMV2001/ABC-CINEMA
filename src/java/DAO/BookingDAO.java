package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

import util.DBConnect;
import models.Booking;

public class BookingDAO {

    // Method to insert a new booking into the database
    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO bookings (movie_id, showtime_id, show_date, show_time, seat_numbers, total_amount, user_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, booking.getMovieId()); // Insert movie_id
            stmt.setInt(2, booking.getShowtimeId());
            stmt.setString(3, booking.getShowDate());
            stmt.setString(4, booking.getShowTime());
            stmt.setString(5, booking.getSeats()); // Comma-separated seat IDs
            stmt.setDouble(6, booking.getTotalAmount());
            stmt.setInt(7, booking.getUserId());  // Add user_id to the insert

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to retrieve booked seats for a given date and showtime
    public List<String> getBookedSeats(int showtimeId, String showDate) {
    List<String> bookedSeats = new ArrayList<>();
    String sql = "SELECT seat_numbers FROM bookings WHERE showtime_id = ? AND show_date = ?";

    try (Connection conn = DBConnect.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setInt(1, showtimeId);
        stmt.setString(2, showDate);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            String seatNumbers = rs.getString("seat_numbers");
            String[] seats = seatNumbers.split(",");
            for (String seat : seats) {
                bookedSeats.add(seat);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    return bookedSeats;
}

}
