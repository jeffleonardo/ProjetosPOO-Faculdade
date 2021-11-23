<%-- 
    Document   : index
    Created on : 27 de set. de 2021, 20:00:26
    Author     : Windows 10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="fatec icon" href="imagem/favicon.png"/>
    </head>
    <body style="margin: 0;">

        <%@include file="WEB-INF/pages/header.jspf" %>
        <div style="width: 300px; margin: 0 auto; margin-top: 100px">
            <table borde="1">
                <%if (sessionName != null && usersOnline != null) {%>
                <tr>
                    <th style="background-color: #48D1CC; text-align: center;">
                        Usuários Online <%=usersOnline.size()%>
                    </th>
                </tr>
                <%for (int i = 0; i < usersOnline.size(); i++) {%>
                <tr>
                    <td style="text-align: center;">
                        <%=usersOnline.get(i)%>
                    </td>
                </tr>
                <%}%>        
            </table>   
            <%}%>              
        </div>
        <%@include file="WEB-INF/pages/footer.jspf" %>
    </body>
</html>
