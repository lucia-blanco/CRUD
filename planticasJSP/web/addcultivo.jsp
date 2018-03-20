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
  
    
    <title>Añade Cultivo al huerto</title>
</head>


<body>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%
    String username = request.getParameter("alias");
    int idC = Integer.parseInt(request.getParameter("idCultivo"));
    int idH = Integer.parseInt(request.getParameter("idHuerto"));
    out.println(username);
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
    Statement s = conexion.createStatement();
    
    String insercion = "INSERT INTO siembra (cultivo_idCultivo, huerto_idHuerto) VALUES ("      + " '" + idC   
      + "', '" + idH + "')";
    
    s.execute(insercion);
    response.sendRedirect("cultivo.jsp?alias=" + username + "&idHuerto=" + request.getParameter("idHuerto"));
    conexion.close();
  %>
  </body>
</html>