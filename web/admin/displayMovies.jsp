<%@ page import="models.Movie" %>
<%@ page import="DAO.MovieDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin-footer.css">
    <title>All Movies</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/displayMovies.css">
</head>
<body>
    <%@ include file="admin_nav.jsp" %>
    <h2 style="text-align:center; color:#FAB005">Movie List</h2>
    
                <%
                    String errorMessage = (String) request.getAttribute("errorMessage");
                    String succMessage = (String) request.getAttribute("succMessage");
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
    
    <a href="${pageContext.request.contextPath}/admin/adminHome.jsp" style="margin-left:20px; color:white; font-size:13px">Back to Admin Dashboard</a>            
    <div class="table-container">
        <table class="styled-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Genre</th>
                    <th>Description</th>
                    <th>Duration</th>
                    <th>Image Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Movie> movies = (List<Movie>) request.getAttribute("movies");
                    if (movies != null) {
                        for (Movie movie : movies) {
                %>
                            <tr>
                                <td><%= movie.getMovieId() %></td>
                                <td><%= movie.getMovieName() %></td>
                                <td><%= movie.getGenre() %></td>
                                <td><%= movie.getDescription() %></td>
                                <td><%= movie.getDuration() %></td>
                                <td><%= movie.getImageName() %></td>
                                <td class="last-column">
                                    <button onclick="location.href='${pageContext.request.contextPath}/admin/updateMovies.jsp?id=<%=movie.getMovieId()%>';" type="button" class="update-btn">Update</button>
                                    <button onclick="location.href='${pageContext.request.contextPath}/DeleteMovie?movieId=<%=movie.getMovieId()%>'" type="button" class="delete-btn">Delete</button>
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
