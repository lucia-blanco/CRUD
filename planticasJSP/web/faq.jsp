<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
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
    Connection conexion1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
    Statement s = conexion1.createStatement();
    ResultSet dato = s.executeQuery("SELECT * FROM usuario WHERE alias= '" + username + "' ");
    
    while (dato.next()) {
  %>
	<nav class="navbar navbar-expand-md fixed-top">
            <a href="home.jsp?alias=<%=username%>" id="logo-navbar">Planticas</a>
            <a href="faq.jsp?alias=<%=username%>" id="salir" class="col-10 d-flex justify-content-end">FaQ</a>
            <a href="index.jsp" id="salir" class="col-1 d-flex justify-content-end">Sign out</a>
	</nav>
    <%
        }
        conexion1.close();
    %>
        <main role="main">
           <div class="jumbotron">
               <div class="container mt-4" style="text-align: justify">
                    <h2>¿Puedo plantar lo que quiera?</h2>
                    <p>Ahora mismo, la base de datos que almacena los cultivos que se pueden plantar en 
                        <span style="font-family: 'Grand Hotel'; font-size: 1.8em;">Planticas</span>  solo puede ser modificada por la administradora. </p>
                    <p>En un futuro, se implementará la opción de que los usuarios
                    añadan nuevos cultivos (previa revisión) para poder llevar un control más completo del huerto.</p>
                </div>
               <div class="container mt-4">
                   <h3>¿Qué cultivos hay disponibles actualmente?</h3>
                   <p>Actualmente, puedes plantar los siguientes cultivos:</p>
                   <%
                        ArrayList<String> arrH = new ArrayList<String>();                      
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
                        Statement s2 = conexion2.createStatement();
                        ResultSet cultH = s2.executeQuery("SELECT nomComun FROM cultivo WHERE tipo = 'Hortaliza'"); 
                        while (cultH.next()) {
                            arrH.add(cultH.getString("nomComun"));
                        }
                        conexion2.close();
                        
                        ArrayList<String> arrF = new ArrayList<String>();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
                        Statement s3 = conexion3.createStatement();
                        ResultSet cultF = s3.executeQuery("SELECT * FROM cultivo WHERE tipo = 'Fruta'"); 
                        while (cultF.next()) {
                            arrF.add(cultF.getString("nomComun"));
                        }
                        conexion3.close();
                        
                        ArrayList<String> arrL = new ArrayList<String>();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
                        Statement s4 = conexion4.createStatement();
                        ResultSet cultL = s4.executeQuery("SELECT * FROM cultivo WHERE tipo = 'Legumbre'"); 
                        while (cultL.next()) {
                            arrL.add(cultL.getString("nomComun"));
                        }
                        conexion4.close();
                        
                        ArrayList<String> arrA = new ArrayList<String>();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
                        Statement s5 = conexion5.createStatement();
                        ResultSet cultA = s5.executeQuery("SELECT * FROM cultivo WHERE tipo = 'Aromática/Medicinal'"); 
                        while (cultA.next()) {
                            arrA.add(cultA.getString("nomComun"));
                        }
                        conexion5.close();
                        
                        ArrayList<String> arrT = new ArrayList<String>();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conexion6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/planticas","root", "");
                        Statement s6 = conexion6.createStatement();
                        ResultSet cultT = s6.executeQuery("SELECT * FROM cultivo WHERE tipo = 'Tubérculo/Raíz'"); 
                        while (cultT.next()) {
                            arrT.add(cultT.getString("nomComun"));
                        }
                        conexion6.close();
                        
                        HashMap<String, ArrayList<String>> hashm = new HashMap<String, ArrayList<String>>();
                        hashm.put("Hortalizas",arrH);
                        hashm.put("Frutas",arrF);
                        hashm.put("Legumbres",arrL);
                        hashm.put("Aromáticas/Medicinales",arrA);
                        hashm.put("Tubérculos/Raíces",arrT);
                    %>
                    
                    
                    <div class="row">
                    <%
                        for (Map.Entry <String,ArrayList<String>> cultivo: hashm.entrySet()) {
                            out.print("<div class='col' style='text-align: center'>");
                            out.print("<h5 style='font-weight:bold'>"+cultivo.getKey()+"</h5>");
                    %> 
                    
                    <%
                            //out.print("</p><br/><div id='' style='display: inline';><ul>");
                            for(String cultivos: cultivo.getValue()) {
                                out.print("<li style='list-style-type: none'>"+cultivos+"</li>");
                            }
                            out.print("</div>");
                        }
                    %>   
                    </div>
               </div>
            </div>
        </main>

