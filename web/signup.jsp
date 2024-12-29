<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/signup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
        <title>Signup Page</title>    
    </head>
    <body>
        <img id="background-image" src="${pageContext.request.contextPath}/images/background.PNG" alt="alt"/>
        
        <%@ include file="components/nav.jsp" %>
        
        <div class="container">
        <a href="${pageContext.request.contextPath}/index.jsp" class="back-link">Back to Home</a>
        
            <% 
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) { 
            %>
                <div class="error-message" style="color: red; font-size:11px; text-align:center;">
                    <p><%= errorMessage %></p>
                </div>
            <% 
                } 
            %>
            
            <p id="error" style="color: red;"></p>
         
        <form class="signup-form" action="signup" method="post">
            <h2 class="signup-title">Sign Up</h2>
            
            <input id="fst" name="firstName" type="text" placeholder="First Name" required>
            <input id="lst" name="lastName" type="text" placeholder="Last Name" required>
            <input id="email" name="email" type="email" placeholder="Email" required>
            <input id="mobile" name="mobile" type="tel" pattern="[0-9]{10}" placeholder="Mobile Number" required>
            <input id="username" name="username" type="text" placeholder="Username" required>
            <input id="password" name="password" type="password" placeholder="Password" required>
            <input id="confirm-password" name="confirmPassword" type="password" placeholder="Re-enter Password" required>  

            <label class="terms">
                <input type="checkbox" name="term" required>
                I agree to the&nbsp;<a href="${pageContext.request.contextPath}/components/terms.jsp">terms and conditions.</a>
            </label>
            
            <button type="submit" value="signup">Sign Up</button>
            <p class="have-acc">Have an account? <a href="${pageContext.request.contextPath}/login.jsp">Login Here</a></p>
        </form>
    </div>
        
    <%@ include file="components/footer.jsp" %>
    <script>
            document.addEventListener('DOMContentLoaded', () => {
            const fname = document.getElementById('fst');
            const lname = document.getElementById('lst');
            const email = document.getElementById('email');
            const mobile = document.getElementById('mobile');
            const username = document.getElementById('username');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirm-password');
            const form = document.querySelector('.signup-form');
            const errorElement = document.getElementById('error');

            form.addEventListener('submit', (e) => {
                let messages = [];

                if (fname.value.trim() === '') {
                    messages.push('First Name is required');
                }

                if (lname.value.trim() === '') {
                    messages.push('Last Name is required');
                }

                if (email.value.trim() === '') {
                    messages.push('Email is required');
                } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value)) {
                    messages.push('Enter a valid email');
                }

                if (mobile.value.trim() === '') {
                    messages.push('Mobile Number is required');
                } else if (!/^\d{10}$/.test(mobile.value)) {
                    messages.push('Enter a valid 10-digit mobile number');
                }

                if (username.value.trim() === '') {
                    messages.push('Username is required');
                }

                if (password.value.trim() === '') {
                    messages.push('Password is required');
                }

                if (confirmPassword.value.trim() === '') {
                    messages.push('Please confirm your password');
                } else if (password.value !== confirmPassword.value) {
                    messages.push('Passwords do not match');
                }

                if (messages.length > 0) {
                    e.preventDefault();
                    errorElement.innerText = messages.join(', ');
                }
            });
        });     
    </script>
        
    </body>
</html>
