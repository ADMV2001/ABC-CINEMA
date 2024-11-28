package models;

public class Book {
    private int book_id;
    private String book_name;
    private String author_name;
    private String price;
    private String category;
    private String status;
    private String image;
    
    public Book(int book_id, String book_name, String author_name, String price, String category, String status, String image)
    {
        this.book_id = book_id;
        this.book_name = book_name;
        this.author_name = author_name;
        this.price = price;
        this.category = category;
        this.status = status;
        this.image = image;  
    }
    
    public Book() {
    }

    public int getBookId() {
        return book_id;
    }
    public void setBookId(int bookId) {
        this.book_id = bookId;
    }
    
    public String getBookName() {
        return book_name;
    }
    public void setBookName(String bookName) {
        this.book_name = bookName;
    }

    public String getAuthorName() {
        return author_name;
    }
    public void setAuthorName(String authorName) {
        this.author_name = authorName;
    }

    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }
    
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    
}
