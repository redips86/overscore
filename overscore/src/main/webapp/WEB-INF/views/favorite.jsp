<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/favorite">

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
<div id="wrapper">
    <jsp:include page="common/menu.jsp"></jsp:include>

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
                <c:if test="${users.size() > 0}">

                    <c:forEach var="users" items="${users}" varStatus="status">
                        <div class="col-xs-12">
                            <a href="/profile?userId=${users.userId}">
                                <div class="ibox float-e-margins">
                                    <div class="ibox-content heroes" style="height:120px;color:whitesmoke;
                            background-image:url(https://overwatch-a.akamaihd.net/img/scene/candy-895e91cbc198218dbe56fed67b590a7c37a8bc3ef29d4b8c2989edf2196cfdb4b6150e64cb6f57a01a26268ae764b4cc22da52168121287e68aa8a9891efd616.jpg)">
                                        <div class="visible-top text-left"
                                             style="position: absolute;left:35px;top:20px;">
                                            <img style="width:80px;height:80px;" src="${users.avatar}"
                                                 class="img-rounded rounded-border m-b-md" alt="profile">
                                        </div>
                                        <div class="visible-top" style="position: absolute;left:36px;top:79px;">
                                            <span class="label"
                                                  style="padding:2px 4px; background-color:#ffffff; border-radius:6px">Lv.${users.level}</span>
                                        </div>
                                        <div class="summary">
                                            <span style="font-size:25px;"><strong>${users.userName}</strong></span><br>
                                            <c:choose>
                                                <c:when test="${users.compRank eq -1}">
                                                    <span style="font-size:18px;"><strong>${users.wins}승</strong></span>
                                                </c:when>
                                                <c:when test="${users.compRank ne -1}">
                                                    <span style="font-size:18px;"><strong>${users.compRank}</strong><img
                                                            alt="image"
                                                            style="width:25px;height:25px;margin-bottom:3px;"
                                                            src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${users.tierImage}.png"></span>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                        <div class="lblEtc">
                                            <div class="lblServer">
                                                <span class="btn btn-default btn-xs"
                                                      style="color:#676a6c">${users.server}</span>
                                            </div>
                                            <div class="lblKd">
                                                <span class="btn btn-xs ${users.kpdColor}">K/D ${users.kpd}</span>
                                            </div>
                                        </div>
                                        <div class="visible-most" style="position:absolute;right:104px;bottom:43px;">
                                            <c:forEach var="j" begin="1" end="${users.mostHeroes.size()-1}" step="1">
                                                <div class="mask">
                                                    <div class="hero"
                                                         style="background-image: url('https://blzgdapipro-a.akamaihd.net/hero/${users.mostHeroes[j].heroesImg}/icon-portrait.png');"></div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div style="position:absolute;right:35px;bottom:43px;">
                                            <div class="mask2">
                                                <div class="hero2"
                                                     style="background-image: url('https://blzgdapipro-a.akamaihd.net/hero/${users.mostHeroes[0].heroesImg}/icon-portrait.png');"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                    <jsp:include page="common/footer.jsp"></jsp:include>

                </c:if>
                <c:if test="${users.size() == 0 }">
                    <div class="col-xs-12">
                        <div class="ibox float-e-margins">
                            <div class="ibox-content" style="text-align:center;">
                                <h2>
                                    <p>즐겨찾기한 프로필이 <br class="br-s-break"> 없습니다</p><span class="text-navy"></span>
                                </h2>
                            </div>
                        </div>
                    </div>


                </c:if>
            </div>
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
    <script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- Overscore -->
    <script src="/js/overscore.js"></script>

</body>
</html>