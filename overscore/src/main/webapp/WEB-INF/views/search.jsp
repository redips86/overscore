<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/search?name=">
    <link href="/css/custom/search.css" rel="stylesheet">

    <style>

        @media (max-width: 375px) {
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

            .lblEtc {
                position: absolute;
                left: 35px;
                bottom: 40px;
                width: 100%;
            }

            .lblServer {
                display: table-cell;
            }

            .lblKd {
                display: table-cell;
            }
        }

        @media (min-width: 375px)
        and (max-width: 480px) {
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

            .lblEtc {
                position: absolute;
                left: 35px;
                bottom: 40px;
                width: 100%;
            }

            .lblServer {
                display: table-cell;
            }

            .lblKd {
                display: table-cell;
            }
        }

        @media (min-width: 480px) {
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

            .lblEtc {
                position: absolute;
                left: 135px;
                bottom: 40px;
                width: 100%;
            }

            .lblServer {
                display: table-cell;
            }

            .lblKd {
                display: table-cell;
            }
        }

        img.rounded-border {
            border: 6px solid whitesmoke;
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

        @media (max-width: 430px) {
            .br-s-break {
                display: block;
            }
        }

        @media (min-width: 430px) {
            .br-s-break {
                display: none;
            }
        }

        @media (max-width: 690px) {
            .br-break {
                display: block;
            }
        }

        @media (min-width: 690px) {
            .br-break {
                display: none;
            }
        }

    </style>
</head>

<body>
<div id="wrapper" style="min-width:320px;">
    <jsp:include page="common/menu.jsp"></jsp:include>

    <input type="hidden" id="syncId" value="${syncId}"/>
    <input type="hidden" id="name" value="${name}"/>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="common/nav.jsp"></jsp:include>
        <div class="row">
            <div class="wrapper wrapper-content" style="padding-top:0px;">
                <div class="col-xs-12" align="center" style="margin-bottom: 5px;margin-top: 5px;">
                    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                    <!-- profile_top -->
                    <ins class="adsbygoogle"
                         style="display:block"
                         data-ad-client="ca-pub-4338490525578472"
                         data-ad-slot="9329085141"
                         data-ad-format="auto"></ins>
                    <script>
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    </script>
                </div>

                <div id="searchList">

                </div>

                <div class="col-xs-12" id="searchIng">
                    <div class="ibox float-e-margins">
                        <div class="ibox-content" style="text-align:center;">
                            <h2>
                                <p id="searchTitle"></p>
                            </h2>

                            <div class="hr-line-dashed"></div>
                            <div class="search-form">

                                <div class="input-group">
                                    <input id="txtName2" type="text" placeholder="배틀태그를 입력해주세요" name="name"
                                           maxlength="20"
                                           class="form-control input-lg" style="position:initial;">
                                    <div class="input-group-btn">
                                        <button id="btnSearch2" class="btn btn-lg btn-primary" type="button"
                                                style="position:initial;">
                                            검색
                                        </button>
                                    </div>
                                </div>

                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="search-result">
                                <h3>
	                               <span class="search-link" style="line-height:1.5">
	                                                       처음 오버스코어를 <br class="br-s-break"/>이용하시는 경우에는 <br
                                           class="br-break"/>
	                 				정확한 배틀태그가 필요합니다.<br class="br-s-break"/> 
	                 				<p></p>
	                 				PSN 유저는 <br class="br-s-break"/>아이디#psn, <br class="br-break"/>
	                 				XBOX유저는 <br class="br-s-break"/>아이디#xbl 를 입력해주세요. (대소문자를 구분합니다)
	                               </span>
                                </h3>
                                <p>
                                    예) OverScore#2838, 오버스코어#2838, Overscore#psn, Overscore#xbl
                                </p>
                            </div>
                        </div>
                    </div>
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

<script>
    var repeat = null;

    $(function () {
        $('#btnSearch2').on('click', function () {
            searchUser2();
        });

        $("#txtName2").keydown(function (key) {
            if (key.keyCode == 13) {
                searchUser2();
            }
        });

        function searchUser2() {
            $('#page-wrapper').toggleClass('sk-loading');
            var name = $("#txtName2").val();
            name = name.replace("#", "%23");
            $('.navbar-static-top').css('z-index', 0);
            location.replace("/search?name=" + name);
        }

        var syncId = $("#syncId").val();
        var name = $("#name").val();

        if (name == "") {
            $("#searchTitle").text("배틀태그를 입력해주세요.");
            return false;
        }

        // only userName
        if (syncId == "") {
            var param = [{
                name: 'name',
                value: name
            }];

            $.ajax({
                type: "GET",
                url: "/search/list",
                data: param,
                cache: false,
                async: false,
                success: function (data) {
                    if (data.length > 0) {
                        $("#searchTitle").text("검색 : " + name);

                        var html = "";
                        for (var i in data) {
                            html += "<div class='col-xs-12'>";
                            html += "<a href=/profile?userId=" + data[i].userId + ">";
                            html += "<div class='ibox float-e-margins'>";
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
                                html += "<span style='font-size:18px;''><strong>" + data[i].compRank + "</strong><img alt='image' style='width:25px;height:25px;margin-bottom:3px;' src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-" + data[i].tierImage + ".png'></span>";
                            html += "</div>";

                            html += "<div class='lblEtc'>";
                            html += "<div class='lblServer'>";
                            html += "<span class='btn btn-default btn-xs' style='color:#676a6c'>" + data[i].server + "</span>";
                            html += "</div>";

                            html += "<div class='lblKd'>";
                            html += "<span class='btn btn-xs " + data[i].kpdColor + "'>K/D " + data[i].kpd + "</span>";
                            html += "</div>";
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

                            html += "	</div>";
                            html += "</div>";
                            html += "</a>";
                            html += "</div>";
                        }
                    } else {
                        $("#searchTitle").html("플레이어를 찾을 수 없습니다 : <span class='text-navy'>" + name + "</span>");
                    }

                    $("#searchList").append(html);
                },
                error: function () {

                }

            });
        }

        // userName+userTag
        if (syncId != "") {

            var pointCnt = 0;
            var pointStr = ".";

            repeat = setInterval(function checkUpdate() {
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
                        pointCnt++;
                        pointStr += ".";
                        if ((pointCnt % 4) == 0)
                            pointStr = ".";

                        if (data.status == "C") {
                            clearInterval(repeat);

                            var param = [{
                                name: 'name',
                                value: name
                            }];

                            $.ajax({
                                type: "GET",
                                url: "/search/getUserInfo",
                                data: param,
                                cache: false,
                                async: false,
                                success: function (data) {
                                    if (data != "") {
                                        location.replace("/profile?userId=" + data.userId);
                                    } else {
                                        $("#searchTitle").html("플레이어를 찾을 수 없습니다 : <span class='text-navy'>" + name + "</span>");
                                    }
                                },
                                error: function () {

                                }

                            });
                        } else if (data.status == "W" && data.waitCnt > 0) {
                            $("#searchTitle").text("프로필 검색 [" + data.waitCnt + "]명 대기중" + pointStr);
                        } else if (data.status == "R" || data.waitCnt == 0) {
                            $("#searchTitle").text("프로필을 검색[" + data.userName + "]중입니다" + pointStr);
                        }
                    },
                    error: function () {

                    }

                });
            }, 1000);
        }
    })


</script>

</body>
</html>