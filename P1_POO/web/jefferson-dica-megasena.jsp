<%-- 
    Document   : jefferson-dica-megasena
    Created on : 27 de set. de 2021, 20:14:00
    Author     : Windows 10
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    List<Integer> numerosSorteio = (List) session.getAttribute("nums");   
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Megasena</title>
        <link rel="fatec icon" href="imagem/favicon.png"/>
    </head>
    <body style="margin: 0; padding: 0">

        <%@include file="WEB-INF/pages/header.jspf" %>

        <%if (sessionName == null) { %>
        <div style="color:red">Você não tem permissão para acessar esta página</div>            
        <%} else {%>

        <table style="margin: 0 auto; width: 500px; margin-top: 100px;">
            <thead>
                <tr style="background-color: #28ff86; font-size: 40px">
                    <th colspan="2" style="font-family:futura-lt-bold; padding: 10px; text-align: center;">Números Megasena</th>                
                </tr>
            </thead>  
            <tbody>
                <% for(int i = 0; i < 6; i++){%>               
                <tr style="background-color: #E6E6E6; ">
                    <td style="padding: 10px; font-size: 20px; width: 200px; text-align: center"><%= (i + 1)%></td>
                    <td style="padding: 10px; font-size: 20px; text-align: center"><%=numerosSorteio.get(i)%></td>                
                </tr>                    
                <%}%> 
            </tbody>
        </table>
        <%}%>        
        <%@include file="WEB-INF/pages/footer.jspf" %>
    </body>
</html>
