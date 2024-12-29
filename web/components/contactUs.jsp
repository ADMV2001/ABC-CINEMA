<%-- 
    Document   : contactUs
    Created on : Dec 16, 2024, 10:57:31?PM
    Author     : Minula Vihanga
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>contact us</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/contactUs.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
</head>
<body>
    <%@ include file="nav.jsp"%>
    <div class="container">
        <div class="contact-wrapper">
            <!-- Left Section: Contact Form -->
            <div class="form-section">
                <h2>Get in Touch</h2>
                <form>
                    <input type="text" placeholder="Your Name" required>
                    <input type="email" placeholder="Your Email" required>
                    <input type="text" placeholder="Subject" required>
                    <textarea placeholder="Your Message" required></textarea>
                    <button type="submit">Send Message</button>
                </form>
            </div>
            
            <!-- Right Section: Contact Information -->
            <div class="info-section">
                <h2>Contact Us</h2>
                <div class="info-details">
                    <div class="info-item">
                        <img src="https://www.svgrepo.com/show/530236/location.svg" alt="Location Icon">
                        <p><strong>Address:</strong> 196/7 HavelockRd, Colombo 06 89000</p>
                    </div>
                    <div class="info-item">
                        <img src="https://www.svgrepo.com/show/469477/phone-out.svg" alt="Phone Icon">
                        <p><strong>Phone:</strong> 011-000 0000</p>
                    </div>
                    <div class="info-item">
                        <img src="https://www.svgrepo.com/show/468758/email.svg" alt="Email Icon">
                        <p><strong>Email:</strong> <a href="mailto:info@abccinema.com">abc@cinema.com.com</a></p>
                    </div>
                    <div class="info-item">
                        <img src="https://www.svgrepo.com/show/491883/the-internet.svg" alt="Website Icon">
                        <p><strong>Website:</strong> <a href="#">abccinema.com</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>

