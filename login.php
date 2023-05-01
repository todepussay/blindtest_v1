<?php

session_start();

require('connect.php');

if (isset($_SESSION['username'])) {
    header('Location: index.php');
} else {
    if (isset($_POST['username']) && isset($_POST['email']) && isset($_POST['password']) && isset($_POST['password2'])) {
        $username = htmlspecialchars($_POST['username']);
        $email = htmlspecialchars($_POST['email']);
        $password = htmlspecialchars($_POST['password']);
        $password2 = htmlspecialchars($_POST['password2']);

        if (!empty($username) && !empty($email) && !empty($password) && !empty($password2)) {
            if ($password == $password2) {

                $sql = $connect->prepare('SELECT * FROM users WHERE email = :email');
                $sql->bindValue(':email', $email);
                $sql->execute();
                $table1 = $sql->fetchAll();

                if (count($table1) == 0) {
                    $sql = $connect->prepare('SELECT * FROM users WHERE username = :username');
                    $sql->bindValue(':username', $username);
                    $sql->execute();
                    $table2 = $sql->fetchAll();

                    if (count($table2) == 0){
                        $password = password_hash($password, PASSWORD_DEFAULT);
                        $sql = $connect->prepare('INSERT INTO users (username, email, password) VALUES (:username, :email, :password)');
                        $sql->bindValue(':username', $username);
                        $sql->bindValue(':email', $email);
                        $sql->bindValue(':password', $password);
                        $sql->execute();

                        $valid = "Votre compte a bien été créé ! Vous pouvez maintenant vous connecter";
                    } else {
                        $error = "Ce nom d'utilisateur est déjà utilisé";
                    }

                } else {
                    $error = "Cette adresse e-mail est déjà utilisée";
                }
            } else {
                $error = "Les mots de passe ne correspondent pas";
            }
        } else {
            $error = "Veuillez remplir tous les champs";
        }
    } else {
        if (isset($_POST['email']) && isset($_POST['password'])) {
            if (!empty($_POST['email']) && !empty($_POST['password'])){
                $email = htmlspecialchars($_POST['email']);
                $password = htmlspecialchars($_POST['password']);
    
                $sql = $connect->prepare('SELECT * FROM users WHERE email = :email');
                $sql->bindValue(':email', $email);
                $sql->execute();
                $table = $sql->fetchAll();
    
                if (count($table) == 1 && password_verify($password, $table[0]['password'])) {

                    $_SESSION['user'] = $table[0];
    
                    if (isset($_SESSION['invite'])){
                        $sql_score = "SELECT * FROM score_invite WHERE invite_id = :invite";
                        $sql_score = $connect->prepare($sql_score);
                        $sql_score->bindParam(":invite", $_SESSION['invite']);
                        $sql_score->execute();
                        $score_temp = $sql_score->fetchAll();
    
                        // var_dump($score_temp);
    
                        if (count($score_temp) > 0){
                            for ($i = 0; $i < count($score_temp); $i++){
                                $sql_inject = "INSERT INTO score (user_id, categorie_id, score, len, parameters, date_score) VALUES (:user_id, :categorie_id, :score, :len, :parameters, :date_score)";
                                $sql_inject = $connect->prepare($sql_inject);
                                $sql_inject->bindParam(":user_id", $_SESSION['id']);
                                $sql_inject->bindParam(":categorie_id", $score_temp[$i]["categorie_id"]);
                                $sql_inject->bindParam(":score", $score_temp[$i]["score"]);
                                $sql_inject->bindParam(":len", $score_temp[$i]["len"]);
                                $sql_inject->bindParam(":parameters", $score_temp[$i]["parameters"]);
                                $sql_inject->bindParam(":date_score", $score_temp[$i]["date_score"]);
                                $sql_inject->execute();
    
                                $sql_delete = "DELETE FROM score_invite WHERE id_score_invite = :id";
                                $sql_delete = $connect->prepare($sql_delete);
                                $sql_delete->bindParam(":id", $score_temp[$i]["id_score_invite"]);
                                $sql_delete->execute();
                            }
                        }
                        unset($_SESSION['invite']);
                    }
    
                    header('Location: index.php');
                } else {
                    $error_login = "Nom d'utilisateur ou mot de passe incorrect";
                }
            } else {
                $error_login = "Veuillez remplir tous les champs";
            }
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion - Blindtest</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

    <?php require_once "header.php"; ?>

    <div class="container-connexion">
        <form class="login" method="post" action="">

            <h2>Connectez-vous à votre compte :</h2>

            <input type="email" name="email" placeholder="Email">

            <div class="password">
                <input type="password" name="password" placeholder="Mot de passe" id="password-login">
                <button type="button" id="btn-login"><ion-icon name="eye-off-outline"></ion-icon></button>
            </div>

            <p class="message error">
                <?php
                    if (isset($error_login)){
                        echo $error_login;
                    }
                ?>
            </p>
        
            <input type="submit" value="Se connecter">

        </form>

        <form class="signin" method="post" action="">
            
            <h2>Vous êtes nouveau ? Créer un nouveau compte :</h2>

            <input type="text" name="username" placeholder="Pseudo">

            <input type="text" name="email" placeholder="Email">

            <div class="password">
                <input type="password" name="password" placeholder="Mot de passe" id="password-signin">
                <button type="button" id="btn-signin"><ion-icon name="eye-off-outline"></ion-icon></button>
            </div>

            <div class="password">
                <input type="password" name="password2" placeholder="Confirmer le mot de passe" id="password-signin-confirm">
                <button type="button" id="btn-signin-confirm"><ion-icon name="eye-off-outline"></ion-icon></button>
            </div>

            <p class="message error">
                <?php
                    if (isset($error)){
                        echo $error;
                    }
                ?>
            </p>

            <p class="message valid">
                <?php
                    if (isset($valid)){
                        echo $valid;
                    }
                ?>
            </p>

            <input type="submit" value="S'inscrire">

        </form>
    </div>

    <?php require_once "footer.php"; ?>

    
    <script src="js/connexion.js"></script>

</body>
</html>