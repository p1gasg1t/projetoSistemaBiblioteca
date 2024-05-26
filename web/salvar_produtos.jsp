<%-- 
    JSP � um arquivo HTML que permite a linguagem java
--%>

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
            // Importar os c�digos dentro do cadpro.html
            // As variav�is que eu tenho aqui precisam ser iguais aos parametros definidos em cadpro.html
            int isbn;
            String titulo, autor, anopub, genero;
            int nmpag;
            
            // Nessas linhas eu recebo os dados inseridos dentro do cadpro.html, precisa ser declarado de acordo com o DB
            isbn = Integer.parseInt(request.getParameter("isbn"));
            titulo = request.getParameter("titulo");
            genero = request.getParameter("genero");
            autor = request.getParameter("autor");
            anopub = request.getParameter("anopub");
            nmpag = Integer.parseInt(request.getParameter("nmpag"));
            
            // TRY para tentar conectar, catch SE DER ERRO ele vai printar a linha com o erro!
            // No catch, ele guarda o erro na variavel X e mostra a mensagem de erro
            try {
            // conex�o com o DB
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.jdbc.Driver");
            // URL sempre � a mesma;
            // Pequeno bug encontrado:
            /*
                Quando for adicionar a URL da database, precisa ser adicionado o IP de conex�o, n�o localhost
                J� me encontrei com esse problema, achei que localhost seria viavel de adicionar, mas pelo visto
                preciso adicionar o endere�o de IP do banco de dados
                no caso, o IP sempre vai ser: 127.0.0.1:3306, esse IP j� cont�m a porta
            */
            conecta = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/banco","root", "%Amnc110%");
            st = conecta.prepareStatement("INSERT INTO produto VALUES (?,?,?,?,?,?)");
            st.setInt(1, isbn);
            st.setString(2, titulo);
            st.setString(3, genero);
            st.setString(4, autor);
            st.setString(5, anopub);
            st.setInt(6, nmpag);
            
            // Isso executa o codigo SQL
            st.executeUpdate();
            out.print("Livro Cadastrado!");
            } catch (Exception x) {
                out.print(x.getMessage());
            }
        %>
    </body>
</html>
