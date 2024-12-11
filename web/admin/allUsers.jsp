<%@ page import="models.User" %>
<%@ page import="DAO.UserDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Users</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/allUsers.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css">
</head>
<body>
    <%@ include file="admin_nav.jsp" %>
    
    <h2 style="text-align:center; color:#FAB005">Registered Users</h2>
    
    <a href="${pageContext.request.contextPath}/admin/adminHome.jsp" style="margin-left:20px; color:white; font-size:13px">Back to Admin Dashboard</a>
    <div class="table-container">
        <table class="styled-table">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<User> userList = (List<User>) request.getAttribute("userList");
                    if (userList != null) {
                        for (User user : userList) {
                %>
                            <tr>
                                <td><%= user.getUserId() %></td>
                                <td><%= user.getFirstName() %></td>
                                <td><%= user.getLastName() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getMobile() %></td>
                                <td><%= user.getUsername() %></td>
                                <td><%= user.getPassword() %></td>
                                <td class="last-column">
                                    <button type="button" class="delete-btn">Delete</button>
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
