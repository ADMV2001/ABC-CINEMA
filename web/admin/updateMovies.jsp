<%@ page import="models.Movie" %>
<%@ page import="DAO.MovieDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DBConnect" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/updateMovies.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin-footer.css">
    <title>Update Movie</title>
</head>
<body>
    <%@ include file="admin_nav.jsp" %>
    
    <div class="body-div">
        <div class="container">
        <a href="${pageContext.request.contextPath}/admin/adminHome.jsp" class="back-link">Admin Dashboard</a>
            <form class="add-movie-form" action="${pageContext.request.contextPath}/UpdateMovies" method="post">
                
                
                <%
                    String errorMessage = (String) session.getAttribute("errorMessage");
                    String succMessage = (String) session.getAttribute("succMessage");
                    session.removeAttribute("errorMessage");
                    session.removeAttribute("succMessage");
                %>

                <% if (errorMessage != null) { %>
                    <div style="color: red; font-size:12px; text-align:center;">
                        <p><%= errorMessage %></p>
                    </div>
                <% } %>

                <% if (succMessage != null) { %>
                    <div style="color: green; font-size:12px; text-align:center;">
                        <p><%= succMessage %></p>
                    </div>
                <% } %>

               
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    MovieDAO dao = new MovieDAO();
                    Movie movie = dao.getMovieById(id);
                %>
                
                
                <h2>Update Movie</h2>

                <input id="movie_id" name="movieId" type="hidden" value="<%=movie.getMovieId()%>"/>
                <input id="movie-name" name="movieName" type="text" placeholder="Movie Name : <%=movie.getMovieName()%>" required>
                <input id="genre" name="genre" type="text" placeholder="Genre : <%=movie.getGenre()%>" required>
                <input id="description" name="description" type="text" placeholder="Description : <%=movie.getDescription()%>" required>
                <input id="duration" name="duration" type="text" placeholder="Duration : <%=movie.getDuration()%>" required>
                
                <button type="submit" value="addMovie">Update Movie</button>
            </form>
        </div>

    </div>
    <%@ include file="admin-footer.jsp" %>
</body>
</html>