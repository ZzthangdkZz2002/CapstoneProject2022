<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đơn hàng của tôi</title>
        <link rel="stylesheet" href="/css/style.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Alef' rel='stylesheet'>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      </head>
      <body>    
        <!--Page Header-->
        <jsp:include page="header.jsp" />

        <!--Page Content-->
        <main>
<%--          <c:if test="${not empty orderId}">--%>
<%--            <div id="myModal" class="modal">--%>

<%--              <!-- Modal content -->--%>
<%--              <div class="modal-content">--%>
<%--                <span class="close">&times;</span>--%>
<%--                <p>Đơn hàng với mã ${orderId} vừa được tạo</p>--%>
<%--              </div>--%>

<%--            </div>--%>
<%--          </c:if>--%>
          <div class="account">
            <div class="account_side">
              <a href="${pageContext.request.contextPath}/profile"><i class="material-icons"> arrow_right</i>Hồ sơ của tôi</a>
              <a href="${pageContext.request.contextPath}/order" style="font-weight: bold; background-color: rgba(0,0,0,0.1);"><i class="material-icons"> arrow_right</i>Đơn hàng của tôi</a>
              <a href="${pageContext.request.contextPath}/change-password"><i class="material-icons"> arrow_right</i>Đổi mật khẩu</a>
            </div>
            <div class="account_content">
              <div id="order_tabs">
                <a href="${pageContext.request.contextPath}/order" style="color: white; background-color: #01447e;">Tất cả</a>
                <a href="${pageContext.request.contextPath}/order/waiting">Chờ xác nhận</a>
                <a href="${pageContext.request.contextPath}/order/accepted">Đã xác nhận</a>
                <a href="${pageContext.request.contextPath}/order/shipping">Đang giao hàng</a>
                <a href="${pageContext.request.contextPath}/order/received">Đã nhận hàng</a>
                <a href="${pageContext.request.contextPath}/order/cancelled">Đã hủy</a>
              </div>
              <div id="order_list">
                  <c:choose>
                      <c:when test="${orders == null}">
                          <h1>Bạn chưa có đơn hàng nào</h1>
                      </c:when>
                      <c:otherwise>
                          <c:forEach var="order" items="${orders}">
                              <div class="an-order">
                                  <table>
                                      <tr>
                                          <td style="font-weight: bold; font-size: 2rem">Mã đơn: #${order.orderid}</td>
                                          <td style="color: ${order.status =="Đã Hủy" ? "red" : order.status =="Chờ Xử Lý" ? "#E1DB0A" : "green"}; font-size: 2rem" >${order.status}</td>
                                      </tr>
                                      <c:forEach var="item" items="${order.orderTransactionDetails}">
                                          <tr style="border-bottom: 0.5px solid #36454F;">
                                              <td><img src="/img/${item.productDTO.image}" alt="hinh ảnh sản phẩm">
                                                  <span style="margin-left: 15px"> ${item.productDTO.name}</span> <br>
                                                  <span style="margin-left: 15px">x${item.quantity}</span>
                                              </td>
                                              <td>${item.amount}</td>
                                          </tr>
                                      </c:forEach>
                                      <tr style="padding-top: 15px">
                                          <td></td>
                                          <td style="font-size: 2rem; padding-top: 20px"><span style="font-size: 2rem">Tổng thanh toán:</span>  ${order.amount}</td>
                                      </tr>
                                      <c:if test="${order.status != 'Đã Hủy' && order.status != 'Hoàn Thành'}">
                                          <tr>
                                              <c:if test="${order.payment_method == 'Thanh toán qua VNPay' && order.isPaid eq 'false'}">
                                                  <td>
                                                      <a href="#" onclick="rePayment('${order.orderid}')">
                                                          <button>Thanh toán đơn hàng</button>
                                                      </a>
                                                  </td>
                                              </c:if>
                                              <td colspan="2">
                                                  <a href="${pageContext.request.contextPath}/customer/cancelOrder?id=${order.id}" onclick="return confirm('Bạn muốn huỷ đơn mã #${order.orderid}?')">
                                                      <button>Hủy đơn hàng</button>
                                                  </a>
                                              </td>
                                          </tr>
                                      </c:if>

                                  </table>
                              </div>
                          </c:forEach>
                      </c:otherwise>
                  </c:choose>
              </div>
            </div>
          </div>
        </main>
    
        <!--Page Footer-->
<%--        <jsp:include page="footer.jsp" />--%>

        <script>
        var modal = document.getElementById("myModal");

        var btn = document.getElementById("myBtn");

        var span = document.getElementsByClassName("close")[0];

        span.onclick = function() {
          modal.style.display = "none";
        }

        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
        </script>
        <script src="${pageContext.request.contextPath}/assets_onlinepage/js/checkout.js"></script>
      </body>
</html>