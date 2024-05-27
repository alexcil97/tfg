<?php
require_once('../Conexion_Config/config.php');
class ClassConectionPDO
{
    //zona de parametros
    public $con;

    //constructor: Crea un objeto de tipo conexion.
    public function __construct()
    {
        try {
            $this->con = new PDO(DSN, USER, PASSWORD, array(
                // aqui opte por usar una conexion persistente para agilizar la conexion con la base de datos ¿Es optimo?
                PDO::ATTR_PERSISTENT => true
            ));
        } catch (PDOException $e) {
            echo 'Falló la conexión: ' . $e->getMessage();
        }
    }

    //destructor: finaliza la conexion cuando ya no se haga instancia a dicho objeto
    public function __destruct()
    {
        $this->con = null;
    }

    public function insertarUsuario($nombre, $apellido, $email, $password)
    {
        $sentencia = $this->con->prepare("INSERT INTO users (name,lastname,email,user_password) VALUES (?,?,?,?)");

        $sentencia->execute([$nombre, $apellido, $email, $password]);
    }

    public function comprobarUsuario($email, $password)
    {
        $sentencia = $this->con->prepare(
            "SELECT id_user1, name, lastname, email FROM users 
            WHERE email = :email AND user_password = :password"
        );

        $sentencia->execute([':email' => $email, ':password' => $password]);
        $resultados = $sentencia->fetchAll(PDO::FETCH_ASSOC);

        // No es necesario recorrer los resultados aquí si solo esperas un resultado
        // foreach ($resultados as $fila) {
        //     echo 'ID: ' . $fila['id_user1'] . '<br>';
        //     echo 'Name: ' . $fila['name'] . '<br>';
        //     echo 'Lastname: ' . $fila['lastname'] . '<br>';
        //     echo 'Email: ' . $fila['email'] . '<br>';
        //     echo '<hr>';
        // }

        return $resultados; // Devuelve los resultados obtenidos de la consulta
    }

    public function guardarImagen($image_path,$file_name){
        $sentencia = $this->con->prepare("INSERT INTO images (image_path,image_name) VALUES (?,?)");

        $sentencia->execute([$image_path,$file_name]);

    }

    public function mostrarImagen($id_image) {
        try {
            $sentencia = $this->con->prepare(
                "SELECT image_path FROM images 
                WHERE id_image = :id_image"
            );
    
            $sentencia->execute([':id_image' => $id_image]);
            $resultados = $sentencia->fetchAll(PDO::FETCH_ASSOC);
    
            // Devuelve los resultados obtenidos de la consulta
            return $resultados;
        } catch (PDOException $e) {
            // Manejar errores de PDO
            throw new Exception("Error al mostrar la imagen: " . $e->getMessage());
        }
    }
        public function insertarPublicacion($email, $password)
    {
    }
}
$conexion = new ClassConectionPDO();

