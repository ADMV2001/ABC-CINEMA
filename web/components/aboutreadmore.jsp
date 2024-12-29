<%-- 
    Document   : aboutreadmore.jsp
    Created on : Dec 16, 2024, 3:59:19 PM
    Author     : abiru
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aboutreadmore.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        <title>About Us - More</title>
    </head>
    <body>
        <%@ include file="nav.jsp"%>
       <header class="header">
           <div class="container">
               <h1>About ABC Cinema</h1>
               <p>Where Entertainment Meets Luxury</p>
           </div>
       </header>


       <section class="about-section">
           <div class="container">

               <div class="content">
                   <h2>Welcome to the Future of Cinema</h2>
                   <p>
                       At <strong>ABC Cinema</strong>, we bring you a premium movie-going experience like no other. Designed for those who seek luxury, comfort, and privacy, our cinema offers state-of-the-art technology, exclusive seating, and personalized services.
                   </p>

                   <h3>What Makes Us Special?</h3>
                   <ul>
                       <li><strong>Private Seating:</strong> Enjoy unmatched privacy in our cozy, couple-friendly seating pods.</li>
                       <li><strong>4K Visuals & Surround Sound:</strong> Immerse yourself in crystal-clear visuals and world-class audio.</li>
                       <li><strong>Gourmet Snacks:</strong> Delight in an exclusive menu of snacks and beverages delivered right to your seat.</li>
                       <li><strong>VIP Experience:</strong> Book private screening halls for special occasions or events.</li>
                   </ul>

                   <p>
                       At ABC Cinema, we redefine movie nights with a touch of elegance. Whether you're here for a romantic date, a family outing, or a solo retreat, your comfort is our priority.
                   </p>
                   <button class="book-now-btn">Book Your Experience</button>
               </div>


               <div class="image">
                   <img src="images/about-image.jpg" alt="ABC Cinema Luxury">
               </div>
           </div>
       </section>


       <footer class="footer">
           <div class="container">
               <p>&copy; 2024 ABC Cinema. All Rights Reserved.</p>
           </div>
       </footer>
    </body>
</html>
