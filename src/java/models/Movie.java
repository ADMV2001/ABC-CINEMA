package models;

public class Movie {
    private int movie_id;
    private String movie_name;
    private String genre;
    private String description;
    private String duration;
    private String imageName;
    private byte[] image;
    
    //parameterized constructor
    public Movie(int movie_id, String movie_name, String genre, String description, String duration,String imageName, byte[] image)
    {
        this.movie_id = movie_id;
        this.movie_name = movie_name;
        this.genre = genre;
        this.description = description;
        this.duration = duration;
        this.imageName = imageName;
        this.image = image;
    }
    
    public Movie(){} //default constructor
    
    public int getMovieId() { return movie_id; }
    public void setMovieId(int movie_id) { this.movie_id = movie_id; }
    
    public String getMovieName() { return movie_name; }
    public void setMovieName(String movie_name) { this.movie_name = movie_name; }
    
    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }
    
    public String getImageName() { return imageName; }
    public void setImageName(String imageName) { this.imageName = imageName; }
    
    public byte[] getImage() { return image; }
    public void setImage(byte[] image) { this.image = image; }
    
}
