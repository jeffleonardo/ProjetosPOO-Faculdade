<%-- 
    Document   : horario
    Created on : 31 de out de 2021, 22:31:52
    Author     : t2s-user-cod218
--%>

<%@page import="model.Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Horario time = new Horario();
    time.setHora(12);
    time.setMinutos(30);
    time.setSegundos(59);
    
    Horario intervalo = new Horario(20,30,00);
    

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>Horários</h2>
        <br/>
        
        <h3>Horário Atual</h3>
        <div><%= time.horarioAtual()%></div>
        <h3>Horário Intervalo</h3>
        <div><%= intervalo.getHorario() %></div>
        
    </body>
</html>
