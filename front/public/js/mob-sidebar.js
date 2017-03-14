var sidebar = {

    $body: $('body'),

    init: function () {
        var self = this;
        
        self.bindEvents();
    },
    bindEvents: function () {
        var self = this;
        
        self.handle();
    },
    handle: function () {
        var self = this;
        
        $('.j-sidebar-toggle').on('click', function () {
            if (self.$body.hasClass('active-mob-sidebar')) {
                self.$body.removeClass('active-mob-sidebar');
            } else {
                self.$body.addClass('active-mob-sidebar');
            }
        })
    }
};

sidebar.init();