<%@page import="com.sun.org.apache.bcel.internal.generic.D2F"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>JavaEE</h1>
        <h2>Java Server Pages</h2>
        <h3>Data/Hora do servidor</h3>
        <h4><a href="index.html">Voltar</a></h4>
        <hr/>
        <div>
            <%
                Date now = new Date();
                out.println(now);
            %>            
        </div>
    </body>
</html>
