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



    if ($_POST["formulario"] == "login") {
        $resultados = $conexion->comprobarUsuario($email, $password);
        if ($resultados) {
            header('location:../Home/home.php');
        } else {
            header('location:../Login/login.php');
        }
        
    } elseif ($_POST["formulario"] == "signin") {

        echo "hola signin<br>";

        $conexion->insertarUsuario($name,$lastname,$email,$password);
        $resultados = $conexion->comprobarUsuario($email, $password);
        if ($resultados) {
            header('location:../Home/home.php');
        } else {
            header('location:../Singin/singin.php');
        }    } else {
        //devolvera a la pagina de login con un mensaje de error
    }
}
