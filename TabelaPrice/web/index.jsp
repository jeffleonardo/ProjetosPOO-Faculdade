<%-- 
    Document   : index
    Created on : 13 de set. de 2021, 20:05:47
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOME</title>
    </head>
    <body style="margin: 0;">
        <%@include file="WEB-INF/pages/header.jspf" %>
        <h1 style="text-align: center;">Jefferson Leonardo da Silva RA:1290482013048</h1>
        <hr/> 
        <div style="width: 100vw;
             display: flex;
             flex-direction: row;
             justify-content: center;
             align-items: center;">
            <div style="width:350px;
                 height: 300px;">
                <h2>Cálculo de amortização de juros</h2>
                <a href="tabela-price.jsp" style="margin-left: 150px; text-decoration: none; background-color: #5858FA; padding: 5px;
                   color: white; border-radius: 5px;">Avançar</a>                
            </div> 
        </div>      
        <%@include file="WEB-INF/pages/footer.jspf" %>
    </body>
</html>
