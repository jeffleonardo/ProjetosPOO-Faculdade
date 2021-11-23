<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Calendario</title>
    </head>
    <body>
        <h1> Calendário</h1>
        <%

            int mes = Integer.parseInt(request.getParameter("mes"));
            int mes2 = mes;
            int ano = Integer.parseInt(request.getParameter("ano"));
            int ano2 = ano;
            int dia = 1;
        %>

        <div> Calendário Mês <%= mes2%> de <%= ano2%></div>



        <table border="2" style="border-collapse: collapse;">
            <tr>
                <th> Domingo</th>
                <th> Segunda </th>
                <th> Terça </th>
                <th> Quarta </th>
                <th> Quinta </th>
                <th> Sexta </th>
                <th> Sábado </th>
            </tr>


            <tr>
                <td> </td>
                <td><%= dia%> </td>
                <td> <%= dia + 1%></td>
                <td> <%=dia + 2%></td>
                <td><%=dia + 3%></td>
                <td> <%=dia + 4%></td>
                <td><%=dia + 5%></td>
            </tr>


            <% for (int i = 1; i <= 4; i++) { %>
            
            <tr>
                <td><% if (i * 7 < 31) {%> <%= (i * 7)%> <%} %>  </td>
                <td><% if ((i * 7) < 31) {%> <%= ((i) * 7) + 1%> <%} %>  </td>
                <td><% if ((i * 7) + 2 < 31) {%> <%= ((i) * 7) + 2%> <%} %>  </td>
                <td><% if ((i * 7) + 3 < 32) {%> <%= ((i) * 7) + 3%> <%} %>  </td>
                <td><% if ((i * 7) + 4 < 32) {%> <%= ((i) * 7) + 4%> <%} %>  </td>
                <td><% if ((i * 7) + 5 < 32) {%> <%= ((i) * 7) + 5%> <%} %>  </td>
                <td><% if ((i * 7) + 6 < 32) {%> <%= ((i) * 7) + 6%> <%} %>  </td>

                <%}%>
            </tr>
        </table><b><b>
            <a href="index.html">Voltar</a>
    </body>
</html>
