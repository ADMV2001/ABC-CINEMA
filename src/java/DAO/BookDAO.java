package DAO;

import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import models.Book;
import util.DBConnect;

public class BookDAO {
    
    public static boolean addBook(String book_name, String author_name, String price, String category, String status,String image)
    {
        boolean isAdded = false;
        
        try(Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement())
        { 
            String query = "INSERT INTO books values('0',"+book_name+"', '"+author_name+"', '"+price+"', '"+category+"', '"+status+"', '"+image+"')";
            int rs = stmt.executeUpdate(query);
            
            if(rs > 0)
            {
                isAdded = true;
            }
            else
            {
                isAdded = false;
            }                
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        return isAdded;
    }
    
    public List<Book> getAllBooks() {
        
        List<Book> bookList = new ArrayList<>();
        
        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT * FROM books";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            // Iterate through the result set and create Book objects
            while (rs.next()) {
                int bookId = rs.getInt("book_id");
                String bookName = rs.getString("book_name");
                String authorName = rs.getString("author_name");
                String price = rs.getString("price");
                String category = rs.getString("category");
                String status = rs.getString("status");
                String image = rs.getString("image");

                Book book = new Book();
                book.setBookId(bookId);
                book.setBookName(bookName);
                book.setAuthorName(authorName);
                book.setPrice(price);
                book.setCategory(category);
                book.setStatus(status);
                book.setImage(image);
                
                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookList;
    }

    public Book getBookById(int id)
    {
        Book book = null;
        
        try {
            Connection con = DBConnect.getConnection();
            String query = "SELECT * FROM books where book_id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                book = new Book();
                book.setBookId(rs.getInt("book_id"));       // Set the book ID
                book.setBookName(rs.getString("book_name")); // Set the book name
                book.setAuthorName(rs.getString("author_name")); // Set the author name
                book.setPrice(rs.getString("price"));       // Set the price
                book.setCategory(rs.getString("category")); // Set the category
                book.setStatus(rs.getString("status"));     // Set the status
                book.setImage(rs.getString("image")); 
            }
            
        } catch (Exception e) 
        {
            e.printStackTrace();
        }
        return book;
    }
    
    public boolean updateBook(Book book) {
        boolean isUpdated = false;

        try (Connection con = DBConnect.getConnection()) {
            String query = "UPDATE books SET book_name = ?, author_name = ?, price = ?, status = ? WHERE book_id = ?";
            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, book.getBookName());
            ps.setString(2, book.getAuthorName());
            ps.setString(3, book.getPrice());
            ps.setString(4, book.getStatus());
            ps.setInt(5, book.getBookId());

            int rowsAffected = ps.executeUpdate();
            isUpdated = rowsAffected > 0; // Check if any row was updated
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    public boolean deleteBook(int id)
    {
        boolean isDeleted = false;
        
        try(Connection con = DBConnect.getConnection())
        {
            String query = "DELETE FROM books where book_id = ?";
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
