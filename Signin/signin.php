<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SignIn</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
  <?php
  include_once('../Classes/ClassConectionPdo.php');

  ?>

  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <!-- /** Generado por ChatGPT: Mejora dada por chatGpt -> meterlo dentro de cards */ -->
        <div class="card">
          <div class="card-header">
            <h4>SignIn</h4>
          </div>
          <div class="card-body">
            <form action="../Procesar_Form/procesar_formulario.php" method="POST">
              <div class="form-group">
                <label for="name">Nombre:</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Ingrese su nombre">
              </div>
              <div class="form-group">
                <label for="lastname">apellido:</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Ingrese su nombre">
              </div>
              <div class="form-group">
                <label for="email">Correo Electrónico:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Ingrese su correo electrónico" required>
              </div>
              <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Ingrese su password" required>
              </div>
              <div class="form-group">
                <label for="bdate">Fecha de nacimiento:</label>
                <input type="date" class="form-control" id="bdate" name="bdate" required>
              </div>
              <!-- Generado Con chatGPT: Distincion entre envio por login y singin -->
              <input type="hidden" name="formulario" value="signin">
              <!-- aqui termina lo generado con chatGPT -->
              <button type="submit" class="btn btn-primary">Registrarse</button>
              <br>
              <p>Do you already have an account? <a href="../Login/login.php">login here</a></p>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>