
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Produtos</title>
    </head>
    <body>
        <%
        int isbn;
        String titulo;
        
        isbn = Integer.parseInt(request.getParameter("isbn"));
        titulo = request.getParameter("titulo");
        
                
        
        try {
            // conex�o com o DB
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.jdbc.Driver");
            // URL sempre � a mesma;
            // Pequeno bug encontrado:
           
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco","root", "%Amnc110%");
            st = conecta.prepareStatement("DELETE FROM produto WHERE isbn = ? or titulo = ?");
            st.setInt(1, isbn);
            st.setString(2, titulo);
           
	    
            
            // Isso executa o codigo SQL
            st.executeUpdate();
            out.print("Livro removido!");
            } catch (Exception x) {
                out.print(x.getMessage());
            }
            %>
    </body>
</html>
