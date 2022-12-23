<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <title>Order Tracking</title>

    <style>
        .gradient-custom {
            /* fallback for old browsers */
            background: #ccc;

            /*!* Chrome 10-25, Safari 5.1-6 *!*/
            /*background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));*/

            /*!* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ *!*/
            /*background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1))*/
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

<section class="h-100 gradient-custom">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-10 col-xl-8">
                <div class="card" style="border-radius: 10px;">
                    <div class="card-header px-4 py-5">
                        <h5 class="text-muted mb-0">Cảm ơn bạn đã mua hàng, <span style="color: #a8729a;">${phone}</span>!</h5>
                    </div>


                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <p class="lead fw-normal mb-0" style="color: #a8729a;">Danh sách đơn hàng</p>
                        </div>
                        <c:forEach var="order" items="${orders}">
                            <div class="card shadow-0 border mb-4">
                                <div class="d-flex justify-content-between pt-2">
                                    <p class="fw-bold mb-0">Chi tiết đơn hàng</p>
                                </div>

                                <div class="d-flex justify-content-between pt-2">
                                    <p class="text-muted mb-0">Mã đơn hàng : #${order.orderid}</p>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <p class="text-muted mb-0">Ngày tạo : ${order.created}</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p class="text-muted mb-0">Tổng tiền hàng : ${order.amount}</p>
                                </div>
                                <c:forEach var="item" items="${order.orderTransactionDetails}">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-2">
                                                <img src="${pageContext.request.contextPath}/img/${item.productDTO.image}"
                                                     class="img-fluid" alt="error">
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0">${item.productDTO.name}</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">${item.quantity}</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">${item.productDTO.price}</p>
                                            </div>
                                            <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                <p class="text-muted mb-0 small">Thành tiền: ${item.amount}</p>
                                            </div>
                                        </div>
                                        <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                    </div>
                                </c:forEach>

                                <div class="row d-flex align-items-center">
                                    <div class="col-md-2">
                                        <p class="mb-0" style="font-size: 110%">Tình trạng: <span style="color: ${order.status =="Đã Hủy" ? "red" : order.status =="Chờ Xử Lý" ? "#E1DB0A" : "green"}">${order.status}</span></p>
                                    </div>
                                    <c:if test="${order.status == 'Chờ Xử Lý'}">
                                        <div class="col-md-10" style="margin-top: 10px">
                                            <div class="progress" style="height: 6px; border-radius: 16px;">
                                                <div class="progress-bar" role="progressbar"
                                                     style="width: 25%; border-radius: 16px; background-color: #a8729a;" aria-valuenow="65"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${order.status == 'Đã Xác Nhận'}">
                                        <div class="col-md-10" style="margin-top: 10px">
                                            <div class="progress" style="height: 6px; border-radius: 16px;">
                                                <div class="progress-bar" role="progressbar"
                                                     style="width: 50%; border-radius: 16px; background-color: #a8729a;" aria-valuenow="65"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${order.status == 'Đang giao hàng'}">
                                        <div class="col-md-10" style="margin-top: 10px">
                                            <div class="progress" style="height: 6px; border-radius: 16px;">
                                                <div class="progress-bar" role="progressbar"
                                                     style="width: 75%; border-radius: 16px; background-color: #a8729a;" aria-valuenow="65"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${order.status == 'Hoàn Thành'}">
                                        <div class="col-md-10" style="margin-top: 10px">
                                            <div class="progress" style="height: 6px; border-radius: 16px;">
                                                <div class="progress-bar" role="progressbar"
                                                     style="width: 100%; border-radius: 16px; background-color: #a8729a;" aria-valuenow="65"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${order.status == 'Đã Hủy'}">
                                        <div class="col-md-10" style="margin-top: 10px">
                                            <div class="progress" style="height: 6px; border-radius: 16px;">
                                                <div class="progress-bar" role="progressbar"
                                                     style="width: 0%; border-radius: 16px; background-color: #a8729a;" aria-valuenow="65"
                                                     aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>




<%--                        <div class="card shadow-0 border mb-4">--%>
<%--                            <div class="card-body">--%>
<%--                                <div class="row">--%>
<%--                                    <div class="col-md-2">--%>
<%--                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Products/1.webp"--%>
<%--                                             class="img-fluid" alt="Phone">--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">--%>
<%--                                        <p class="text-muted mb-0">iPad</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">--%>
<%--                                        <p class="text-muted mb-0 small">Pink rose</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">--%>
<%--                                        <p class="text-muted mb-0 small">Capacity: 32GB</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">--%>
<%--                                        <p class="text-muted mb-0 small">Qty: 1</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">--%>
<%--                                        <p class="text-muted mb-0 small">$399</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">--%>
<%--                                <div class="row d-flex align-items-center">--%>
<%--                                    <div class="col-md-2">--%>
<%--                                        <p class="text-muted mb-0 small">Track Order</p>--%>
<%--                                    </div>--%>
<%--                                    <div class="col-md-10">--%>
<%--                                        <div class="progress" style="height: 6px; border-radius: 16px;">--%>
<%--                                            <div class="progress-bar" role="progressbar"--%>
<%--                                                 style="width: 20%; border-radius: 16px; background-color: #a8729a;" aria-valuenow="20"--%>
<%--                                                 aria-valuemin="0" aria-valuemax="100"></div>--%>
<%--                                        </div>--%>
<%--                                        <div class="d-flex justify-content-around mb-1">--%>
<%--                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Out for delivary</p>--%>
<%--                                            <p class="text-muted mt-1 mb-0 small ms-xl-5">Delivered</p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                    </div>
<%--                    <div class="card-footer border-0 px-4 py-5"--%>
<%--                         style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">--%>
<%--                        <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Total--%>
<%--                            paid: <span class="h2 mb-0 ms-2">$1040</span></h5>--%>
<%--                    </div>--%>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/onlinepage.js"></script>
<script src="${pageContext.request.contextPath}/assets_onlinepage/js/bootstrap.min.js"></script>

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

