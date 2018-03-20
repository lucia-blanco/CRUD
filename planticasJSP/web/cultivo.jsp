<%@page import="java.sql.*"%>
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
	<title>Cultivos</title>
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
  %>
	<main role="main">
		<div class="jumbotron mb-5">
			<div class="container">
				<h3 id="bienvenida" class="display-4">Cultivos</h3>
				<p>Aquí tienes una lista de los cultivos que actualmente están el la base de datos.</p>
				<a href="huerto.jsp?alias=<%= username%>&idHuerto=<%= Integer.parseInt(request.getParameter("idHuerto"))%>" id="button" class="btn" style="width: 15%;">Volver al huerto</a>
			</div>
		</div>
		<!-- <div class="container-fluid">
			<div id="buscador" class="container col-10 mx-sm-5 p-4 rounded-top">
				<form class="form-inline mt-2 mt-md-0">
					<input type="text" name="buscar" placeholder="Buscar">
					<button class="btn my-2 my-sm-0" style="color: #3a4d47; background-color: #FFF">Buscar</button>
				</form>
				</div>
			</div> -->
			<div class="container col-10 mx-sm-5">
				<table class="table table-striped">
			    <thead>
			      <tr>
			        <th>Nombre común</th>
			        <th>Tipo</th>
			        <th>Mes Inicio Siembra</th>
			        <th>Mes Fin Siembra</th>
			        <th>Añadir</th>
			      </tr>
			    </thead>
			    <tbody>
            <%     
              int idH =  Integer.parseInt(request.getParameter("idHuerto"));
              Class.forName("com.mysql.jdbc.Driver");
              Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
              Statement s2 = conexion2.createStatement();
              ResultSet cultivos = s2.executeQuery("SELECT * FROM cultivo");
              while (cultivos.next()) {
            %>
			      <tr>
			        <td><%= cultivos.getString("nomComun")%></td>
              <td><%= cultivos.getString("tipo")%></td>
              <td><%= cultivos.getString("fechaInicio")%></td>
              <td><%= cultivos.getString("fechaFin")%></td>
              <td><a type="button" class="btn btn-secondary" style="color: #FFF" href="addcultivo.jsp?idHuerto=<%= Integer.parseInt(request.getParameter("idHuerto"))%>&idCultivo=<%= cultivos.getInt("idCultivo")%>&alias=<%= username%>">+</a></td>
			      </tr>
            <% 
              }
              conexion2.close();
            %>
			    </tbody>
			  </table>
			</div>
		</div>
	</main>
</body>
</html>