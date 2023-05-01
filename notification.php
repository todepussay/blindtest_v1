<?php if(isset($notification)): ?>
        <div class="notification">
            <div class="notification-content">
                <p><?= $notification ?></p>
            </div>
            <div class="notification-close">
                <ion-icon name="close-outline"></ion-icon>
            </div>
        </div>
    <?php endif; ?>

<script src="js/notification.js"></script>