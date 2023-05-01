<?php

session_start();

require('connect.php');

$sql = "SELECT users.user_id as 'id', users.username as 'pseudo', categories.name as 'categorie', score.date_score as 'date', users.picture as 'pp' FROM users, categories, score WHERE users.user_id = score.user_id AND categories.id = score.categorie_id LIMIT 10";
$sql = $connect->prepare($sql);
$sql->execute();
$activity = $sql->fetchAll();

$news = "SELECT * FROM news LIMIT 3";
$news = $connect->prepare($news);
$news->execute();
$news = $news->fetchAll();

if(isset($_SESSION['user'])){
    if(empty($_SESSION['user']["bio"]) || $_SESSION['user']['picture'] == "0.png"){
        $notification = "Completez votre profils, ajoutez une photo de profil ou une description !";
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="/blindtest/">
    <title>Accueil - Blindtest</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <?php require_once "header.php"; ?>

    <?php require "notification.php"; ?>

    <div class="container">
        <div class="content">

            <div class="title">
                <h1>Blindtest</h1>
            </div>

            <main>

                <div class="home-activity">

                    <h2>Activité</h2>

                    <?php for($i = 0; $i < count($activity); $i++): ?>
                        <div class="activity">
                            <a href="profils.php?id=<?= $activity[$i]["id"] ?>" class="user-profils">
                                <img src="asset/profils_picture/<?= $activity[$i]["pp"] ?>" alt="Profil user">
                            </a>

                            <div class="user-activity">
                                <p class="activity-details">
                                    <span class="activity-date">
                                        <?php

                                            $date = new DateTime($activity[$i]["date"]);
                                            $date = $date->format("d/m/Y à H:i");
                                            echo $date;
                                        
                                        ?>
                                    </span><br>
                                    <a href="profils.php?id=<?= $activity[$i]["id"] ?>" class="activity-pseudo"><?= $activity[$i]["pseudo"] ?></a> a fait un blindtest sur les <a href="game_selection.php" class="activity-categorie"><?= ucfirst($activity[$i]["categorie"]) ?></a>.
                                </p>
                            </div>
                        </div>
                    <?php endfor; ?>

                </div>

                <div class="news">
                        
                    <h2>Nouveautés</h2>

                    <?php for($i = 0; $i < count($news); $i++): ?>
                        <div class="new">
                            <p class="new-details">
                                <span class="new-version"><?= $news[$i]["version"] ?></span><br>
                                <span class="new-date">
                                    <?php

                                        $date = new DateTime($news[$i]["date"]);
                                        $date = $date->format("d/m/Y à H:i");
                                        echo $date;
                                    
                                    ?>
                                </span><br><br>
                                <?= $news[$i]["text"] ?>
                            </p>
                        </div>
                    <?php endfor; ?>

                </div>

            </main>

        </div>
    </div>

    <?php require_once "footer.php"; ?>

    <script>
    </script>
    
</body>
</html>