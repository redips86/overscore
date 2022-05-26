<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <jsp:include page="../common/header.jsp"></jsp:include>
    <link rel="canonical" href="http://overscore.kr/board">

    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <style>
        table tr th, table tr td {
            text-align: center;
            vertical-align: middle;
        }

        table a {
            color: #96999a;
        }

    </style>

</head>

<body>
<div id="wrapper">
    <jsp:include page="../common/menu.jsp"></jsp:include>

    <div id="page-wrapper" class="gray-bg">
        <jsp:include page="../common/nav.jsp"></jsp:include>
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title" id='boardName'>

                    </div>
                    <div class="ibox-content">

                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th width='5%'>번호</th>
                                <th width='5%'>분류</th>
                                <th width='65%'>제목</th>
                                <th width='10%'>글쓴이</th>
                                <th width='5%'>날짜</th>
                                <th width='5%'>조회수</th>
                                <th width='5%'>추천</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class='listId'>1</td>
                                <td class='listCategory'>잡담</td>
                                <td class='listSubject'>
                                    <a href='/board/list?bid=1&lid=1'>
                                        안녕하세요
                                    </a>
                                </td>
                                <td class='listOprt'>redips</td>
                                <td class='listDate'>07-03</td>
                                <td class='listView'>344</td>
                                <td class='listRec'>2</td>
                            </tr>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"></jsp:include>
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

<!-- React.js -->
<script crossorigin src="https://unpkg.com/react@16/umd/react.production.min.js"></script>
<script crossorigin src="https://unpkg.com/react-dom@16/umd/react-dom.production.min.js"></script>

<!-- Overscore -->
<script src="/js/overscore.js"></script>
<script type="text/jsx" src="/js/board/list.js"></script>

</body>
</html>