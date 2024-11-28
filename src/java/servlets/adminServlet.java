package servlets;

import models.Book;
import DAO.BookDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.MultipartConfig;
import java.io.File; // For the File class
import java.io.IOException; // For handling IOException
import jakarta.servlet.ServletContext; // To access servlet context
import jakarta.servlet.http.Part; // For handling file parts in a multipart request


@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50   // 50MB
)
public class adminServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String book_name = request.getParameter("bookName");
        String author_name = request.getParameter("authorName");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        String status = request.getParameter("status");
        Part part = request.getPart("image");
        if (part == null) 
        {
        System.out.println("Part is null. Check form submission and file upload.");
        }
        String filename = part.getSubmittedFileName();
        
        boolean isTrue;
        isTrue = BookDAO.addBook(book_name,author_name,price,category,status,filename);
        
        HttpSession session = request.getSession();
        
        if(isTrue == true)
        {
            //save added image to the folder named book_images
            String path = getServletContext().getRealPath("")+"book_images";
            File file = new File(path);
            part.write(path + File.separator + filename);
            
            session.setAttribute("successMsg","The book is added successfully!");
            RequestDispatcher dis1 = request.getRequestDispatcher("adminHome.jsp");
            dis1.forward(request, response);
        }
        else
        {
            session.setAttribute("errorMsg","The book is not added!!!");
            RequestDispatcher dis2 = request.getRequestDispatcher("addBooks.jsp");
            dis2.forward(request, response);
        }
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
