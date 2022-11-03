<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <style>
        img {
            width: 80px;
            height: 80px;
        }
        .navbar{
            justify-content: normal;
        }
        .navbar-nav{
            flex-direction: row;
        }
    </style>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container" style="margin-top: 1rem">
    <table class="table table-hover mt-3">
        <thead>
        <tr>
            <th scope="col">Sản phẩm</th>
            <th scope="col">Tên Sản phẩm</th>
            <th scope="col">Đơn giá</th>
            <th scope="col" class="text-center">Số lượng</th>
            <th scope="col">Thành tiền</th>
            <th scope="col">Xóa</th>
        </tr>
        </thead>
        <tbody class="shopping-cart">
        <!-- LIST CART IN HERE -->


        </tbody>
    </table>
    <div class="total d-flex justify-content-end">
        <p class="fw-bold" style="font-size: 2rem;">Tổng tiền: </p>
        <p class="total-order ms-2 text-primary" style="font-size: 2rem;">0</p>
    </div>
    <div class="d-flex justify-content-between">
        <a href="${pageContext.request.contextPath}/homepage"class="btn btn-light btn-lg me-2"><i class="fa-solid fa-rotate-left mr-1" role="button"></i>Tiếp tục
            mua hàng</a>
        <a href="${pageContext.request.contextPath}/homepage/checkout" style="color: white;" class="btn btn-success btn-lg" role="button">Tiếp tục</a>
    </div>
</div>
<script>var contextPath = "${pageContext.request.contextPath}"</script>
<!-- Cart JS -->
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/showCart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>