<?php
require_once('../Classes/ClassConectionPdo.php');
// Verificar si se han enviado datos mediante el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {

    // Recibir los datos del formulario
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $lastname = isset($_POST['lastname']) ? $_POST['lastname'] : '';
    $email = $_POST["email"];
    $password = $_POST["password"];
    $conexion = new ClassConectionPDO();
    $imagen = $conexion->comprobarUsuario($email, $password);
    $_SESSION['id']=$imagen['id_user1'];
    $_SESSION['email'] = $email;
    $_SESSION['password'] = $password;

        // comprueba si el formulario pasado por post es login y de ser asi llama al metodo comprobarusuario y si 
        //  falla te devuelve a la misma pagina.
    if ($_POST["formulario"] == "login") {
        if ($imagen) {
            header('location:../Home/home.php');
        } else {
            header('location:../Login/login.php');
        }

        // comprueba si el formulario pasado por post es singin y de ser asi llama al metodo insertarUsuario y si 
        //  falla te devuelve a la misma pagina.
    } elseif ($_POST["formulario"] == "signin") {

        echo "hola signin<br>";

        $conexion->insertarUsuario($name, $lastname, $email, $password);
        $imagen = $conexion->comprobarUsuario($email, $password);
        if ($imagen) {
            header('location:../Home/home.php');
        } else {
            header('location:../Singin/singin.php');
        }
    } else {
        //devolvera a la pagina de login con un mensaje de error
    }
}
