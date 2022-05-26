<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/feedback">
    <link href="/css/plugins/bootstrapSocial/bootstrap-social.css" rel="stylesheet">
    <style>
        .heroes .mask {
            display: inline-block;
            position: relative;
            width: 100px;
            height: 150px;
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
            margin-left: -3px;
            position: relative;
            background-size: auto 150%;
            background-position: -30% 50%;
            transform: skew(-25rad) translateX(-5px);

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
            <div class="col-lg-4 col-lg-push-4 col-md-6 col-md-push-3">
                <div class="widget-head-color-box navy-bg p-lg text-center heroes">
                    <div class="m-b-md">
                        <h2 class="font-bold no-margins">
                            REDIPS
                        </h2>
                        <small>developer</small>
                    </div>

                    <div class="mask">
                        <div class="hero"
                             style="background-image: url('https://s-media-cache-ak0.pinimg.com/originals/bc/0f/14/bc0f14499d380dea3634b3350a8360f2.jpg');"></div>
                    </div>

                    <div class="m-t-md">
                        <span>개발자</span> |
                        <span>고양이 집사</span>
                    </div>
                </div>
                <div class="widget-text-box">
                    <h4 class="media-heading">Feedback</h4>
                    <div>
                        버그를 발견하셨거나 <br class="br-s-break"/>제안사항이 있으시다면 <br class="br-break"/> 아래로 보내주세요 :)
                    </div>
                    <br/>
                    <div class="text-right" style="margin-top:5px;">
                        <a href="mailto:redips@prismweaver.com" class="btn btn-xs btn-white"><i
                                style="margin-right:3px;" class="fa fa-envelope"></i>E-mail</a>
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

                </div>
            </div>
        </div>
        <jsp:include page="common/footer.jsp"></jsp:include>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="js/inspinia.js"></script>

<!-- jQuery UI -->
<script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

<!-- Overscore -->
<script src="/js/overscore.js"></script>

</body>
</html>