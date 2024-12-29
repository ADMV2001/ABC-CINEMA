<%@ page import="java.util.List" %>
<%@ page import="DAO.MovieDAO" %>
<%@ page import="models.Movie" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="util.DBConnect" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddShowtimesDates.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin-footer.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ include file="admin_nav.jsp"%>
        <form action="${pageContext.request.contextPath}/ShowTimesDates" method="post">
            <a class="show-back-link" href="${pageContext.request.contextPath}/admin/adminHome.jsp">Back to Admin Dashboard</a>
            <h1 style="text-align:center;">Add Showtimes</h1>
            <label class="select" for="movie_id">Select Movie:</label>
            <select name="movie_id" id="movie_id">
                <% 
                    MovieDAO dao = new MovieDAO();
                    List<Movie> list = dao.getAllMovies();
                    for(Movie movie : list){
                %>
                    <option value="<%= movie.getMovieId() %>"><%= movie.getMovieName() %></option>
                <% } %>
            </select>

            <!-- Dynamically allow admin to add multiple showtimes -->
            <div id="showtimesContainer">
                <div class="showtime">
                    <label for="show_date">Show Date:</label>
                    <input type="date" name="show_date[]" required>

                    <label for="start_time">Start Time:</label>
                    <input type="time" name="start_time[]" required>

                    <label for="end_time">End Time:</label>
                    <input type="time" name="end_time[]" required>
                </div>
            </div>

            <!-- Add button to dynamically add more showtimes -->
            <button type="button" onclick="addShowtime()">Add Another Showtime</button>
            <button type="submit">Add Now</button>
        </form>
        
        <%@ include file="admin-footer.jsp" %>

<script>
    // JavaScript to add additional showtime input fields dynamically
    function addShowtime() {
        var showtimesContainer = document.getElementById('showtimesContainer');
        var newShowtime = document.createElement('div');
        newShowtime.classList.add('showtime');
        newShowtime.innerHTML = `
            <label for="show_date">Show Date:</label>
            <input type="date" name="show_date[]" required>

            <label for="start_time">Start Time:</label>
            <input type="time" name="start_time[]" required>

            <label for="end_time">End Time:</label>
            <input type="time" name="end_time[]" required>
        `;
        showtimesContainer.appendChild(newShowtime);
    }
</script>

    </body>
</html>
