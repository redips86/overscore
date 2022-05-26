$(document).ready(function () {
    $('#btnSearch').on('click', function () {
        searchUser();
    });

    $("#txtName").keydown(function (key) {
        if (key.keyCode == 13) {
            searchUser();
        }
    });

    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r;
        i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date();
        a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
        a.async = 1;
        a.src = g;
        m.parentNode.insertBefore(a, m)
    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-96094896-1', 'auto');
    ga('send', 'pageview');

    function searchUser() {
        $('#page-wrapper').toggleClass('sk-loading');
        var name = $("#txtName").val();
        name = name.replace("#", "%23");
        $('.navbar-static-top').css('z-index', 0);
        location.replace("/search?name=" + name);
    }
});