/*jslint unparam: true, sloppy: true, devel: true, node: true, windows: true */
/*global jQuery:false */
(function ($) {
    $.fn.validateField = function () {
        if (this.val().length === 0 || this.val().length > 20) {
            this.addClass("ui-state-error");
            this.parent().parent().parent().find(".validateTips").html("Długość pola musi być pomiędzy 1 a 20 znaków ");
            return false;
        } else {
            this.removeClass("ui-state-error");
            this.parent().parent().parent().find(".validateTips").html("");
        }
        return true;
    };
})(jQuery);