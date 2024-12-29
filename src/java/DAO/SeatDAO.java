package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;

import util.DBConnect;
import models.Seat;

public class SeatDAO {
    private Connection connection;

    public SeatDAO() {
        connection = DBConnect.getConnection();
    }

    // Fetch available seats for a specific showtime
    public List<Seat> getAvailableSeats(int showtimeId) {
    List<Seat> seats = new ArrayList<>();
    try {
        String query = """
            SELECT s.seat_id, s.seat_number
            FROM seats s
            WHERE s.seat_id NOT IN (
                SELECT b.seat_id
                FROM bookings b
                WHERE b.showtime_id = ?
            )
        """;
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setInt(1, showtimeId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Seat seat = new Seat(rs.getInt("seat_id"), rs.getString("seat_number"));
            seats.add(seat);

            // Log the available seat number to verify data retrieval
            System.out.println("Available Seat: " + seat.getSeatNumber());
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return seats;
}


    // Fetch booked seats for a specific showtime
    public List<Seat> getBookedSeats(int showtimeId) {
    List<Seat> seats = new ArrayList<>();
    try {
        String query = """
            SELECT s.seat_id, s.seat_number
            FROM seats s
            JOIN bookings b ON s.seat_id = b.seat_id
            WHERE b.showtime_id = ?
        """;
        PreparedStatement stmt = connection.prepareStatement(query);
        stmt.setInt(1, showtimeId);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Seat seat = new Seat(rs.getInt("seat_id"), rs.getString("seat_number"));
            seats.add(seat);

            // Log the booked seat number to verify data retrieval
            System.out.println("Booked Seat: " + seat.getSeatNumber());
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return seats;
}

}
