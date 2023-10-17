<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="configura.css"/>
        <title>Alteração de produtos</title>
    </head>
    <body class="wpp"> <div class="sucesso">
        <%
            //Receber os dados ALTERADOS no formulário carregaprod.jsp
            int c;
            String n, m, l;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            l = request.getParameter("local");
            p = Double.parseDouble(request.getParameter("quantidade"));
           try{
            //Fazer a conexão com o Banco de Dados
            Connection conecta;
            PreparedStatement st;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "@Pedro2003456");
            //Alterar o sdados na tabela produtos do BD
            st = conecta.prepareStatement("UPDATE produto SET nome = ?, marca = ?, local = ?, quantidade = ? WHERE codigo = ?");
            st.setString(1, n);
            st.setString(2, m);
            st.setString(3, l);
            st.setDouble(4, p);
            st.setInt(5, c);
            st.executeUpdate(); //Executa o UPDATE
            out.print("Os dados do Smurf " + c + " foram alterados com sucesso");
       } catch (Exception erro){
          out.print ("Entre em contato com o suporte e informe o erro " + erro.getMessage());
       }
%>    
        </div>
    </body>
</html>
