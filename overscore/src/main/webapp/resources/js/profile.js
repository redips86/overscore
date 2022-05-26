$(document).ready(function () {
    $("#hero_" + $("#heroesId").val()).css('background-color', '#f7931e');
    $(".rank").each(function (index) {
        if ($(this).attr("data-value") == $("#oppositeId").val())
            $(this).css('background-color', '#f7931e');
    });

    var cookies = getCookie("favorite");
    var flag = false;
    cookieList = cookies.split(",");

    for (i = 0; i < cookieList.length; i++) {
        if (cookieList[i] == $("#userId").val())
            flag = true;
    }

    if (flag)
        $("#btnFavorite, #btnFavorite2").addClass("active");
    else
        $("#btnFavorite, #btnFavorite2").removeClass("active");

    if ($("#expand").val() == 1) {
        $("#collapseOne").attr("aria-expanded", true);
        $("#collapseOne").addClass("in");
        $("#collapseOne").css("height", "");
    }

    var syncId = $("#syncId").val();
    if (syncId > 0) {
        /*$('#page-wrapper').toggleClass('sk-loading');
        $('.navbar-static-top').css('z-index', 0);
       */
        var pointCnt = 0;
        var pointStr = ".";

        repeat = setInterval(function checkUpdate() {
            $("#step3, #step3_1").css("display", "none");
            $("#spanProcess").css("display", "block");

            var param = [{
                name: 'syncId',
                value: syncId
            }];

            $.ajax({
                type: "GET",
                url: "/search/checkUpdate",
                data: param,
                cache: false,
                async: false,
                success: function (data) {
                    console.log(syncId + ", " + data.status);

                    if (data.status == "C" || data == null) {
                        clearInterval(repeat);
                        var userId = $("#userId").val();
                        location.replace("/profile?userId=" + userId);
                    } else if (data.status == "W" && data.waitCnt > 0) {
                        $("#btnProcess").text("대기중 [" + data.waitCnt + "]");
                    } else if (data.status == "R" || data.waitCnt == 0) {
                        pointCnt++;
                        pointStr += ".";
                        if ((pointCnt % 4) == 0)
                            pointStr = ".";

                        $("#btnProcess").text("갱신중" + pointStr);
                    }

                },
                error: function () {

                }

            });
        }, 1000);
    }


});

$('.hero').mouseover(function (event) {

    $('.hero').each(function (index) {
        if ($(this).attr('data-value') != $("#heroesId").val())
            $(this).css('background-color', '#a7b1c2');
    });

    $(this).css('background-color', '#f7931e');
});

$('.hero').mouseout(function (event) {
    $('.hero').each(function (index) {
        if ($(this).attr('data-value') != $("#heroesId").val())
            $(this).css('background-color', '#a7b1c2');
    });
});

$('.hero').click(function (event) {
    var heroesId = $(this).attr('data-value');
    if (heroesId != $("#heroesId").val())
        loadHeroes(heroesId);
});

$('#btnFaq').click(function (event) {
    location.replace("/faq");
});

$('.rank').mouseover(function (event) {
    $('.rank').each(function (index) {
        if ($(this).attr('data-value') != $("#oppositeId").val())
            $(this).css('background-color', '#a7b1c2');
    });
    $(this).css('background-color', '#f7931e');
});

$('.rank').mouseout(function (event) {
    $('.rank').each(function (index) {
        if ($(this).attr('data-value') != $("#oppositeId").val())
            $(this).css('background-color', '#a7b1c2');
    });
});

$('.rank').click(function (event) {
    var userId = $("#userId").val();
    var oppositeId = $(this).attr('data-value');
    var heroesId = $("#heroesId").val();
    var typeId = $("#typeId").val();
    var expand = $("#collapseOne").attr("aria-expanded") == "true" ? 1 : 0;
    location.replace("/profile?userId=" + userId + "&oppositeId=" + oppositeId + "&heroesId=" + heroesId + "&typeId=" + typeId + "&expand=" + expand);
});

/* $("li[name$='t2_h1_img']").each(function(index){
	$(this).click(function(e){
		var heroesId = $("#heroesId").val();
		var typeId = $("#typeId").val();
		var expand = $("#collapseOne").attr("aria-expanded") == "true" ? 1 : 0;
		location.replace("/profile?userId=" + $("#oppositeId").val() + "&oppositeId=" + $("#userId").val() + "&heroesId=" + heroesId  + "&typeId=" + typeId + "&expand=" + expand, '', '');
	})
}); */

$("#btnQuick, #btnQuick2").click(function () {
    /*$("#typeId").val(2);
    loadHeroes();*/
    var userId = $("#userId").val();
    var oppositeId = $("#oppositeId").val();
    var heroesId = $("#heroesId").val();
    var typeId = 2;
    var expand = $("#collapseOne").attr("aria-expanded") == "true" ? 1 : 0;
    location.replace("/profile?userId=" + userId + "&oppositeId=" + oppositeId + "&heroesId=" + heroesId + "&typeId=" + typeId + "&expand=" + expand);
});

$("#btnComp, #btnComp2").click(function () {
    /*$("#typeId").val(1);
    loadHeroes();*/
    var userId = $("#userId").val();
    var oppositeId = $("#oppositeId").val();
    var heroesId = $("#heroesId").val();
    var typeId = 1;
    var expand = $("#collapseOne").attr("aria-expanded") == "true" ? 1 : 0;
    location.replace("/profile?userId=" + userId + "&oppositeId=" + oppositeId + "&heroesId=" + heroesId + "&typeId=" + typeId + "&expand=" + expand);
});

$("#btnFavorite, #btnFavorite2").click(function (e) {
    var cookies = getCookie("favorite");
    var userId = $("#userId").val();

    cookieList = cookies.split(",");

    if ($("#btnFavorite, #btnFavorite2").hasClass("active")) {
        $("#btnFavorite, #btnFavorite2").removeClass("active");
        $("#btnFavorite, #btnFavorite2").css("background-color", "rgba(0, 0, 0, 0)");
        $("#btnFavorite, #btnFavorite2").css("color", "#f7a54a");

        var reCookie = "";
        for (i = 0; i < cookieList.length; i++) {
            if (!(cookieList[i] == userId))
                reCookie += cookieList[i] + ",";
        }

        if (reCookie == "")
            setCookie("favorite", "", 365);
        else {
            reCookie = reCookie.slice(0, -1)
            setCookie("favorite", reCookie, 365);
        }

    } else {
        $("#btnFavorite, #btnFavorite2").addClass("active");
        $("#btnFavorite, #btnFavorite2").css("background-color", "#f7a54a");
        $("#btnFavorite, #btnFavorite2").css("color", "#fff");

        if (cookies == "")
            setCookie("favorite", userId, 365);
        else {
            var flag = false;

            for (i = 0; i < cookieList.length; i++) {
                if (cookieList[i] == userId)
                    flag = true;
            }
            if (!flag)
                setCookie("favorite", cookies + "," + userId, 365);
        }

    }
});

$("#btnUpdate, #btnUpdate2").click(function () {
    /*$('#page-wrapper').toggleClass('sk-loading');
    $('.navbar-static-top').css('z-index', 0);*/
    location.replace("/search/update?userId=" + $("#userId").val());
});

$('#btnSearch2').on('click', function () {
    searchUser2(1, 0);
});

$('#btnSearch2_1').on('click', function () {
    searchUser2(1, 1);
});

$('#btnSearch3').on('click', function () {
    searchUser2(2, 0);
});

$('#btnSearch3_1').on('click', function () {
    searchUser2(2, 1);
});


$("#txtName2").keydown(function (key) {
    if (key.keyCode == 13) {
        searchUser2(1, 0);
    }
});

$("#txtName2_1").keydown(function (key) {
    if (key.keyCode == 13) {
        searchUser2(1, 1);
    }
});

$("#btnVersus").on('click', function () {
    $("#txtName2").val("");
    $("#searchModal").empty();
    $("#searchModal").removeClass("modal-body");
});


var temp = "<div class='popover tour'>";
temp += "<div class='arrow'></div>";
temp += "<h3 class='popover-title'></h3>";
temp += "<div class='popover-content'></div>";
temp += "<div class='popover-navigation'>";
temp += "<button class='btn btn-default' data-role='prev'>« 이전</button>";
temp += "<span data-role='separator'></span>";
temp += "<button class='btn btn-default' data-role='next'>다음 »</button>";
temp += "<button class='btn btn-default' data-role='end'>끝</button>";
temp += "</div>";
temp += "</div>";

var inner = {
    element: "#step1",
    title: "<i class='fa fa-info-circle' style='font-size:small'> 오버스코어 도우미</i>",
    content: "나의 프로필을 <br />한 눈에 볼 수 있습니다.",
    placement: "bottom",
    backdrop: true,
    backdropContainer: '#wrapper',
    onShown: function (tour) {
        $('body').addClass('tour-open')
    },
    onHidden: function (tour) {
        $('body').removeClass('tour-close')
    }
};

var inner2 = clone(inner);
inner2.element = "#step2";
inner2.content = "경쟁전, 빠른대전 프로필로 <br /> 변경할 수 있습니다";
var inner2_1 = clone(inner);
inner2_1.element = "#step2_1";
inner2_1.content = "경쟁전, 빠른대전 프로필로 <br /> 변경할 수 있습니다";
var inner3 = clone(inner);
inner3.element = "#step3";
inner3.content = "최신 데이터로 <br />프로필을 갱신할 수 있습니다",
    inner3.placement = "left";
var inner3_1 = clone(inner);
inner3_1.element = "#step3_1";
inner3_1.content = "최신 데이터로 <br />프로필을 갱신할 수 있습니다",
    inner3_1.placement = "left";
var inner4 = clone(inner);
inner4.element = "#step4";
inner4.content = "조건 검색을 누르시면 <br />다양한 비교가 가능합니다 <br /> 꼭 사용해보세요!";
inner4.onNext = function (tour) {
    $("#collapseOne").attr("aria-expanded", true);
    $("#collapseOne").addClass("in");
    $("#collapseOne").css("height", "");
};
var inner4_1 = clone(inner);
inner4_1.element = "#step4_1";
inner4_1.placement = "top";
inner4_1.content = "영웅별 가상점수를 확인하고 <br />진짜 모스트 영웅을 찾아보세요!";
var inner4_2 = clone(inner);
inner4_2.element = "#step4_2";
inner4_2.placement = "top";
inner4_2.content = "다양한 비교를 위해 <br /> 티어별 훈련봇들을 <br />준비했습니다";
var inner5 = clone(inner);
inner5.element = "#step5";
inner5.placement = "top";
inner5.content = "트레이서를 클릭하면 <br /> 다른 유저와 <br />비교할 수 있습니다";
var inner6 = clone(inner);
inner6.element = "#step6";
inner6.placement = "bottom";
inner6.content = "내 영웅의 가상점수입니다. <br /> 가상점수가 경쟁전 점수보다 높다면 <br />남은건 승급뿐입니다!";
var inner6_1 = clone(inner);
inner6_1.element = "#step6_1";
inner6_1.placement = "bottom";
inner6_1.content = "상대방의 가상점수입니다. <br /> 티어 평균 또는 다른 유저와 <br /> 비교할 수 있습니다";
var inner6_2 = clone(inner);
inner6_2.element = "#step6_2";
inner6_2.placement = "bottom";
inner6_2.content = "상대방의 가상점수입니다. <br /> 티어 평균 또는 다른 유저와 <br /> 비교할 수 있습니다";
var inner7 = clone(inner);
inner7.element = "#step7";
inner7.placement = "top";
inner7.content = "내 영웅의 종합평가를 <br />한 눈에 알아볼 수 있습니다. ";
var inner7_1 = clone(inner);
inner7_1.element = "#step7_1";
inner7_1.placement = "bottom";
inner7_1.content = "즐겨찾기를 이용해 <br />편리하게 프로필을 찾아보세요! ";
var inner7_2 = clone(inner);
inner7_2.element = "#step7_2";
inner7_2.placement = "bottom";
inner7_2.content = "즐겨찾기를 이용해 <br />편리하게 프로필을 찾아보세요! ";
var inner8 = clone(inner);
inner8.element = "#step1";
inner8.placement = "bottom";
inner8.content = "도움말은 여기까지입니다. <br /> 문의사항은 피드백 <br />페이지를 방문해주세요. <br /><br />감사합니다!";

inner.onPrev = function (tour) {
    tour.end();
};

inner8.onNext = function (tour) {
    tour.end();
};

// Instance the tour
var tour = new Tour({
    template: temp,
    steps: [
        inner, inner2, inner2_1, inner3, inner3_1, inner4, inner4_1, inner4_2, inner5, inner6, inner6_1, inner6_2, inner7, inner7_1, inner7_2, inner8
    ]
});


tour.init();
$('.startTour').click(function () {
    tour.restart();
});

function setCookie(cName, cValue, cDay) {
    var expire = new Date();
    expire.setDate(expire.getDate() + cDay);
    cookies = cName + '=' + escape(cValue) + '; path=/ ';
    if (typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
    document.cookie = cookies;
}

function getCookie(cName) {
    cName = cName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cName);
    var cValue = '';
    if (start != -1) {
        start += cName.length;
        var end = cookieData.indexOf(';', start);
        if (end == -1) end = cookieData.length;
        cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}

function searchUser2(difftype, isMobile) {
    var name = (isMobile == 0) ? $("#txtName2").val() : $("#txtName2_1").val();
    name = name.replace("#", "%23");

    var userId = $("#userId").val();
    var heroesId = $("#heroesId").val();
    var typeId = $("#typeId").val();
    /* var expand = $("#collapseOne").attr("aria-expanded") == "true" ? 1 : 0; */
    var expand = 0;

    var param = [{
        name: 'name',
        value: name
    }, {
        name: 'difftype',
        value: difftype
    }];

    var html = "<div id='divSearchModal' class='row'>";
    html += "<div class='wrapper wrapper-content' style='padding:0px 10px;'>";

    $.ajax({
        type: "GET",
        url: "/search/getSearchModal",
        data: param,
        cache: false,
        async: false,
        success: function (data) {
            if (data.length > 0) {
                for (var i in data) {
                    html += "<div class='col-xs-12'>";
                    html += "<a href='/profile?userId=" + userId + "&oppositeId=" + data[i].userId + "&heroesId=" + heroesId + "&typeId=" + typeId + "&expand=" + expand + "'>";
                    html += "<div class='ibox float-e-margins'>";
                    html += "<div class='ibox-content heroes' style='height:120px;color:whitesmoke;"
                    html += "background-image:url(https://overwatch-a.akamaihd.net/img/scene/candy-895e91cbc198218dbe56fed67b590a7c37a8bc3ef29d4b8c2989edf2196cfdb4b6150e64cb6f57a01a26268ae764b4cc22da52168121287e68aa8a9891efd616.jpg)'>";

                    html += "<div class='visible-top2 text-left' style='position: absolute;left:35px;top:20px;'>";
                    html += "<img style='width:80px;height:80px;' src='" + data[i].avatar + "' class='img-rounded rounded-border m-b-md' alt='profile'>";
                    html += "</div>";

                    html += "<div class='visible-top2 text-left' style='position: absolute;left:36px;top:79px;'>";
                    html += "<span class='label' style='padding:2px 4px; background-color:#ffffff; border-radius:6px'>Lv." + data[i].level + "</span>";
                    html += "</div>";

                    html += "<div class='summary'>";
                    html += "<span style='font-size:25px;'><strong>" + data[i].userName + "</strong></span><br>";
                    if (data[i].compRank == -1)
                        html += "<span style='font-size:18px;'><strong>" + data[i].wins + "승</strong></span>";
                    else
                        html += "<span style='font-size:18px;''><strong>" + data[i].compRank + "</strong><img alt='image' style='width:25px;height:25px;margin-bottom:3px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + data[i].tierImage + ".png'></span>";
                    html += "</div>";

                    html += "<div class='lblServer'>";
                    html += "<span class='btn btn-default btn-xs' style='color:#676a6c'>" + data[i].server + "</span>";
                    html += "</div>";

                    html += "<div class='lblKd'>";
                    html += "<span class='btn btn-xs " + data[i].kpdColor + "'>K/D " + data[i].kpd + "</span>";
                    html += "</div>";

                    html += "<div class='visible-most' style='position:absolute;right:104px;bottom:40px;'>";
                    for (var j = 1; j < data[i].mostHeroes.length; j++) {
                        html += "<div class='mask'>";
                        html += "<div class='hero' style='background-image: url(https://blzgdapipro-a.akamaihd.net/hero/" + data[i].mostHeroes[j].heroesImg + "/icon-portrait.png);'></div>";
                        html += "</div>";
                    }
                    html += "</div>";

                    html += "<div style='position:absolute;right:35px;bottom:40px;'>";
                    html += "<div class='mask2'>";
                    html += "<div class='hero2' style='background-image: url(https://blzgdapipro-a.akamaihd.net/hero/" + data[i].mostHeroes[0].heroesImg + "/icon-portrait.png);'></div>";
                    html += "</div>";
                    html += "</div>";

                    html += "</div>";
                    html += "</div>";
                    html += "</a>";
                    html += "</div>";
                }
            } else {
                if (name.indexOf("%23")) {
                    name = name.split("%23")[0];
                }
                html += "<div class='ibox float-e-margins' style='margin-bottom:0px;'>";
                html += "<div class='ibox-content' style='text-align:center;'>";
                html += "<h2>";
                html += "<p>플레이어를 <br class='br-s-break'>찾을 수 없습니다</p>";
                html += "<span class='text-navy'>" + name + "</span>";
                html += "</h2>";
                html += "</div>";
                html += "</div>";
            }

            html += "</div></div>";

            $("#searchModal").empty();
            $("#searchModal").addClass("modal-body");
            $("#searchModal").append(html);

        },
        error: function () {

        }

    });
}

function loadHeroes(hId) {
    var userId = $("#userId").val();
    var oppositeId = $("#oppositeId").val();
    var userName = $("#userName").val();
    var oppositeName = $("#oppositeName").val();
    var typeId = $("#typeId").val();
    var heroesId = (hId == null) ? $("#heroesId").val() : hId;

    var param = [{
        name: 'userId',
        value: userId
    }, {
        name: 'oppositeId',
        value: oppositeId
    }, {
        name: 'typeId',
        value: typeId
    }, {
        name: 'heroesId',
        value: heroesId
    }];

    var html = "<tbody>";
    var myHeroesImg = "";
    var opHeroesImg = "";

    $.ajax({
        type: "POST",
        url: "/profile/heroes",
        data: param,
        cache: false,
        async: false,
        success: function (data) {
            var myData;
            var opData;

            for (var i in data) {
                if (data[i].userId == userId) {
                    myData = data[i];
                    myHeroesImg = data[i].heroesImg;
                }
                if (data[i].userId == oppositeId) {
                    opData = data[i];
                    opHeroesImg = data[i].heroesImg;
                }
            }

            $("#statPanel").html("");

            var statHtml = "";
            statHtml += "<div class='panel panel-default'>";
            statHtml += "<div class='panel-heading'>일반</div>";
            statHtml += "<div class='panel-body'>";
            statHtml += "<table id='diff_table' class='table table-hover table-bordered' style='white-space: nowrap;''>";
            statHtml += "<thead><tr><th width='45%'>" + userName + "</th><th width='10%''></th><th width='45%'>" + oppositeName + "</th></tr></thead>";
            statHtml += "<tbody>";
            statHtml += "<tr><td>" + ((myData != null) ? myData.timePlayed.toFixed(1) + "시간" : '-') + "</td>";
            statHtml += "<td>플레이시간</td>";
            statHtml += "<td>" + ((opData != null) ? opData.timePlayed.toFixed(1) + "시간" : '-') + "</td></tr>";
            statHtml += "<tr><td>" + ((myData != null) ? ((typeId == 1) ? (myData.gamesWon.toFixed(0) + "승 " + myData.gamesTied.toFixed(0) + "무 " + myData.gamesLost.toFixed(0) + "패") : (myData.gamesWon.toFixed(0) + "승")) : '-') + "</td>"
            statHtml += "<td>전적</td>"
            statHtml += "<td>" + ((opData != null) ? ((typeId == 1) ? (opData.gamesWon.toFixed(0) + "승 " + opData.gamesTied.toFixed(0) + "무 " + opData.gamesLost.toFixed(0) + "패") : (opData.gamesWon.toFixed(0) + "승")) : '-') + "</td></tr>";
            if (typeId == 1) {
                statHtml += "<tr><td>" + ((myData != null) ? ((myData.gamesPlayed == 0) ? '-' : (myData.gamesWon * 100 / myData.gamesPlayed).toFixed(1)) + "%" : '-') + "</td>"
                statHtml += "<td>승률</td>"
                statHtml += "<td>" + ((opData != null) ? ((opData.gamesPlayed == 0) ? '-' : (opData.gamesWon * 100 / opData.gamesPlayed).toFixed(1)) + "%" : '-') + "</td></tr>";
            }
            statHtml += "</tbody>";
            statHtml += "</table>";
            statHtml += "</div>";
            statHtml += "</div>";
            statHtml += "</div>";
            $("#statPanel").append(statHtml);

            if (myData != null && myData.atk == 1 || opData != null && opData.atk == 1) {
                statHtml = "";
                statHtml += "<div id='statPanelAtk' class='panel panel-warning'>";
                statHtml += "<div class='panel-heading'>공격</div>";
                statHtml += "<div class='panel-body'>";
                statHtml += "<table id='diff_table' class='table table-hover table-bordered' style='white-space: nowrap;''>";
                statHtml += "<thead><tr><th width='45%'>" + userName + "</th><th width='10%''></th><th width='45%'>" + oppositeName + "</th></tr></thead>";
                statHtml += "<tbody>";
                statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.damageDone / myData.deaths).toFixed(2)) : '-') + "</td>";
                statHtml += "<td>딜/D</td>";
                statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.damageDone / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.eliminations / myData.deaths).toFixed(2)) : '-') + "</td>"
                statHtml += "<td>K/D</td>"
                statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.eliminations / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                statHtml += "</tbody>";
                statHtml += "</table>";
                statHtml += "</div>";
                statHtml += "</div>";
                statHtml += "</div>";
                $("#statPanel").append(statHtml);
            }

            if (myData != null && myData.def == 1 || opData != null && opData.def == 1) {
                statHtml = "";
                statHtml += "<div id='statPanelBlock' class='panel panel-success'>";
                statHtml += "<div class='panel-heading'>방어</div>";
                statHtml += "<div class='panel-body'>";
                statHtml += "<table id='diff_table' class='table table-hover table-bordered' style='white-space: nowrap;''>";
                statHtml += "<thead><tr><th width='45%'>" + userName + "</th><th width='10%''></th><th width='45%'>" + oppositeName + "</th></tr></thead>";
                statHtml += "<tbody>";
                statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.damageBlocked / myData.deaths).toFixed(2)) : '-') + "</td>";
                statHtml += "<td>방어/D</td>";
                statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.damageBlocked / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                statHtml += "</tbody>";
                statHtml += "</table>";
                statHtml += "</div>";
                statHtml += "</div>";
                statHtml += "</div>";
                $("#statPanel").append(statHtml);
            }

            if (myData != null && myData.heal == 1 || opData != null && opData.heal == 1) {
                statHtml = "";
                statHtml += "<div id='statPanelHeal' class='panel panel-primary'>";
                statHtml += "<div class='panel-heading'>치유</div>";
                statHtml += "<div class='panel-body'>";
                statHtml += "<table id='diff_table' class='table table-hover table-bordered' style='white-space: nowrap;''>";
                statHtml += "<thead><tr><th width='45%'>" + userName + "</th><th width='10%''></th><th width='45%'>" + oppositeName + "</th></tr></thead>";
                statHtml += "<tbody>";
                statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.healingDone / myData.deaths).toFixed(2)) : '-') + "</td>";
                statHtml += "<td>치유/D</td>";
                statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.healingDone / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                statHtml += "</tbody>";
                statHtml += "</table>";
                statHtml += "</div>";
                statHtml += "</div>";
                statHtml += "</div>";
                $("#statPanel").append(statHtml);
            }

            if (myData != null && myData.hit == 1 || opData != null && opData.hit == 1) {
                statHtml = "";
                statHtml += "<div id='statPanelHit' class='panel panel-hit'>";
                statHtml += "<div class='panel-heading'>명중</div>";
                statHtml += "<div class='panel-body'>";
                statHtml += "<table id='diff_table' class='table table-hover table-bordered' style='white-space: nowrap;''>";
                statHtml += "<thead><tr><th width='45%'>" + userName + "</th><th width='10%''></th><th width='45%'>" + oppositeName + "</th></tr></thead>";
                statHtml += "<tbody>";
                statHtml += "<tr><td>" + ((myData != null) ? (myData.weaponAccuracy * 100).toFixed(2) + "%" : '-') + "</td>";
                statHtml += "<td>명중률</td>";
                statHtml += "<td>" + ((opData != null) ? (opData.weaponAccuracy * 100).toFixed(2) + "%" : '-') + "</td></tr>";
                statHtml += "<tr><td>" + ((myData != null) ? (myData.criticalHitAccuracy * 100).toFixed(2) + "%" : '-') + "</td>";
                statHtml += "<td>치명타율</td>";
                statHtml += "<td>" + ((opData != null) ? (opData.criticalHitAccuracy * 100).toFixed(2) + "%" : '-') + "</td></tr>";
                statHtml += "</tbody>";
                statHtml += "</table>";
                statHtml += "</div>";
                statHtml += "</div>";
                statHtml += "</div>";
                $("#statPanel").append(statHtml);
            }

            if (myData != null && myData.skill == 1 || opData != null && opData.skill == 1) {
                statHtml = "";
                statHtml += "<div id='statPanelSkill' class='panel panel-info'>";
                statHtml += "<div class='panel-heading'>스킬</div>";
                statHtml += "<div class='panel-body'>";
                statHtml += "<table id='diff_table' class='table table-hover table-bordered' style='white-space: nowrap;''>";
                statHtml += "<thead><tr><th width='45%'>" + userName + "</th><th width='10%''></th><th width='45%'>" + oppositeName + "</th></tr></thead>";
                statHtml += "<tbody>";

                statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.skill1 / myData.deaths).toFixed(2)) : '-') + "</td>";
                statHtml += "<td>" + ((myData != null) ? myData.skill1Kor + "/D" : (opData != null) ? opData.skill1Kor + "/D" : '-') + "</td>";
                statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.skill1 / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                if (myData != null && myData.skill2Kor != null || opData != null && opData.skill2Kor != null) {
                    statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.skill2 / myData.deaths).toFixed(2)) : '-') + "</td>";
                    statHtml += "<td>" + ((myData != null) ? myData.skill2Kor + "/D" : (opData != null) ? opData.skill2Kor + "/D" : '-') + "</td>";
                    statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.skill2 / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                }
                statHtml += "</tbody>";
                statHtml += "</table>";
                statHtml += "</div>";
                statHtml += "</div>";
                statHtml += "</div>";
                $("#statPanel").append(statHtml);
            }

            if (myData != null && myData.carry == 1 || opData != null && opData.carry == 1) {
                statHtml = "";
                statHtml += "<div id='statPanelCarry' class='panel panel-danger'>";
                statHtml += "<div class='panel-heading'>캐리</div>";
                statHtml += "<div class='panel-body'>";
                statHtml += "<table id='diff_table' class='table table-hover table-bordered' style='white-space: nowrap;''>";
                statHtml += "<thead><tr><th width='45%'>" + userName + "</th><th width='10%''></th><th width='45%'>" + oppositeName + "</th></tr></thead>";
                statHtml += "<tbody>";

                statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.carry1 / myData.deaths).toFixed(2)) : '-') + "</td>";
                statHtml += "<td>" + ((myData != null) ? myData.carry1Kor + "/D" : (opData != null) ? opData.carry1Kor + "/D" : '-') + "</td>";
                statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.carry1 / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                if (myData != null && myData.carry2Kor != null || opData != null && opData.carry2Kor != null) {
                    statHtml += "<tr><td>" + ((myData != null) ? ((myData.deaths == 0) ? 'PERFECT' : (myData.carry2 / myData.deaths).toFixed(2)) : '-') + "</td>";
                    statHtml += "<td>" + ((myData != null) ? myData.carry2Kor + "/D" : (opData != null) ? opData.carry2Kor + "/D" : '-') + "</td>";
                    statHtml += "<td>" + ((opData != null) ? ((opData.deaths == 0) ? 'PERFECT' : (opData.carry2 / opData.deaths).toFixed(2)) : '-') + "</td></tr>";
                }
                statHtml += "</tbody>";
                statHtml += "</table>";
                statHtml += "</div>";
                statHtml += "</div>";
                statHtml += "</div>";
                $("#statPanel").append(statHtml);
            }

            $('.hero').each(function (index) {
                $(this).css('background-color', '#a7b1c2');
            });
            $("#hero_" + heroesId).css('background-color', '#f7931e');

            $("#heroesId").val(heroesId);

            if (typeId == 1) {
                $("#btnQuick, #btnQuick2").removeClass("active");
                $("#btnComp, #btnComp2").addClass("active");
            } else {
                $("#btnComp, #btnComp2").removeClass("active");
                $("#btnQuick, #btnQuick2").addClass("active");
            }


        },
        error: function () {

        }

    });

    var scoreHtml = "<thead>";
    //var scoreHtml = "<tbody>";
    $.ajax({
        type: "POST",
        url: "/profile/scorecard",
        data: param,
        cache: false,
        async: false,
        success: function (data) {
            var myScorecard = {
                "rank": 0,
                "tier": 0,
                "vrank": 0,
                "atk": 0,
                "block": 0,
                "heal": 0,
                "hit": 0,
                "carry": 0,
                "skill": 0
            };
            var oppositeScorecard = myScorecard;

            if (data.length > 0) {
                for (var i in data) {
                    if (data[i].userId == userId)
                        myScorecard = data[i];
                    if (data[i].userId == oppositeId)
                        oppositeScorecard = data[i];
                }
            }
            if (myScorecard.vrank != 0 || oppositeScorecard.vrank != 0) {
                $("#t1_vrank").empty();
                $("#t2_vrank").empty();
                $("#t2_vrank2").empty();

                if (myScorecard.vrank != 0) {
                    if (myScorecard.playtimeOn == 0) {
                        $("#t1_vrank").append(
                            "플레이 시간 부족"
                        );
                    } else {
                        $("#t1_vrank").append(
                            myScorecard.vrank
                            + "<img alt='image' style='width:21px;height:21px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + myScorecard.vtier + ".png'>"
                        );
                        $("#t1_vrank").css("margin-top", "-2px");
                    }
                } else {
                    $("#t1_vrank").append(
                        "전적 없음"
                    );
                    $("#t1_vrank").css("margin-top", "0px");
                }
                if (oppositeScorecard.vrank != 0) {
                    if (oppositeScorecard.playtimeOn == 0) {
                        $("#t2_vrank, #t2_vrank2").append(
                            "플레이 시간 부족"
                        );
                    } else {
                        $("#t2_vrank, #t2_vrank2").append(
                            "<img alt='image' style='width:21px;height:21px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + oppositeScorecard.vtier + ".png'>"
                            + oppositeScorecard.vrank
                        );
                        $("#t2_vrank").css("margin-top", "-2px");
                    }
                } else {
                    $("#t2_vrank, #t2_vrank2").append(
                        "전적 없음"
                    );
                    $("#t2_vrank").css("margin-top", "0px");
                }
            } else {
                $("#t1_vrank").empty();
                $("#t2_vrank").empty();
                $("#t2_vrank2").empty();
                $("#t1_vrank, #t2_vrank, #t2_vrank2").append(
                    "전적 없음"
                );
                $("#t1_vrank, #t2_vrank").css("margin-top", "0px");
            }

            if (typeId == 2) {
                $("#t1_vrank").html("");
                $("#t2_vrank").html("");
                $("#t2_vrank2").html("");
                $("#t1_vrank, #t2_vrank, #t2_vrank2").append(
                    "빠른 대전"
                );
                $("#t1_vrank, #t2_vrank, #t2_vrank2").css("margin-top", "0px");
            }


            if (typeId == 2) {
                scoreHtml += "<tr style='background-color:rgba(0,0,0,0.4);font-size:14px;border:2px solid;'>";
                scoreHtml += "<th name='score_left' width='45%'>빠른 대전" + "</th>";
                scoreHtml += "<th width='10%' style='font-size:13px;font-weight:600;'>OverScore</th>";
                scoreHtml += "<th name='score_right' width='45%'>빠른 대전" + "</th>";
                scoreHtml += "</tr>";
                scoreHtml += "</thead>";
                scoreHtml += "<tbody>";
            } else {
                if (myScorecard.vrank != 0 || oppositeScorecard.vrank != 0) {
                    scoreHtml += "<tr'>";
                    scoreHtml += "<td name='score_left' width='45%'>";
                    scoreHtml += (myScorecard.rank == 0 ? '-' : myScorecard.rank);
                    scoreHtml += "</td>";
                    scoreHtml += "<td width='10%' style='font-size:13px;font-weight:600;'>현재점수</td>";
                    scoreHtml += "<td name='score_right' width='45%'>";
                    scoreHtml += (oppositeScorecard.rank == 0 ? '-' : oppositeScorecard.rank) + "</td>";
                    scoreHtml += "</tr>";

                    scoreHtml += "<tr style='background-color:rgba(0,0,0,0.4);font-size:14px;border:2px solid;'>";
                    scoreHtml += "<th name='score_left' width='45%' class=" + ((myScorecard.vrank >= oppositeScorecard.vrank) ? "text-danger" : "text-success") + ">";
                    scoreHtml += "<div style='font-weight:bold;margin-top:-2px'>";
                    scoreHtml += (myScorecard.vrank == 0 ? '-' : myScorecard.vrank);
                    scoreHtml += "<span style='font-size:11px;' class=" + (((myScorecard.vrank - myScorecard.rank) >= 0) ? "text-danger" : "text-success") + ">";
                    scoreHtml += (myScorecard.vrank == 0 ? '' : ((((myScorecard.vrank - myScorecard.rank) >= 0) ? "(+" : "(") + (myScorecard.vrank - myScorecard.rank)) + ")");
                    scoreHtml += "</span>";
                    scoreHtml += "</div>";
                    scoreHtml += "</th>";
                    scoreHtml += "<th width='10%' style='font-size:13px;font-weight:600;'>가상점수</th>";
                    scoreHtml += "<th name='score_right' width='45%' class=" + ((myScorecard.vrank >= oppositeScorecard.vrank) ? "text-success" : "text-danger") + ">";
                    scoreHtml += "<div style='font-weight:bold;margin-top:-2px'>";
                    scoreHtml += (oppositeScorecard.vrank == 0 ? '-' : oppositeScorecard.vrank);
                    scoreHtml += "<span style='font-size:11px;' class=" + (((oppositeScorecard.vrank - oppositeScorecard.rank) >= 0) ? "text-danger" : "text-success") + ">";
                    scoreHtml += (oppositeScorecard.vrank == 0 ? '' : ((((oppositeScorecard.vrank - oppositeScorecard.rank) >= 0) ? "(+" : "(") + (oppositeScorecard.vrank - oppositeScorecard.rank)) + ")");
                    scoreHtml += "</span>";
                    scoreHtml += "</div>";
                    scoreHtml += "</th>";
                    scoreHtml += "</tr>";
                    scoreHtml += "</thead>";
                    scoreHtml += "<tbody>";
                }
            }

            if (myScorecard.atk != 0 || oppositeScorecard.atk != 0) {
                scoreHtml += "<tr class='panel-default'>";
                scoreHtml += "<td name='score_left' width='45%' class='" + myScorecard.atkColor + "'>" + (myScorecard.atk == 0 ? '-' : myScorecard.atk) + "</td>";
                scoreHtml += "<td class='panel-heading' width='10%'>" + "<div class='tooltip-demo'>공격<a class='footnote' href='#statPanelAtk'>?</a></div>" + "</td>";
                scoreHtml += "<td name='score_right' width='45%' class='" + oppositeScorecard.atkColor + "'>" + (oppositeScorecard.atk == 0 ? '-' : oppositeScorecard.atk) + "</td>";
                scoreHtml += "</tr>";
            }
            if (myScorecard.block != 0 || oppositeScorecard.block != 0) {
                scoreHtml += "<tr class='panel-default'>";
                scoreHtml += "<td name='score_left' width='45%' class='" + myScorecard.blockColor + "'>" + (myScorecard.block == 0 ? '-' : myScorecard.block) + "</td>";
                scoreHtml += "<td class='panel-heading' width='10%'>" + "<div class='tooltip-demo'>방어<a class='footnote' href='#statPanelBlock'>?</a></div>" + "</td>";
                scoreHtml += "<td name='score_right' width='45%' class='" + oppositeScorecard.blockColor + "'>" + (oppositeScorecard.block == 0 ? '-' : oppositeScorecard.block) + "</td>";
                scoreHtml += "</tr>";
            }
            if (myScorecard.heal != 0 || oppositeScorecard.heal != 0) {
                scoreHtml += "<tr class='panel-default'>";
                scoreHtml += "<td name='score_left' width='45%' class='" + myScorecard.healColor + "'>" + (myScorecard.heal == 0 ? '-' : myScorecard.heal) + "</td>";
                scoreHtml += "<td class='panel-heading' width='10%'>" + "<div class='tooltip-demo'>치유<a class='footnote' href='#statPanelHeal'>?</a></div>" + "</td>";
                scoreHtml += "<td name='score_right' width='45%' class='" + oppositeScorecard.healColor + "'>" + (oppositeScorecard.heal == 0 ? '-' : oppositeScorecard.heal) + "</td>";
                scoreHtml += "</tr>";
            }
            if (myScorecard.hit != 0 || oppositeScorecard.hit != 0) {
                scoreHtml += "<tr class='panel-default'>";
                scoreHtml += "<td name='score_left' width='45%' class='" + myScorecard.hitColor + "'>" + (myScorecard.hit == 0 ? '-' : myScorecard.hit) + "</td>";
                scoreHtml += "<td class='panel-heading' width='10%'>" + "<div class='tooltip-demo'>명중<a class='footnote' href='#statPanelHit'>?</a></div>" + "</td>";
                scoreHtml += "<td name='score_right'width='45%' class='" + oppositeScorecard.hitColor + "'>" + (oppositeScorecard.hit == 0 ? '-' : oppositeScorecard.hit) + "</td>";
                scoreHtml += "</tr>";
            }
            if (myScorecard.skill != 0 || oppositeScorecard.skill != 0) {
                scoreHtml += "<tr class='panel-default'>";
                scoreHtml += "<td name='score_left' width='45%' class='" + myScorecard.skillColor + "'>" + (myScorecard.skill == 0 ? '-' : myScorecard.skill) + "</td>";
                scoreHtml += "<td class='panel-heading' width='10%'>" + "<div class='tooltip-demo'>스킬<a class='footnote' href='#statPanelSkill'>?</a></div>" + "</td>";
                scoreHtml += "<td name='score_right' width='45%' class='" + oppositeScorecard.skillColor + "'>" + (oppositeScorecard.skill == 0 ? '-' : oppositeScorecard.skill) + "</td>";
                scoreHtml += "</tr>";
            }
            if (myScorecard.carry != 0 || oppositeScorecard.carry != 0) {
                scoreHtml += "<tr class='panel-default'>";
                scoreHtml += "<td name='score_left' width='45%' class='" + myScorecard.carryColor + "'>" + (myScorecard.carry == 0 ? '-' : myScorecard.carry) + "</td>";
                scoreHtml += "<td class='panel-heading' width='10%'>" + "<div class='tooltip-demo'>캐리<a class='footnote' href='#statPanelCarry'>?</a></div>" + "</td>";
                scoreHtml += "<td name='score_right' width='45%' class='" + oppositeScorecard.carryColor + "'>" + (oppositeScorecard.carry == 0 ? '-' : oppositeScorecard.carry) + "</td>";
                scoreHtml += "</tr>";
            }
            if ((myScorecard.total != '' || oppositeScorecard.total != '') && (myScorecard.total != undefined || oppositeScorecard.total != undefined)) {
                scoreHtml += "<tr class='panel-default' style='background-color:#f5f5f5'>";
                scoreHtml += "<td name='score_left' width='45%' class='font-bold " + myScorecard.totalColor + "'>" + ((myScorecard.vrank == 0) ? ((myScorecard.total == undefined) ? '-' : myScorecard.total) : "<img alt='image' style='width:20px;height:20px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + myScorecard.tier + ".png'>" + myScorecard.total) + "</td>";
                scoreHtml += "<td class='panel-heading' width='10%'>" + "<div class='tooltip-demo'>종합</div>" + "</td>";
                scoreHtml += "<td name='score_right' width='45%' class='font-bold " + oppositeScorecard.totalColor + "'>" + ((oppositeScorecard.vrank == 0) ? ((oppositeScorecard.total == undefined) ? '-' : oppositeScorecard.total) : "<img alt='image' style='width:20px;height:20px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + oppositeScorecard.tier + ".png'>" + oppositeScorecard.total) + "</td>";
                scoreHtml += "</tr>";
            }
            if (myScorecard.tier < oppositeScorecard.tier) {
                scoreHtml += "<tr class='panel-default'>";
                scoreHtml += "<td width='320px' colspan='3' style='padding: 0px;'>";
                scoreHtml += "	<small>";
                scoreHtml += "		* 내 티어가 상대방의 티어보다 낮습니다. <br />";
                scoreHtml += "		* 스탯은 티어가 다르면 다른 의미를 갖습니다.<br />";
                scoreHtml += "		예) <img alt='image' style='width:18px;height:18px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-1.png'>";
                scoreHtml += "공격 50 ≠ ";
                scoreHtml += "		 <img alt='image' style='width:18px;height:18px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-7.png'>";
                scoreHtml += "		 공격 50";
                scoreHtml += "	</small>";
                scoreHtml += "</td>";
                scoreHtml += "</tr>";
            }

            if (scoreHtml == "<tbody>") {
                scoreHtml += "<thead>";
                scoreHtml += "<tr style='background-color:rgba(0,0,0,0.4);'>";
                scoreHtml += "<th colspan='3' height='80px;' style='vertical-align: middle'>전적이 없습니다</th>";
                scoreHtml += "</tr>";
                scoreHtml += "</thead>";
                scoreHtml += "<tbody>";
            }


            if (myScorecard.vrank > 0 && myScorecard.vrank < oppositeScorecard.vrank) {
                $("li[name='t1_h1_img']").css("background-image", "url(/img/sad_" + heroesId + ".png)");
            } else {
                $("li[name='t1_h1_img']").css("background-image", "url(https://blzgdapipro-a.akamaihd.net/hero/" + myHeroesImg + "/icon-portrait.png)");
            }
            if (oppositeScorecard.vrank > 0 && oppositeScorecard.vrank < myScorecard.vrank) {
                $("li[name='t2_h1_img']").each(function (index) {
                    $(this).css("background-image", "url(/img/sad_" + heroesId + ".png)");
                });
            } else {
                $("li[name='t2_h1_img']").each(function (index) {
                    $(this).css("background-image", "url(https://blzgdapipro-a.akamaihd.net/hero/" + opHeroesImg + "/icon-portrait.png)");
                });
            }

            $("#score_table").empty();
            scoreHtml += "</tbody>";
            $("#score_table").append(scoreHtml);

            $("#heroesId").val(heroesId);

            if (myScorecard.playtimeOn == 0) {
                $("th[name='score_left']").text("-").css("color", "#676a6c");
                $("td[name='score_left']").text("-").css("color", "#676a6c");
            }
            if (oppositeScorecard.playtimeOn == 0) {
                $("th[name='score_right']").text("-").css("color", "#676a6c");
                $("td[name='score_right']").text("-").css("color", "#676a6c");
            }
        },
        error: function () {

        }

    });
}

function clone(obj) {
    if (null == obj || "object" != typeof obj) return obj;
    var copy = obj.constructor();
    for (var attr in obj) {
        if (obj.hasOwnProperty(attr)) copy[attr] = obj[attr];
    }
    return copy;
}