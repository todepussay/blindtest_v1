<?php

session_start();

require_once "connect.php";

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Choix du jeu - Blindtest</title>
    <link rel="shortcut icon" href="asset/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/selection.css">
</head>
<body>

    <?php require_once "header.php"; ?> 

    <div class="container">
        <div class="content">

            <h1>Choisir le mode de jeu</h1>

            <div class="list">
                <div class="element">
                    <p>Opening</p>
                </div>
            </div>

            <div class="type">
                <h2>Choisir le type de partie</h2>

                <div class="list">
                    <div class="element">
                        <p>Normal</p>
                    </div>
                    <div class="element ranked">
                        <p>Classé</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <?php require_once "footer.php"; ?>
    
    <script src="js/selection.js"></script>
    
</body>
</html>