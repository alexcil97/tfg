<div class="header__div">
            <nav class="header__nav">
                <ul class="header__list">
                    <li class="header__item"><a href="enviados.php" class="header__item  item--a">Mensaje Enviados</a></li>
                    <li class="header__item"><a href="recibidos.php" class="header__item  item--a">Mensajes Recibidos</a></li>
                    <li class="header__item"><a href="index.php" class="header__item  item--a">Cerrar Sesion</a></li>
                    <li class="header__item item--group"><?= "<img src='globo.png' alt='textglobo'><div><p><a href='principal.php' class='header__item  item--a'>" . $nombre . " " . $apellido . "</a><p class='ocu'><a href='principal.php' class='header__item  item--ocupacion'>" . $ocupacion . "</a></p></p> </div>"; ?></li>
                </ul>
            </nav>
        </div>
