<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Order</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body{
            background-color: #eee;
        }
    </style>
</head>
<body>
<h3 class="text-center mt-3">Đặt hàng thành công</h3>
<div class="payment mt-1">
    <div class="mx-auto" style="background-color: white; width: 40%;padding: 30px;">
        <p>Đơn hàng của bạn đã đặt thành công</p>
        <div class="d-flex justify-content-between">
            <p class="fw-bold ">Mã đơn hàng:</p>
            <p class="fw-bold ">#${transaction.orderid}</p>
        </div>
        <div class="d-flex justify-content-between">
            <p class="fw-bold ">Ngày tạo:</p>
            <p>${transaction.created}</p>
        </div>
        <p class="fw-bold  text-danger">Thông tin đơn hàng:</p>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th scope="col">Sản phẩm</th>
                <th scope="col">Số lượng</th>
                <th scope="col">Giá</th>
                <th scope="col">Tổng</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${transactionDetail}" var="trans">
                <tr>
                    <td scope="row"><a href="${pageContext.request.contextPath}/homepage/detailProduct?id=${trans.id}" style="text-decoration: none;">${trans.name}</a></td>
                    <td>${trans.quantity}</td>
                    <td class="text-right">${trans.price}</td>
                    <td class="text-right">${trans.price * trans.quantity}</td>
                </tr>
            </c:forEach>
            <tr>
                <th colspan="3">Giao nhận hàng</th>
                <td class="text-right">0</td>
            </tr>
            <tr>
                <th colspan="3">Tổng cộng :</th>
                <th class="text-right">${transaction.amount}</th>
            </tr>
            </tbody>
        </table>
        <div class="d-flex justify-content-between">
            <p class="fw-bold ">Phương thức thanh toán:</p>
            <p>${transaction.payment_method}</p>
        </div>
        <div class="d-flex justify-content-between">
            <p class="fw-bold ">Trạng thái thanh toán:</p>
            <p class="fw-bold  text-danger">${ordermessage}</p>
        </div>
        <div class="d-flex justify-content-between">
            <p class="fw-bold ">Vận chuyển:</p>
            <p>Giao hàng nhanh</p>
        </div>
        <a  class="btn btn-primary btn-lg btn-block btn-confirm-order w-100 " data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="fa-solid fa-arrow-right me-2 "

        ></i>Xem chi tiết đơn hàng</a>
        <div class="collapse" id="collapseExample" >
            <div class="card card-body" style="border: none; border-radius:none;padding:0px;margin-top: 20px;">
                <p class="fw-bold  text-danger" >Thông tin khách hàng:</p>
                <div class="d-flex justify-content-between">
                    <p class="fw-bold ">Điện thoại:</p>
                    <p>${transaction.user_phone}</p>
                </div>
                <div class="d-flex justify-content-between">
                    <p class="fw-bold ">Họ tên:</p>
                    <p>${transaction.user_name}</p>
                </div>
                <div class="d-flex justify-content-between">
                    <p class="fw-bold ">Email:</p>
                    <p>${transaction.user_email}</p>
                </div>
                <div class="d-flex justify-content-between">
                    <p class="fw-bold ">Địa chỉ:</p>
                    <p>${transaction.address}</p>
                </div>
                <a href="${pageContext.request.contextPath}/homepage"class="btn btn-primary btn me-2"><i class="fa-solid fa-rotate-left me-2"></i>Quay lại trang chủ</a>
            </div>
        </div >
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets_onlinepage/js/confirmOrder.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>