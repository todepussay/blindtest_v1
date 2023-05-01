let close_notification = document.querySelector(".notification-close");
let notification = document.querySelector(".notification");

close_notification.addEventListener("click", () => {
    notification.style.animation = "notification-close 0.5s ease forwards";
    setTimeout(() => {
        notification.style.display = "none";                
    }, 500);
});