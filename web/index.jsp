<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/nav.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/slider.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/components/footer.css"/>
        
        <title>ABC Cinema | Home</title>
    </head>
    <body style="background-color:black">
        <%@ include file="components/nav.jsp"%>
        
        <%@ include file="components/slider.jsp" %>
        
        <%@ include file="movieSection.jsp" %>
        
        <%@ include file="components/footer.jsp" %>
    </body>
</html>
