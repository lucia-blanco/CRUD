<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/usuario.css">
    <script
    src="https://code.jquery.com/jquery-3.3.1.min.js"
    integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
    crossorigin="anonymous"></script>
  
    
    <title></title>
  </head>

  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      // Comprueba la existencia del mail y alias introducidos
      String consultaAlias = "SELECT * FROM usuario WHERE alias='"+ request.getParameter("alias") + "'";      
      
      ResultSet existeAlias = s.executeQuery (consultaAlias);
      existeAlias.last();

      if (existeAlias.getRow() != 0) {
         response.sendRedirect("registro.jsp?a=cambia");
      } else {
        String consultaMail = "SELECT * FROM usuario WHERE email='"+ request.getParameter("mail") + "'";      
        
        ResultSet existeMail = s.executeQuery (consultaMail);
        existeMail.last();

        if (existeMail.getRow() != 0) {
         response.sendRedirect("registro.jsp?m=cambia");
        } else { 
        String insercion = "INSERT INTO usuario (alias, passw, email) VALUES ("
          
          + " '" + request.getParameter("alias")
          + "', '" + request.getParameter("password")
          + "', '" + request.getParameter("mail") + "')";
        s.execute(insercion);
        response.sendRedirect("home.jsp?alias=" + request.getParameter("alias"));
      }
      }
      conexion.close();
    %>
  </body>
</html>
