<%-- 
    Document   : faq
    Created on : 16 Dec 2024, 12:00:34 pm
    Author     : TestUser
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/faq.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
    <title>Frequently Asked Questions</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <%@ include file="nav.jsp"%>
    <div class="faq-page">
       
        <div class="faq-header">Frequently Asked Questions</div>
        <div class="faq-subtext">Clearing up common queries about ABC Cinema.</div>

        
        <div class="faq-content">
           
            <div class="faq-image">
                <img src="https://cdni.iconscout.com/illustration/premium/thumb/faq-illustration-download-in-svg-png-gif-file-formats--customer-questions-and-answers-helpdesk-pack-network-communication-illustrations-3749051.png?f=webp" alt="faq image">
            </div>
            
            
            <div class="faq-details">
               
                <div class="faq-item">
                    <div class="faq-question">
                        <span>What is ABC Cinema?</span>
                        <span class="faq-icon">+</span>
                    </div>
                    <div class="faq-answer">
                        ABC Cinema is an online entertainment portal tied up with leading theaters across Sri Lanka to provide users the convenience of online ticket booking almost anywhere.
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span>How do I book tickets online?</span>
                        <span class="faq-icon">+</span>
                    </div>
                    <div class="faq-answer">
                        To book movie tickets, go to "Buy Movie Tickets" link on the website main menu, select the movie from the drop-down menu, choose a convenient date and show time, your preferred seats and it’s done!
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span>How does seat allocation work?</span>
                        <span class="faq-icon">+</span>
                    </div>
                    <div class="faq-answer">
                        After you have selected the movie, date, showtime and number of tickets you wish to purchase, you will be presented with a graphical representation of the theater seating layout.                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span>How many tickets can I buy online in one transaction?</span>
                        <span class="faq-icon">+</span>
                    </div>
                    <div class="faq-answer">
                        The total number of tickets that can be purchased online in one transaction cannot exceed 20. This is to assist with security and prevention of fraud.
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span>How can I confirm that my tickets have been booked?</span>
                        <span class="faq-icon">+</span>
                    </div>
                    <div class="faq-answer">
                        After you complete your booking, you will receive a confirmation Email and SMS. The confirmation Email and SMS will provide all the details of your booking
                    </div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        <span>When and where do I collect my movie tickets?</span>
                        <span class="faq-icon">+</span>
                    </div>
                    <div class="faq-answer">
                        Once your booking is confirmed, you will receive the confirmation Email and SMS along with a reference number and a QR link. You need to present the reference number/QR link at the theater counter to collect your move tickets.
                    </div>
                </div>
                <div class="faq-item">
                    <div class="faq-question">
                        <span>How secure are my credit card and other personal details?</span>
                        <span class="faq-icon">+</span>
                    </div>
                    <div class="faq-answer">
                        Our online ticket booking system has security measures in place to protect the customer from loss, misuse and alteration of the information under our control. The secure server software, Secure Socket Layers (SSL) is among the best available for secure commerce transactions.</div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp" %>

    <script>document.addEventListener('DOMContentLoaded', () => {
        const faqItems = document.querySelectorAll('.faq-item');
    
        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            const answer = item.querySelector('.faq-answer');
    
            question.addEventListener('click', () => {
                const isActive = item.classList.contains('active');
    
                // Collapse all items except the clicked one
                faqItems.forEach(faq => {
                    if (faq !== item) {
                        faq.classList.remove('active');
                        const faqAnswer = faq.querySelector('.faq-answer');
                        faqAnswer.style.height = '0';
                    }
                });
    
                // Toggle the clicked FAQ
                if (!isActive) {
                    item.classList.add('active');
                    answer.style.height = `${answer.scrollHeight}px`; // Dynamically set height
                } else {
                    item.classList.remove('active');
                    answer.style.height = '0'; 
                }
            });
    
            // Initialize collapsed state for all answers
            answer.style.height = '0';
            answer.style.overflow = 'hidden';
        });
    });
    </script>
</body>
</html>
