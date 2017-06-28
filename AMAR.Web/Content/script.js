
/*Menu-toggle*/
$("#menu-toggle").click(function (e) {

    e.preventDefault();
    $("#wrapper").toggleClass("wr-active");
    hideMenu();
});

/*Scroll Spy*/
$('body').scrollspy({ target: '#spy', offset: 80 });

/*Smooth link animation*/
$('a[href*="#"]:not([href="#"])').click(function () {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') || location.hostname == this.hostname) {
        ;
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
        if (target.length) {
            $('html,body').animate({
                scrollTop: target.offset().top
            }, 1000);
            return false;
        }
    }
})
function hhh(className) {

    hideMenu();

    var appBanners = document.getElementsByClassName(className);

    for (var i = 0; i < appBanners.length; i++) {
        appBanners[i].style.display = 'block';
    }
}
function hideMenu() {
    var hide = $(".navbar-nav li");
    for (var i = 0; i < hide.length; i++) {
        hide[i].style.display = 'none';
    }
}
