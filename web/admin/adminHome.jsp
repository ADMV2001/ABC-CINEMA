<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminHome.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin-footer.css">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <%@ include file="admin_nav.jsp" %>
        
        <div class="admin-info">
            <div class="admin-info-box">
                <img src="${pageContext.request.contextPath}/admin/images/display1.png" alt="info-users" class="info-icon"/>
                <h3 class="info-title">Registered Users</h3>
                <h4 class="info-amount-1"><%= request.getAttribute("userCount") %></h4>
            </div>
            
            <div class="admin-info-box">
                <img src="${pageContext.request.contextPath}/admin/images/display3.png" alt="info-users" class="info-icon"/>
                <h3 class="info-title">Active Movies</h3>
                <h4 class="info-amount-3">05</h4>
            </div>
                
            <div class="admin-info-box">
                <img src="${pageContext.request.contextPath}/admin/images/display2.png" alt="info-users" class="info-icon"/>
                <h3 class="info-title">Customer Feedbacks</h3>
                <h4 class="info-amount-2">100</h4>
            </div>
        </div>

        <div class="body">

            <div class="box" onclick="location.href='${pageContext.request.contextPath}/admin/AddMovie.jsp';">
                <p class="box-text">Add New Movie</p>
                <img src="${pageContext.request.contextPath}/admin/images/addIcon.png" alt="Add Book Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='${pageContext.request.contextPath}/admin/AddShowtimesDates.jsp';">
                <p class="box-text">Add Show Times</p>
                <img src="${pageContext.request.contextPath}/admin/images/showtime.png" alt="Box 4 Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='${pageContext.request.contextPath}/DisplayMovies';">
                <p class="box-text">Active Movies</p>
                <img src="${pageContext.request.contextPath}/admin/images/movieIcon.png" alt="Box 2 Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='${pageContext.request.contextPath}/displayAllUsers';">
                <p class="box-text">Users</p>
                <img src="${pageContext.request.contextPath}/admin/images/userIcon.png" alt="Box 2 Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='orders.jsp';">
                <p class="box-text">Slider Change</p>
                <img src="${pageContext.request.contextPath}/admin/images/slider.png" alt="Box 3 Icon" class="admin-logo">
            </div>
            
        </div>
            
            <footer>
                <%@ include file="admin-footer.jsp" %>
            </footer>
      
        
    </body>
</html>
