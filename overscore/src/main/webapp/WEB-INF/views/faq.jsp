<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <jsp:include page="common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/faq">

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>

<body>
<div id="wrapper">
    <jsp:include page="common/menu.jsp"></jsp:include>

    <div id="page-wrapper" class="gray-bg">
        <jsp:include page="common/nav.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content animated fadeInRight">

                    <div class="ibox-content m-b-sm border-bottom">
                        <div class="text-center p-lg">
                            <h2>그 외의 궁금하신 점이 있다면? </h2>
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

                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-12">
                                <a data-toggle="collapse" href="#faq1" class="faq-question">오버스코어란 무엇인가요?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq1" class="panel-collapse collapse ">
                                    <div class="faq-answer">
                                        <p>
                                            오버스코어는 "내 경쟁전 점수를 영웅별로 표기할 수 있으면 재밌지 않을까?" 라는 단순한 생각에서 개발한 사이트입니다. <br/>
                                            기본적인 오버워치 전적검색 사이트임은 물론이며 <br/>
                                            자신의 플레이 스타일을 다른 플레이어와 객관적인 데이터를 가지고 <br/>
                                            비교해 나의 진짜 모스트 영웅을 찾도록 도와드립니다.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-12">
                                <a data-toggle="collapse" href="#faq2" class="faq-question">왜 제 스탯의 점수가 더 높은데 상대방보다
                                    가상점수가 낮게 나오나요?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq2" class="panel-collapse collapse">
                                    <div class="faq-answer">
                                        <p>
                                            가상점수는 자신의 현재 경쟁전 점수를 토대로 계산되는데 상대방과의 경쟁전 점수와 너무 차이가 나기 때문입니다. <br/>
                                            이러한 일이 일어나는 원인은 스탯이 압도적이라도 내 경쟁전 점수가 너무 낮아 점수차를 좁히기 힘들었기 때문입니다. <br/> <br/>
                                            예를 들어 A유저 : 브론즈 K/D 8, B유저: 그랜드마스터 K/D 2의 유저가 있습니다. <br/>
                                            이 경우 스탯은 A유저가 압도적이지만 B유저보다 더 잘한다고 할 수는 없다는 것이죠.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-7">
                                <a data-toggle="collapse" href="#faq3" class="faq-question">상세 비교의 준 피해가 상대방보다 높은데도 왜
                                    스탯이 낮게 나오나요?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq3" class="panel-collapse collapse">
                                    <div class="faq-answer">
                                        <p>
                                            오버스코어의 모든 기준은 '게임당 평균'이 아닌 '목숨당 평균'입니다. <br/>
                                            예를 들어 쟁탈맵에서 A유저가 3:0스코어로 딜 2만. B유저가 3:2스코어로 7만 딜을 했다고 가정해본다면 <br/>
                                            '게임당' 기준으로는 B유저가 A유저보다 압도적으로 잘했다고 할 수 있지만 실제로는 그렇지 않습니다. <br/> <br/>
                                            기존 전적들은 '게임당'을 기준으로 삼지만 오버스코어는 모든 기준을 '목숨당'으로 환산합니다. <br/>
                                            즉, "내가 한 목숨으로 게임에 기여하는 값"을 통계에 사용하고 있기 때문에 생기는 현상입니다. <br/>
                                            *이러한 관점에서 승률은 가상점수의 기준으로 삼지 않습니다.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="faq-item">
                        <div class="row">
                            <div class="col-md-12">
                                <a data-toggle="collapse" href="#faq4" class="faq-question">캐리의 기준이 뭔가요?</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div id="faq4" class="panel-collapse collapse">
                                    <div class="faq-answer">
                                        <p>
                                            캐리는 다양한 요소로 결정됩니다. <br/>
                                            기본적으로 궁극기 여부지만 다른 스킬활용이 '캐리력'에 영향을 준다면 그 부분이 가감됩니다. <br/>
                                            위도우의 경우 궁극기를 자주 켠다고 캐리력이 있다고 생각하지 않아 아예 제거한 부분도 있습니다. <br/> <br/>
                                            프로필 하단으로 내려보시면 각 점수의 기준이 되는 수치들이 있습니다. <br/>
                                            확인을 부탁드립니다!
                                        </p>
                                    </div>
                                </div>
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

</body>
</html>