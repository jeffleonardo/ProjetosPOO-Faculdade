<%-- 
    Document   : jefferson
    Created on : 27 de set. de 2021, 20:11:49
    Author     : Windows 10
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sobre Mim</title>
        <link rel="fatec icon" href="imagem/favicon.png"/>
    </head>
    <body style="margin: 0;">
        <%@include file="WEB-INF/pages/header.jspf" %>              
        <%
            List<String> disciplinas = new ArrayList<>();
            disciplinas.add("Programação Orientada a Objetos");
            disciplinas.add("Engenharia de Software III");
            disciplinas.add("Linguagem de Programação - Internet");
            disciplinas.add("Sistemas Operacionais II");
            disciplinas.add("Metodologia da Pesquisa Científico-Tecnológica");
            disciplinas.add("Inglês IV");
            disciplinas.add("Banco de Dados");
        %>        
        <%if (sessionName == null) {%>
        <div style='color:red'>Você não tem permissão para acessar esta página</div>
        <%} else {%>
        <hr>
        <div style="margin: 0 auto; width: 500px; margin-top: 40px; text-align: center">
            <h4>Jefferson Leonardo da Silva</h2>
            <h5>RA: 1290482013048</h3>
            <a href="https://github.com/jeffleonardo" target="_blank"><img src="imagem/github.jpg"/> </a>
        </div>
        <table border="1" style="border-collapse: collapse; width: 500px; margin: 0 auto;">
            <thead>
                <tr style="background-color: #81BEF7; font-size: 20px;">                  
                    <th style="text-align: center;">Disciplinas Fatec 4º Ciclo</th> 
                </tr>
            </thead>
            <tbody>
                <%for (int i = 0; i < disciplinas.size(); i++) {%>
                <tr style="background-color: #E6E6E6; ">
                    <td style="padding: 5px; font-size: 20px"><%=disciplinas.get(i)%></td>
                </tr>
                <%}%>
            </tbody>
        </table>

        <%}%>

        <%@include file="WEB-INF/pages/footer.jspf" %>
    </body>
</html>
