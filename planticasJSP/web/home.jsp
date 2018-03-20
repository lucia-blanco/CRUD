<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
	<title>Planticas</title>
	<script type="text/javascript" src="registro.js"></script>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<title>Home</title>
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
	<main role="main">
		<div class="jumbotron">
			<div class="container">
				<% 
            out.println("<h1 id='bienvenida' class='display-3'> Hola, " + dato.getString("alias") + "</h1>");
          }
          conexion.close();
        %>
				<p>¿Qué te apetece plantar hoy?</p>
				<span>
					<a id="button" class="btn btn-primary btn-lg" style="width:20%;" href="nuevohuerto.jsp?alias=<%=username%>">Nuevo Huerto</a>
				</span>
			</div>
		</div>
		<div class="container">
			<div class="row">
					<%
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
          Statement s2 = conexion2.createStatement();
          
          ResultSet huertos = s2.executeQuery("SELECT * FROM huerto H JOIN usuario U ON (U.idUsuario=H.idUsuario) WHERE alias ='" + username + "' ");

          while (huertos.next()) {  
            int hid = huertos.getInt("idHuerto");
            String h = huertos.getString("nomHuerto");
          %>
            <div class="col-md-4">
              <div class="card mb-4" style="width: 18rem;">
                <div class="card-img-top img-huerto" alt="Imagen del huerto"></div>
						  <div class="card-body">
						    <h5 class="card-title"><%=h%></h5>
						    <a style="width:50%" id="button" class="btn" href="huerto.jsp?idHuerto=<%=hid%>&alias=<%= request.getParameter("alias")%>">Ir al huerto</a>
		  				</div>
						</div>
					</div>
					<%
          }
          conexion2.close();
        %>
		</div>
	</main>
</body>
</html>