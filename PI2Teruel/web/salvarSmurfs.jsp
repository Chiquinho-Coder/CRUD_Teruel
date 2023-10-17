<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="configura.css"/>
        <title>JSP Page</title>
    </head>
    <body class="wpp">
        <div class="save">
        <%
            //Receber os dados digitados no formulário cadpro.html
           
            int c;
            String n, m, l;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("tipo");
            p = Double.parseDouble(request.getParameter("quantidade"));
            l = request.getParameter("local");
            
            
            try {
               
            //Fazer a conexão com o Banco de Dados
               
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
               
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco", "root", "@Pedro2003456");
                //Inserir os dados na tabela produto do banco de dados aberto
               
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?,?)");
                st.setInt(1, c);
                st.setString(2, n);
                st.setString(3, m);
                st.setDouble(4, p);
                st.setString(5, l);
                st.executeUpdate(); //Executa o comando INSERT
                out.print("Smurf catalogado com sucesso");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color:red;font-size:30px'>Este produto já está cadastrado</p>");
                } else {
                    out.print("<p style='color:red;font-size:30px'>Vixi rapaz deu erro: " + erro + "</p>");
                }

            }
        %>
        </div>
    </body>
</html>
