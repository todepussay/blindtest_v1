<?php

session_start();

require('connect.php');

$sql = "SELECT users.user_id, users.username, users.admin, users.picture, users.bio, users.discord, users.anilist, users.twitter FROM users WHERE users.user_id = :id";
$sql = $connect->prepare($sql);
$sql->bindParam(":id", $_GET['id']);
$sql->execute();
$user = $sql->fetchAll();
$user = $user[0];

$activity = "SELECT users.username as 'pseudo', categories.name as 'categorie', score.date_score as 'date', users.picture as 'pp' FROM users, categories, score WHERE users.user_id = score.user_id AND categories.id = score.categorie_id AND users.user_id = :id LIMIT 20";
$activity = $connect->prepare($activity);
$activity->bindParam(":id", $_GET['id']);
$activity->execute();
$activity = $activity->fetchAll();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $user["username"] ?> - Blindtest</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/profils.css">
</head>
<body>

    <?php require_once "header.php"; ?>

    <div class="container">
        <div class="content-profils">

            <div class="general">

                <div class="user-profils">
                    <img src="asset/profils_picture/<?= $user["picture"] ?>" alt="Profil user">
                </div>

                <div class="user-details">
                    <h2 <?php if($user['admin'] == 1){echo "class='user-admin'";} ?>><?= $user["username"] ?></h2>
                </div>

                <?php if($user["user_id"] == $_SESSION['user']["user_id"]): ?>
                    <div class="btn">
                        <a href="setting.php"><ion-icon name="settings-outline"></ion-icon></a>
                    </div>
                <?php endif; ?>

            </div>

        </div>

        <main>

            <div class="description">
                <h2>Description</h2>
                
                <div class="description-box">
                    <p>
                        <?php
                            if (!empty($user["bio"])) {
                                echo $user["bio"];
                            } else {
                                echo "Ce joueur n'a pas de description.";
                            }
                        ?>
                    </p>
                </div>

                <div class="contacts">

                    <?php if(!empty($user["discord"])): ?>
                        <div id="discord" class="contact">
                            <div class="contact-img">
                                <img src="asset/discord.png" alt="discord logo">
                            </div>
                            <div class="contact-description">
                                <span><?= $user["discord"] ?></span>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(!empty($user["anilist"])): ?>
                        <div id="anilist" class="contact">
                            <div class="contact-img">
                                <img src="asset/anilist.png" alt="anilist logo">
                            </div>
                            <div class="contact-description">
                                <span><?= $user["anilist"] ?></span>
                            </div>
                        </div>
                    <?php endif; ?>

                    <?php if(!empty($user['twitter'])): ?>
                        <div id="twitter" class="contact">
                            <div class="contact-img">
                                <img src="asset/twitter.png" alt="twitter logo">
                            </div>
                            <div class="contact-description">
                                <span><?= $user["twitter"] ?></span>
                            </div>
                        </div>
                    <?php endif; ?>

                </div>

                

            </div>

            <div class="home-activity">
                <h2>Activité</h2>
                <?php for($i = 0; $i < count($activity); $i++): ?>
                    <div class="activity">
                        <div class="user-profils">
                            <img src="asset/profils_picture/<?= $activity[$i]["pp"] ?>" alt="Profil user">
                        </div>
                        <div class="user-activity">
                            <p class="activity-details">
                                <span class="activity-date">
                                    <?php

                                        $date = new DateTime($activity[$i]["date"]);
                                        $date = $date->format("d/m/Y à H:i");
                                        echo $date;
                                    
                                    ?>
                                </span><br>
                                <span class="activity-pseudo"><?= $activity[$i]["pseudo"] ?></span> a fait un blindtest sur les <span class="activity-categorie"><?= ucfirst($activity[$i]["categorie"]) ?></span>.
                            </p>
                        </div>
                    </div>
                    <div class="activity">
                        <div class="user-profils">
                            <img src="asset/profils_picture/<?= $activity[$i]["pp"] ?>" alt="Profil user">
                        </div>
                        <div class="user-activity">
                            <p class="activity-details">
                                <span class="activity-date">
                                    <?php

                                        $date = new DateTime($activity[$i]["date"]);
                                        $date = $date->format("d/m/Y à H:i");
                                        echo $date;
                                    
                                    ?>
                                </span><br>
                                <span class="activity-pseudo"><?= $activity[$i]["pseudo"] ?></span> a fait un blindtest sur les <span class="activity-categorie"><?= ucfirst($activity[$i]["categorie"]) ?></span>.
                            </p>
                        </div>
                    </div>
                    <div class="activity">
                        <div class="user-profils">
                            <img src="asset/profils_picture/<?= $activity[$i]["pp"] ?>" alt="Profil user">
                        </div>
                        <div class="user-activity">
                            <p class="activity-details">
                                <span class="activity-date">
                                    <?php

                                        $date = new DateTime($activity[$i]["date"]);
                                        $date = $date->format("d/m/Y à H:i");
                                        echo $date;
                                    
                                    ?>
                                </span><br>
                                <span class="activity-pseudo"><?= $activity[$i]["pseudo"] ?></span> a fait un blindtest sur les <span class="activity-categorie"><?= ucfirst($activity[$i]["categorie"]) ?></span>.
                            </p>
                        </div>
                    </div>
                <?php endfor; ?>
            </div>

        </main>
    </div>

    <?php require_once "footer.php"; ?>

    
    
</body>
</html>