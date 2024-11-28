package servlets;

import DAO.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class DeleteBookServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) { 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteBookServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteBookServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        
        BookDAO dao = new BookDAO();
        boolean isDeleted = dao.deleteBook(bookId);
        
        HttpSession session = request.getSession();
        if(isDeleted)
        {
            session.setAttribute("successMsg", "The book is deleted successfully!");
            response.sendRedirect("displayAllBooks");
        }
        else
        {
            session.setAttribute("errorMsg", "The book deletion is failed!");
            response.sendRedirect("displayAllBooks");
        }
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
               
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
