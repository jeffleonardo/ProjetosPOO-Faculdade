<%-- 
    Document   : index
    Created on : 25 de out de 2021, 20:33:42
    Author     : t2s-user-cod218
--%>
<%@page import="model.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  Data padrao = new Data();  
  
  Data hoje = new Data();
  hoje.setDia(25);
  hoje.setMes(10);
  hoje.setAno(2021);
  
  Data jeffersonNiver = new Data(11, 10, 1991);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Data - Java OO</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>DATA</h2>
        <h3>Data de hoje</h3>
        <div><%=hoje.dataAtual()%></div>
        <h3>Data Padrão</h3>
        <div><%=padrao.getDia()%>/<%=padrao.getMes()%>/<%=padrao.getAno()%></div>
        <h3>Data do meu Aniversário</h3>
        <div><%=jeffersonNiver.getData()%></div>
    </body>
</html>
