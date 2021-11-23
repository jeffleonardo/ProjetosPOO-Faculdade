<%@page import="java.util.Arrays"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
  
    String name = String.valueOf(session.getAttribute("name"));
    String password = String.valueOf(session.getAttribute("password"));
    Boolean sessionActive = name != "null" && password != "null";
    
    
    String nameRequest = String.valueOf(request.getParameter("name"));
    String passwordRequest = String.valueOf(request.getParameter("password"));
    Boolean isValid = nameRequest != "null" && passwordRequest != "null";
    
   
    String listNums = String.valueOf(session.getAttribute(nameRequest == "null" ? name : nameRequest));
    List<String> listFixed = new ArrayList();
    
    if(listNums != "null"){
        String formatList = listNums.replace("[", "").replace("]", "");
        listFixed = Arrays.asList(formatList.split(",",-1));
    }
    
    if (isValid) {
        session.setAttribute("name", nameRequest);
        session.setAttribute("password", passwordRequest);
        if (listNums == "null") {
            Random numRandom = new Random();
            List<Integer> list = new ArrayList();
            for (Integer i = 0; i < 6; i++) {
                list.add(1+ numRandom.nextInt(59));
            }
            session.setAttribute(nameRequest, String.valueOf(list));
        }
        response.sendRedirect("index.jsp");
    }    
    
    String logout = String.valueOf(request.getParameter("logout"));
    if (logout != "null") {
        session.removeAttribute("name");
        session.removeAttribute("password");
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de acesso</title>
        
    </head>
    <body style="margin: 0 auto;">
        <%@include file="WEB-INF/pages/header.jspf" %>
        <div>
            <%if (!sessionActive) {%>
            <form action="index.jsp" style="width: 200px; margin: 0 auto;">
                <div>
                    <label for='name'>Usuário</label><br>
                    <input required type='text' id='name' name='name' style="padding: 5px; width: 200px;"/>
                </div><br>
                <div>
                    <label for='password'>Senha</label><br>
                    <input required type='password' name='password' id='password' style="padding: 5px; width: 200px;"/>
                </div><br>
                <input type='submit' value='Logar' style="margin-left: 75px; cursor: pointer; "/>
            </form>
            <%} else {%>
            Olá <%=name%>
                <table>
                    <tbody>
                        <% for (int i = 0; i < listFixed.size(); i++) { %>
                            <tr>
                                <th><%=i+1%></th>
                                <th><%=listFixed.get(i)%></th>
                            </tr>
                        <%}%>
                    </tbody>
                </table>
            <%}%>
        </div>
        <%@include file="WEB-INF/pages/footer.jspf" %>
    </body>
</html>