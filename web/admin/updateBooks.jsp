<%@ page import="models.Book" %>
<%@ page import="DAO.BookDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DBConnect" %>
<%@ page import="java.util.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateBooks.css"/>
        <title>Update Books</title>
    </head>
    <body>
        <div class="container">
        <a href="${pageContext.request.contextPath}/displayAllBooks" class="back-link">Back Book List</a>
        
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            BookDAO dao = new BookDAO();
            Book book = dao.getBookById(id);
        %>
        
        <form class="signup-form" action="${pageContext.request.contextPath}/updateBooks" method="post" >
            <h2>Update Books</h2>
            <input id="book-id" name="bookId" type="hidden" placeholder="Book ID" value="<%=book.getBookId()%>" readonly>
            <input id="book-name" name="bookName" type="text" placeholder="Name of the Book" value="<%=book.getBookName()%>" required>
            <input id="author-name" name="authorName" type="text" placeholder="Name of the Author" value="<%=book.getAuthorName()%>" required>          
            <input id="price" name="price" type="number" placeholder="Price" step="0.01" value="<%=book.getPrice ()%>" required>

            <select id="status" name="status" required>
                <option value="Available" <%= "Available".equals(book.getStatus()) ? "selected" : "" %>>Available</option>
                <option value="Out of Stock" <%= "Out of Stock".equals(book.getStatus()) ? "selected" : "" %>>Out of Stock</option>
            </select>


            <button type="submit" value="addBook">Update Book</button>
        </form>
    </div>
    </body>
</html>
