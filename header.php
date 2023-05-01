<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<header>
    <nav>
        <div id="left">
            <a href="index.php">
                <!-- <img src="asset/favicon.png" alt="Logo"> -->
                <ion-icon name="musical-notes-outline"></ion-icon>
            </a>
        </div>

        <div id="center">
            <a href="game_selection.php">Jouer !</a>
        </div>

        <div id="right">
            <div id="search-user">
                <ion-icon name="search-outline"></ion-icon>
            </div>

            <?php if(isset($_SESSION['user'])): ?>
                <a href="profils.php?id=<?= $_SESSION['user']['user_id'] ?>">
                    <img src="asset/profils_picture/<?= $_SESSION['user']['picture'] ?>" alt="Profils picture">
                </a>
            
            <?php else : ?>
                <a href="login.php">
                    <ion-icon name="person-outline"></ion-icon>
                </a>
            <?php endif; ?>
        </div>

        <div class="search-btn-phone">
            <ion-icon name="search-outline"></ion-icon>
        </div>

    </nav>
</header>