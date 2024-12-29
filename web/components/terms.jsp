<%-- 
    Document   : terms
    Created on : Dec 17, 2024, 6:24:11 AM
    Author     : Minula Vihanga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/terms.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
        <title>Terms & Conditions</title>
    </head>
    <body>
        <%@ include file="nav.jsp"%>
        
         <div class="container">
        <h1>Terms and Conditions</h1>
        <hr>
        <p>Welcome to <strong>ABC Cinema</strong>. These terms and conditions outline the rules and regulations for the use of our movie booking website.</p>

        <h2>1. Acceptance of Terms</h2>
        <p>By accessing this website and booking tickets, you agree to comply with these terms and conditions. If you do not agree with any part of these terms, please do not use our website.</p>

        <h2>2. Ticket Booking</h2>
        <ul>
            <li>All bookings are subject to seat availability.</li>
            <li>Once a booking is confirmed, tickets cannot be transferred or resold.</li>
            <li>Refunds and cancellations are subject to our refund policy, which is outlined below.</li>
        </ul>

        <h2>3. Pricing and Payment</h2>
        <ul>
            <li>All prices listed on the website include applicable taxes and fees.</li>
            <li>Payments can be made using valid credit/debit cards, UPI, or other payment methods listed at checkout.</li>
            <li>ABC Cinema reserves the right to change ticket prices without prior notice.</li>
        </ul>

        <h2>4. Refund and Cancellation Policy</h2>
        <ul>
            <li>Tickets can be canceled up to 24 hours before the showtime for a partial refund.</li>
            <li>No refunds will be issued for cancellations made within 24 hours of the showtime.</li>
            <li>In case of show cancellation by ABC Cinema, a full refund will be processed automatically.</li>
        </ul>

        <h2>5. User Conduct</h2>
        <p>You agree not to use this website in any way that causes harm or disruption. Users must provide accurate personal information during the booking process.</p>

        <h2>6. Privacy Policy</h2>
        <p>Your personal data is handled in accordance with our <a href="#">Privacy Policy</a>. By using this website, you consent to the collection and use of your data.</p>

        <h2>7. Intellectual Property</h2>
        <p>All content on this website, including logos, text, graphics, and images, is the property of ABC Cinema and is protected under applicable copyright laws.</p>

        <h2>8. Changes to Terms</h2>
        <p>ABC Cinema reserves the right to modify these terms at any time. Users are encouraged to review the terms periodically for updates.</p>

        <h2>9. Contact Us</h2>
        <p>If you have any questions about these terms and conditions, please contact us at:</p>
        <ul>
            <li>Email: <a href="mailto:support@abccinema.com">support@abccinema.com</a></li>
            <li>Phone: 0781927719</li>
        </ul>
        <hr>
        <footer>
            <p>&copy; 2024 ABC Cinema. All rights reserved.</p>
        </footer>
    </div>
        <%@ include file="footer.jsp" %>
    </body>
</html>
