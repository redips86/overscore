<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr">
    <link href="/css/plugins/slick/slick.css" rel="stylesheet">
    <link href="/css/plugins/slick/slick-theme.css" rel="stylesheet">


    <style type="text/css">

        @media (max-width: 575px) {
            .hidden-top, .hidden-most {
                display: block !important;
            }

            .visible-top, .visible-most {
                display: none !important;
            }

            .summary {
                position: absolute;
                left: 35px;
                top: 14px;
                z-index: 2000;
            "
            }

            .lblKd {
                position: absolute;
                left: 34px;
                bottom: 15px;
            }
        }

        @media (min-width: 575px)
        and (max-width: 950px) {
            .hidden-top {
                display: block !important;
            }

            .visible-top {
                display: none !important;
            }

            .summary {
                position: absolute;
                left: 35px;
                top: 14px;
                z-index: 2000;
            "
            }

            .lblKd {
                position: absolute;
                left: 34px;
                bottom: 15px;
            }
        }

        @media (min-width: 950px) {
            .hidden-top, .hidden-most {
                display: none !important;
            }

            .visible-top, .visible-most {
                display: block !important;
            }

            .summary {
                position: absolute;
                left: 135px;
                top: 14px;
                z-index: 2000;
            }

            .lblKd {
                position: absolute;
                left: 134px;
                bottom: 15px;
            }
        }

        img.rounded-border {
            border: 6px solid whitesmoke;
        }

        .slick-slide {
            outline: none;
        }

        .slick-dots {
            position: relative;
            bottom: 0px;
            top: 10px;
        }

        .slick-prev {
            left: 20px;
            z-index: 1;
            top: 95%;
        }

        .slick-next {
            right: 20px;
            z-index: 1;
            top: 95%;
        }

        .slick-prev:before, .slick-next:before {
            color: #999999 !important;
        }

        h1 small {
            font-size: 50%;
        }

        .contact-box.center-version > a img {
            width: 100px;
            height: 100px;
            margin-top: 0px;
            margin-bottom: 0px;
        }

        .contact-box.center-version > a h1 img {
            width: 30px;
            height: 30px;
        }

        .contact-box .ibox-content > div img {
            width: 40px;
            height: 40px;
            background-color: #a7b1c2;
        }

        .p-t-xs {
            padding: 10px 0px 0px 0px;
        }

        .jumbotron {
            background-color: transparent;
            color: whitesmoke;
            padding: 30px;
            margin-bottom: 0px;
        }

        @media (max-width: 410px) {
            .br-s-break {
                display: block;
            }
        }

        @media (min-width: 410px) {
            .br-s-break {
                display: none;
            }
        }

        @media (max-width: 880px) {
            .br-break {
                display: block;
            }
        }

        @media (min-width: 880px) {
            .br-break {
                display: none;
            }
        }

        .heroes .mask {
            display: inline-block;
            position: relative;
            width: 44px;
            height: 55px;
            border: 3px solid #f0edf2;
            border-radius: 7px;
            margin: 2.4px 0px;
            transform: skew(25rad);
            overflow: hidden;
            background-color: #a7b1c2;
            background-clip: padding-box;
        }

        .heroes .hero {
            display: inline-block;
            width: 150%;
            height: 100%;
            margin-left: 1px;
            position: relative;
            background-size: auto 110%;
            background-position: 50% 50%;
            transform: skew(-25rad) translateX(-5px);
        }

        .heroes .mask2 {
            display: inline-block;
            position: relative;
            width: 64px;
            height: 80px;
            border: 3px solid #f0edf2;
            border-radius: 7px;
            margin: 2.4px 0px;
            transform: skew(25rad);
            overflow: hidden;
            background-color: #a7b1c2;
            background-clip: padding-box;
        }

        .heroes .hero2 {
            display: inline-block;
            width: 150%;
            height: 100%;
            margin-left: 1px;
            position: relative;
            background-size: auto 130%;
            background-position: 100% 50%;
            transform: skew(-25rad) translateX(-5px);
        }

        @media (min-width: 1400px) {
            .col-lg-3 {
                width: 25%;
            }
        }

        @media (min-width: 880px) and (max-width: 1400px) {
            .col-md-6 {
                width: 50%;
            }
        }

        @media (max-width: 880px) {
            .col-sm-12 {
                width: 100%;
            }
        }


    </style>


</head>

<body>
<div id="wrapper" style="min-width:320px;">
    <jsp:include page="common/menu.jsp"></jsp:include>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="common/nav.jsp"></jsp:include>
        <div class="row  border-bottom white-bg dashboard-header">
            <div class="col-lg-12"
                 style="background-image:url('https://overwatch-a.akamaihd.net/img/scene/candy-895e91cbc198218dbe56fed67b590a7c37a8bc3ef29d4b8c2989edf2196cfdb4b6150e64cb6f57a01a26268ae764b4cc22da52168121287e68aa8a9891efd616.jpg');">
                <div class="col-lg-12">
                    <div class="jumbotron">
                        <h1>Overscore</h1>
                        <p>영웅별 가상점수를 <br class="br-s-break"/>확인하고 <br class="br-break"/>경쟁전 실력을 <br class="br-s-break"/>높여보세요.
                        </p>
                    </div>
                </div>
                <!-- <div class="col-lg-3">
                    <div class="jumbotron">
                    <form action="/auth/step1" method="post">
                             <a href="/search?name=" role="button" class="btn btn-primary btn-lg" style="margin-top: 10px;">시작하기</a>
                             <button type="submit" class="btn btn-success btn-facebook btn-lg"
                             style="background-image:url(http://kr.battle.net/static/images/nav-client/logo-bnet-compact.png);
                                 background-repeat: no-repeat;
                                padding-left: 45px;
                                background-position: 0% 95%;
                                margin-top: 10px;">배틀태그 가져오기</button>
                         </form>
                         </div>
                </div> -->
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="wrapper" style="padding:0px 5px">
                    <div class="row">
                        <div class="ibox float-e-margins" style="margin-bottom:0px;">
                            <div class="ibox-title text-center text-success">
                                <h5 style='float:none'>최근 검색 <i class="fa fa-angle-double-down"></i></h5>
                            </div>
                            <div id="recentList" class="ibox-content autoplay" style="margin-bottom:0px;">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="wrapper" style="padding:0px 5px">
                <div class="col-md-6">
                    <div class="row">
                        <div class="ibox float-e-margins" style="margin-bottom:0px;">
                            <div class="ibox-title text-center text-danger">
                                <h5 style='float:none'>SS등급 플레이어 <i class="fa fa-angle-double-down"></i></h5>
                            </div>
                            <div id="ssList" class="ibox-content autoplay" style="margin-bottom:0px;">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div id="top5_view" class="row">
                    <div class="wrapper wrapper-content">
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title text-center">
                                    <h5 style='float:none'>공격 TOP5 </h5>
                                </div>
                                <div class="top5 ibox-content">
                                    <c:forEach var="Top" items="${AttackTop}" varStatus="status">
                                        <div>
                                            <div class="">
                                                <div class="widget-head-color-box red-bg p-md text-center heroes">
                                                    <div>
                                                        <h2 class="font-bold no-margins">
                                                        </h2>
                                                        <small></small>
                                                    </div>
                                                    <div class="mask2">
                                                        <div class="hero2"
                                                             style="background-image: url('https://blzgdapipro-a.akamaihd.net/hero/${Top.heroesImg}/icon-portrait.png');">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="widget-text-box">
                                                    <div class="feed-activity-list">
                                                        <c:forEach var="TopHeroes" items="${Top.mainTopHeroesModel}"
                                                                   varStatus="status">
                                                            <div class="feed-element" style="cursor: pointer;"
                                                                 onclick="window.location='/profile?userId=${TopHeroes.userId}'">
                                                                <a class="pull-left">
                                                                    <img alt="image" class="img-rounded"
                                                                         style="width:40px;height:40px;"
                                                                         src="${TopHeroes.avatar}">
                                                                </a>
                                                                <div>
                                                                    <span class="pull-right">${TopHeroes.vrank}점</span>
                                                                    <strong>${TopHeroes.userName}</strong> <br>

                                                                    <img alt="image"
                                                                         style="width:20px;height:20px;display:inline-block"
                                                                         src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${TopHeroes.tierNumber}.png">
                                                                    <span>${TopHeroes.rank}</span>

                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title text-center">
                                    <h5 style='float:none'>수비 TOP5 </h5>
                                </div>
                                <div class="top5 ibox-content">
                                    <c:forEach var="Top" items="${DefenseTop}" varStatus="status">
                                        <div>
                                            <div class="">
                                                <div class="widget-head-color-box blue-bg p-md text-center heroes">
                                                    <div>
                                                        <h2 class="font-bold no-margins">
                                                        </h2>
                                                        <small></small>
                                                    </div>

                                                    <div class="mask2">
                                                        <div class="hero2"
                                                             style="background-image: url('https://blzgdapipro-a.akamaihd.net/hero/${Top.heroesImg}/icon-portrait.png');">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="widget-text-box">
                                                    <div class="feed-activity-list">
                                                        <c:forEach var="TopHeroes" items="${Top.mainTopHeroesModel}"
                                                                   varStatus="status">
                                                            <div class="feed-element" style="cursor: pointer;"
                                                                 onclick="window.location='/profile?userId=${TopHeroes.userId}'">
                                                                <a class="pull-left">
                                                                    <img alt="image" class="img-rounded"
                                                                         style="width:40px;height:40px;"
                                                                         src="${TopHeroes.avatar}">
                                                                </a>
                                                                <div>
                                                                    <span class="pull-right">${TopHeroes.vrank}점</span>
                                                                    <strong>${TopHeroes.userName}</strong> <br>

                                                                    <img alt="image"
                                                                         style="width:20px;height:20px;display:inline-block"
                                                                         src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${TopHeroes.tierNumber}.png">
                                                                    <span>${TopHeroes.rank}</span>

                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title text-center">
                                    <h5 style='float:none'>돌격 TOP5 </h5>
                                </div>
                                <div class="top5 ibox-content">
                                    <c:forEach var="Top" items="${TankTop}" varStatus="status">
                                        <div>
                                            <div class="">
                                                <div class="widget-head-color-box yellow-bg p-md text-center heroes">
                                                    <div>
                                                        <h2 class="font-bold no-margins">
                                                        </h2>
                                                        <small></small>
                                                    </div>

                                                    <div class="mask2">
                                                        <div class="hero2"
                                                             style="background-image: url('https://blzgdapipro-a.akamaihd.net/hero/${Top.heroesImg}/icon-portrait.png');">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="widget-text-box">
                                                    <div class="feed-activity-list">
                                                        <c:forEach var="TopHeroes" items="${Top.mainTopHeroesModel}"
                                                                   varStatus="status">
                                                            <div class="feed-element" style="cursor: pointer;"
                                                                 onclick="window.location='/profile?userId=${TopHeroes.userId}'">
                                                                <a class="pull-left">
                                                                    <img alt="image" class="img-rounded"
                                                                         style="width:40px;height:40px;"
                                                                         src="${TopHeroes.avatar}">
                                                                </a>
                                                                <div>
                                                                    <span class="pull-right">${TopHeroes.vrank}점</span>
                                                                    <strong>${TopHeroes.userName}</strong> <br>

                                                                    <img alt="image"
                                                                         style="width:20px;height:20px;display:inline-block"
                                                                         src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${TopHeroes.tierNumber}.png">
                                                                    <span>${TopHeroes.rank}</span>

                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title text-center">
                                    <h5 style='float:none'>지원 TOP5 </h5>
                                </div>
                                <div class="top5 ibox-content">
                                    <c:forEach var="Top" items="${SupportTop}" varStatus="status">
                                        <div>
                                            <div class="">
                                                <div class="widget-head-color-box navy-bg p-md text-center heroes">
                                                    <div>
                                                        <h2 class="font-bold no-margins">
                                                        </h2>
                                                        <small></small>
                                                    </div>

                                                    <div class="mask2">
                                                        <div class="hero2"
                                                             style="background-image: url('https://blzgdapipro-a.akamaihd.net/hero/${Top.heroesImg}/icon-portrait.png');">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="widget-text-box">
                                                    <div class="feed-activity-list">
                                                        <c:forEach var="TopHeroes" items="${Top.mainTopHeroesModel}"
                                                                   varStatus="status">
                                                            <div class="feed-element" style="cursor: pointer;"
                                                                 onclick="window.location='/profile?userId=${TopHeroes.userId}'">
                                                                <a class="pull-left">
                                                                    <img alt="image" class="img-rounded"
                                                                         style="width:40px;height:40px;"
                                                                         src="${TopHeroes.avatar}">
                                                                </a>
                                                                <div>
                                                                    <span class="pull-right">${TopHeroes.vrank}점</span>
                                                                    <strong>${TopHeroes.userName}</strong> <br>

                                                                    <img alt="image"
                                                                         style="width:20px;height:20px;display:inline-block"
                                                                         src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${TopHeroes.tierNumber}.png">
                                                                    <span>${TopHeroes.rank}</span>

                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="hr-line-dashed"></div>
                </div>
            </div>
        </div>
        <jsp:include page="common/footer.jsp"></jsp:include>
    </div>
</div>

<!-- Mainly scripts -->
<script src="/js/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="/js/inspinia.js"></script>

<!-- jQuery UI -->
<script src="/js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- Overscore -->
<script src="/js/overscore.js"></script>

<!-- Toastr script -->
<script src="/js/plugins/toastr/toastr.min.js"></script>

<script>

    $(document).ready(function () {

        var data = ${RecentList};

        var html = "";
        for (var i in data) {
            html += "<div class='col-lg-12' style='padding-left:5px;padding-right:5px'>";
            html += "<a href=/profile?userId=" + data[i].userId + ">";
            html += "<div class='ibox float-e-margins' style='margin-bottom:0px;'>";
            html += "	<div class='ibox-content heroes' style='height:120px;color:whitesmoke; background-image:url(https://overwatch-a.akamaihd.net/img/scene/candy-895e91cbc198218dbe56fed67b590a7c37a8bc3ef29d4b8c2989edf2196cfdb4b6150e64cb6f57a01a26268ae764b4cc22da52168121287e68aa8a9891efd616.jpg)'>";

            html += "	<div class='visible-top text-left' style='position: absolute;left:35px;top:20px;'>";
            html += "		<img style='width:80px;height:80px;' src='" + data[i].avatar + "' class='img-rounded rounded-border m-b-md' alt='profile'>";
            html += "	</div>";

            html += "<div class='visible-top text-left' style='position: absolute;left:36px;top:79px;'>";
            html += "<span class='label' style='padding:2px 4px; background-color:#ffffff; border-radius:6px'>Lv." + data[i].level + "</span>";
            html += "</div>";

            html += "<div class='summary'>";
            html += "<span style='font-size:25px;'><strong>" + data[i].userName + "</strong></span><br>";
            if (data[i].compRank == -1)
                html += "<span style='font-size:18px;'><strong>" + data[i].wins + "승</strong></span>";
            else
                html += "<span style='font-size:18px;''><strong>" + data[i].compRank + "</strong><img alt='image' style='width:25px;height:25px;margin-bottom:3px;display:inline-block;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + data[i].tierImage + ".png'></span>";
            html += "</div>";

            html += "<div class='lblKd'>";
            html += "<span class='btn btn-xs " + data[i].kpdColor + "'>K/D " + data[i].kpd + "</span>";
            html += "</div>";

            html += "<div class='visible-most' style='position:absolute;right:104px;bottom:15px;'>";
            for (var j = 1; j < data[i].mostHeroes.length; j++) {
                html += "<div class='mask'>";
                html += "<div class='hero' style='background-image: url(https://blzgdapipro-a.akamaihd.net/hero/" + data[i].mostHeroes[j].heroesImg + "/icon-portrait.png);'></div>";
                html += "</div>";
            }
            html += "</div>";

            html += "<div style='position:absolute;right:35px;bottom:15px;'>";
            html += "<div class='mask2'>";
            html += "<div class='hero2' style='background-image: url(https://blzgdapipro-a.akamaihd.net/hero/" + data[i].mostHeroes[0].heroesImg + "/icon-portrait.png);'></div>";
            html += "</div>";
            html += "</div>";

            html += "	</div>";
            html += "</div>";
            html += "</a>";
            html += "</div>";
        }

        $("#recentList").append(html);

        var data = ${SSList};

        var html = "";
        for (var i in data) {
            html += "<div class='col-lg-12' style='padding-left:5px;padding-right:5px'>";
            html += "<a href=/profile?userId=" + data[i].userId + "&heroesId=" + data[i].mostHeroes[0].heroesId + ">";
            html += "<div class='ibox float-e-margins' style='margin-bottom:0px;'>";
            html += "	<div class='ibox-content heroes' style='height:120px;color:whitesmoke; background-image:url(https://overwatch-a.akamaihd.net/img/scene/candy-895e91cbc198218dbe56fed67b590a7c37a8bc3ef29d4b8c2989edf2196cfdb4b6150e64cb6f57a01a26268ae764b4cc22da52168121287e68aa8a9891efd616.jpg)'>";

            html += "	<div class='visible-top text-left' style='position: absolute;left:35px;top:20px;'>";
            html += "		<img style='width:80px;height:80px;' src='" + data[i].avatar + "' class='img-rounded rounded-border m-b-md' alt='profile'>";
            html += "	</div>";

            html += "<div class='visible-top text-left' style='position: absolute;left:36px;top:79px;'>";
            html += "<span class='label' style='padding:2px 4px; background-color:#ffffff; border-radius:6px'>Lv." + data[i].level + "</span>";
            html += "</div>";

            html += "<div class='summary'>";
            html += "<span style='font-size:25px;'><strong>" + data[i].userName + "</strong></span><br>";
            if (data[i].compRank == -1)
                html += "<span style='font-size:18px;'><strong>" + data[i].wins + "승</strong></span>";
            else
                html += "<span style='font-size:18px;''><strong>" + data[i].compRank + "</strong><img alt='image' style='width:25px;height:25px;margin-bottom:3px;display:inline-block;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + data[i].tierImage + ".png'></span>";
            html += "</div>";

            html += "<div class='lblKd'>";
            html += "<span class='btn btn-xs " + data[i].kpdColor + "'>K/D " + data[i].kpd + "</span>";
            html += "</div>";

            html += "<div class='visible-most' style='position:absolute;right:104px;bottom:15px;'>";
            for (var j = 1; j < data[i].mostHeroes.length; j++) {
                html += "<div class='mask'>";
                html += "<div class='hero' style='background-image: url(https://blzgdapipro-a.akamaihd.net/hero/" + data[i].mostHeroes[j].heroesImg + "/icon-portrait.png);'></div>";
                html += "</div>";
            }
            html += "</div>";

            html += "<div style='position:absolute;right:35px;bottom:15px;'>";
            html += "<div class='mask2'>";
            html += "<div class='hero2' style='background-image: url(https://blzgdapipro-a.akamaihd.net/hero/" + data[i].mostHeroes[0].heroesImg + "/icon-portrait.png);'></div>";
            html += "</div>";
            html += "</div>";

            html += "	</div>";
            html += "</div>";
            html += "</a>";
            html += "</div>";
        }

        $("#ssList").append(html);

        $('.top5').slick({
            dots: true
        });

        $('.autoplay').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
            arrows: false,
            centerMode: true,
            centerPadding: '30px',
            responsive: [
                {
                    breakpoint: 768,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '20px',
                        slidesToShow: 1
                    }
                },
                {
                    breakpoint: 480,
                    settings: {
                        arrows: false,
                        centerMode: true,
                        centerPadding: '20px',
                        slidesToShow: 1
                    }
                }
            ]
        });

        var param = [{
            name: 'recentDay',
            value: 3
        }];

        $.ajax({
            type: "POST",
            url: "/main/notice/recent",
            data: param,
            cache: false,
            success: function (data) {
                for (var i = data.length - 1; i > -1; i--) {
                    toastr.options = {
                        closeButton: true,
                        progressBar: true,
                        showMethod: 'slideDown',
                        timeOut: data[i].noticeTimer
                    };

                    var content = data[i].noticeContent;
                    var title = '[' + data[i].insDate.split(' ')[0] + ']' + data[i].noticeTitle;

                    if (data[i].noticeType == 'success') {
                        toastr.success(content, title).css("width", "300px");
                    } else if (data[i].noticeType == 'error') {
                        toastr.error(content, title).css("width", "300px");
                    }
                }
                $("#toast-container").css("margin-top", "40px");
            },
            error: function () {

            }
        });

    });

</script>

<!-- slick carousel-->
<script src="/js/plugins/slick/slick.min.js"></script>
</body>
</html>
