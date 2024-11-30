<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/adminHome.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
        <title>Admin Dashboard</title>
    </head>
    <body>
        <%@ include file="admin_nav.jsp" %>
        
        <div class="admin-info">
            <div class="admin-info-box">
                <img src="${pageContext.request.contextPath}/admin/images/info-users.png" alt="info-users" class="info-icon"/>
                <h3 class="info-title">Registered Users</h3>
                <h4 class="info-amount-1">100</h4>
            </div>
            <div class="admin-info-box">
                <img src="${pageContext.request.contextPath}/admin/images/info-feedback.png" alt="info-users" class="info-icon"/>
                <h3 class="info-title">Feedbacks</h3>
                <h4 class="info-amount-2">100</h4>
            </div>
            <div class="admin-info-box">
                <img src="${pageContext.request.contextPath}/admin/images/info-movies.png" alt="info-users" class="info-icon"/>
                <h3 class="info-title">Ongoing Movies</h3>
                <h4 class="info-amount-3">05</h4>
            </div>
        </div>
                
        <div class="settings-div">
            <img class="setting-icon" src="${pageContext.request.contextPath}/admin/images/settings.png" alt="settings"/>
            <h3>Settings | Visualization</h3>
        </div>
            

        <div class="body">

            <div class="box" onclick="location.href='${pageContext.request.contextPath}/admin/AddMovie.jsp';">
                <p class="box-text">Add New Movie</p>
                <img src="${pageContext.request.contextPath}/admin/images/add.png" alt="Add Book Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='${pageContext.request.contextPath}/displayAllBooks';">
                <p class="box-text">Active Movies</p>
                <img src="${pageContext.request.contextPath}/admin/images/all.png" alt="Box 2 Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='${pageContext.request.contextPath}/displayAllUsers';">
                <p class="box-text">Users</p>
                <img src="${pageContext.request.contextPath}/admin/images/users.png" alt="Box 2 Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='orders.jsp';">
                <p class="box-text">Slider Change</p>
                <img src="${pageContext.request.contextPath}/admin/images/slider.png" alt="Box 3 Icon" class="admin-logo">
            </div>
            <div class="box" onclick="location.href='adminHome.jsp';">
                <p class="box-text">Logout</p>
                <img src="${pageContext.request.contextPath}/admin/images/logout.png" alt="Box 4 Icon" class="admin-logo">
            </div>
            
        </div>

    </body>
</html>