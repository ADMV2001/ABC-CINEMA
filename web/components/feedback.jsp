<%-- 
    Document   : feedback
    Created on : Dec 14, 2024, 7:06:16 PM
    Author     : udari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/feedback.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        
        
        <title>Feedback Page</title>
    </head>
    <body>
        <%@ include file="nav.jsp"%>
        <div class="container">
        <h1 style="color:red;">We Value Your Feedback</h1>
        <p style="color:white">Please let us know about your experience.</p>

        <form id="feedback-form">
            <label class="feed-label" for="name">Your Name:</label>
            <input class="feed-input" type="text" id="name" name="name" placeholder="Enter your name" required>

            <label class="feed-label" for="email">Your Email:</label>
            <input class="feed-input" type="email" id="email" name="email" placeholder="Enter your email" required>

            <label class="feed-label" for="rating">Rate Your Experience:</label>
            <select id="rating" name="rating" required>
                <option value="">Select Rating</option>
                <option value="5">Excellent</option>
                <option value="4">Good</option>
                <option value="3">Average</option>
                <option value="2">Poor</option>
                <option value="1">Terrible</option>
            </select>

            <label class="feed-label" for="comments">Additional Comments:</label>
            <textarea id="comments" name="comments" rows="5" placeholder="Write your feedback here..."></textarea>

            <button class="feed-btn" type="submit">Submit Feedback</button>
        </form>

        <div class="success-message" id="success-message">
            Thank you for your feedback!
        </div>

        <div class="error-message" id="error-message">
            Oops! Something went wrong. Please try again.
        </div>
    </div>
        <%@ include file="footer.jsp" %>
    <script>
        const form = document.getElementById('feedback-form');
        const successMessage = document.getElementById('success-message');
        const errorMessage = document.getElementById('error-message');

        form.addEventListener('submit', function(event) {
            event.preventDefault();

            successMessage.style.display = 'block';
            errorMessage.style.display = 'none';

            // Reset form after submission (for demonstration purposes)
            form.reset();
        });
    </script>
    </body>
</html>
