$(function () {
    $('.j-sidebar-toggle').on('click', function () {
        var body = $('body');
        if (body.hasClass('active-mob-sidebar')) {
            body.removeClass('active-mob-sidebar');
        } else {
            body.addClass('active-mob-sidebar');
        }
    })
});