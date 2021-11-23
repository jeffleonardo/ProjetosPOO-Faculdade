<%@page import="com.sun.org.apache.bcel.internal.generic.D2F"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    int n = 5;
    String error = null;
    if (request.getParameter("n") == null) {
        error = "Não foi informado o parâmetro necessários 'n'";
    } else {
        try {
            n = Integer.parseInt(request.getParameter("n"));
        } catch (Exception e) {
            error = "O parametro informado como parâmetro n (" + request.getParameter("n")
                    + ") não é um número inteiro válido";

        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JavaEE</h1>
        <h2>Java Server Pages</h2>
        <h3>Números aleatórios</h3>
        <h4><a href="index.html">Voltar</a></h4>
        <hr/>
        <%if (error != null) {%>
        <div style="color: red"><%=error%> </div>
        <%} else {%>
        <table border="1">
            <tr>
                <th>Índice</th>
                <th>Número</th>                
            </tr>
            <%for(int i = 0; i < disciplinas.size(); i++){%>
            <tr>
                <td><%= i %></td>
                <td><%=((int)(Math.random()* 100))%></td>                
            </tr>
            <%}%>
        </table>
        <hr/>
        <%}%>    
        <form action="random-list.jsp">
            <input type="number" name="n" value="<%=n%>"/>       
            <input type="submit" value="Gerar">
        </form>
    </body>
</html>
