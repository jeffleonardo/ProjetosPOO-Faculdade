<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.text.NumberFormat"%>
<%@ page import="java.util.Locale"%>

<%
    double valor = 0;
    double juros = 0;
    double juros2 = 0;
    double juros3 = 0;
    int meses = 0;
    double taxa1 = 0;
    double taxa2 = 0;
    double parcela = 0;
    double devedor = 0;
    double parcela2 = 0;
    NumberFormat dinheiro = NumberFormat.getCurrencyInstance(new Locale("pt", "BR"));
    int i = 1;
    if (request.getParameter("valor") != null) {
        valor = Double.parseDouble(request.getParameter("valor"));
        juros = Double.parseDouble(request.getParameter("juros"));
        meses = Integer.parseInt(request.getParameter("meses"));
        juros2 = juros / 100;
       taxa1 = Math.pow((1 + juros2), meses) * juros2;
        taxa2 = Math.pow((1 + juros2), meses) - 1;
        parcela = valor * (taxa1 / taxa2);
        devedor = (valor - parcela);
        juros3 = valor * juros2;
        parcela2 = valor - devedor;
    }
%>

<html>
    <head>
        <title>Calculadora Price</title>

    </head>
    <body style="margin: 0;min-height:100%;
          position:relative;">

        <%@include file="WEB-INF/pages/header.jspf"%>
        <%@include file="WEB-INF/pages/form.jspf"%>
        
        <div style="margin-left: 20px;">
            <h4>
                Valor a financiar:
                <%=(dinheiro.format(valor))%></h4>
            <h4>
                Taxa de juros:
                <%=juros%>%
            </h4>
            <h4>
                meses:
                <%=meses%></h4>
     
  
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Período</th>
                        <th scope="col">Saldo Devedor</th>
                        <th scope="col">Parcela</th>
                        <th scope="col">Juros</th>
                        <th scope="col">Amortização</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <th scope="row">0</th>
                        <td><%=(dinheiro.format(valor))%></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>

                        <%
                            do {
                        %>
                        <%
                            valor = (valor + juros3) - parcela2;
                        %>
                        <th scope="row"><%=i%></th>

                        <td><%=(dinheiro.format(valor))%></td>

                        <td><%=(dinheiro.format(parcela2))%></td>

                        <td><%=(dinheiro.format(juros3))%></td>

                        <td><%=(dinheiro.format(parcela2 - juros3))%></td>

                        <%
                            juros3 = valor * juros2;
                        %>

                    </tr>

                    <%
                        devedor = valor;
                    %>
                    <%
                        devedor = valor - parcela;
                    %>
                    <%
                        i++;
                    %>
                    <%
                        } while (i <= meses + 2);
                    %>
                </tbody>
            </table>
        </div>
        <%@include file="WEB-INF/pages/footer.jspf"%>
    </body>
</html>