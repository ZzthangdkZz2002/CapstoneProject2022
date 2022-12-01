<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Quản lý đơn hàng | Quản trị</title>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link href="<c:url value="/css/main.css"/>" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
  <jsp:include page="header.jsp"/>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <jsp:include page="home-menu.jsp"/>
  <main class="app-content">
    <div class="app-title">
      <ul class="app-breadcrumb breadcrumb side">
        <li class="breadcrumb-item"><b>Quản lý đơn hàng</b></li>
      </ul>
      <div id="clock"></div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="tile">
          <div class="tile-body">
            <div class="row element-button">
              <div id="myBtnContainer">
                <a href="${pageContext.request.contextPath}/admin/orders/waiting">
                  <button class="filter-btn <c:if test="${active eq 'waiting'}">active</c:if>">Chờ xử lý</button>
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders/confirmed">
                  <button class="filter-btn <c:if test="${active eq 'confirmed'}">active</c:if>">Đã xác nhận</button>
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders/shipping">
                  <button class="filter-btn <c:if test="${active eq 'shipping'}">active</c:if>">Đang giao hàng</button>
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders/received">
                  <button class="filter-btn <c:if test="${active eq 'received'}">active</c:if>">Hoàn thành</button>
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders/cancelled">
                  <button class="filter-btn <c:if test="${active eq 'cancelled'}">active</c:if>">Đã huỷ</button>
                </a>
                <a href="${pageContext.request.contextPath}/admin/orders/returned">
                  <button class="filter-btn <c:if test="${active eq 'returned'}">active</c:if>">Đã nhận hoàn</button>
                </a>
              </div>
            </div>
            <div class="row element-button">
              <div class="col-sm-2">
                <a class="btn btn-add btn-sm" href="${pageContext.request.contextPath}/admin/orders/orderOffline" title="Tạo đơn hàng mới"><i
                    class="fas fa-plus"></i>
                  Tạo đơn hàng mới</a>
              </div>




              <c:if test="${acceptOrderMessage != null}">
                <span class="badge bg-success" id="box" style="font-size: 30px; margin-left: 15%; text-align: center">${acceptOrderMessage}</span>
                <script type="text/javascript">
                  setTimeout(() => {
                    const box = document.getElementById('box');

                    // 👇️ removes element from DOM
                    box.style.display = 'none';

                    // 👇️ hides element (still takes up space on page)
                    // box.style.visibility = 'hidden';
                  }, 5000); // 👈️ time in milliseconds
                </script>
              </c:if>

              <c:if test="${acceptOrderMessage eq 'error'}">
                <span class="badge bg-success" id="box" style="font-size: 30px; margin-left: 15%;text-align: center; color: red">Thêm đơn hàng thất bại</span>
                <script type="text/javascript">
                  setTimeout(() => {
                    const box = document.getElementById('box');
                    // 👇️ removes element from DOM
                    box.style.display = 'none';
                    // 👇️ hides element (still takes up space on page)
                    // box.style.visibility = 'hidden';
                  }, 5000); // 👈️ time in milliseconds
                </script>
              </c:if>

            </div>
<%--            <c:if test="${active eq 'waiting'}">--%>
<%--              <c:set var="status" value="Chờ Xử Lý" />--%>
<%--            </c:if>--%>
<%--            <c:if test="${active eq 'confirmed'}">--%>
<%--              <c:set var="status" value="Đã Xác Nhận" />--%>
<%--            </c:if>--%>
<%--            <c:if test="${active eq 'shipping'}">--%>
<%--              <c:set var="status" value="Đang Giao Hàng" />--%>
<%--            </c:if>--%>
<%--            <c:if test="${active eq 'cancelled'}">--%>
<%--              <c:set var="status" value="Đã Hủy" />--%>
<%--            </c:if>--%>
<%--            <c:if test="${active eq 'returned'}">--%>
<%--              <c:set var="status" value="Đã Nhận Hoàn" />--%>
<%--            </c:if>--%>
            <div class="search-row">
              <form action="${pageContext.request.contextPath}/admin/orders/search" method="GET">
                <div class="search-container">
                  <input class="form-control" type="text" placeholder="Tìm kiếm" name="text" id="searchText" value="${text}">
                  <input type="hidden" value="0" type="text" name="index">
<%--                  <input type="hidden" value="<%=pageContext.getAttribute("status")%>" type="text" name="status">--%>
                  <button type="submit" id="search" ><i class="fa fa-search"></i></button>
                </div>
              </form>
            </div>

            <table class="table table-hover table-bordered" id="sampleTable">
              <thead>
                <tr>
                  <th width="100">Mã đơn hàng</th>
                  <th>Mã nhân viên</th>
                  <th>Mã khách hàng</th>
                  <th>Ngày đặt hàng</th>
                  <th>Tổng tiền</th>
                  <th>Tình trạng</th>
                  <th>Loại đơn hàng</th>
                  <th width="100">Tuỳ chọn</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="orderDto" items="${listOrder}">
                <tr>
                  <td>#${orderDto.orderid}</td>
                  <td>${orderDto.accountemployee != null ? orderDto.accountemployee.id : ""}</td>
                  <td>${orderDto.customer != null ? orderDto.customer.id : "Khách lẻ"}</td>
                  <td>${orderDto.created}</td>
                  <td class = "currency-text">${orderDto.amount}</td>
                  <td><span class="${orderDto.status =="Đã Hủy" ? "badge bg-danger" : orderDto.status =="Chờ Xử Lý" ? "badge bg-warning" : "badge bg-success"}">${orderDto.status}</span></td>
                  <td>${orderDto.orderKind}</td>
                  <td>
                  <c:if test="${orderDto.status eq 'Chờ Xử Lý'}">
                    <a href="${pageContext.request.contextPath}/admin/orders/accept?id=${orderDto.id}" class="btn btn-primary btn-sm edit"
                           type="button" title="Xác nhận đơn hàng"><i class="fas fa-edit"></i>Xác nhận đơn hàng</a>
                  </c:if>

                    <c:if test="${orderDto.status eq 'Chờ Xử Lý' || orderDto.status eq 'Đã Xác Nhận'}">
                      <button class="btn btn-primary btn-sm edit"
                         type="button" title="Xác nhận đơn hàng" data-toggle="modal" data-target="#cancelOrderModel" onclick="openModalData('${orderDto.id}')" ><i class="fas fa-edit"></i>Hủy đơn hàng</button>
<%--                      <span style="display: none" id="orderid">${orderDto.id}</span>--%>
                    </c:if>
                    <c:if test="${orderDto.status eq 'Đã Xác Nhận'}">
                      <a class="btn btn-primary btn-sm edit"
                         type="button" title="Xuất đơn hàng" href="${pageContext.request.contextPath}/admin/warehouses/export/detail/add?orderid=${orderDto.orderid}"><i class="fas fa-edit"></i>Xuất đơn hàng</a>
                    </c:if>

                    <c:if test="${orderDto.status eq 'Đang Giao Hàng'}">
                      <a class="btn btn-primary btn-sm edit"
                         type="button" title="Giao thành công" href="${pageContext.request.contextPath}/admin/orders/finish?id=${orderDto.id}"><i class="fas fa-edit"></i>Xác nhận</a>
                      <a class="btn btn-primary btn-sm edit"
                         type="button" title="Giao thành công" href="#"><i class="fas fa-edit"></i>Hoàn trả</a>
                      <c:if test="${orderDto.isShipping eq 'false'}">
                        <a class="btn btn-primary btn-sm edit"
                           type="button" title="Giao hàng nhanh" href="${pageContext.request.contextPath}/admin/orders/giaohangnhanh?orderid=${orderDto.orderid}"><i class="fas fa-edit"></i>Lên đơn Giao Hàng Nhanh</a>
                      </c:if>
                      <c:if test="${orderDto.isShipping eq 'true'}">
                        <a class="btn btn-primary btn-sm edit"
                           type="button" title="Giao hàng nhanh" href="#"><i class="fas fa-edit"></i>Đã lên đơn cho Giao Hàng Nhanh</a>
                      </c:if>
                    </c:if>

                    <a class="btn btn-primary btn-sm edit"
                       type="button" title="Xem" href="${pageContext.request.contextPath}/admin/orders/view/${orderDto.id}"><i class="fa fa-info"></i></a>
                  </td>
                </tr>
              </c:forEach>

              </tbody>
            </table>
            <div class="pagination-row">
              <div class="pagination-container">
                <%--              <p>${pageNo}</p>--%>
                <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                  <ul class="pagination">
                    <c:forEach var="i" step="1" begin="0" end="${total<=0 ? 0: total-1}">
                      <c:choose>
                        <c:when test="${pageNo == i}">
                          <li class="active paginate_button page-item " id="sampleTable_previous"><a href="${pageContext.request.contextPath}/admin/orders/${active}<c:choose><c:when test="${text!=null}">/search?text=${text}&index=${i}</c:when><c:otherwise>?index=${i}</c:otherwise></c:choose>"
                                                                                                     aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link">${i+1}</a></li>
                        </c:when>
                        <c:otherwise>
                          <li class="paginate_button page-item " id="sampleTable_previous"><a href="${pageContext.request.contextPath}/admin/orders/${active}<c:choose><c:when test="${text!=null}">/search?text=${text}&index=${i}</c:when><c:otherwise>?index=${i}</c:otherwise></c:choose>"
                                                                                              aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link">${i+1}</a></li>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>

  <!--
  MODAL
-->
  <div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body">
          <div class="row">
            <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chi tiết đơn hàng </h5>
              </span>
            </div>
            <div class="form-group col-md-12">
              <ul style="padding-left: 20px;">
                <li>Ghế làm việc Zuno x 2</li>
                <li>Bàn ăn gỗ Theresa x 5</li>
              </ul>
            </div>
          </div>
          <div style="display: flex; justify-content: flex-end;">
            <button class="btn btn-save" data-dismiss="modal" type="button">Quay lại</button>
          </div>

        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
  <!--
MODAL
-->

  <!--
  MODAL CONFIRM FINISHED
-->
  <div class="modal fade" id="confirmFinished" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <form method="POST" action="">
        <div class="modal-content">

          <div class="modal-body">
            <div class="row">
              <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chú ý</h5>
              </span>
              </div>
              <div class="form-group col-md-12" style="text-align: center;">
                <label class="control-label">Xác nhận đơn hàng đã được giao và thanh toán</label>
              </div>
            </div>
            <div style="display: flex; justify-content: center; padding: 10px;">
              <a style="margin: 5px;" class="btn btn-save" data-dismiss="modal" href="#">Xác nhận</a>
              <a style="margin: 5px;" class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </div>
      </form>
    </div>
  </div>
  <!--
MODAL
-->

  <!--
 Cancel Order Model
-->
  <div class="modal fade" id="cancelOrderModel" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
       data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body">
          <div class="row">
            <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Lý do hủy đơn hàng</h5>
              </span>
            </div>
            <div class="form-group col-md-12" style="text-align: center;">
              <label class="control-label">Nhập lý do: </label>
              <br>
              <textarea name="cancelReason" style="width: 300px; height: 200px"></textarea>
            </div>
          </div>
          <div style="display: flex; justify-content: center; padding: 10px;">
            <input type="hidden" value="" id="OderIdModal">
            <a style="margin: 5px;" class="btn btn-save" data-dismiss="modal" href="#" onclick="cancelOrder();">Xác nhận</a>
            <a style="margin: 5px;" class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
          </div>
        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
  <!--

  MODAL CONFIRM ORDER
-->
  <div class="modal fade" id="confirmOrder" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
    data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body">
          <div class="row">
            <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Chú ý</h5>
              </span>
            </div>
            <div class="form-group col-md-12" style="text-align: center;">
              <label class="control-label">Bạn có muốn chấp nhận đơn hàng này</label>
            </div>
          </div>
          <div style="display: flex; justify-content: center; padding: 10px;">
            <a style="margin: 5px;" class="btn btn-save" data-dismiss="modal" href="#" id="confirmCancel">Xác nhận</a>
            <a style="margin: 5px;" class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
          </div>
        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
  <!--
MODAL
-->
  <!-- Essential javascripts for application to work-->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/order-offline.js"></script>
  <script src="${pageContext.request.contextPath}/assets_onlinepage/js/common.js"></script>
  <script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
  <script src="<c:url value="/js/popper.min.js"/>"></script>
  <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/js/main.js"/>"></script>
  <script src="<c:url value="/js/api-province.js"/>"></script>
  <script src="<c:url value="/js/plugins/pace.min.js"/>"></script>
  <script src="<c:url value="/resources/data.json"/>"></script>
  <script src="<c:url value="src/jquery.table2excel.js"/>"></script>

  <!-- The javascript plugin to display page loading on top-->
  <!-- Page specific javascripts-->

</body>

</html>