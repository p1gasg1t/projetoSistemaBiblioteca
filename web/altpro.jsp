<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                st = conecta.prepareStatement("UPDATE produto WHERE");
                // Aqui v�o os dados para colocar dentro dos ? que est�o na linha acima;
                st.executeUpdate();
            } catch (Exception x) {
            out.print(x.getMessage());
    }
        %> 
        <main>
            <!-- Forma pra apresentar os dados para a busca -->
            <iframe src="listapro.jsp"></iframe>
            
            <% out.print("Testando");%>
            
        </main>
        
    </body>
</html>
