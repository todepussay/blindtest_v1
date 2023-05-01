<?php

session_start();

if(!isset($_GET['id']) || empty($_GET['id']) || $_SESSION['user']["user_id"] != $_GET['id']) {
    header("Location: index.php");
    exit();
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edition du profils - Blindtest</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/profiles-editor.css">
</head>
<body>

    <?php require "header.php"; ?>
    
    <div class="container">
        <div class="content">

            <h1>Modifier votre profils</h1>

            <form action="" method="post" enctype="multipart/form-data">

                <div class="element">
                    <label for="username">Changer votre nom d'utilisateur:</label>
                    <input type="text" name="username" id="username" placeholder="<?= $_SESSION['user']["username"] ?>">
                </div>

                <div class="element">
                    <label for="email">Changer votre adresse mail: </label>
                    <input type="email" name="email" id="email" placeholder="<?= $_SESSION['user']["email"] ?>">
                </div>

                <div class="element">
                    <label for="password">Changer votre mot de passe:</label>
                    <div class="password">
                        <input type="password" name="password" id="password" placeholder="Nouveau mot de passe">
                        <button type="button" id="btn-password"><ion-icon name="eye-off-outline"></ion-icon></button>
                    </div>
                    <label for="password2">Confirmer votre nouveau mot de passe:</label>
                    <div class="password">
                        <input type="password" name="password2" id="password2" placeholder="Confirmer le mot de passe">
                        <button type="button" id="btn-password2"><ion-icon name="eye-off-outline"></ion-icon></button>
                    </div>
                </div>

                <div class="element">
                    <label for="picture">Changer votre photo de profils:</label>
                    <div class="element-img-input">
                        <div class="element-img">
                            <img src="asset/profils_picture/<?= $_SESSION['user']["picture"] ?>" alt="Photo de profils">
                        </div>
                        <div class="element-input">
                            <input type="file" name="picture" id="picture">
                        </div>
                    </div>
                </div>

                <div class="element">
                    <label for="bio">Changer votre description de profils:</label>
                    <textarea name="bio" placeholder="<?= $_SESSION['user']["bio"] ?>"></textarea>
                </div>
                
                <div class="element">
                    <p>Changer vos contacts:</p>

                    <div class="contact">
                        <div class="contact-img">
                            <img src="asset/discord.png" alt="Discord logo">
                        </div>
                        <div class="contact-content">
                            <input type="text" name="discord" placeholder="<?= $_SESSION['user']['discord'] ?>">
                        </div>
                    </div>

                    <div class="contact">
                        <div class="contact-img">
                            <img src="asset/twitter.png" alt="twitter logo">
                        </div>
                        <div class="contact-content">
                            <input type="text" name="twitter" placeholder="<?= $_SESSION['user']['twitter'] ?>">
                        </div>
                    </div>

                    <div class="contact">
                        <div class="contact-img">
                            <img src="asset/anilist.png" alt="anilist logo">
                        </div>
                        <div class="contact-content">
                            <input type="text" name="anilist" placeholder="<?= $_SESSION['user']['anilist'] ?>">
                        </div>
                    </div>

                </div>

                <div class="submit">
                    <input type="submit" value="Modifier votre profils">
                </div>

            </form>

        </div>
    </div>
    
    <script src="js/profiles-editor.js"></script>

</body>
</html>