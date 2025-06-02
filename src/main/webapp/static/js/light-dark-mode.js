// Toggle Dark/Light Mode
function toggleDarkMode() {
    document.body.classList.toggle('dark-mode');
    const icon = document.getElementById('toggle-icon');
    if (document.body.classList.contains('dark-mode')) {
        icon.textContent = '☀️'; // Biểu tượng mặt trời
    } else {
        icon.textContent = '🌙'; // Biểu tượng mặt trăng
    }
}