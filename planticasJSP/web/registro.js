function validarReg(){
	var correcto=true;
  //Validar una dirección de email
  valorMail = document.getElementById("mail").value;
  if (!(/\w{1,}[@][\w\-]{1,}([.]([\w\-]{1,})){1,3}$/.test(valorMail))) {
    console.log("introduce el email");
    document.getElementById("mail").style.borderColor = "#F00";
    document.getElementById("mail").style.color = "#888";
    document.getElementById("errorMail").style.display = "inline";
    correcto=false;
  } else {
    document.getElementById("mail").style.borderColor = "#090";
    document.getElementById("mail").style.color = "#000";
    document.getElementById("errorMail").style.display = "none";
  }

  // Contraseña
  var password=document.getElementById("password")
  if (password.length<4||password.length>30|| // mínimo 6 car. máximo 30
    !/[a-zñ]/.test(password.value)|| !/[A-ZÑ]/.test(password.value)|| // al menos 1 min. y 1 may.
    !/[0-9]/.test(password.value)|| // al menos 1 dígito y
    !/[-().+*_]/.test(password.value)) { // 1 car. especial
    console.log('La contraseña tiene que tener 6 caracteres');
    document.getElementById("password").style.borderColor = "#F00";
    document.getElementById("password").style.color = "#888";
    document.getElementById("errorPassword").style.display = "inline";
    correcto=false;
  } else {
    document.getElementById("password").style.borderColor = "#090";
    document.getElementById("password").style.color = "#000";
    document.getElementById("errorPassword").style.display = "none";
  }

  // Valida nombre
  valorNom = document.getElementById("username").value;
  if (valorNom.length == 0 || /^\s+$/.test(valorNom)) {
    console.log('Debe escribir su nombre');
    document.getElementById("username").style.borderColor = "#F00";
    document.getElementById("username").style.color = "#888";
    document.getElementById("errorUsername").style.display = "inline";
    correcto=false;
  } else {
    document.getElementById("username").style.borderColor = "#090";
    document.getElementById("username").style.color = "#000";
    document.getElementById("errorUsername").style.display = "none";
  }
  
}

function quitarError(dato, mensaje){
	document.getElementById(dato).style.borderColor="#aacfe4"
	document.getElementById(mensaje).style.display="none"
	return false;
}