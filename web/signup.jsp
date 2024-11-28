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
        <form class="signup-form" action="signup" method="post">
            <h2 class="signup-title">Sign Up</h2>
            
            <input id="fst" name="firstName" type="text" placeholder="First Name" required>
            <input id="lst" name="lastName" type="text" placeholder="Last Name" required>
            <input id="email" name="email" type="email" placeholder="Email" required>
            <input id="mobile" name="mobile" type="tel" pattern="[0-9]{10}" placeholder="Mobile Number" required>
            <input id="username" name="username" type="text" placeholder="Username" required>
            <input id="password" name="password" type="password" placeholder="Password" required>
            <input id="confirm-password" name="confirmPassword" type="password" placeholder="Re-enter Password" required>
            
            <p id="error" style="color: red;"></p>

            <label class="terms">
                <input type="checkbox" name="term" required>
                I agree to the&nbsp;<a href="#">terms and conditions.</a>
            </label>
            
            <button type="submit" value="signup">Sign Up</button>
        </form>
    </div>
        
    <%@ include file="components/footer.jsp" %>
        
    
        
        
        
    </body>
</html>
