<?php

session_start();

if(!isset($_GET['id']) || empty($_GET['id']) || $_SESSION['user']["user_id"] != $_GET['id']) {
    header("Location: index.php");
    exit();
}

require_once "connect.php";

$message = "";
$message_error = "";

if (isset($_POST['submit'])){
    if (!empty($_POST['username'])){
        if ($_POST['username'] != $_SESSION['user']["username"]){
            $username = htmlspecialchars($_POST['username']);

            $sql = "SELECT * FROM users WHERE username = :username";
            $sql = $connect->prepare($sql);
            $sql->bindParam(":username", $username);
            $sql->execute();
            $table = $sql->fetchAll();

            if (count($table) == 0){

                $sql1 = "UPDATE users SET username = :username WHERE user_id = :id";
                $sql1 = $connect->prepare($sql1);
                $sql1->bindParam(":username", $username);
                $sql1->bindParam(":id", $_SESSION['user']["user_id"]);
                $sql1->execute(); 

                $message .= "Votre nom d'utilisateur a bien été modifié <br>";

            } else {
                $message_error .= "Le nom d'utilisateur est déjà utilisé <br>";
            }
        } else {
            $message_error .= "Vous pouvez pas mettre le même nom d'utilisateur. <br>";
        }
    }

    if (!empty($_POST['email'])){
        if ($_POST['email'] != $_SESSION['user']["email"]){
            $email = htmlspecialchars($_POST['email']);

            $sql = "SELECT * FROM users WHERE email = :email";
            $sql = $connect->prepare($sql);
            $sql->bindParam(":email", $email);
            $sql->execute();
            $table = $sql->fetchAll();

            if (count($table) == 0){

                $sql1 = "UPDATE users SET email = :email WHERE user_id = :id";
                $sql1 = $connect->prepare($sql1);
                $sql1->bindParam(":email", $email);
                $sql1->bindParam(":id", $_SESSION['user']["user_id"]);
                $sql1->execute(); 

                $message .= "Votre adresse mail a bien été modifié <br>";

            } else {
                $message_error .= "L'adresse mail est déjà utilisée <br>";
            }
        } else {
            $message_error .= "Vous pouvez pas mettre la même adresse mail. <br>";
        }
    }

    if (!empty($_POST['password'])){
        if ($_POST['password'] == $_POST['password2']){
            if (!password_verify($_POST['password'], $_SESSION['user']["password"])){
                
                $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

                $sql = "UPDATE users SET password = :password WHERE user_id = :id";
                $sql = $connect->prepare($sql);
                $sql->bindParam(":password", $password);
                $sql->bindParam(":id", $_SESSION['user']["user_id"]);
                $sql->execute(); 

                $message .= "Votre mot de passe a bien été modifié <br>";

            } else {
                $message_error .= "Vous pouvez pas mettre le même mot de passe";
            }

        } else {
            $message_error .= "Les mots de passe ne correspondent pas <br>";
        }
    }

    if (!empty($_FILES['picture']['name'])){
        $picture = $_FILES['picture']['name'];
        $picture_tmp = $_FILES['picture']['tmp_name'];
        $picture_size = $_FILES['picture']['size'];
        $picture_error = $_FILES['picture']['error'];

        $picture_extension = strrchr($picture, ".");

        $extensions_autorisees = array('.png', '.PNG', '.jpg', '.JPG', '.jpeg', '.JPEG');

        if (in_array($picture_extension, $extensions_autorisees)){
            if ($picture_size <= 1000000){
                unlink("asset/profils_picture/" . $_SESSION['user']["picture"]);
                $picture_name = $_SESSION['user']["user_id"] . $picture_extension;
                $picture_destination = "asset/profils_picture/" . $picture_name;
                move_uploaded_file($picture_tmp, $picture_destination);

                $sql = "UPDATE users SET picture = :picture WHERE user_id = :id";
                $sql = $connect->prepare($sql);
                $sql->bindParam(":picture", $picture_name);
                $sql->bindParam(":id", $_SESSION['user']["user_id"]);
                $sql->execute(); 

                $message .= "Votre photo de profil a bien été modifié <br>";

            } else {
                $message_error .= "Votre photo de profil ne doit pas dépasser 1Mo <br>";
            }
        } else {
            $message_error .= "Votre photo de profil doit être au format png, jpg ou jpeg <br>";
        }
    }

    if (!empty($_POST['bio'])){

        $bio = htmlspecialchars($_POST['bio']);

        $sql = "UPDATE users SET bio = :bio WHERE user_id = :id";
        $sql = $connect->prepare($sql);
        $sql->bindParam(":bio", $bio);
        $sql->bindParam(":id", $_SESSION['user']["user_id"]);
        $sql->execute();

        $message .= "Votre biographie a bien été modifié <br>";
    }

    if (!empty($_POST["discord"])){
        $discord = htmlspecialchars($_POST["discord"]);

        $sql = "UPDATE users SET discord = :discord WHERE user_id = :id";
        $sql = $connect->prepare($sql);
        $sql->bindParam(":discord", $discord);
        $sql->bindParam(":id", $_SESSION['user']["user_id"]);
        $sql->execute();

        $message .= "Votre discord a bien été modifié <br>";
    }

    if (!empty($_POST['twitter'])){
        $twitter = htmlspecialchars($_POST['twitter']);

        $sql = "UPDATE users SET twitter = :twitter WHERE user_id = :id";
        $sql = $connect->prepare($sql);
        $sql->bindParam(":twitter", $twitter);
        $sql->bindParam(":id", $_SESSION['user']["user_id"]);
        $sql->execute();

        $message .= "Votre twitter a bien été modifié <br>";
    }

    if (!empty($_POST['anilist'])){
        $anilist = htmlspecialchars($_POST['anilist']);

        $sql = "UPDATE users SET anilist = :anilist WHERE user_id = :id";
        $sql = $connect->prepare($sql);
        $sql->bindParam(":anilist", $anilist);
        $sql->bindParam(":id", $_SESSION['user']["user_id"]);
        $sql->execute();

        $message .= "Votre anilist a bien été modifié <br>";
    }

    $user = "SELECT * FROM users WHERE user_id = :id";
    $user = $connect->prepare($user);
    $user->bindParam(":id", $_SESSION['user']["user_id"]);
    $user->execute();
    $user = $user->fetch();

    $_SESSION['user'] = $user;
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

            <?php if(isset($message)) : ?>
                <div class="message">
                    <p><?= $message ?></p>
                </div>
            <?php endif; ?>

            <?php if(isset($message_error)) : ?>
                <div class="message error">
                    <p><?= $message_error ?></p>
                </div>
            <?php endif; ?>

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
                    <input type="submit" name="submit" value="Modifier votre profils">
                </div>

            </form>

        </div>
    </div>
    
    <script src="js/profiles-editor.js"></script>

</body>
</html>