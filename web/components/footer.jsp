<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css">
    <title>Footer</title>
</head>
<body>
    <footer class="footer">
        <div class="footer-container">
          <div class="footer-logo">
            <h1>ABC Cinema</h1>
            <p>ABC Cinema brings you the ultimate movie experience with easy online ticket booking. Discover the latest blockbusters, choose your favorite 
                seats, and enjoy a seamless booking journey. Stay tuned for exciting offers and updates!</p>
          </div>
          <div class="footer-social">
            <a href="#" class="social-link" data-tooltip="Facebook">
              <img class="social-icons" src="${pageContext.request.contextPath}/components/images/fb.png" alt="fb">
            </a>
            <a href="#" class="social-link" data-tooltip="Twitter">
                <img class="social-icons" src="${pageContext.request.contextPath}/components/images/x.png" alt="x">
            </a>
            <a href="#" class="social-link" data-tooltip="Instagram">
                <img class="social-icons" src="${pageContext.request.contextPath}/components/images/insta.png" alt="insta">
            </a>
            <a href="#" class="social-link" data-tooltip="YouTube">
                <img class="social-icons" src="${pageContext.request.contextPath}/components/images/yt.png" alt="yt">
            </a>
          </div>
          <div class="footer-links">
            <a href="${pageContext.request.contextPath}/index.jsp">Home</a>
            <a href="${pageContext.request.contextPath}/components/aboutUs.jsp">About Us</a>
            <a href="${pageContext.request.contextPath}/components/terms.jsp">Privacy Policy</a>
            <a href="${pageContext.request.contextPath}/components/faq.jsp">FAQ</a>
            <a href="${pageContext.request.contextPath}/components/contactUs.jsp">Contact</a><br>
          </div>

          <div class="f-contact-main">
            <div class="f-contact">
                <img class="email-icon" src="${pageContext.request.contextPath}/components/images/email.png" alt="email-icon">
                <a style="color:white;" href="#"> supportabc@cinemaabc.com</a>
              </div>
              <div class="f-contact f-contact-2">
                <img class="email-icon" src="${pageContext.request.contextPath}/components/images/call.png" alt="call-icon">
                <p> 011-000 0000</p>
              </div>
          </div>
          

        </div>
        <p class="footer-credit">© 2024 ABC Cinema. All rights reserved.</p>
      </footer>
    
</body>
</html>