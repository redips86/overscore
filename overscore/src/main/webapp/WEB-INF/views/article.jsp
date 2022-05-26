<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/profile?userId=${MySummary.userId}">
    <!-- Bootstrap Tour -->
    <link href="/css/plugins/bootstrapTour/bootstrap-tour.min.css" rel="stylesheet">

</head>
<body>
<div id="wrapper" style="min-width:320px;">
    <jsp:include page="common/menu.jsp"></jsp:include>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="common/nav.jsp"></jsp:include>

        <c:forEach var="Article" items="${Article}" varStatus="status">


        <div class="wrapper wrapper-content  animated fadeInRight article">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="ibox">
                        <div class="ibox-content">
                            <!--
                                <div class="pull-right">
                                    <button class="btn btn-white btn-xs" type="button">Model</button>
                                    <button class="btn btn-white btn-xs" type="button">Publishing</button>
                                    <button class="btn btn-white btn-xs" type="button">Modern</button>
                                </div>
                            -->
                            <div class="text-center article-title">
                                <span class="text-muted"><i class="fa fa-clock-o"></i> ${Article.insDate}</span>
                                <h1>
                                        ${Article.articleTitle}
                                </h1>
                            </div>

                                ${Article.articleContent}

                            <hr>
                            <div class="row">
                                <div class="col-md-6">
                                    <h5>Tags:</h5>
                                    <span class="btn btn-primary btn-xs">Overwatch</span>
                                    <span class="btn btn-white btn-xs">Overscroe</span>
                                </div>

                                <div class="col-md-6">
                                    <div class="small text-right">
                                        <!--
                                        <h5>Stats:</h5>
                                        <div> <i class="fa fa-comments-o"> </i> 56 comments </div>
                                        <i class="fa fa-eye"> </i> 144 views
                                        -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            </c:forEach>
        </div>
    </div>
</div>
hello
<!-- Mainly scripts -->
<script src="/js/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="/js/inspinia.js"></script>
<script src="/js/plugins/pace/pace.min.js"></script>

<!-- Overscore -->
<script src="/js/overscore.js"></script>

<!-- Bootstrap Tour -->
<script src="/js/plugins/bootstrapTour/bootstrap-tour.min.js"></script>
</body>
</html>