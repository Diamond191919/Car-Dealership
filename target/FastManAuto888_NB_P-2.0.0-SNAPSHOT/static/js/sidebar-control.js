$(function () {
    // Hover mở rộng sidebar
    $('.main-sidebar').hover(
        function () {
            // Kiểm tra xem sidebar có bị ẩn hoàn toàn hay không
            if ($('body').hasClass('sidebar-collapse') || $('body').hasClass('sidebar-closed')) {
                // Mở sidebar
                $('body').removeClass('sidebar-collapse sidebar-closed').addClass('sidebar-open');
            }
        },
        function () {
            // Kiểm tra xem sidebar có đang ở trạng thái "mở tạm" hay không
            if ($('body').hasClass('sidebar-open')) {
                // Thu gọn sidebar
                $('body').removeClass('sidebar-open').addClass('sidebar-collapse');
            }
        }
    );
    // Xử lý sự kiện click trên nút pushmenu
    $('[data-widget="pushmenu"]').on('click', function () {
        // Kiểm tra trạng thái hiện tại của sidebar
        if ($('body').hasClass('sidebar-open')) {
            // Nếu đang mở, thu gọn lại
            $('body').removeClass('sidebar-open').addClass('sidebar-collapse');
        } else if ($('body').hasClass('sidebar-collapse')) {
            // Nếu đang thu gọn, mở ra
            $('body').removeClass('sidebar-collapse').addClass('sidebar-open');
        } else {
            // Nếu đang đóng hoàn toàn, mở ra
            $('body').removeClass('sidebar-closed').addClass('sidebar-open');
        }
    });
});