<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>index</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<?php
include_once('../head/head.php');
?>

<div class="container-fluid">
    <div class="row">
        <div class="col-12">
            <h1>publication!</h1>

            <form action="<?php htmlspecialchars($_SERVER["PHP_SELF"])?>" method="post" enctype="multipart/form-data">
            <input type="file" name="imagen"/>
            <br><br>
            <input type="text">
            <input type="submit" value="Enviar" />
            </form>

            <?php
            const DIR_IMAGES = "Img";

            if (isset($_FILES['imagen'])) {
                //Nombre original del fichero
                $file_name = $_FILES['imagen']['name'];
                //Tamaño del fichero
                $file_size = $_FILES['imagen']['size'];
                //Nombre temporal del fichero (se guarda en una carpeta tmp del servidor)
                $file_tmp = $_FILES['imagen']['tmp_name'];
                //Tipo del fichero
                $file_type = $_FILES['imagen']['type'];

                //Comprobación de la extensión, en este ejemplo .png, .jpg o .jpeg
                $tmp = explode('.', $file_name);
                //mifoto.12.png
                //$tmp[0]="mifoto" $tmp[1]="12" $tmp[2]="png"
                $file_ext = end($tmp);
                $extensions = array("jpeg", "jpg", "png");
                if (in_array($file_ext, $extensions) === false) {
                    $errors[] = "extensión no permitida, por favor introduce una imagen .PNG o .JPG.";
                }

                //Comprobación de tamaño, nos lo pasa en bytes
                if ($file_size > 4194304) {
                    $errors[] = 'El tamaño de la imagen es superior a 4 MB';
                }

                //Si no hay errores
                if (empty($errors)) {
                    //IMPORTANTE: se debe comprobar si el directorio existe
                    if (file_exists("../".DIR_IMAGES)) {
                        move_uploaded_file($file_tmp, "../".DIR_IMAGES . "/" . $file_name);
                        echo "Subida correcta<br/>";
                        echo "<img src='" . "../".DIR_IMAGES . "/$file_name' width='300'/>";
                    } else {
                        $errors[] = "El directorio '" . DIR_IMAGES . "' no existe";
                    }
                }

                if (isset($errors)) {
                    echo implode(". ", $errors);
                }
            }
            ?>
            </body>


</html>



</div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<?php
include_once('../footer/footer.php');
?>

</html>