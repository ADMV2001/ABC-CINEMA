<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        <title>Navigation Bar</title>
    </head>
    <body>
        <nav class="navbar">
        <div class="nav-container">
            <div class="hamburger" onclick="toggleMenu()">&#9776;</div>
            <div onclick="location.href='${pageContext.request.contextPath}/index.jsp';" class="logo"><img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" class="logo"></div>
            <div class="site-name"></div>
            <input type="text" placeholder="Search" class="search-bar">
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
                <a href="${pageContext.request.contextPath}/components/bookingSummary.jsp">Bookings</a>
                <a href="${pageContext.request.contextPath}/components/contactUs.jsp">Contact</a>
                <a href="${pageContext.request.contextPath}/components/aboutUs.jsp">About</a>
            </div>
            <div class="auth-buttons">
                <button onclick="location.href='${pageContext.request.contextPath}/login.jsp';" class="btn">Login</button>
                <button onclick="location.href='${pageContext.request.contextPath}/signup.jsp';" class="btn">Sign Up</button>
            </div>
            <div onclick="location.href='${pageContext.request.contextPath}/components/userProfile.jsp';" class="profile">
                <img src="${pageContext.request.contextPath}/images/profile.png" alt="Profile" class="profile-pic"> 
            </div>
        </div>
        
        <div class="mobile-menu" id="mobileMenu">
            <div class="mobile-links">
                <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
                <a href="${pageContext.request.contextPath}/components/bookingSummary.jsp">Bookings</a>
                <a href="${pageContext.request.contextPath}/components/contactUs.jsp">Contact</a>
                <a href="${pageContext.request.contextPath}/components/aboutUs.jsp">About</a>
                <button onclick="location.href='${pageContext.request.contextPath}/login.jsp';" class="btn btn1">Login</button>
                <button onclick="location.href='${pageContext.request.contextPath}/signup.jsp';" class="btn btn2">Sign Up</button>
            </div>
        </div>
    </nav>

    <script>
        function toggleMenu() {
            const menu = document.getElementById('mobileMenu');
            menu.classList.toggle('active');
        }

        // Close the mobile menu when the window is resized to a larger size
        window.addEventListener('resize', () => {
            const menu = document.getElementById('mobileMenu');
            if (window.innerWidth > 910) {
                menu.classList.remove('active'); // Remove 'active' class to hide the mobile menu
            }
        });

        // Dropdown functionality for desktop
        document.querySelector('.dropdown-toggle').addEventListener('click', function(event) {
            event.preventDefault();
            const dropdownMenu = this.nextElementSibling;
            dropdownMenu.classList.toggle('show');
        });

        // Dropdown functionality for mobile
        document.querySelector('.mobile-dropdown-toggle').addEventListener('click', function(event) {
            event.preventDefault();
            const dropdownMenu = this.nextElementSibling;
            dropdownMenu.classList.toggle('show');
        });

        // Close dropdown when clicking outside of it
        window.addEventListener('click', function(event) {
            const dropdowns = document.querySelectorAll('.dropdown-menu, .mobile-dropdown-menu');
            dropdowns.forEach(menu => {
                if (!menu.previousElementSibling.contains(event.target)) {
                    menu.classList.remove('show');
                }
            });
        });
    </script>
    </body>
</html>
