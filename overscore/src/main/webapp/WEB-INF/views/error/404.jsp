<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Overscore | 404 Error</title>

    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link href="/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/css/animate.css" rel="stylesheet">
    <link href="/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">


<div class="middle-box text-center animated fadeInDown">
    <h1>404</h1>
    <h3 class="font-bold">페이지를 찾을 수 없습니다</h3>

    <div class="error-desc">
        요청하신 페이지를 찾을 수 없습니다.<br/>
    </div>
    <div class="error-desc m-t">
        <a href="mailto:redips@prismweaver.com" class="btn btn-xs btn-white"><i style="margin-right:3px;"
                                                                                class="fa fa-envelope"></i>E-mail</a>
        <a style="background-color:#3b5998;color:white" href="https://www.facebook.com/overscore.kr"
           class="btn btn-xs btn-white">
            <i style="margin-right:5px;" class="fa fa-facebook">
            </i>페이스북
        </a>
        <a style="background-color:#1da1f2;color:white" href="https://twitter.com/redips_dev"
           class="btn btn-xs btn-white">
            <i style="margin-right:5px;" class="fa fa-twitter">
            </i>트위터
        </a>
    </div>
    <div class="error-desc">
        <a href="/index" class="btn btn-primary m-t">메인으로</a>
    </div>
</div>

<!-- Mainly scripts -->
<script src="/js/jquery-3.1.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>

    var param = [{
        name: 'url',
        value: window.location
    }];

    $.ajax({
        type: "POST",
        url: "/error",
        data: param,
        cache: false,
        async: false,
        success: function (data) {

        },
        error: function () {

        }
    });
</script>

</body>

</html>
