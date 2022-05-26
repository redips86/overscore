<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/top100">

    <style>
        .topAnchorButton {
            height: 38px;
            width: 38px;
            display: block;
            background: #1ab394;
            padding: 9px 8px;
            text-align: center;
            color: #fff;
            border-radius: 50%;
        }

        .heroes .mask {
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

        .heroes .hero {
            display: inline-block;
            width: 150%;
            height: 100%;
            margin-left: 1px;
            position: relative;
            background-size: auto 110%;
            background-position: 100% 50%;
            transform: skew(-25rad) translateX(-5px);
        }

        @media ( min-width: 1860px) {
            .col-lg-3 {
                width: 25%;
            }
        }

        @media ( min-width: 1080px) and (max-width: 1860px) {
            .col-md-6 {
                width: 50%;
            }

            .col-md-12 {
                width: 100%;
            }
        }

        @media ( max-width: 1080px) {
            .col-sm-12 {
                width: 100%;
            }
        }
    </style>
</head>

<body>
<div id="wrapper">
    <jsp:include page="common/menu.jsp"></jsp:include>

    <input type="hidden" id="server" value="${Server}"/>
    <input type="hidden" id="typeId" value="${TypeId}"/>
    <input type="hidden" id="order" value="${Order}"/>
    <input type="hidden" id="heroesId" value="${HeroesId}"/>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="common/nav.jsp"></jsp:include>
        <div class="row">
            <div class="wrapper wrapper-content" style="padding-top: 0px;">
                <div class="row" style="height: 0px;">
                    <div class="col-lg-12"
                         style="margin-bottom: 5px; margin-top: 5px;">
                        <div class="col-sm-3">
                            <select class="form-control m-b-xs" id="sel_type">
                                <option value="1">경쟁전</option>
                                <option value="2">빠른 대전</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select class="form-control m-b-xs" id="sel_server">
                                <option value='pc'>PC</option>
                                <option value='xbl'>XBL</option>
                                <option value='psn'>PSN</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select class="form-control m-b-xs" id="sel_order">
                                <option value='vrank'>가상점수</option>
                                <option value='playtime'>플레이시간</option>
                                <option value='kpd'>K/D</option>
                            </select>
                        </div>
                        <div class="col-sm-3">
                            <select class="form-control m-b-xs" id="sel_heroes">
                                <optgroup label="공격">
                                    <option value='2'>겐지</option>
                                    <option value='4'>맥크리</option>
                                    <option value='5'>솔저: 76</option>
                                    <option value='7'>파라</option>
                                    <option value='13'>트레이서</option>
                                    <option value='16'>리퍼</option>
                                    <option value='23'>솜브라</option>
                                    <option value='25'>둠피스트</option>
                                </optgroup>
                                <optgroup label="수비">
                                    <option value='10'>위도우메이커</option>
                                    <option value='11'>한조</option>
                                    <option value='12'>정크렛</option>
                                    <option value='18'>메이</option>
                                    <option value='19'>토르비욘</option>
                                    <option value='22'>바스티온</option>
                                </optgroup>
                                <optgroup label="돌격">
                                    <option value='6'>로드호그</option>
                                    <option value='8'>라인하르트</option>
                                    <option value='9'>디바</option>
                                    <option value='15'>자리야</option>
                                    <option value='20'>윈스턴</option>
                                    <option value='24'>오리사</option>
                                </optgroup>
                                <optgroup label="지원">
                                    <option value='1'>메르시</option>
                                    <option value='3'>루시우</option>
                                    <option value='14'>아나</option>
                                    <option value='17'>젠야타</option>
                                    <option value='21'>시메트라</option>
                                    <option value='26'>모이라</option>
                                </optgroup>
                            </select>
                        </div>
                        <div class="col-sm-12" align="center"
                             style="margin-bottom: 5px; margin-top: 5px;">
                            <script async
                                    src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                            <!-- profile_top -->
                            <ins class="adsbygoogle" style="display: block"
                                 data-ad-client="ca-pub-4338490525578472"
                                 data-ad-slot="9329085141" data-ad-format="auto"></ins>
                            <script>
                                (adsbygoogle = window.adsbygoogle || []).push({});
                            </script>
                        </div>
                        <div class="col-sm-12">
                            <div class="well text-right" style="padding:5px;">
                                <small>* 각 플레이어의 모스트3 영웅만 집계에 포함됩니다.</small>
                                <!-- <small>* 경쟁전 전적이 없는 빠른대전 유저들만 집계합니다.</small> -->
                            </div>
                        </div>
                        <div class="top5 ibox-content">
                            <div>
                                <div class="">
                                    <c:if test="${Top100.size() > 0}">
                                        <div
                                                class="widget-head-color-box
	                                 <c:if test="${Top100[0].heroesType eq 'attack'}"> red-bg </c:if>
	                                 <c:if test="${Top100[0].heroesType eq 'defense'}"> blue-bg </c:if>
	                                 <c:if test="${Top100[0].heroesType eq 'tank'}"> yellow-bg </c:if>
	                                 <c:if test="${Top100[0].heroesType eq 'support'}"> navy-bg </c:if>
	                                 p-md text-center heroes">
                                            <div>
                                                <h2 class="font-bold no-margins"></h2>
                                                <small></small>
                                            </div>
                                            <div class="mask">
                                                <div class="hero"
                                                     style="background-image: url('https://blzgdapipro-a.akamaihd.net/hero/${Top100[0].heroesImg}/icon-portrait.png');">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="widget-text-box">
                                            <div class="feed-activity-list">
                                                <c:forEach var="TopHeroes" items="${Top100}"
                                                           varStatus="status">
                                                    <div class="feed-element" style="cursor: pointer;"
                                                         onclick="window.location='/profile?userId=${TopHeroes.userId}&heroesId=${TopHeroes.heroesId}&typeId=${TypeId}'">
                                                        <a class="pull-left"> ${TopHeroes.rnum} &nbsp; <img
                                                                alt="image" class="img-rounded"
                                                                style="width: 40px; height: 40px;"
                                                                src="${TopHeroes.avatar}">
                                                        </a>
                                                        <div>
                                                            <c:if test="${Order eq 'vrank'}">
                                                                <c:if test="${TopHeroes.typeId eq 1}">
                                                                    <span class="pull-right">${TopHeroes.vrank}점</span>
                                                                </c:if>
                                                                <c:if test="${TopHeroes.typeId eq 2}">
                                                                    <span class="pull-right">${TopHeroes.total}점</span>
                                                                </c:if>
                                                            </c:if>
                                                            <c:if test="${Order eq 'playtime'}">
                                                                <span class="pull-right"><fmt:formatNumber
                                                                        value="${TopHeroes.orderValue}"
                                                                        pattern="0시간"/></span>
                                                            </c:if>
                                                            <c:if test="${Order eq 'kpd'}">
                                                                <span class="pull-right"><fmt:formatNumber
                                                                        value="${TopHeroes.orderValue}"
                                                                        pattern="K/D 0.00"/></span>
                                                            </c:if>
                                                            <strong>${TopHeroes.userName}</strong> <br>
                                                            <c:if test="${TopHeroes.typeId eq 1}">
                                                                <img alt="image"
                                                                     style="width: 20px; height: 20px; display:inline-block"
                                                                     src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${TopHeroes.tierNumber}.png">
                                                                <span>${TopHeroes.rank}</span>
                                                            </c:if>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                                <div class="feed-element" align="center">
                                                    <script async
                                                            src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                                                    <!-- bottom -->
                                                    <ins class="adsbygoogle"
                                                         style="display:block"
                                                         data-ad-client="ca-pub-4338490525578472"
                                                         data-ad-slot="3502877543"
                                                         data-ad-format="auto"></ins>
                                                    <script>
                                                        (adsbygoogle = window.adsbygoogle || []).push({});
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${Top100.size() eq 0}">
                                        <div
                                                class="widget-head-color-box p-md text-center heroes">
                                            <div>
                                                <h2 class="font-bold no-margins">데이터가 없습니다.</h2>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- <div class="col-md-12">
            <div id="top5_view" class="row">
            <div class="wrapper wrapper-content">


             </div>
             </div>

             <div class="row">
                 <div class="hr-line-dashed"></div>
             </div>
            </div> -->
        </div>
        <div id="topAnchor"
             style="position: fixed; bottom: 20px; right: 20px; z-index: 100;">
            <a class="topAnchorButton"> <i class="fa fa-chevron-up"></i>
            </a>
        </div>
    </div>
    <!-- End of PageWrapper -->
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

<script>
    $(document).ready(function () {
        $("#sel_server").val($("#server").val());
        $("#sel_type").val($("#typeId").val());
        $("#sel_order").val($("#order").val());
        $("#sel_heroes").val($("#heroesId").val());

        $('#sel_server, #sel_type, #sel_order, #sel_heroes').change(function () {
            redirectTop100();
        });

        $('.topAnchorButton').click(function (event) {
            redirectTop100();
        });
    });

    function redirectTop100() {
        var server = $("#sel_server option:selected").val();
        var typeId = $("#sel_type option:selected").val();
        var order = $("#sel_order option:selected").val();
        var heroesId = $("#sel_heroes option:selected").val();
        location.href = "/top100" + "?typeId=" + typeId + "&server=" + server + "&order=" + order + "&heroesId=" + heroesId;
    }

</script>

</body>
</html>
