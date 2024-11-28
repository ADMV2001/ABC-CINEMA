package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
    private static String url = "jdbc:mysql://localhost:3306/ecommerce";
    private static String user = "root";
    private static String pass = "12345";
    
    private static Connection con;
    
    public static Connection getConnection()
    {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url,user,pass);
        }
        catch(Exception e){
            System.out.println("Database connection error!");
        }
        return con;
    }
        
}
