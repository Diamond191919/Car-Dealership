$(document).ready(function () {
    // Sử dụng SortableJS để cho phép kéo và thả các phần tử trong row
    var el = document.getElementById('profile-edit-container');
    var sortable = new Sortable(el, {
        handle: '.card-header',  // Cho phép kéo và thả bằng cách kéo phần tiêu đề card
        animation: 150,  // Thời gian chuyển động khi kéo
    });
});