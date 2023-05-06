<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>


<?php

$sql = "SELECT users.user_id, users.username, users.picture FROM users";
$sql = $connect->prepare($sql);
$sql->execute();
$users_recherche = $sql->fetchAll();

?>

<header>
    <nav>
        <div id="left">
            <a href="home">
                <!-- <img src="asset/favicon.png" alt="Logo"> -->
                <ion-icon name="musical-notes-outline"></ion-icon>
            </a>
        </div>

        <div id="center">
            <a href="selection">Jouer !</a>
        </div>

        <div id="right">
            <div id="search-user">
                <ion-icon name="search-outline"></ion-icon>
            </div>

            <?php if(isset($_SESSION['user'])): ?>
                <a href="user/<?= $_SESSION['user']['user_id'] ?>">
                    <img src="asset/profils_picture/<?= $_SESSION['user']['picture'] ?>" alt="Profils picture">
                </a>
            
            <?php else : ?>
                <a href="login">
                    <ion-icon name="person-outline"></ion-icon>
                </a>
            <?php endif; ?>
        </div>

        <div class="search-btn-phone" id="search_btn">
            <ion-icon name="search-outline"></ion-icon>
        </div>

    </nav>

</header>

<div class="recherche" id="recherche-box">

    <div id="close">
        <ion-icon name="close-outline"></ion-icon>
    </div>

    <div class="recherche-box">
        <input type="text" name="recherche" id="search" placeholder="Rechercher un utilisateur">
    </div>
    
    <div class="resultats" id="list-resultat">

    </div>
</div>

<div id="del">
    <input type="hidden" id="user_max" value="<?= count($users_recherche) ?>">
    <?php for($i = 0; $i < count($users_recherche); $i++): ?>
        <input type="hidden" id="id_<?= $i ?>" value="<?= $users_recherche[$i]["user_id"] ?>">
        <input type="hidden" id="username_<?= $i ?>" value="<?= $users_recherche[$i]["username"] ?>">
        <input type="hidden" id="picture_<?= $i ?>" value="<?= $users_recherche[$i]["picture"] ?>">
    <?php endfor; ?>
</div>

<script src="js/recherche.js"></script>