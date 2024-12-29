<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/admin_nav.css"/>
    <title>ABC Cinema</title>
</head>
<body>

    <nav class="navbar">
        <div class="nav-container">
            <div class="hamburger" onclick="toggleMenu()">&#9776;</div>
            <div class="site-name">Admin dashboard</div>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
                <a href="#home" style="color:#FAB005">Logout</a>
            </div>     
        </div>
        
        <div class="mobile-menu" id="mobileMenu">
            <div class="mobile-links">
                <a href="#home">Home</a>
                <a href="#home">Logout</a>
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
            if (window.innerWidth > 768) {
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
