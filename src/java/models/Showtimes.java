package models;
import java.time.LocalDate;
import java.time.LocalTime;


public class Showtimes {
    // Fields
    private int showtimeId;
    private int movieId;
    private LocalDate showDate;
    private LocalTime startTime;
    private LocalTime endTime;

    // Default constructor
    public Showtimes() {
    }

    // Parameterized constructor
    public Showtimes(int showtimeId, int movieId, LocalDate showDate, LocalTime startTime, LocalTime endTime) {
        this.showtimeId = showtimeId;
        this.movieId = movieId;
        this.showDate = showDate;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    // Getters and Setters

    public int getShowtimeId() {
        return showtimeId;
    }

    public void setShowtimeId(int showtimeId) {
        this.showtimeId = showtimeId;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public LocalDate getShowDate() {
        return showDate;
    }

    public void setShowDate(LocalDate showDate) {
        this.showDate = showDate;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    @Override
    public String toString() {
        return "Showtime{" +
                "showtimeId=" + showtimeId +
                ", movieId=" + movieId +
                ", showDate=" + showDate +
                ", startTime=" + startTime +
                ", endTime=" + endTime +
                '}';
    }
}
