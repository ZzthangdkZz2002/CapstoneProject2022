<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        .btn-continue {
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
</head>

<body>
<jsp:include page="header.jsp"/>
<div class="d1 step1">
    <img src="https://www.thegioididong.com/lich-su-mua-hang/images/i1.png">
    <span>Tra cứu thông tin đơn hàng</span>
    <form id="frmGetVerifyCode">
        <input type="tel" name="txtPhoneNumber" id="txtPhoneNumber" placeholder="Nhập số điện thoại mua hàng"
               autocomplete="off" maxlength="10">
        <label class="hide"></label>
        <button type="button" class="btn-continue" onclick="sendOtp()">Tiếp tục</button>
    </form>
<%--    <form method="GET" action="/tracking/test">--%>
<%--        <button type="submit" class="btn-continue" >Test</button>--%>
<%--    </form>--%>
</div>
</body>



</html>