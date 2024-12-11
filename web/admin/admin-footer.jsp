<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="admin-footer.css">
    <title>Footer</title>
</head>
<body>
  <div class="footer-body-div">
    <footer class="footer">
        <h1 style="color:#FAB005">Welcome Admin</h1>
      <div class="footer-container">
        <div class="footer-logo">
          <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" class="footer-logo-image">
        </div>
        
        <div class="footer-links">
          <a href="#">About Us</a>
          <a href="#">Privacy Policy</a>
          <a href="#">FAQ</a>
          <a href="#">Contact</a><br>
        </div>

        <div class="f-contact-main">
          <div class="f-contact">
              <img class="email-icon" src="${pageContext.request.contextPath}/components/images/email.png" alt="email-icon">
              <p> supportabc@abccinema.com</p>
            </div>
            <div class="f-contact f-contact-2">
              <img class="email-icon" src="${pageContext.request.contextPath}/components/images/call.png" alt="call-icon">
              <p> +94-000000000</p>
            </div>
        </div>
        

      </div>
      <p class="footer-credit">© 2024 ABC Cinema. All rights reserved.</p>
    </footer>
  </div>
    
    
</body>
</html>