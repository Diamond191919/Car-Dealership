$(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('#backToTop').fadeIn();
    } else {
        $('#backToTop').fadeOut();
    }
});

$('#backToTop').click(function () {
    $('html, body').animate({ scrollTop: 0 }, 600);
    return false;
});