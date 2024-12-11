<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddMovie.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin-footer.css">
    <title>Add New Movie</title>
</head>
<body>
    <%@ include file="admin_nav.jsp" %>
    
    <div class="body-div">
        <div class="container">
        <a href="${pageContext.request.contextPath}/admin/adminHome.jsp" class="back-link">Admin Dashboard</a>
            <form class="add-movie-form" action="${pageContext.request.contextPath}/AddMovieServlet" method="post" enctype="multipart/form-data">
                
                <% 
                String errorMessage = (String) request.getAttribute("errMessage");
                if (errorMessage != null) { 
                %>
                    <div style="color: red; font-size:12px; text-align:center;">
                        <p><%= errorMessage %></p>
                    </div>
                <% 
                    } 
                %>
                
                <% 
                String succMessage = (String) request.getAttribute("succMessage");
                if (succMessage != null) { 
                %>
                    <div style="color: green; font-size:12px; text-align:center;">
                        <p><%= succMessage %></p>
                    </div>
                <% 
                    } 
                %>
                <h2>Add New Movie</h2>

                <input id="movie-name" name="movieName" type="text" placeholder="Movie Name" required>
                <input id="genre" name="genre" type="text" placeholder="Genre" required>
                <input id="description" name="description" type="text" placeholder="Description" required>
                <input id="duration" name="duration" type="text" placeholder="Duration(1hr 36min)" required>
                

                <label class="label" for="upload-image">Add Movie Poster</label>
                <input id="upload-image" name="posterImage" type="file" accept="image/*" required>

                <button type="submit" value="addMovie">Add Movie</button>
            </form>
        </div>

    </div>
    
        <%@ include file="admin-footer.jsp" %>
</body>
</html>