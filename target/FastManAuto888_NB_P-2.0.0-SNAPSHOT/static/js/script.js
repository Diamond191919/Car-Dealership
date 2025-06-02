function handleScroll() {
  const elements = document.querySelectorAll('.fade-in, .scale-effect, .parallax');

  elements.forEach(element => {
    const rect = element.getBoundingClientRect();
    const isVisible = rect.top >= 0 && rect.bottom <= window.innerHeight;

    if (isVisible) {
      element.classList.add('visible');
    }
  });
}

// Password toggle functionality
document.addEventListener('DOMContentLoaded', function() {
  // Khởi tạo tất cả modals
  var modals = document.querySelectorAll('.modal');
  modals.forEach(function(modal) {
    new bootstrap.Modal(modal);
  });
});

document.addEventListener('DOMContentLoaded', function() {
  const inputs = document.querySelectorAll('.floating-label-group input');

  inputs.forEach(input => {
      input.addEventListener('input', function() {
          if (this.value) {
              this.classList.add('has-value');
          } else {
              this.classList.remove('has-value');
          }
      });
  });
});

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

