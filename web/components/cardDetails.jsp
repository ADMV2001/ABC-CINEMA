<%-- 
    Document   : cardDetails
    Created on : Dec 14, 2024, 6:23:31 PM
    Author     : udari
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Payment Form</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cardDetails.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <%@ include file="nav.jsp"%>
        <div class="container">
            <h1>Payment Form Widget</h1>
                    
            <div class="payment-methods">
                <h2>Select Payment Methods</h2>
                <div class="methods">
                    <div class="method active">
                        <i class="fa-solid fa-credit-card"></i>
                        <p>Credit Card</p>
                    </div>
                    <div class="method">
                        <i class="fa-solid fa-building-columns"></i>
                        <p>Net Banking</p>
                    </div>
                    <div class="method">
                        <i class="fa-brands fa-paypal"></i>
                        <p>PayPal</p>
                    </div>
                    <div class="method">
                        <i class="fa-solid fa-credit-card"></i>
                        <p>Debit Card</p>
                    </div>
                </div>
            </div>
            
            <form action="${pageContext.request.contextPath}/components/bookingConfirm.jsp" method="post">
                <!-- Credit Card Information -->
                <h2 class="form-heading">Credit Card Info</h2>
                
                <label for="card-name" class="form-label">Name on Card</label>
                <input class="cd-input" type="text" id="card-name" placeholder="Name on card" required>
                
                <label for="card-number" class="form-label">Card Number</label>
                <input class="cd-input" type="text" id="card-number" placeholder="XXXX XXXX XXXX XXXX" maxlength="19" required>
                
                <div class="row">
                    <div class="col">
                        <label for="expiration" class="form-label">Expiration</label>
                        <input class="cd-input" type="text" id="expiration" placeholder="MM/YY" maxlength="5" required>
                    </div>
                    <div class="col">
                        <label for="cvv" class="form-label">CVV Number</label>
                        <input class="cd-input" type="text" id="cvv" placeholder="XXX" maxlength="3" required>
                    </div>
                </div>
                            
                <button class="cd-button" type="submit">Submit</button>
            </form>
        </div> 
                
        <%@ include file="footer.jsp" %>
    </body>
</html>
