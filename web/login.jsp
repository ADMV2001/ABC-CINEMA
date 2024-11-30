<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/login.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
    </head>
    <body>    
        <img id="background-image" src="${pageContext.request.contextPath}/images/background.PNG" alt="alt"/>
        
        <%@ include file="components/nav.jsp" %>
        
        <div class="lgn-container">
            <a href="${pageContext.request.contextPath}/index.jsp" class="lgn-back-link">Back to Home</a>

            <form class="lgn-login-form" action="loginServlet" method="POST">
                <h2 class="lgn-title">Login</h2>

                <input id="lgn-email" name="email" type="text" placeholder="Email" required>
                <input id="lgn-password" name="password" type="text" placeholder="Password" required>

                <label class="lgn-redirect">I don't have an account. <a href="${pageContext.request.contextPath}/signup.jsp">Signup here<a/></label>

                <button type="submit">Login</button>

            </form>
        </div>
    
        <div style="margin-bottom: 0; ">
            <%@ include file="components/footer.jsp" %>
        </div>
            
    </body>
</html>