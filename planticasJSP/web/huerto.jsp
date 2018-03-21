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
	<title>Huerto</title>
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
		<div class="jumbotron mb-5">
			<div class="container" style="padding-top: 3.5rem;">
        <a id="modHuerto" href="modificaHuerto.jsp?alias=<%= username%>&idHuerto=<%= Integer.parseInt(request.getParameter("idHuerto"))%>" class="display-4 h3">Huerto</a>
				<p>Aquí puedes ver todo lo que tienes plantado en el huerto, así como la fecha aproximada de cosecha.</p>
				<p>También puedes dejarte inspirar por la lista de cultivos y sembrar algo nuevo.</p>
				<a href="cultivo.jsp?alias=<%= username%>&idHuerto=<%= Integer.parseInt(request.getParameter("idHuerto"))%>" id="button" class="btn" style="width: 15%;">Nuevo Cultivo</a>
        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">Eliminar</button>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">¿Estás seguro que quieres eliminar este huerto?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                Si eliminas el huerto, no podrás recuperarlo.
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <a href="eliminarHuerto.jsp?idHuerto=<%= Integer.parseInt(request.getParameter("idHuerto"))%>&alias=<%= username%>">
                  <button type="button" class="btn btn-danger">Eliminar</button>
                </a>
              </div>
            </div>
          </div>
        </div>
          <% 
            }
            conexion.close();
          %>
			</div>
		</div>
		<div class="container-fluid text-center">
      <div id="buscador" class="container col-11 mx-sm-5 p-4 rounded-top">
        <form class="form-inline mt-2 mt-md-0">
          <input id="searchText" type="text" name="buscar" placeholder="Buscar" onkeyup='doSearch()'>
          <button class="btn my-2 my-sm-0" style="color: #3a4d47; background-color: #FFF">Buscar</button>
        </form>
      </div>
    </div>
			<div class="col-11 mx-sm-5 mb-5 text-center">
				<table id="tabla" class="table table-striped">
		    <thead>
		      <tr>
		        <th>Nombre común</th>
		        <th>Tipo</th>
		        <th>Fecha Siembra</th>
		        <!-- <th>Fecha Cosecha</th> -->
		        <th>Eliminar</th>
		      </tr>
		    </thead>
		    <tbody>
          <%     
          int id =  Integer.parseInt(request.getParameter("idHuerto"));
          Class.forName("com.mysql.jdbc.Driver");
          Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
          Statement s2 = conexion2.createStatement();
          ResultSet cultivos = s2.executeQuery("SELECT * FROM cultivo_huerto WHERE huerto_idHuerto = '" + id + "'");
          while (cultivos.next()) {
            int idSiembra = cultivos.getInt("idSiembra");
          %>
		      <tr>
		        <td><%= cultivos.getString("nomComun")%></td>
		        <td><%= cultivos.getString("tipo")%></td>
            <td><%= cultivos.getString("fechaSiembra")%></td>
            <!-- <td><%= idSiembra%></td> -->
		        <td>
              <a class="btn btn-danger" href="eliminarSiembra.jsp?idHuerto=<%= id%>&idSiembra=<%= cultivos.getInt("idSiembra")%>&alias=<%= username%>">Eliminar</a>
		        </td>
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
<script src="buscador.js"></script>
</html>