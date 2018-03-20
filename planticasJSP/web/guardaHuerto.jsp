<%@page import="java.sql.PreparedStatement"%>
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
  
    
    <title>Guarda Huerto</title>
</head>


<body>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%
    String username = request.getParameter("alias");
    out.println(username);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
    Statement s = conexion.createStatement();

    String nuevohuerto = "SELECT * FROM usuario WHERE alias='"+ username + "'";      
      
    ResultSet existe = s.executeQuery (nuevohuerto);
    existe.last();
      
    String insercion = "INSERT INTO huerto (idUsuario, nomHuerto) VALUES ("                 
      + " '" + existe.getInt("idUsuario")   
      + "', '" + request.getParameter("huerto") + "')";
    s.execute(insercion);
    response.sendRedirect("home.jsp?alias=" + request.getParameter("alias"));
    conexion.close();
  %>
  </body>
</html>
