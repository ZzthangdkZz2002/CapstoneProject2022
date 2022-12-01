<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <style>
        .GHN {
            /* padding-left: 3rem;
            padding-right: 3rem; */
        }

        .row-title {
            margin-left: 16rem;
            color: #f26522;
            margin-top: 1rem;
        }

        .GHN label {
            font-weight: bold;
        }

        .products-info {
            width: 70%;
            display: flex;
            margin-bottom: 1rem;
            padding: 10px;
            margin-left: 14.5rem;
            box-shadow: 0 0 4px rgb(0 0 0 / 25%);
            border-radius: 12px;
        }
        .products-info img{
            height: 4rem;
            width: 4rem;
        }

        .products-info input {
            border: none !important;
            border-bottom: 1px solid #d4d4d4 !important;
            height: 28px !important;
            padding: 5px;
            background-color: transparent !important;
        }
        .products-info div{
        }
        .products-info label{
            font-weight: bold;
        }
        .boder{
            padding: 10px;
        }
    </style>
</head>

<body>
<jsp:include page="header.jsp"/>
<jsp:include page="home-menu.jsp"/>
<!-- bên gửi -->
<h4 class="row-title"> | Bên gửi</h4>
<div class="row GHN justify-content-center">
    <div class="col-4">
        <div class="mb-2">
            <label for="sender-name" class="form-label">Tên cửa hàng/bên gửi</label>
            <input type="text" class="form-control" id="sender-name">
        </div>
        <div class="mb-2">
            <label for="sender-phone" class="form-label">Số điện thoại</label>
            <input type="tel" class="form-control" id="sender-phone">
        </div>
        <div class="mb-2">
            <label for="sender-address" class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" id="sender-address">
        </div>
    </div>
    <div class="col-4">
<%--        <div class="mb-2">--%>
<%--            <label for="sender-district" class="form-label">Quận/Huyện</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="sender-district">--%>
<%--                <option selected>Quận 11 - Hồ Chí Minh</option>--%>
<%--                <option value="1">Quận 12 - Hồ Chí Minh</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="mb-2">--%>
<%--            <label for="sender-wards" class="form-label">Phường/Xã</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="sender-wards">--%>
<%--                <option selected>phường 5</option>--%>
<%--                <option value="1">phường 4</option>--%>
<%--            </select>--%>
<%--        </div>--%>
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>

<!-- bên nhận -->
<h4 class="row-title"> | Bên nhận</h4>
<div class="row GHN justify-content-center">
    <div class="col-4">
        <div class="mb-2">
            <label for="receive-name" class="form-label">Họ tên</label>
            <input type="text" class="form-control" id="receive-name" value="${order.customer.name != null ? order.customer.name : "khách lẻ"}">
        </div>
        <div class="mb-2">
            <label for="receive-phone" class="form-label">Số điện thoại</label>
            <input type="tel" class="form-control" id="receive-phone" value="${order.customer.phone}">
        </div>
        <div class="mb-2">
            <label for="receive-address" class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" id="receive-address" value="${order.customer.address}">
        </div>
    </div>
    <div class="col-4">
        <div class="mb-2">
            <label for="receive-province" class="form-label">Tỉnh/Thành Phố</label>
            <select class="form-select" aria-label="Default select example" id="receive-province">
                <option selected>${order.province}</option>
            </select>
        </div>
        <div class="mb-2">
            <label for="receive-district" class="form-label">Quận/Huyện</label>
            <select class="form-select" aria-label="Default select example" id="receive-district">
                <option selected>${order.district}</option>

            </select>
        </div>
        <div class="mb-2">
            <label for="receive-wards" class="form-label">Phường/Xã</label>
            <select class="form-select" aria-label="Default select example" id="receive-wards">
                <option selected>${order.ward}</option>
            </select>
        </div>
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>



<!-- địa chỉ trả hàng chuyển hoàn -->
<h4 class="row-title"> | Địa chỉ trả hàng chuyển hoàn</h4>
<div class="row GHN justify-content-center">
    <div class="col-4">
        <div class="mb-2">
            <label for="return-name" class="form-label">Họ tên</label>
            <input type="tel" class="form-control" id="return-name">
        </div>
        <div class="mb-2">
            <label for="return-phone" class="form-label">Số điện thoại</label>
            <input type="tel" class="form-control" id="return-phone">
        </div>
        <div class="mb-2">
            <label for="return-address" class="form-label">Địa chỉ</label>
            <input type="text" class="form-control" id="return-address">
        </div>
    </div>
    <div class="col-4">
<%--        <div class="mb-2">--%>
<%--            <label for="return-province" class="form-label">Tỉnh/Thành Phố</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="return-province">--%>
<%--                <option selected>Quận 11 - Hồ Chí Minh</option>--%>
<%--                <option value="1">Quận 12 - Hồ Chí Minh</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="mb-2">--%>
<%--            <label for="return-district" class="form-label">Quận/Huyện</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="return-district">--%>
<%--                <option selected>phường 5</option>--%>
<%--                <option value="1">phường 4</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="mb-2">--%>
<%--            <label for="return-wards" class="form-label">Phường/Xã</label>--%>
<%--            <select class="form-select" aria-label="Default select example" id="return-wards">--%>
<%--                <option selected>phường 5</option>--%>
<%--                <option value="1">phường 4</option>--%>
<%--            </select>--%>
<%--        </div>--%>
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>


<!-- sản phẩm-->
<h4 class="row-title"> | Sản phẩm</h4>
<div class="boder">
    <c:forEach var="item" items="${order.orderTransactionDetails}">
        <div class="products-info justify-content-center">
            <div class="d-flex">
                <label for="product-name" class="form-label">1.</label>
                <input type="text" class="form-control" id="product-name" value="${item.productDTO.name}">
            </div>
            <div class="">
                <input type="text" class="form-control" id="product-code" value="${item.productDTO.code}" >
            </div>
            <div class="d-flex">
                <label for="product-mass" class="form-label">KL (gam)</label>
                <input style="width: 60%;" type="text" class="form-control" id="product-mass" placeholder="g">
            </div>
            <div class="d-flex">
                <label for="product-quantity" class="form-label">SL</label>
                <input type="text" class="form-control" id="product-quantity" value="${item.quantity}">
            </div>
        </div>
    </c:forEach>
</div>

<!-- Thông tin gói hàng-->
<h4 class="row-title"> | Thông tin gói hàng</h4>
<div class="boder">
    <div class="products-info justify-content-center">
        <img src="https://bizweb.dktcdn.net/100/307/433/articles/87126502-2509242206005371-2073523065622364160-n.jpg?v=1627806241047" alt="">
        <div class="d-flex">
            <label for="product-name" class="form-label">Tổng KL(gam)</label>
            <input style="width: 60%;" type="text" class="form-control" id="total-mass">
        </div>
        <div class="d-flex">
            <label for="product-mass" class="form-label">Dài</label>
            <input type="text" class="form-control" id="product-length">
        </div>
        <div class="d-flex">
            <label for="product-mass" class="form-label">Rộng</label>
            <input  type="text" class="form-control" id="product-width" >
        </div>
        <div class="d-flex">
            <label for="product-quantity" class="form-label">Cao</label>
            <input type="text" class="form-control" id="product-height">
        </div>
    </div>

</div>
<div class="row justify-content-center">
    <div class="col-md-4">
        <div class="d-flex justify-content-between">
            <p>Tổng tiền thu hộ COD</p>
        </div>
        <input type="number" class="form-control" id="cod-amount" value="${order.isPaid eq 'true' ? "0" : order.amount}">
    </div>
    <div class="col-md-4">
        <div class="d-flex justify-content-between">
            <p>Tổng giá trị hàng hoá</p>
        </div>
        <input type="number" class="form-control" id="total-value" value="${order.amount}">
    </div>
    <div class="col-8">
        <hr>
    </div>
</div>


<!-- Lưu ý - Ghi chú-->
<h4 class="row-title"> | Lưu ý - Ghi chú</h4>
<div class="row justify-content-center">
    <div class="col-md-4">
        <p>Lưu ý giao hàng</p>
        <select class="form-select" aria-label="Default select example" id="ship-note">
            <option selected value="KHONGCHOXEMHANG">Không cho xem hàng</option>
            <option value="CHOXEMHANGKHONGTHU">Cho xem hàng không cho thử</option>
            <option value="CHOTHUHANG">cho thử hàng</option>
        </select>
        <p style="margin-top: 1rem;">Thêm mã đơn khách hàng </p>
        <input type="number" class="form-control" id="order-id" value="${order.orderid}" readonly>
    </div>
    <div class="col-md-4">
        <div class="d-flex justify-content-between">
            <p>Ghi chú</p>
        </div>
        <textarea class="form-control" id="note" style="height: 130px"></textarea>
    </div>
    <button type="button" class="btn-primary" onclick="giaohangnhanh('${order.id}')">Lên Đơn Hàng</button>
</div>

<script src="${pageContext.request.contextPath}/js/orderGHN.js"></script>
</body>

</html>