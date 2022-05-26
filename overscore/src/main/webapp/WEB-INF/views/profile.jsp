<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/profile?userId=${MySummary.userId}">
    <link href="/css/profile.css" rel="stylesheet">
    <!-- Bootstrap Tour -->
    <link href="/css/plugins/bootstrapTour/bootstrap-tour.min.css" rel="stylesheet">
    <style>
        a.footnote {
            vertical-align: super;
            font-size: 0.5em;
            margin-left: 2px;
            color: #1c84c6;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>

<body>
<div id="wrapper" style="min-width:320px;">
    <jsp:include page="common/menu.jsp"></jsp:include>

    <input type="hidden" id="syncId" value="${syncId}"/>
    <input type="hidden" id="userId" value="${MySummary.userId}"/>
    <input type="hidden" id="oppositeId" value="${OppositeSummary.userId}"/>
    <input type="hidden" id="userName" value="${MySummary.userName}"/>
    <input type="hidden" id="oppositeName" value="${OppositeSummary.userName}"/>
    <input type="hidden" id="typeId" value="${TypeId}"/>
    <input type="hidden" id="heroesId" value="${MyHeroes.heroesId}"/>
    <input type="hidden" id="expand" value="${expand}"/>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="common/nav.jsp"></jsp:include>
        <div class="row">
            <div class="wrapper wrapper-content" style="padding-top:0px;">
                <div class="col-lg-12" align="center" style="margin-bottom: 5px;margin-top: 5px;">
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
                <!-- Start of Summary -->
                <div class="col-lg-12">
                    <div class="row">
                        <div class="ibox float-e-margins" style="margin-bottom: 5px;">
                            <div class="ibox-content" id="step1"
                                 style="height:120px;color:whitesmoke;
                            background-image:url(https://overwatch-a.akamaihd.net/img/scene/candy-895e91cbc198218dbe56fed67b590a7c37a8bc3ef29d4b8c2989edf2196cfdb4b6150e64cb6f57a01a26268ae764b4cc22da52168121287e68aa8a9891efd616.jpg)">
                                <div class="text-left" style="position: absolute;left:20px;top:20px;">
                                    <img style="width:80px;height:80px;" src="${MySummary.avatar}"
                                         class="img-rounded rounded-border m-b-md" alt="profile">
                                </div>
                                <div style="position: absolute;left:120px;top:14px;">
                                    <span style="font-size:25px;"><strong>${MySummary.userName}</strong></span><br/>
                                    <c:choose>
                                        <c:when test="${MySummary.comprank eq -1}">
                                            <span style="font-size:18px;"><strong>${MySummary.wins}승</strong></span>
                                        </c:when>
                                        <c:when test="${MySummary.comprank ne -1}">
                                            <span style="font-size:18px;"><strong>${MySummary.comprank}</strong><img
                                                    alt="image" style="width:25px;height:25px;margin-bottom:3px;"
                                                    src="${MySummary.tierImage}"></span>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div style="position: absolute;left:21px;top:79px;">
                                    <span class="label"
                                          style="padding:2px 4px; background-color:#ffffff; border-radius:6px">Lv.${MySummary.level}</span>
                                </div>

                                <c:if test="${MySummary.isFake eq '0'}">
                                    <div class="btnUpdate">
                                        <!-- <div class="visible-top"> -->
                                        <c:if test="${error == '' }">
                                            <c:choose>
                                                <c:when test="${MySummary.latestUpdate eq '최신'}">
											<span id="step3">
												<button class="btn btn-xs btn-success" type="button"
                                                        style="cursor:default;margin-bottom:0px;"><i
                                                        class="fa fa-refresh"
                                                        style="margin-right:2px;"></i> ${MySummary.latestUpdate}</button>
											</span>
                                                </c:when>
                                                <c:when test="${MySummary.latestUpdate ne '최신'}">
											<span id="step3_1">
												<button id="btnUpdate" class="btn btn-xs btn-warning" type="button"
                                                        style="margin-bottom:0px;"><i class="fa fa-refresh"
                                                                                      style="margin-right:2px;"></i> ${MySummary.latestUpdate}</button>
											</span>
                                                </c:when>
                                            </c:choose>
                                            <span id="spanProcess" style="display:none;">
											<button id="btnProcess" class="btn btn-xs btn-danger" type="button"
                                                    style="margin-bottom:0px;"></button>
										</span>
                                        </c:if>
                                        <c:if test="${error != ''}">
                                            <button id="btnUpdate" class="btn btn-xs btn-danger" type="button"
                                                    style="margin-bottom:0px;">
                                                <i class="fa fa-exclamation-triangle" style="margin-right:2px;"></i>
                                                다시 시도
                                            </button>
                                        </c:if>
                                    </div>
                                </c:if>

                                <div class="btnHelp">
                                    <button class="btn btn-xs btn-info startTour" type="button">
                                        <i class="fa fa-info-circle"></i> 도움말
                                    </button>
                                </div>

                                <div class="btnQuick">
                                    <div class="visible-top">
                                    	<span id="step2">
                                    	<button id="btnQuick" style="margin-bottom:0px;"
                                                class="btn btn-xs btn-outline btn-success ${TypeId eq 2 ? 'active' : '' }"
                                                type="button"><i class="fa fa-rocket"></i> 빠른 대전</button>
                                    	<c:if test="${MySummary.comprank ne -1}">
                                            <button id="btnComp" style="margin-bottom:0px;"
                                                    class="btn btn-xs btn-outline btn-danger ${TypeId eq 1 ? 'active' : '' }"
                                                    type="button"><i class="fa fa-trophy"></i> 경쟁전</button>
                                        </c:if>
                                    	</span>
                                        <span id="step7_1">
                                    	<button id="btnFavorite" style="margin-bottom:0px;"
                                                class="btn btn-xs btn-outline btn-warning" type="button"><i
                                                class="fa fa-star"></i> 즐겨찾기</button>
                                    	</span>
                                    </div>
                                    <div class="hidden-top">
                                    	<span id="step2_1">
                                    	<button id="btnQuick2" style="margin-bottom:0px;"
                                                class="btn btn-xs btn-outline btn-success ${TypeId eq 2 ? 'active' : '' }"
                                                type="button"><i class="fa fa-rocket"></i></button>
                                    	<c:if test="${MySummary.comprank ne -1}">
                                            <button id="btnComp2" style="margin-bottom:0px;"
                                                    class="btn btn-xs btn-outline btn-danger ${TypeId eq 1 ? 'active' : '' }"
                                                    type="button"><i class="fa fa-trophy"></i></button>
                                        </c:if>
                                    	</span>
                                        <span id="step7_2">
                                    	<button id="btnFavorite2" style="margin-bottom:0px;"
                                                class="btn btn-xs btn-outline btn-warning" type="button"><i
                                                class="fa fa-star"></i></button>
                                    	</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- End of Summary -->
                <!-- Start of Chart -->
                <div class="row" style="margin-left:-16px;">
                    <c:if test="${TypeId eq 1}">
                    <div class="col-lg-8">
                        </c:if>
                        <c:if test="${TypeId eq 2}">
                        <div class="col-lg-12">
                            </c:if>
                            <div class="ibox float-e-margins"
                                 style="margin-bottom: 5px;background-image:url(https://overwatch-a.akamaihd.net/img/scene/candy-895e91cbc198218dbe56fed67b590a7c37a8bc3ef29d4b8c2989edf2196cfdb4b6150e64cb6f57a01a26268ae764b4cc22da52168121287e68aa8a9891efd616.jpg)">
                                <div class="ibox-content heroes"
                                     style="padding: 5px 20px 5px 20px;background-color:transparent;">
                                    <div id="step4_1" class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12" style="padding-right:0px;">
                                            <div class="mask">
                                                <div class="role red-bg"
                                                     style="background-image:url(https://www.overbuff.com/assets/images/roles/offense.png?v=f72031f);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_2" data-value=2 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/genji/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_4" data-value=4 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/mccree/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_7" data-value=7 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/pharah/icon-portrait.png); "></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_16" data-value=16 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/reaper/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_5" data-value=5 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/soldier-76/icon-portrait.png);)"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_13" data-value=13 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/tracer/icon-portrait.png);)"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_23" data-value=23 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/sombra/icon-portrait.png);)"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_25" data-value=25 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/doomfist/icon-portrait.png);)"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12" style="padding-right:0px;">
                                            <div class="mask">
                                                <div class="role blue-bg"
                                                     style="background-image:url(https://www.overbuff.com/assets/images/roles/defense.png?v=f72031f);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_22" data-value=22 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/bastion/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_11" data-value=11 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/hanzo/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_12" data-value=12 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/junkrat/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_18" data-value=18 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/mei/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_19" data-value=19 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/torbjorn/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_10" data-value=10 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/widowmaker/icon-portrait.png);"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12" style="padding-right:0px;">
                                            <div class="mask">
                                                <div class="role yellow-bg"
                                                     style="background-image:url(https://www.overbuff.com/assets/images/roles/tank.png?v=f72031f);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_9" data-value=9 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/dva/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_8" data-value=8 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/reinhardt/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_6" data-value=6 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/roadhog/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_24" data-value=24 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/orisa/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_20" data-value=20 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/winston/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_15" data-value=15 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/zarya/icon-portrait.png);"></div>
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12" style="">
                                            <div class="mask">
                                                <div class="role navy-bg"
                                                     style="background-image:url(https://www.overbuff.com/assets/images/roles/support.png?v=f72031f);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_14" data-value=14 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/ana/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_3" data-value=3 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/lucio/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_1" data-value=1 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/mercy/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_21" data-value=21 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/symmetra/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_17" data-value=17 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/zenyatta/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_26" data-value=26 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/moira/icon-portrait.png);"></div>
                                            </div>
                                            <div class="mask">
                                                <div id="hero_27" data-value=27 class="hero"
                                                     style="background-image:url(https://blzgdapipro-a.akamaihd.net/hero/brigitte/icon-portrait.png);"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="ibox-content ranks"
                                     style="padding: 5px 20px 5px 20px;background-color:transparent;">
                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12" style="padding-right:0px;"
                                             id="step4_2">
                                            <c:forEach var="Bot" items="${Bot}" varStatus="status">
                                                <c:set var="len" value="${fn:length(Bot.userTag)}"/>
                                                <c:if test="${fn:substring(Bot.userTag, len-1, len) > 0}">
                                                    <div class="mask">
                                                        <div data-value="${Bot.userId}" class="rank"
                                                             style="background-image:url(http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${fn:substring(Bot.userTag, len-1, len)}.png);"></div>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                        <div class="col-lg-6 col-md-6 col-sm-12" id="step5">
                                            <div class="mask-versus">
                                                <button id="btnVersus" type="button" data-toggle="modal"
                                                        data-target="#myModal"
                                                        style="background-image:url(https://bnetcmsus-a.akamaihd.net/cms/page_media/CFI5P4GCJ84R1485823564573.jpg);
				 								width:101%;height:55px;
				 								background-repeat:no-repeat;
				 								background-size:100% 500%;
				 								background-position:50% 30%;
				 								background-color:rgb(167, 177, 194);
				 								border-width:0px;outline:none;">
                                                </button>
                                            </div>
                                        </div>

                                        <div class="modal inmodal fade" id="myModal" tabindex="-1" role="dialog"
                                             aria-hidden="true">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content animated">
                                                    <div class="modal-header">
                                                        <div>
                                                            <div class="ibox float-e-margins"
                                                                 style="margin-bottom:0px;">
                                                                <div class="ibox-content"
                                                                     style="text-align:center;padding-right: 0px;padding-left: 0px;">
                                                                    <div class="search-form">
                                                                        <h2>
                                                                            <p>비교할 플레이어를 <br class="br-s-break">찾아보세요
                                                                            </p>
                                                                        </h2>
                                                                        <div class="hr-line-dashed"></div>
                                                                        <div class="input-group visible-modal">
                                                                            <input id="txtName2" type="text"
                                                                                   placeholder="아이디를 입력해주세요."
                                                                                   name="name" maxlength="20"
                                                                                   class="form-control input-lg"
                                                                                   style="position:initial;">
                                                                            <div class="input-group-btn">
                                                                                <button id="btnSearch2"
                                                                                        class="btn btn-lg btn-primary"
                                                                                        type="button"
                                                                                        style="position:initial;">
                                                                                    검색
                                                                                </button>
                                                                                <button id="btnSearch3"
                                                                                        class="btn btn-lg btn-warning"
                                                                                        type="button"
                                                                                        style="position:initial;">
                                                                                    즐겨찾기
                                                                                </button>
                                                                            </div>
                                                                        </div>
                                                                        <div class="input-group hidden-modal">
                                                                            <input id="txtName2_1" type="text"
                                                                                   placeholder="아이디를 입력해주세요."
                                                                                   name="name" maxlength="20"
                                                                                   class="form-control input-sm"
                                                                                   style="position:initial;">
                                                                            <div class="input-group-btn">
                                                                                <button id="btnSearch2_1"
                                                                                        class="btn btn-sm btn-primary"
                                                                                        type="button"
                                                                                        style="position:initial;">
                                                                                    검색
                                                                                </button>
                                                                                <button id="btnSearch3_1"
                                                                                        class="btn btn-sm btn-warning"
                                                                                        type="button"
                                                                                        style="position:initial;">
                                                                                    즐겨찾기
                                                                                </button>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="" id="searchModal">

                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-white"
                                                                data-dismiss="modal">닫기
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:if test="${TypeId eq 1}">
                            <div class="col-lg-4">
                                <div class="tabs-container">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a data-toggle="tab" href="#tab-1"
                                                              aria-expanded="true">${TypeId eq 2 ? '빠른대전 현황' : '경쟁전 현황' }</a>
                                        </li>
                                        <!-- <li class=""><a data-toggle="tab" href="#tab-2" aria-expanded="false">Todo</a></li> -->
                                    </ul>
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane active">
                                            <div class="panel-body" style="padding:0px;">
                                                <canvas id="canvas" height="170"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </div>
                    <!-- End of Chart  -->
                    <!-- Start of Scorecard -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins" style="margin-bottom: 5px;">

                                <div class="ibox-content" style="padding-bottom: 0px;">
                                    <div class="m-t-sm">
                                        <div class="row">
                                            <div class="col-lg-3 col-xs-6" style="padding-right:0px;">
                                                <div id="step6">
                                                    <ul class="list-group">
                                                        <li class="list-group-item text-left"
                                                            style="background-color:rgba(0,0,0,0.4);color:whitesmoke;height:40px;">
                                                            <span class=""></span>
                                                            <c:choose>
                                                                <c:when test="${MyScoreCard.vrank eq 0}">
							                                			<span id="t1_vrank" class="pull-right"
                                                                              style="font-weight: bold;">
							                                				<c:if test="${MySummary.comprank ne -1}"> 전적 없음 </c:if>
							                                				<c:if test="${MySummary.comprank eq -1}"> 빠른 대전 </c:if>
							                                			</span>
                                                                </c:when>
                                                                <c:when test="${MyScoreCard.vrank ne 0}">
							                                    		<span id="t1_vrank" class="pull-right"
                                                                              style="font-weight: bold;margin-top:-2px">
							                                    		<c:if test="${MyScoreCard.playtimeOn eq 0}"> 플레이 시간 부족</c:if>
							                                    		<c:if test="${MyScoreCard.playtimeOn eq 1}">
                                                                            <img alt="image"
                                                                                 style="width:25px;height:25px;"
                                                                                 src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${MyScoreCard.vtier}.png">
                                                                            ${MyScoreCard.vrank}
                                                                        </c:if>
							                                    		</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </li>

                                                        <li name="t1_h1_img" class="list-group-item text-right blue-bg"
                                                            style="color:white; margin-left:10%;
                                                                    background-image:url(
                                                            <c:choose>
                                                            <c:when test="${MyScoreCard.vrank >= OppositeScoreCard.vrank || MyScoreCard.vrank == 0}">
                                                                    https://blzgdapipro-a.akamaihd.net/hero/${MyHeroes.heroesImg}/icon-portrait.png
                                                            </c:when>
                                                            <c:when test="${MyScoreCard.vrank < OppositeScoreCard.vrank}">
                                                                    /img/sad_${MyHeroes.heroesId}.png
                                                            </c:when>
                                                            </c:choose>
                                                                    );
                                                                    background-repeat:no-repeat;
                                                                    background-position:0% 50%;">
                                                            <span class="m-r-xs hidden-margin-r"><strong>${MySummary.userName}</strong></span>
                                                            <span class="pull-right hidden-icon">
							                                	<img alt="image" src="${MySummary.avatar}"
                                                                     style="margin-top:-2px;">
							                                    <%-- <c:choose>
																	<c:when test="${MySummary.comprank ne -1}">
							                                		<img alt="image" src="${MySummary.tierImage}">
							                                		</c:when>
							                                	</c:choose> --%>
							                                </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 visible-custom col-xs-6 " style="padding-left:0px;">
                                                <div id="step6_1">
                                                    <ul class="list-group">
                                                        <li class="list-group-item text-right"
                                                            style="background-color:rgba(0,0,0,0.4);color:whitesmoke;height:40px;">
                                                            <!-- <span class="">2팀</span> -->
                                                            <c:choose>
                                                                <c:when test="${OppositeScoreCard.vrank eq 0}">
							                                			<span id="t2_vrank" class="pull-left"
                                                                              style="font-weight: bold;">
							                                				<c:if test="${MySummary.comprank ne -1}"> 전적 없음 </c:if>
							                                				<c:if test="${MySummary.comprank eq -1}"> 빠른 대전 </c:if>
							                                			</span>
                                                                </c:when>
                                                                <c:when test="${OppositeScoreCard.vrank ne 0}">
							                                    		<span id="t2_vrank" class="pull-left"
                                                                              style="font-weight: bold;margin-top:-2px">
							                                    		<c:if test="${OppositeScoreCard.playtimeOn eq 0}"> 플레이 시간 부족</c:if>
							                                    		<c:if test="${OppositeScoreCard.playtimeOn eq 1}">
                                                                            <img alt="image"
                                                                                 style="width:25px;height:25px;"
                                                                                 src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${OppositeScoreCard.vtier}.png">
                                                                            ${OppositeScoreCard.vrank}
                                                                        </c:if>
							                                    		</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </li>
                                                        <li name="t2_h1_img" class="list-group-item text-left red-bg"
                                                            style="margin-right:10%;
                                                                    background-image:url(
                                                            <c:choose>
                                                            <c:when test="${OppositeScoreCard.vrank >= MyScoreCard.vrank || OppositeScoreCard.vrank == 0 }">
                                                                    https://blzgdapipro-a.akamaihd.net/hero/${OppositeHeroes.heroesImg}/icon-portrait.png
                                                            </c:when>
                                                            <c:when test="${OppositeScoreCard.vrank < MyScoreCard.vrank}">
                                                                    /img/sad_${OppositeHeroes.heroesId}.png
                                                            </c:when>
                                                            </c:choose>
                                                                    );
                                                                    background-repeat:no-repeat;
                                                                    background-position:100% 50%;">
                                                            <span class="m-l-xs hidden-margin-l"><strong>${OppositeSummary.userName}</strong></span>
                                                            <span class="pull-left hidden-icon">
							                                	<%-- <c:choose>
																	<c:when test="${OppositeSummary.comprank ne -1}">
							                                		<img alt="image" src="${OppositeSummary.tierImage}">
							                                		</c:when>
							                                	</c:choose> --%>
							                                	<img alt="image" src="${OppositeSummary.avatar}"
                                                                     style="margin-top:-2px;">
							                                </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-xs-12" id="step7">
                                                <div class="ibox-content" style="padding: 15px 0 20px 0">
                                                    <table id="score_table" class="table table-hover table-bordered"
                                                           style="white-space: nowrap;">
                                                        <thead>
                                                        <c:if test="${TypeId eq 1 }">
                                                            <tr>
                                                                <td width="45%">
                                                                    <c:choose>
                                                                        <c:when test="${MyScoreCard.rank eq ''}"><c:if
                                                                                test="${TypeId eq 2 }">빠른 대전</c:if><c:if
                                                                                test="${TypeId eq 1}">-</c:if></c:when>
                                                                        <c:when test="${MyScoreCard.rank ne ''}">
					                                    	<span style="margin-top:-2px">
                                                                    ${MyScoreCard.rank}
                                                            </span>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td width="10%">
                                                                    <div class="tooltip-demo">
                                                                        <span data-toggle="tooltip"
                                                                              data-placement="bottom"
                                                                              title="현재점수">현재점수</span>
                                                                    </div>
                                                                </td>
                                                                <td width="45%">
                                                                    <c:choose>
                                                                        <c:when test="${OppositeScoreCard.rank eq ''}"><c:if
                                                                                test="${TypeId eq 2 }">빠른 대전</c:if><c:if
                                                                                test="${TypeId eq 1}">-</c:if></c:when>
                                                                        <c:when test="${OppositeScoreCard.rank ne ''}">
					                                    	<span style="margin-top:-2px">
                                                                    ${OppositeScoreCard.rank}
                                                            </span>
                                                                        </c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <tr style="background-color:rgba(0,0,0,0.4);font-size:14px;border: 2px solid;">
                                                            <th width="45%" class=
                                                                    '<c:if test="${MyScoreCard.vrank >= OppositeScoreCard.vrank && TypeId eq 1}">text-danger</c:if>
					                                    <c:if test="${MyScoreCard.vrank < OppositeScoreCard.vrank && TypeId eq 1}">text-success</c:if>'
                                                            >
                                                                <c:choose>
                                                                    <c:when test="${MyScoreCard.vrank eq ''}"><c:if
                                                                            test="${TypeId eq 2 }">빠른 대전</c:if><c:if
                                                                            test="${TypeId eq 1}">-</c:if></c:when>
                                                                    <c:when test="${MyScoreCard.vrank ne ''}">
					                                    	<span style="font-weight: bold;margin-top:-2px">
						                                    	${MyScoreCard.vrank}
						                                    	<span style="font-size:11px;" class=
                                                                        '<c:if test='${MyScoreCard.vrank - MyScoreCard.rank >= 0}'>text-danger</c:if>
						                                    	<c:if test='${MyScoreCard.vrank - MyScoreCard.rank < 0}'>text-success</c:if>
						                                    	'>
						                                    	<c:if test='${MyScoreCard.vrank - MyScoreCard.rank >= 0}'> (+${MyScoreCard.vrank - MyScoreCard.rank})</c:if>
						                                    	<c:if test='${MyScoreCard.vrank - MyScoreCard.rank < 0}'> (${MyScoreCard.vrank - MyScoreCard.rank})</c:if>
						                                    	</span>
				                                    		</span>
                                                                    </c:when>
                                                                </c:choose>
                                                            </th>
                                                            <th width="10%" style='font-size:13px;font-weight:600;'>
                                                                <div class="tooltip-demo">
                                                                    <span data-toggle="tooltip" data-placement="bottom"
                                                                          title="오버스코어(영웅별 가상점수)">가상점수</span>
                                                                </div>
                                                            </th>
                                                            <th width="45%" class=
                                                                    '<c:if test="${MyScoreCard.vrank >= OppositeScoreCard.vrank && TypeId eq 1}">text-success</c:if>
					                                    <c:if test="${MyScoreCard.vrank < OppositeScoreCard.vrank && TypeId eq 1}">text-danger</c:if>'
                                                            >
                                                                <c:choose>
                                                                    <c:when test="${OppositeScoreCard.vrank eq ''}"><c:if
                                                                            test="${TypeId eq 2 }">빠른 대전</c:if><c:if
                                                                            test="${TypeId eq 1}">-</c:if></c:when>
                                                                    <c:when test="${OppositeScoreCard.vrank ne ''}">
					                                    	<span style="font-weight: bold;margin-top:-2px">
						                                    	${OppositeScoreCard.vrank}
						                                    	<span style="font-size:11px;" class=
                                                                        '<c:if test='${OppositeScoreCard.vrank - OppositeScoreCard.rank >= 0}'>text-danger</c:if>
						                                    	<c:if test='${OppositeScoreCard.vrank - OppositeScoreCard.rank < 0}'>text-success</c:if>
						                                    	'>
						                                    	<c:if test='${OppositeScoreCard.vrank - OppositeScoreCard.rank >= 0}'> (+${OppositeScoreCard.vrank - OppositeScoreCard.rank})</c:if>
						                                    	<c:if test='${OppositeScoreCard.vrank - OppositeScoreCard.rank < 0}'> (${OppositeScoreCard.vrank - OppositeScoreCard.rank})</c:if>
						                                    	</span>
				                                    		</span>
                                                                    </c:when>
                                                                </c:choose>
                                                            </th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <c:if test="${MyScoreCard.atk ne 0 || OppositeScoreCard.atk ne 0}">
                                                            <tr class="panel-default">
                                                                <td width="45%" class="${MyScoreCard.atkColor}">
                                                                    <c:choose>
                                                                        <c:when test="${MyScoreCard.atk eq 0}">-</c:when>
                                                                        <c:when test="${MyScoreCard.atk ne 0}">${MyScoreCard.atk}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="panel-heading" width="10%">
                                                                    <div class="tooltip-demo">
                                                                        공격<a class="footnote" href="#statPanelAtk">?</a>
                                                                    </div>
                                                                </td>
                                                                <td width="45%" class="${OppositeScoreCard.atkColor}">
                                                                    <c:choose>
                                                                        <c:when test="${OppositeScoreCard.atk eq 0}">-</c:when>
                                                                        <c:when test="${OppositeScoreCard.atk ne 0}"><span>${OppositeScoreCard.atk}</span></c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${MyScoreCard.block ne 0 || OppositeScoreCard.block ne 0}">
                                                            <tr class="panel-default">
                                                                <td width="45%" class="${MyScoreCard.blockColor}">
                                                                    <c:choose>
                                                                        <c:when test="${MyScoreCard.block eq 0}">-</c:when>
                                                                        <c:when test="${MyScoreCard.block ne 0}">${MyScoreCard.block}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="panel-heading" width="10%">
                                                                    <div class="tooltip-demo">
                                                                        방어<a class="footnote"
                                                                             href="#statPanelBlock">?</a>
                                                                    </div>
                                                                </td>
                                                                <td width="45%" class="${OppositeScoreCard.blockColor}">
                                                                    <c:choose>
                                                                        <c:when test="${OppositeScoreCard.block eq 0}">-</c:when>
                                                                        <c:when test="${OppositeScoreCard.block ne 0}">${OppositeScoreCard.block}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${MyScoreCard.heal ne 0 || OppositeScoreCard.heal ne 0}">
                                                            <tr class="panel-default">
                                                                <td width="45%" class="${MyScoreCard.healColor}">
                                                                    <c:choose>
                                                                        <c:when test="${MyScoreCard.heal eq 0}">-</c:when>
                                                                        <c:when test="${MyScoreCard.heal ne 0}">${MyScoreCard.heal}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="panel-heading" width="10%">
                                                                    <div class="tooltip-demo">
                                                                        치유<a class="footnote"
                                                                             href="#statPanelHeal">?</a>
                                                                    </div>
                                                                </td>
                                                                <td width="45%" class="${OppositeScoreCard.healColor}">
                                                                    <c:choose>
                                                                        <c:when test="${OppositeScoreCard.heal eq 0}">-</c:when>
                                                                        <c:when test="${OppositeScoreCard.heal ne 0}">${OppositeScoreCard.heal}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${MyScoreCard.hit ne 0 || OppositeScoreCard.hit ne 0}">
                                                            <tr class="panel-default">
                                                                <td width="45%" class="${MyScoreCard.hitColor}">
                                                                    <c:choose>
                                                                        <c:when test="${MyScoreCard.hit eq 0}">-</c:when>
                                                                        <c:when test="${MyScoreCard.hit ne 0}">${MyScoreCard.hit}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="panel-heading" width="10%">
                                                                    <div class="tooltip-demo">
                                                                        명중<a class="footnote" href="#statPanelHit">?</a>
                                                                    </div>
                                                                </td>
                                                                <td width="45%" class="${OppositeScoreCard.hitColor}">
                                                                    <c:choose>
                                                                        <c:when test="${OppositeScoreCard.hit eq 0}">-</c:when>
                                                                        <c:when test="${OppositeScoreCard.hit ne 0}">${OppositeScoreCard.hit}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${MyScoreCard.skill ne 0 || OppositeScoreCard.skill ne 0}">
                                                            <tr class="panel-default">
                                                                <td width="45%" class="${MyScoreCard.skillColor}">
                                                                    <c:choose>
                                                                        <c:when test="${MyScoreCard.skill eq 0}">-</c:when>
                                                                        <c:when test="${MyScoreCard.skill ne 0}">${MyScoreCard.skill}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="panel-heading" width="10%">
                                                                    <div class="tooltip-demo">
                                                                        스킬<a class="footnote"
                                                                             href="#statPanelSkill">?</a>
                                                                    </div>
                                                                </td>
                                                                <td width="45%" class="${OppositeScoreCard.skillColor}">
                                                                    <c:choose>
                                                                        <c:when test="${OppositeScoreCard.skill eq 0}">-</c:when>
                                                                        <c:when test="${OppositeScoreCard.skill ne 0}">${OppositeScoreCard.skill}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${MyScoreCard.carry ne 0 || OppositeScoreCard.carry ne 0}">
                                                            <tr class="panel-default">
                                                                <td width="45%" class="${MyScoreCard.carryColor}">
                                                                    <c:choose>
                                                                        <c:when test="${MyScoreCard.carry eq 0}">-</c:when>
                                                                        <c:when test="${MyScoreCard.carry ne 0}">${MyScoreCard.carry}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="panel-heading" width="10%">
                                                                    <div class="tooltip-demo">
                                                                        캐리<a class="footnote"
                                                                             href="#statPanelCarry">?</a>
                                                                    </div>
                                                                </td>
                                                                <td width="45%" class="${OppositeScoreCard.carryColor}">
                                                                    <c:choose>
                                                                        <c:when test="${OppositeScoreCard.carry eq 0}">-</c:when>
                                                                        <c:when test="${OppositeScoreCard.carry ne 0}">${OppositeScoreCard.carry}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        <c:if test="${MyScoreCard.total ne '' || OppositeScoreCard.total ne ''}">
                                                            <tr class="panel-default" style="background-color:#f5f5f5">
                                                                <td width="45%" class="${MyScoreCard.totalColor}">
                                                                    <c:choose>
                                                                        <c:when test="${TypeId eq 2}">${MyScoreCard.total}</c:when>
                                                                        <c:when test="${MyScoreCard.total eq ''}">-</c:when>
                                                                        <c:when test="${MyScoreCard.total ne ''}"><img
                                                                                alt="image"
                                                                                style="width:20px;height:20px;"
                                                                                src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${MyScoreCard.tier}.png'>${MyScoreCard.total}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td class="panel-heading" width="10%">
                                                                    <div class="tooltip-demo">
                                                                        종합
                                                                    </div>
                                                                </td>
                                                                <td width="45%" class="${OppositeScoreCard.totalColor}">
                                                                    <c:choose>
                                                                        <c:when test="${TypeId eq 2}">${OppositeScoreCard.total}</c:when>
                                                                        <c:when test="${OppositeScoreCard.total eq ''}">-</c:when>
                                                                        <c:when test="${OppositeScoreCard.total ne ''}"><img
                                                                                alt="image"
                                                                                style="width:20px;height:20px;"
                                                                                src='http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${OppositeScoreCard.tier}.png'>${OppositeScoreCard.total}</c:when>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>
                                                        </c:if>

                                                        <c:if test="${MyScoreCard.tier < OppositeScoreCard.tier}">
                                                            <tr class="panel-default">
                                                                <td width="320px" colspan="3" style="padding: 0px;">
                                                                    <small>
                                                                        * 내 티어가 상대방의 티어보다 낮습니다. <br/>
                                                                        * 스탯은 티어가 다르면 다른 의미를 갖습니다.<br/>
                                                                        예) <img alt="image"
                                                                                style="width:18px;height:18px;"
                                                                                src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-1.png">
                                                                        공격 50 ≠
                                                                        <img alt="image" style="width:18px;height:18px;"
                                                                             src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-7.png">
                                                                        공격 50
                                                                    </small>
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                        </tbody>
                                                    </table>
                                                    <%-- <canvas id="radarChart"></canvas> --%>
                                                </div>
                                            </div>
                                            <div class="col-lg-3 hidden-custom col-xs-6" style="padding-left:0px;">
                                                <div id="step6_2">
                                                    <ul class="list-group">
                                                        <li class="list-group-item text-right"
                                                            style="background-color:rgba(0,0,0,0.4);color:whitesmoke;height:40px;">
                                                            <!-- <span class="m-l-md">2팀</span> -->
                                                            <c:choose>
                                                                <c:when test="${OppositeScoreCard.vrank eq 0}">
							                                			<span id="t2_vrank2" class="pull-left"
                                                                              style="font-weight: bold;">
							                                				<c:if test="${MySummary.comprank ne -1}"> 전적 없음 </c:if>
							                                				<c:if test="${MySummary.comprank eq -1}"> 빠른 대전 </c:if>
							                                			</span>
                                                                </c:when>
                                                                <c:when test="${OppositeScoreCard.vrank ne 0}">
							                                    		<span id="t2_vrank2" class="pull-left"
                                                                              style="font-weight: bold;margin-top:-2px">
							                                    		<c:if test="${OppositeScoreCard.playtimeOn eq 0}"> 플레이 시간 부족</c:if>
							                                    		<c:if test="${OppositeScoreCard.playtimeOn eq 1}">
                                                                            <img alt="image"
                                                                                 style="width:25px;height:25px;"
                                                                                 src="http://blzgdapipro-a.akamaihd.net/game/rank-icons/season-2/rank-${OppositeScoreCard.vtier}.png">
                                                                            ${OppositeScoreCard.vrank}
                                                                        </c:if>
							                                    		</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </li>
                                                        <li name="t2_h1_img" class="list-group-item text-left red-bg"
                                                            style="margin-right:10%;
                                                                    background-image:url(
                                                            <c:choose>
                                                            <c:when test="${OppositeScoreCard.vrank >= MyScoreCard.vrank || OppositeScoreCard.vrank == 0}">
                                                                    https://blzgdapipro-a.akamaihd.net/hero/${OppositeHeroes.heroesImg}/icon-portrait.png
                                                            </c:when>
                                                            <c:when test="${OppositeScoreCard.vrank < MyScoreCard.vrank}">
                                                                    /img/sad_${OppositeHeroes.heroesId}.png
                                                            </c:when>
                                                            </c:choose>
                                                                    );
                                                                    background-repeat:no-repeat;
                                                                    background-position:100% 50%;">
                                                            <span class="m-l-xs hidden-margin-l"><strong>${OppositeSummary.userName}</strong></span>
                                                            <span class="pull-left hidden-icon">
							                                	<%-- <c:choose>
																	<c:when test="${OppositeSummary.comprank ne -1}">
							                                		<img alt="image" src="${OppositeSummary.tierImage}">
							                                		</c:when>
							                                	</c:choose> --%>
							                                	<img alt="image" src="${OppositeSummary.avatar}"
                                                                     style="margin-top:-2px;">
							                                </span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- End of Scorecard -->

                    <!-- Start of DetailView -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>상세 비교 </h5>
                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                    </div>
                                </div>
                                <div id="statPanel" class="ibox-content" style="padding-left: 5px;padding-right: 5px;">

                                    <div id="statPanelNormal" class="panel panel-default">
                                        <div class="panel-heading">
                                            일반
                                        </div>
                                        <div class="panel-body">
                                            <table id="diff_table" class="table table-hover table-bordered"
                                                   style="white-space: nowrap;">
                                                <thead>
                                                <tr>
                                                    <th width="45%">${MySummary.userName}</th>
                                                    <th width="10%"></th>
                                                    <th width="45%">${OppositeSummary.userName}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td id="myHeroesPlaytime"><fmt:formatNumber
                                                            value="${MyHeroes.timePlayed}" pattern="0.0"/>시간
                                                    </td>
                                                    <td>플레이</td>
                                                    <td id="opHeroesPlaytime"><fmt:formatNumber
                                                            value="${OppositeHeroes.timePlayed}" pattern="0.0"/>시간
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td id="myHeroesStat"><fmt:formatNumber value="${MyHeroes.gamesWon}"
                                                                                            pattern="0"/>승
                                                        <c:if test="${TypeId eq 1}">
                                                            <fmt:formatNumber value="${MyHeroes.gamesTied}"
                                                                              pattern="0"/>무
                                                            <fmt:formatNumber value="${MyHeroes.gamesLost}"
                                                                              pattern="0"/>패
                                                        </c:if></td>
                                                    <td>전적</td>
                                                    <td id="opHeroesStat"><fmt:formatNumber
                                                            value="${OppositeHeroes.gamesWon}" pattern="0"/>승
                                                        <c:if test="${TypeId eq 1}">
                                                            <fmt:formatNumber value="${OppositeHeroes.gamesTied}"
                                                                              pattern="0"/>무
                                                            <fmt:formatNumber value="${OppositeHeroes.gamesLost}"
                                                                              pattern="0"/>패
                                                        </c:if></td>
                                                </tr>
                                                <c:if test="${TypeId eq 1}">
                                                    <tr>
                                                        <td id="myHeroesWinRate"><fmt:formatNumber
                                                                value="${MyHeroes.gamesWon / MyHeroes.gamesPlayed}"
                                                                pattern="0.0%"/></td>
                                                        <td>승률</td>
                                                        <td id="opHeroesWinRate"><fmt:formatNumber
                                                                value="${OppositeHeroes.gamesWon / OppositeHeroes.gamesPlayed}"
                                                                pattern="0.0%"/></td>
                                                    </tr>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="statPanelAtk" class="panel panel-warning" style="<c:if
                                            test="${MyScoreCard.atk eq '' && OppositeScoreCard.atk eq ''}">display:none</c:if>">
                                        <div class="panel-heading">
                                            공격
                                        </div>
                                        <div class="panel-body">
                                            <table id="diff_table" class="table table-hover table-bordered"
                                                   style="white-space: nowrap;">
                                                <thead>
                                                <tr>
                                                    <th width="45%">${MySummary.userName}</th>
                                                    <th width="10%"></th>
                                                    <th width="45%">${OppositeSummary.userName}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td id="myHeroesDeal"><fmt:formatNumber
                                                            value="${MyHeroes.damageDone / MyHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                    <td>딜/D</td>
                                                    <td id="opHeroesDeal"><fmt:formatNumber
                                                            value="${OppositeHeroes.damageDone / OppositeHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                </tr>
                                                <tr>
                                                    <td id="myHeroesKpd"><fmt:formatNumber
                                                            value="${MyHeroes.eliminations / MyHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                    <td>K/D</td>
                                                    <td id="opHeroesKpd"><fmt:formatNumber
                                                            value="${OppositeHeroes.eliminations / OppositeHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="statPanelBlock" class="panel panel-success" style="<c:if
                                            test="${MyScoreCard.block eq '' && OppositeScoreCard.block eq ''}">display:none</c:if>">
                                        <div class="panel-heading">
                                            방어
                                        </div>
                                        <div class="panel-body">
                                            <table id="diff_table" class="table table-hover table-bordered"
                                                   style="white-space: nowrap;">
                                                <thead>
                                                <tr>
                                                    <th width="45%">${MySummary.userName}</th>
                                                    <th width="10%"></th>
                                                    <th width="45%">${OppositeSummary.userName}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td id="myHeroesBlock"><fmt:formatNumber
                                                            value="${MyHeroes.damageBlocked / MyHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                    <td>방어/D</td>
                                                    <td id="opHeroesBlock"><fmt:formatNumber
                                                            value="${OppositeHeroes.damageBlocked / OppositeHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="statPanelHeal" class="panel panel-primary" style="<c:if
                                            test="${MyScoreCard.heal eq '' && OppositeScoreCard.heal eq ''}">display:none</c:if>">
                                        <div class="panel-heading">
                                            치유
                                        </div>
                                        <div class="panel-body">
                                            <table id="diff_table" class="table table-hover table-bordered"
                                                   style="white-space: nowrap;">
                                                <thead>
                                                <tr>
                                                    <th width="45%">${MySummary.userName}</th>
                                                    <th width="10%"></th>
                                                    <th width="45%">${OppositeSummary.userName}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td id="myHeroesHeal"><fmt:formatNumber
                                                            value="${MyHeroes.healingDone / MyHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                    <td>힐/D</td>
                                                    <td id="opHeroesHeal"><fmt:formatNumber
                                                            value="${OppositeHeroes.healingDone / OppositeHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="statPanelHit" class="panel panel-hit" style="<c:if
                                            test="${MyScoreCard.hit eq '' && OppositeScoreCard.hit eq ''}">display:none</c:if>">
                                        <div class="panel-heading">
                                            명중
                                        </div>
                                        <div class="panel-body">
                                            <table id="diff_table" class="table table-hover table-bordered"
                                                   style="white-space: nowrap;">
                                                <thead>
                                                <tr>
                                                    <th width="45%">${MySummary.userName}</th>
                                                    <th width="10%"></th>
                                                    <th width="45%">${OppositeSummary.userName}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td id="myHeroesHit1"><fmt:formatNumber
                                                            value="${MyHeroes.weaponAccuracy}" pattern="0.00%"/></td>
                                                    <td>명중률</td>
                                                    <td id="opHeroesHit1"><fmt:formatNumber
                                                            value="${OppositeHeroes.weaponAccuracy}"
                                                            pattern="0.00%"/></td>
                                                </tr>
                                                <tr>
                                                    <td id="myHeroesHit2"><fmt:formatNumber
                                                            value="${MyHeroes.criticalHitAccuracy}"
                                                            pattern="0.00%"/></td>
                                                    <td>치명타율</td>
                                                    <td id="opHeroesHit2"><fmt:formatNumber
                                                            value="${OppositeHeroes.criticalHitAccuracy}"
                                                            pattern="0.00%"/></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="statPanelSkill" class="panel panel-info" style="<c:if
                                            test="${MyScoreCard.skill eq '' && OppositeScoreCard.skill eq ''}">display:none</c:if>">
                                        <div class="panel-heading">
                                            스킬
                                        </div>
                                        <div class="panel-body">
                                            <table id="diff_table" class="table table-hover table-bordered"
                                                   style="white-space: nowrap;">
                                                <thead>
                                                <tr>
                                                    <th width="45%">${MySummary.userName}</th>
                                                    <th width="10%"></th>
                                                    <th width="45%">${OppositeSummary.userName}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td id="myHeroesSkill1"><fmt:formatNumber
                                                            value="${MyHeroes.skill1 / MyHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                    <td id="nmHeroesSkill1">${MyHeroes.skill1Kor}/D</td>
                                                    <td id="opHeroesSkill1"><fmt:formatNumber
                                                            value="${OppositeHeroes.skill1 / OppositeHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                </tr>
                                                <c:if test="${MyHeroes.skill2 ne '' || OppositeHeroes.skill2 ne ''}">
                                                    <tr>
                                                        <td id="myHeroesSkill2"><fmt:formatNumber
                                                                value="${MyHeroes.skill2 / MyHeroes.deaths}"
                                                                pattern="0.00"/></td>
                                                        <td id="nmHeroesSkill2">${MyHeroes.skill2Kor}/D</td>
                                                        <td id="opHeroesSkill2"><fmt:formatNumber
                                                                value="${OppositeHeroes.skill2 / OppositeHeroes.deaths}"
                                                                pattern="0.00"/></td>
                                                    </tr>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div id="statPanelCarry" class="panel panel-danger" style="<c:if
                                            test="${MyScoreCard.carry eq '' && OppositeScoreCard.carry eq ''}">display:none</c:if>">
                                        <div class="panel-heading">
                                            캐리
                                        </div>
                                        <div class="panel-body">
                                            <table id="diff_table" class="table table-hover table-bordered"
                                                   style="white-space: nowrap;">
                                                <thead>
                                                <tr>
                                                    <th width="45%">${MySummary.userName}</th>
                                                    <th width="10%"></th>
                                                    <th width="45%">${OppositeSummary.userName}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td id="myHeroesCarry1"><fmt:formatNumber
                                                            value="${MyHeroes.carry1 / MyHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                    <td id="nmHeroesCarry1">${MyHeroes.carry1Kor}/D</td>
                                                    <td id="opHeroesCarry1"><fmt:formatNumber
                                                            value="${OppositeHeroes.carry1 / OppositeHeroes.deaths}"
                                                            pattern="0.00"/></td>
                                                </tr>
                                                <c:if test="${MyHeroes.carry2 ne '' || OppositeHeroes.carry2 ne ''}">
                                                    <tr>
                                                        <td id="myHeroesCarry2"><fmt:formatNumber
                                                                value="${MyHeroes.carry2 / MyHeroes.deaths}"
                                                                pattern="0.00"/></td>
                                                        <td id="nmHeroesCarry2">${MyHeroes.carry2Kor}/D</td>
                                                        <td id="opHeroesCarry2"><fmt:formatNumber
                                                                value="${OppositeHeroes.carry2 / OppositeHeroes.deaths}"
                                                                pattern="0.00"/></td>
                                                    </tr>
                                                </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>


                                </div>
                                <button id='btnFaq' style='height:50px;' class="btn btn-primary btn-block">오버스코어 보는법
                                </button>
                            </div>
                        </div>
                    </div>
                    <!-- End of DetailView -->

                    <div class="row">
                        <div class="col-lg-12" align="center" style="margin-bottom: 5px;margin-top: 5px;">
                            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
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
    <script src="/js/plugins/pace/pace.min.js"></script>

    <!-- Bootstrap Tour -->
    <script src="/js/plugins/bootstrapTour/bootstrap-tour.min.js"></script>

    <!-- ChartJS -->
    <script src="/js/plugins/chartJs/Chart.min.js"></script>
    <script src="/js/plugins/chartJs/Chart.bundle.js"></script>

    <script>
        $(document).ready(function () {
            var historyObj = ${HistoryStat};
            var typeId = ${TypeId};
            var execDate = [];
            var wins = [];
            var ties = [];
            var losses = [];
            var yAxis = [];

            var maxValue = 0;

            for (var i in historyObj) {
                execDate.push(historyObj[i].execDate);
                wins.push(historyObj[i].wins);
                ties.push(historyObj[i].ties);
                losses.push(historyObj[i].losses * -1);
                yAxis.push(historyObj[i].yAxis);
                if (historyObj[i].yAxis > maxValue)
                    maxValue = historyObj[i].yAxis;
            }

            /* Morris.Line({
                element: 'morris-line-chart',
                data: historyObj,
                xkey: 'execDate',
                parseTime: false,
                ykeys: ['yAxis'],
                labels: ['실력 평점'],
                resize: true,
                // grid: false,
                ymax: 'auto',
                ymin: 'auto',
                lineColors: ['#54cdb4'],
                axes: 'x',

            }); */
            window.chartColors = {
                red: 'rgb(255, 99, 132)',
                orange: 'rgb(255, 159, 64)',
                yellow: 'rgb(255, 205, 86)',
                green: 'rgb(75, 192, 192)',
                blue: 'rgb(54, 162, 235)',
                purple: 'rgb(153, 102, 255)',
                grey: 'rgb(201, 203, 207)'
            };

            var color = Chart.helpers.color;
            var barChartData = {
                labels: execDate,
                datasets: [{
                    yAxisID: 'A',
                    type: 'bar',
                    label: '승',
                    backgroundColor: color(window.chartColors.green).alpha(0.2).rgbString(),
                    borderColor: window.chartColors.green,
                    data: wins
                }, {
                    yAxisID: 'A',
                    type: 'bar',
                    label: '패',
                    backgroundColor: color(window.chartColors.red).alpha(0.2).rgbString(),
                    borderColor: window.chartColors.red,
                    data: losses
                }, {
                    yAxisID: 'B',
                    type: 'line',
                    fill: false,
                    label: (typeId == "1" ? "실력 평점" : "승률"),
                    backgroundColor: color(window.chartColors.blue).alpha(0.2).rgbString(),
                    borderColor: window.chartColors.blue,
                    data: yAxis
                }]
            };

            // Define a plugin to provide data labels
            Chart.plugins.register({
                afterDatasetsDraw: function (chart, easing) {
                    // To only draw at the end of animation, check for easing === 1
                    var ctx = chart.ctx;

                    chart.data.datasets.forEach(function (dataset, i) {
                        var meta = chart.getDatasetMeta(i);
                        if (!meta.hidden) {
                            meta.data.forEach(function (element, index) {
                                // Draw the text in black, with the specified font
                                ctx.fillStyle = 'rgb(0, 0, 0)';

                                var fontSize = 12;
                                var fontStyle = 'bold';
                                var fontFamily = 'Helvetica Neue';
                                ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

                                // Just naively convert to string for now
                                var dataString = dataset.data[index].toString();

                                // Make sure alignment settings are correct
                                ctx.textAlign = 'center';
                                ctx.textBaseline = 'middle';

                                var padding = 5;
                                var position = element.tooltipPosition();

                                var addStr = "";
                                if (dataset.yAxisID == "B") {
                                    ctx.fillText(dataString + (typeId == "1" ? "점" : "%"), position.x, position.y - (fontSize / 2) - padding);
                                }
                            });
                        }
                    });
                }
            });

            window.onload = function () {
                var ctx = document.getElementById("canvas").getContext("2d");

                window.myBar = new Chart(ctx, {
                    type: 'bar',
                    data: barChartData,
                    options: {
                        animation: false,
                        maintainAspectRatio: false,
                        responsive: true,
                        legend: {
                            display: false
                        },
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                            callbacks: {
                                label: function (tooltipItems, data) {
                                    var labelStr = data.datasets[tooltipItems.datasetIndex].label;
                                    var labelVal = tooltipItems.yLabel;
                                    if (labelStr == "패")
                                        labelVal = labelVal * -1;
                                    if (labelStr == "승률")
                                        labelVal = labelVal + "%";
                                    return labelStr + ': ' + labelVal;
                                }
                            }
                        },
                        scales: {
                            yAxes: [{
                                id: 'A',
                                type: 'linear',
                                position: 'left',
                                ticks: {
                                    display: false, maxTicksLimit: 1
                                }
                            }, {
                                id: 'B',
                                type: 'linear',
                                position: 'right',
                                display: false,
                                ticks: {
                                    max: (typeId == "1" ? 6000 : 120),
                                    min: (typeId == "1" ? -1000 : -20)
                                }
                            }]
                        }
                    }
                });
            };

        });
    </script>

    <!-- Overscore -->
    <script src="/js/overscore.js"></script>
    <script src="/js/profile.js"></script>

</body>
</html>
