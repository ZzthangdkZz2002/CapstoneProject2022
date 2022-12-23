<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
    .d2 {
        margin-top: 100px;
        margin: 3% auto;
        max-width: 500px;
        border: 1px solid #ccc;
        padding: 25px 0;
        background-color: #fff;
        text-align: center;
    }

    div.d2>span {
        width: 300px;
        margin-left: auto;
        margin-right: auto;
        font-size: 22px;
    }

    .d2>span {
        font-size: 20px;
        font-weight: normal;
        line-height: 1.5;
    }


    .hide {
        display: none !important;
    }

    .d2>form>input {
        background-image: url(https://cdn.tgdd.vn/mwgcart/orderhistory/images/icon-lock.png);
        background-size: 16px 17px;
        padding: 0 45px;
        width: 220px;
        background-position: 20px center;
        text-align: center;
    }

    .d2>form>input {
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

    .d2>label {
        color: #f01;
        margin-bottom: 15px;
        width: 90%;
    }

    .btn-verifyotp {
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
        margin-top: 10px;
    }

    /*div>a {*/
    /*    font-size: 14px;*/
    /*    color: #666;*/
    /*    font-weight: bold;*/
    /*    text-decoration: none;*/
    /*    transition: .2s;*/
    /*}*/

    div>a.btnChangeNum {
        font-size: 13px;
        color: #288ad6;
        font-weight: normal;
    }
</style>

<body>
<jsp:include page="header.jsp"/>
<div class="d2 step2">
    <span class="s1">Mã xác nhận đã được gửi đến số điện thoại <b>${phone}</b></span>
    <span class="s2 hide">Mã xác nhận đã được gửi lại</span>
    <form id="frmSubmitVerifyCode" method="POST" action="/tracking/verifyOtp?phone=${phone}" style="margin-top: 15px">
        <input type="number" name="txtOTP" placeholder="Nhập mã xác nhận gồm 6 chữ số" maxlength="6"
               autocomplete="one-time-code">
        <label>${wrongOtp != null ? wrongOtp : ""}</label>
        <button type="submit" class="btn-verifyotp">Tiếp tục</button>
    </form>
<%--    <a class="resend-sms" href="javascript:GetVerifyCode(1, 1)">Tôi không nhận được mã, vui lòng gửi lại</a>--%>

<%--    <a href="javascript:void(0)" onclick="changeNum()" class="btnChangeNum">Thay đổi số điện thoại</a>--%>
</div>
<jsp:include page="footer.jsp"></jsp:include>

<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap-hover-dropdown.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/echo.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/jquery.easing-1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap-slider.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/jquery.rateit.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets_onlinepage/js/lightbox.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap-select.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/wow.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/scripts.js"></script>
</body>

</html>

