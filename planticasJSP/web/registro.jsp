<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <link rel="shortcut icon" href="favicon.ico">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Grand+Hotel|Montserrat" rel="stylesheet">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="style.css">
    <title>Registro</title>
  </head>

  <body id="fondo-principal">
    <% 
      request.setCharacterEncoding("UTF-8"); 
      String mostrarM = request.getParameter("m");
      String mostrarA = request.getParameter("a");
    %>
    <div id="wrapper-reg" class="cover-container d-flex h-100 p-3 mx-auto flex-column text-center">
      <main>
        
        <form action="guardaUsuario.jsp" method="get" accept-charset="utf-8" id="formulario" class="text-center" onsubmit="return validarReg()">
          <span id="<% out.print(mostrarM); %>" class="alert alert-danger alert-dismissible fade show mt-3" role="alert" style="display: none;">
          Ya hay un usuario registrado con ese correo
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </span>
        <span id="<% out.print(mostrarA); %>" class="alert alert-danger alert-dismissible fade show mt-3" role="alert" style="display: none;">
          Ya hay un usuario registrado con ese alias
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </span>
          <h1 id="registrate">Regístrate</h1>
          <div class="form-row form-group">
            <div class="col">
              <input class="form-control" type="text" id="alias" name="alias" value="" required placeholder="Nombre de usuario" onchange="quitarError('alias', 'errorUsername')"">
              <span id="errorUsername" class="error"> No es un nombre de usuario válido</span>
            </div>

            <div class="col">
              <input class="form-control" type="password" id="password" name="password" value="" required placeholder="Contraseña" onchange="quitarError('password', 'errorPassword')">
              <!-- <span id="errorPassword" class="error"> La contraseña debe tener al menos 4 caracteres y contener mayúscula, minúscula, un dígito y carácter no alfanumérico -().+*_</span> -->
            </div>
          </div>

          <div class="form-row form-group">
            <div class="col md-6">
              <input class="form-control" type="email" id="mail" name="mail" value="" required placeholder="Correo electrónico" onchange="quitarError('mail', 'errorMail')">
              <span id="errorMail" class="error"> No es un email válido</span>
            </div>
          </div>
          <div id="envio">
            <input id="button" class="btn btn-lg btn-basic btn-block" type="submit" name="button" value="Enviar">
          </div>
          <a id="atras" class="mt-5 mb-3 text-muted atras" href="index.jsp">Sign in</a>
        </form>
      </main>
      <footer id="footer" class="page-footer font-small pt-4 mt-4">
        <small class="footer-copyright py-3 text-center"> © 2018 Copyright</small>
      </footer>
    </div>
  </body>
  <script src="registro.js"></script>
  <script type="text/javascript">
    window.onload = function alert() {
      //mostrar = request.getParameter("q");
      document.getElementById("cambia").style.display = "inline";
    };
    
    window.onclick = function quitar() {
      document.getElementById("cambia").style.display = "none";
    };
  </script>
</html>