<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/bootstrap.min.css">

    <!-- Customizable CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/main.css">
    <%--    <link href="<c:url value="assets_onlinepage/css/main.css"/>" rel="stylesheet" type="text/css">--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/owl.carousel.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/owl.transitions.css">
    <!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
    <link href="${pageContext.request.contextPath}/assets_onlinepage/css/lightbox.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/animate.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/bootstrap-select.min.css">

    <!-- Demo Purpose Only. Should be removed in production -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets_onlinepage/css/config.css">

    <link href="${pageContext.request.contextPath}/assets_onlinepage/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">


    <!-- Icons/Glyphs -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

    <!-- Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>


    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets_onlinepage/images/favicon.ico">


    <style>
        .step1 {
            margin: 3% auto;
            max-width: 500px;
            border: 1px solid #ccc;
            padding: 25px 0;
            background-color: #fff;
        }
        img {
            max-width: 100%;
            background: none;
            height: auto;
            border: 0;
        }
        .d1>* {
            display: block;
            margin-bottom: 25px;
        }
        div>span {
            font-size: 20px;
            font-weight: normal;
            line-height: 1.5;
            text-align: center;
        }
        form>input {
            background-image: url(https://cdn.tgdd.vn/mwgcart/orderhistory/images/icon-phone-blue.png);
            background-size: 14px 21px;
        }
        form>input {
            border: 1px solid #e0e0e0;
            border-radius: 100px;
            width: 200px;
            height: 48px;
            padding: 0 50px;
            background-repeat: no-repeat;
            background-position: 25px center;
            margin-bottom: 15px;
            font-size: 15px;
        }
        div>form>* {
            display: block;
            margin: auto;
            font-family: ROBOTO LIGHT;
        }
        .continues-btn {
            background-image: linear-gradient(-106deg, #51beed 2%, #288ad6 100%);
            box-shadow: 0 2px 6px 0 #9ed4ec;
            border-radius: 100px;
            width: 302px;
            height: 50px;
            border: none;
            text-transform: uppercase;
            color: #fff;
            font-size: 17px;
            max-width: 100%;
            cursor: pointer;
            margin-top: 15px;
        }
    </style>


    <!-- ============================================== TOP MENU : END ============================================== -->
    <div class="main-header">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
                    <!-- ============================================================= LOGO ============================================================= -->
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/homepage">

                            <img src="${pageContext.request.contextPath}/assets_onlinepage/images/logo.png" alt="">

                        </a>
                    </div><!-- /.logo -->
                    <!-- ============================================================= LOGO : END ============================================================= -->
                </div><!-- /.logo-holder -->

                <div class="col-xs-12 col-sm-12 col-md-6 top-search-holder">
                    <div class="search-area" style="position: absolute;">
                        <form>
                            <div class="control-group">
                                <input class="search-field" id="btnProductSearch" type="text" name="ProductSearch"
                                       placeholder="Search here..." />
                                <a class="search-button" href="#"></a>
                            </div>
                        </form>
                    </div><!-- /.search-area -->
                    <!-- ============================================================= SEARCH AREA : END ============================================================= -->
                </div><!-- /.top-search-holder -->

                <div class="col-xs-12 col-sm-12 col-md-3 animate-dropdown top-cart-row" style="display: flex; justify-content: right">
                    <!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->

                    <c:set var="username" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}"/>

                    <%--                    giỏ hàng--%>
                    <div class="dropdown dropdown-cart" style="">
                        <a href="${pageContext.request.contextPath}/homepage/cart" class="dropdown-toggle lnk-cart">
                            <div class="items-cart-inner">
                                <div class="basket">
                                    <i class="glyphicon glyphicon-shopping-cart" style="font-size: 15px"></i>
                                    <span style="font-size: 15px">Giỏ hàng</span>
                                </div>
                                <div class="basket-item-count"><span class="count">0</span></div>
                            </div>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="cart-item product-summary">
                                    <div class="row">
                                        <div class="col-xs-4">
                                            <div class="image">
                                                <a href="detail.html"><img src="assets/images/cart.jpg" alt=""></a>
                                            </div>
                                        </div>
                                        <div class="col-xs-7">

                                            <h3 class="name"><a href="index.php?page-detail">Simple Product</a></h3>
                                            <div class="price">$600.00</div>
                                        </div>
                                        <div class="col-xs-1 action">
                                            <a href="#"><i class="fa fa-trash"></i></a>
                                        </div>
                                    </div>
                                </div><!-- /.cart-item -->
                                <div class="clearfix"></div>
                                <hr>

                                <div class="clearfix cart-total">
                                    <div class="pull-right">

                                        <span class="text">Sub Total :</span><span class='price'>$600.00</span>

                                    </div>
                                    <div class="clearfix"></div>

                                    <a href="checkout.html"
                                       class="btn btn-upper btn-primary btn-block m-t-20">Checkout</a>
                                </div><!-- /.cart-total-->


                            </li>
                        </ul>
                    </div>

                    <%--                    tài khoản--%>
                    <div style="margin-left: 20px">
                        <c:choose>
                            <c:when test = "${username == null}">
                                <%--                                <div id="avatar_icon">--%>
                                <%--                                    <a href="${pageContext.request.contextPath}/signin"><i class="material-icons"></i></a><a href="${pageContext.request.contextPath}/signin">Đăng nhập</a> / <a href="${pageContext.request.contextPath}/signup">Đăng ký</a>--%>
                                <%--                                </div>--%>
                                <%--                                <div>--%>
                                <%--                                    <a href="${pageContext.request.contextPath}/tracking/trackingOrder">Lịch sử đơn hàng</a>--%>
                                <%--                                </div>--%>
                                <div class="dropdown">
                                    <button class="dropdown-toggle" data-hover ="dropdown" style="padding: 15px 13px; border: none; font-size: 15px"><i class="icon fa fa-user" style="margin-right: 3px"></i>Tài khoản</button>
                                    <ul class="dropdown-menu">
                                        <li><a href="${pageContext.request.contextPath}/signin" style="color: black;">Đăng nhập</a></li>
                                        <li><a href="${pageContext.request.contextPath}/signup" style="color: black;">Đăng kí</a></li>
                                        <li><a href="${pageContext.request.contextPath}/tracking/trackingOrder" style="color: black;">Lịch sử đơn hàng</a></li>
                                    </ul>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown">
                                    <button class="dropdown-toggle" data-hover ="dropdown" style="padding: 15px 13px; border: none; font-size: 15px"><i class="icon fa fa-user" style="margin-right: 3px; font-size: 15px"></i>${username}</button>
                                    <ul class="dropdown-menu">
                                        <li><a href="${pageContext.request.contextPath}/profile" style="color: black;">Tài khoản của tôi</a></li>
                                        <li><a href="${pageContext.request.contextPath}/order" style="color: black;">Đơn hàng của tôi</a></li>
                                        <li><a href="${pageContext.request.contextPath}/sign-out" style="color: black;">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                </div>

            </div>

        </div>

        <div class="header-nav animate-dropdown">
            <div class="container">
                <div class="yamm navbar navbar-default" role="navigation">
                    <div class="navbar-header">
                        <button data-target="#mc-horizontal-menu-collapse" data-toggle="collapse"
                                class="navbar-toggle collapsed" type="button">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="nav-bg-class">
                        <div class="navbar-collapse collapse" id="mc-horizontal-menu-collapse">
                            <div class="nav-outer">
                                <ul class="nav navbar-nav">
                                    <li class="active dropdown yamm-fw">
                                        <a href="${pageContext.request.contextPath}/homepage" data-hover="dropdown" class="dropdown-toggle">Home</a>

                                    </li>
                                    <li class="dropdown yamm">
                                        <a href="home.html" data-hover="dropdown"
                                           class="dropdown-toggle">Desktop</a>
                                    </li>

                                    <li class="dropdown">
                                        <a href="contact.html">Contact</a>
                                    </li>

                                    <li class="dropdown navbar-right">
                                        <a href="#" class="dropdown-toggle" data-hover="dropdown">Pages</a>

                                    </li>

                                </ul>
                                <div class="clearfix"></div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

        </div>

    </div>


    <%--    <div class="modal fade" id="orderHistoryModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"--%>
    <%--         data-backdrop="static" data-keyboard="false">--%>
    <%--        <div class="modal-dialog modal-dialog-centered" role="document">--%>
    <%--            <div class="modal-content">--%>
    <%--                <div class="modal-body">--%>
    <%--                    <div class="row">--%>
    <%--                        <div class="d1 step1">--%>
    <%--                            <img src="https://www.thegioididong.com/lich-su-mua-hang/images/i1.png">--%>
    <%--                            <span>Tra cứu thông tin đơn hàng</span>--%>
    <%--                            <form id="frmGetVerifyCode">--%>
    <%--                                <input type="tel" name="txtPhoneNumber" id="txtPhoneNumber" placeholder="Nhập số điện thoại mua hàng"--%>
    <%--                                       autocomplete="off" maxlength="12">--%>
    <%--                                <label class="hide"></label>--%>
    <%--                                <button type="button" class="continues-btn" onclick="sendOtp()" c>Tiếp tục</button>--%>
    <%--                                <button class="continues-btn" data-dismiss="modal" href="#">Hủy bỏ</button>--%>
    <%--                            </form>--%>
    <%--                        </div>--%>
    <%--                </div>--%>
    <%--                <div class="modal-footer">--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </div>--%>

    <%--        <div class="modal fade" id="formInputOtpModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"--%>
    <%--             data-backdrop="static" data-keyboard="false">--%>
    <%--            <div class="modal-dialog modal-dialog-centered" role="document">--%>
    <%--                <div class="modal-content">--%>
    <%--                    <div class="modal-body">--%>
    <%--                        <div class="row">--%>
    <%--                            <div class="d2 step2">--%>
    <%--                                <span class="s1">Mã xác nhận đã được gửi đến số điện thoại <b>0961990712</b></span>--%>
    <%--                                <span class="s2 hide">Mã xác nhận đã được gửi lại</span>--%>
    <%--                                <form id="formInputOtp">--%>
    <%--                                    <input type="number" name="txtOTP" id="txtOTP" placeholder="Nhập mã xác nhận gồm 4 chữ số" maxlength="6"--%>
    <%--                                           autocomplete="one-time-code">--%>
    <%--                                    <label class="hide"></label>--%>
    <%--                                    <button type="button" class="btn-inputotp">Tiếp tục</button>--%>
    <%--                                    <button class="continues-btn" data-dismiss="modal" href="#">Hủy bỏ</button>--%>
    <%--                                </form>--%>
    <%--                                <a class="resend-sms" href="javascript:GetVerifyCode(1, 1)">Tôi không nhận được mã, vui lòng gửi lại</a>--%>

    <%--                                <a href="javascript:void(0)" onclick="changeNum()" class="btnChangeNum">Thay đổi số điện thoại</a>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <div class="modal-footer">--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>

    <script>var contextPath = "${pageContext.request.contextPath}"</script>

    <script src="${pageContext.request.contextPath}/assets_onlinepage/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets_onlinepage/js/header.js"></script>
    <script src="${pageContext.request.contextPath}/assets_onlinepage/js/common.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <%--<script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>--%>







</header>