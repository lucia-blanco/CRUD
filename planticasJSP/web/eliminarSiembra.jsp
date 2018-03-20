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
  
    
    <title>Elimina Siembra</title>
</head>


<body>
    <%
      //String alias = request.getParameter("alias");
      /*int id = Integer.parseInt(request.getParameter("idSiembra"));
      out.println(id);*/
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
      Statement s = conexion.createStatement();
      String query = "DELETE FROM siembra WHERE idSiembra= '" + request.getParameter("idSiembra") + "' ";

      int i = s.executeUpdate(query);

      s.close();
      response.sendRedirect("huerto.jsp?idHuerto=" + request.getParameter("idHuerto") + "&alias=" + request.getParameter("alias"));
    %>	
  </body>
</html>