<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/addBooks.css"/>
        <title>Add New Books</title>
    </head>
    <body>
        <%@ include file="admin_nav.jsp" %>
        <div class="container">
        <a href="${pageContext.request.contextPath}/admin/adminHome.jsp" class="back-link add-book-back">Back to Admin Home</a>
        <form class="signup-form" action="adminServlet" method="post" enctype="multipart/form-data">
            <h2>Add New Books</h2>

            <input id="book-name" name="bookName" type="text" placeholder="Name of the Book" required>
            <input id="author-name" name="authorName" type="text" placeholder="Name of the Author" required>          
            <input id="price" name="price" type="number" placeholder="Price" step="0.01" required>

          
            <select id="category" name="category" required>
                <option value="" disabled selected>Select Category</option>
                <option value="Fiction">Fiction</option>
                <option value="Non-Fiction">Non-Fiction</option>
                <option value="Science">Science</option>
                <option value="History">History</option>
                <option value="Biography">Biography</option>
            </select>

            <select id="status" name="status" required>
                <option value="" disabled selected>Select Book Status</option>
                <option value="Available">Available</option>
                <option value="Out of Stock">Out of Stock</option>
            </select>

            <input id="upload-image" name="image" type="file" accept="image/*" required>

            <button type="submit" value="addBook">Add Book</button>
        </form>
    </div>
    </body>
</html>
