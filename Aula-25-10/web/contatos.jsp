<%-- 
    Document   : index
    Created on : 25 de out de 2021, 20:33:42
    Author     : t2s-user-cod218
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Contato"%>
<%@page import="model.Base"%>
<%@page import="model.Data"%>
<!DOCTYPE html>

<%
    String error = null;
    try{
        if(request.getParameter("form-add") != null){
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        int dia = Integer.parseInt(request.getParameter("dia"));
        int mes = Integer.parseInt(request.getParameter("mes"));
        int ano = Integer.parseInt(request.getParameter("ano"));
        Contato c = new Contato(nome, telefone, new Data(dia, mes, ano));
        Base.getContatosList().add(c);
        response.sendRedirect(request.getRequestURI());
    }else if(request.getParameter("form-remove") != null){
        int i = Integer.parseInt(request.getParameter("index"));
        Base.getContatosList().remove(i);
    }
    }catch(Exception ex){
        error = ex.getMessage();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contatos - Java OO</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>CONTATOS</h2>
        <%if(error != null){%><div style="color: red"><%= error %></div><%}%>
        <form>
            <fieldset>
                <legend>Novo Contato</legend>
                Nome:<br/><input type="text" name="nome" required/><br/>
                Telefone:<br/><input type="tel" name="telefone" required/><br/>
                Data Nascimento:<br/>
                <input type="number" step="1" name="dia" required/> /
                <input type="number" step="1" name="mes" required/> /
                <input type="number" step="1" name="ano" required/>
                <br/><br/>
                <input type="submit" name="form-add" value="Salvar" style="cursor: pointer;">
            </fieldset>
        </form><br/>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Nascimento</th>
                <th>Remover</th>
            </tr>
            <%for(Contato c: Base.getContatosList()){%>
            <tr>
                <td><%=c.getNome()%></td>
                <td><%=c.getTelefone()%></td>
                <td><%=c.getNascimento().getData()%></td>
                <td>
                    <form>
                        <input style="background-color: red; color: white; cursor: pointer; margin-left: 15px;" type="submit" name="form-remove" value=" X "/>
                        <input type="hidden" name="index" value="<%=Base.getContatosList().indexOf(c)%>">
                    </form>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
