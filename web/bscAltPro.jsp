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
            int isbn, nmpag;
            String titulo, autor, genero, anopub;
            
            isbn = Integer.parseInt(request.getParameter("isbn"));
            titulo = request.getParameter("titulo");
            autor = request.getParameter("autor");
            genero = request.getParameter("genero");
            anopub = request.getParameter("anopub");
            nmpag = Integer.parseInt(request.getParameter("nmpag"));
            
            try {
                // conex�o com o DB
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.jdbc.Driver");
                // URL sempre � a mesma;
                // Pequeno bug encontrado:

                conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco", "root", "%Amnc110%");
                st = conecta.prepareStatement("SELECT * ");
                // Aqui v�o os dados para colocar dentro dos ? que est�o na linha acima;
                st.setInt(1, isbn);
                
                
                ResultSet rs = st.executeQuery();

        %> 
        <table border="1" align="center" width="500" height="150">
            <iframe> </iframe>
            
            <tr>
                <th>Codigo</th><th>Titulo</th><th>autor</th><th>Genero</th><th>Ano publicacao</th><th>Numero paginas</th>
            </tr> 

            <%  
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
                
            %>
        </table>
        <%
        } catch (Exception x) {
            out.print(x.getMessage());

    }
        %>
    </body>
</html>
