<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>

<head>
    <jsp:include page="common/header.jsp"></jsp:include>
</head>

<body>
<div id="wrapper">
    <jsp:include page="common/menu.jsp"></jsp:include>

    <div id="page-wrapper" class="gray-bg dashbard-1">
        <jsp:include page="common/nav.jsp"></jsp:include>
        <div class="row  border-bottom white-bg dashboard-header">
            news
        </div>
        <jsp:include page="common/footer.jsp"></jsp:include>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- jQuery UI -->
<script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>

</body>
</html>