
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
        
        titulo = request.getParameter("titulo");
        autor = request.getParameter("autor");
        genero = request.getParameter("genero");
        anopub = request.getParameter("anopub");
        nmpag = Integer.parseInt(request.getParameter("nmpag"));
        isbn = Integer.parseInt(request.getParameter("isbn"));
        
                
        
        try {
            // conex�o com o DB
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.jdbc.Driver");
            // URL sempre � a mesma;
            // Pequeno bug encontrado:
           
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco","root", "%Amnc110%");
            st = conecta.prepareStatement("UPDATE produto set titulo = ?, autor = ?, genero = ?, ano_pub = ?, paginas = ? where isbn = ?");
            st.setString(1, titulo);
            st.setString(2, autor);
            st.setString(3, genero);
            st.setString(4, anopub);
            st.setInt(5, nmpag);
            st.setInt(6, isbn);
            
           
	    
            
            // Isso executa o codigo SQL
            st.executeUpdate();
            out.print("Livro modificado!");
            } catch (Exception x) {
                out.print(x.getMessage());
            }
            %>
    </body>
</html>
