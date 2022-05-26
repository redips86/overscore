<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<div class="sk-spinner sk-spinner-wave">
    <div class="sk-rect1"></div>
    <div class="sk-rect2"></div>
    <div class="sk-rect3"></div>
    <div class="sk-rect4"></div>
    <div class="sk-rect5"></div>
</div>
<div class="row border-bottom">
    <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
            <div class="search-form" style="margin-right: 13px;">

                <div class="input-group">
                    <input id="txtName" type="text" maxlength="20"
                           placeholder=" 배틀태그를 입력해주세요" name="name" class="form-control">
                    <div class="input-group-btn">
                        <button id="btnSearch" class="btn btn-primary" type="button">
                            검색
                        </button>
                    </div>
                    <div class="input-group-btn">
                        <form action="/auth/step1" method="post">
                            <button type="submit" class="btn btn-success">배틀넷</button>
                            <!-- style="background-image:url(http://kr.battle.net/static/images/nav-client/logo-bnet-compact.png);
                                background-repeat: no-repeat;
                               padding-left: 0px;
                               background-position: 0% 87%;" -->

                        </form>
                    </div>
                </div>

            </div>
        </div>
    </nav>
</div>