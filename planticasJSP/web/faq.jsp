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
            <a href="faq.jsp" id="salir" class="col-10 d-flex justify-content-end">FaQ</a>
            <a href="index.jsp" id="salir" class="col-1 d-flex justify-content-end">Sign out</a>
	</nav>
        <main role="main">
           <div class="jumbotron">
                <div class="container mt-4">
                    <h2>¿Puedo plantar lo que quiera?</h2>
                    <p>Ahora mismo, la base de datos que almacena los cultivos que se pueden plantar en 
                        <span style="font-family: 'Grand Hotel'; font-size: 1.8em;">Planticas</span>  solo puede ser modificada por la administradora. </p>
                    <p>En un futuro, se implementará la opción de que los usuarios
                    añadan nuevos cultivos (previa revisión) para poder llevar un control más completo del huerto.</p>
                </div>
               <div class="container mt-4">
                   <h3>¿Qué cultivos hay disponibles actualmente?</h3>
                   <p>Actualmente, puedes plantar los siguientes cultivos</p>
               </div>
            </div>
        </main>
  <%
    }
    conexion.close();
  %>