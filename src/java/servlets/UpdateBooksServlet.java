package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import models.Book;
import DAO.BookDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;
import util.DBConnect;

public class UpdateBooksServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateBooks</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateBooks at " + request.getContextPath() + "</h1>");
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
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            String bookName = request.getParameter("bookName");
            String authorName = request.getParameter("authorName");
            String price = request.getParameter("price");
            String status = request.getParameter("status");

            Book book = new Book();
            book.setBookId(bookId);
            book.setBookName(bookName);
            book.setAuthorName(authorName);
            book.setPrice(price);
            book.setStatus(status);

            BookDAO dao = new BookDAO();
            boolean isUpdated = dao.updateBook(book);

            HttpSession session = request.getSession();
            if (isUpdated) {
                session.setAttribute("successMsg", "The book was updated successfully!");
                response.sendRedirect("displayAllBooks");
            } else {
                session.setAttribute("errorMsg", "The book update failed!");
                response.sendRedirect("displayAllBooks");
            }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
    }
        
        //processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
