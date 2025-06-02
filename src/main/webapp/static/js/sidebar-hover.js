$(document).ready(function () {
    let hoverTimer = null;

    // Khi hover vào sidebar
    $('.main-sidebar').on('mouseenter', function () {
        // Nếu đang ở trạng thái collapse thì mới mở ra
        if ($('body').hasClass('sidebar-collapse')) {
            // Hủy bỏ timer cũ nếu có
            if (hoverTimer) {
                clearTimeout(hoverTimer);
            }
            // Thiết lập timer mới để mở sidebar sau 100ms
            hoverTimer = setTimeout(function () {
                $('.nav-link[data-widget="pushmenu"]');
            }, 100);
        }
    }).on('mouseleave', function () {
        // Hủy bỏ timer cũ nếu có
        if (hoverTimer) {
            clearTimeout(hoverTimer);
        }
        // Nếu sidebar đang mở rộng, đóng lại sau 50ms
        if (!$('body').hasClass('sidebar-collapse')) {
            hoverTimer = setTimeout(function () {
                $('.nav-link[data-widget="pushmenu"]').trigger('click');
            }, 800);
        }
    });

    // Nếu người dùng click hẳn vào nút pushmenu, ta xóa timer để tránh xung đột
    $('.nav-link[data-widget="pushmenu"]').on('click', function () {
        if (hoverTimer) {
            clearTimeout(hoverTimer);
            hoverTimer = null;
        }
    });
});