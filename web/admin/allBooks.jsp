<%@ page import="models.Book" %>
<%@ page import="DAO.BookDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Books</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/allBooks.css">
</head>
<body>
    
    <c:if test="${not empty successMsg}">
        <p style="color:green; text-align:center">${successMsg}</p>
        <c:remove var="successMsg" scope="Session"/>
    </c:if>

    <c:if test="${not empty errorMsg}">
        <p style="color:red; text-align:center">${errorMsg}</p>
        <c:remove var="errorMsg" scope="Session"/>
    </c:if>
    
    <div class="table-container">
        <table class="styled-table">
            <thead>
                <tr>
                    <th>Book ID</th>
                    <th>Book Image</th>
                    <th>Book Name</th>
                    <th>Author Name</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Book Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Book> bookList = (List<Book>) request.getAttribute("bookList");
                    if (bookList != null) {
                        for (Book book : bookList) {
                %>
                            <tr>
                                <td><%= book.getBookId() %></td>
                                <td><img src="${pageContext.request.contextPath}/book_images/<%= book.getImage() %>" style="width:50px; height:50px;"></td>
                                <td><%= book.getBookName() %></td>
                                <td><%= book.getAuthorName() %></td>
                                <td><%= book.getPrice() %></td>
                                <td><%= book.getCategory() %></td>
                                <td><%= book.getStatus() %></td>
                                <td class="last-column">
                                    <button onclick="location.href='${pageContext.request.contextPath}/admin/updateBooks.jsp?id=<%=book.getBookId()%>';" type="button" class="update-btn">Update</button>
                                    <button onclick="location.href='${pageContext.request.contextPath}/delete?bookId=<%=book.getBookId()%>'" type="button" class="delete-btn">Delete</button>
                                </td>
                            </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
