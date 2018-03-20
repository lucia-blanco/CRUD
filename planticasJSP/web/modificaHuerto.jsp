<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
  <link rel="shortcut icon" href="favicon.ico">
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Grand+Hotel|Montserrat" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="style.css">

  <!-- jQuery library -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <!-- Latest compiled JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <title>Nuevo Huerto</title>
</head>

<body>
  <% request.setCharacterEncoding("UTF-8"); %>
  <%      
    String username = request.getParameter("alias");
    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
    Statement s = conexion.createStatement();
    ResultSet dato = s.executeQuery("SELECT * FROM usuario WHERE alias= '" + username + "' ");
    while (dato.next()) {
  %>
  <nav class="navbar navbar-expand-md fixed-top">
		<a href="home.jsp?alias=<%=username%>" id="logo-navbar">Planticas</a>
    <a href="index.jsp" id="salir" class="col-11 d-flex justify-content-end">Sign out</a>
	</nav>
    <% 
      }
      conexion.close();
      int idH = Integer.parseInt(request.getParameter("idHuerto"));
      out.println(idH);
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
      Statement n = conexion2.createStatement();
      ResultSet hu = n.executeQuery("SELECT * FROM huerto WHERE idHuerto= '" + idH + "' ");
      while (hu.next()) {
    %>
  <main role="main">
     <div class="jumbotron mb-5">
      <div class="container">
        <h3 id="bienvenida" class="display-4"><%=hu.getString("nomHuerto")%></h3>
        <p>Aquí puedes hacer pequeños cambios sobre el huerto</p>
      </div>
    </div>
    <div class="container mt-6">
      <form action="guardamodHuerto.jsp?" method="get" accept-charset="utf-8"  class="form-inline">
        <div class="form-group mx-sm-5 mb-2">
          <% 
            
          %>
          <input type="text" style="display: none" class="form-control" id="nombre" placeholder="" name="idHuerto" value="<%= idH%>">
          <input type="text" style="display: none" class="form-control" id="nombre" placeholder="" name="alias" value="<%= username%>">
          <label for="huerto" class="col-sm-6 col-form-label">Nuevo nombre del huerto</label>
          <input type="text" class="form-control" id="nombre" placeholder="" name="nombre" value="<%= hu.getString("nomHuerto")%>">
          <% 
            }
            conexion2.close();
          %>
        </div>
        <button type="submit" id="button" style="width: 10%" class="btn">Guardar</button>
      </form>
    </div>
    
  </main>
</body>
</html>