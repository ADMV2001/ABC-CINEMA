<%-- 
    Document   : aboutUs.jsp
    Created on : Dec 16, 2024, 10:48:31 AM
    Author     : abiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>About Us - ABC Cinema</title>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutUs.css"/>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
         <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
         <script src="js.js" defer></script>
    </head>
    <body>
        <%@ include file="nav.jsp"%>
         <div class="container">
        
        <div class="content">
            <div class="content">
                <h1>ABOUT US</h1>
                <h2>Welcome to ABC Cinema<br>Your ultimate movie experience with privacy!</h2>
                <p>
                    At ABC Cinema, we are committed to providing a comfortable and private movie-watching experience 
                    for everyone. Whether you're catching the latest blockbusters or enjoying a romantic night out, 
                    our cinema offers cozy, private spaces perfect for couples.
                </p>
                <p>
                    Enjoy world-class sound, crystal-clear visuals, and exclusive seating options that guarantee both 
                    comfort and discretion. ABC Cinema is the perfect place for an unforgettable movie night!</p>
            <button onclick="location.href='aboutreadmore.jsp';" class="read-more-btn">Read More</button>

            <div class="social-iconss">
                <a class="ab-a" href="#"><img src="images/fb.png" alt="Facebook"></a>
                <a class="ab-a" href="#"><img src="images/x.png" alt="Twitter"></a>
                <a class="ab-a" href="#"><img src="images/insta.png" alt="Instagram"></a>
                <a class="ab-a" href="#"><img src="images/yt.png" alt="YouTube"></a>
            </div>
        </div>

        
        <div class="image-section">
            <h2>ABC Cinema – Where Every Moment Feels Like the Main Event. 🎬✨</h2>
        </div>
    </div>
    
    </body>
</html>
