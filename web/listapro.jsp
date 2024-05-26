<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de Produtos</title>
    </head>
    <body>
        <%
            try {
                // conex�o com o DB
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");
                // URL sempre � a mesma;
                // Pequeno bug encontrado:

                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "root", "%Amnc110%");
                st = conecta.prepareStatement("SELECT * FROM produto");
                // Aqui v�o os dados para colocar dentro dos ? que est�o na linha acima;
                ResultSet rs = st.executeQuery();

        %> 
        <table border="1" align="center" width="500" height="150">
            <tr>
                <th>Codigo</th><th>Titulo</th><th>autor</th><th>Genero</th><th>Ano publicacao</th><th>Numero paginas</th>
            </tr> 

            <%                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("isbn")%></td>
                <td><%= rs.getString("titulo")%></td>
                <td><%= rs.getString("autor")%></td>
                <td><%= rs.getString("genero")%></td>
                <td><%= rs.getString("ano_pub")%></td>
                <td><%= rs.getString("paginas")%></td>
            </tr>

            <%
                }
            %>
        </table>
        <%
        } catch (Exception x) {
            out.print(x.getMessage());

    }
        %>
    </body>
</html>
