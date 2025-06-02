$(document).ready(function () {
    $(document).ready(function () {
        // Hàm để xác định số lượng xe hiển thị
        function getItemsToShow() {
            var screenWidth = window.innerWidth;
            if (screenWidth >= 1600) {
                return 10; // Hiển thị 10 xe trên màn hình desktop rất lớn
            } else if (screenWidth >= 1200) {
                return 8; // Hiển thị 8 xe trên màn hình lớn
            } else if (screenWidth >= 1025) {
                return 6; // Hiển thị 6 xe trên màn hình desktop
            } else if (screenWidth >= 768) {
                return 4; // Hiển thị 4 xe trên màn hình tablet (laptop)
            } else {
                return 2; // Hiển thị 2 xe trên màn hình mobile
            }
        }

        // Lấy số lượng xe hiển thị dựa trên kích thước màn hình
        var itemsToShow = getItemsToShow();
        var totalCards = $('.custom-car-card').length;

        // Ban đầu ẩn tất cả các xe, chỉ hiện số xe đầu tiên dựa trên itemsToShow
        $('.custom-car-card').hide();
        $('.custom-car-card').slice(0, itemsToShow).show();

        // Nếu tổng số xe lớn hơn số xe ban đầu, thêm nút "Xem thêm"
        if (totalCards > itemsToShow) {
            $('.load-more-container').html('<button id="loadMore" class="load-more-btn">Xem thêm</button>');
        }

        // Hàm cập nhật văn bản của nút load-more
        function updateLoadButton() {
            var visibleItems = $('.custom-car-card:visible').length;
            if (visibleItems < totalCards) {
                $('#loadMore').text('Xem thêm');
            } else {
                $('#loadMore').text('Thu gọn');
            }
        }

        // Khi nhấn nút load-more
        $('#loadMore').on('click', function () {
            var visibleItems = $('.custom-car-card:visible').length;
            if (visibleItems < totalCards) {
                // Hiển thị thêm xe dựa trên số lượng itemsToShow
                $('.custom-car-card').slice(visibleItems, visibleItems + itemsToShow).slideDown(function () {
                    updateLoadButton();
                });
            } else {
                // Thu gọn: ẩn các xe sau số xe ban đầu
                $('.custom-car-card').not(':lt(' + itemsToShow + ')').slideUp().promise().done(function () {
                    updateLoadButton();
                    // Cuộn lên đầu grid
                    $('html, body').animate({
                        scrollTop: $('.custom-cars-grid').offset().top
                    }, 600);
                });
            }
        });

        // Cập nhật số lượng xe khi thay đổi kích thước màn hình
        $(window).resize(function () {
            itemsToShow = getItemsToShow();
            var visibleItems = $('.custom-car-card:visible').length;
            if (visibleItems > itemsToShow) {
                // Nếu có nhiều xe hơn số lượng hiển thị, thu gọn lại
                $('.custom-car-card').not(':lt(' + itemsToShow + ')').slideUp();
                updateLoadButton();
            } else {
                // Nếu số lượng hiển thị ít hơn, không cần làm gì
                updateLoadButton();
            }
        });

        // Car Modal: populate modal with card data on click
        $('.custom-car-card').on('click', function () {
            var title = $(this).data('title');
            var year = $(this).data('year');
            var price = $(this).data('price');
            var img = $(this).data('img');

            $('#carModalLabel').text(title);
            $('#carModalYear').text('Năm: ' + year);
            $('#carModalPrice').text('Giá: ' + price);
            $('#carModalImg').attr('src', img);
        });
    });
    console.log("Load more initialized!");
});



