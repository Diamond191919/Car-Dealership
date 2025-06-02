$(document).ready(function () {
    $('.custom-car-card').on('click', function () {
        var title = $(this).data('title');
        var serial = $(this).data('serial');
        var model = $(this).data('model');
        var colour = $(this).data('colour');
        var year = $(this).data('year');
        var price = $(this).data('price');
        var img = $(this).data('img');
        var status = $(this).data('status');

        $('#carModalLabel').text(title);
        $('#carModalImg').attr('src', img);
        $('#carModalSerial').text(serial);
        $('#carModalModel').text(model);
        $('#carModalColour').text(colour);
        $('#carModalYear').text(year);
        $('#carModalPrice').text(price);
        $('#carModalStatus').text(status);
    });
});