<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Quản lý nhà cung cấp | Quản trị</title>
  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link href="<c:url value="/css/main.css"/>" rel="stylesheet" type="text/css">
  <link href="<c:url value="/css/warehouse.css"/>" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

  <!-- icon -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
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
        <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/suppliers"><b>Quản lý nhà cung cấp</b></a></li>
      </ul>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="tile">
          <div class="tile-body">
            <div class="row element-button">
              <div class="col-sm-2">
                <a class="btn btn-add btn-sm" href="#" title="Thêm" data-toggle="modal" data-target="#addSupplierModel"><i class="fas fa-plus"></i>
                  Thêm nhà cung cấp</a>
              </div>
            </div>
            <div class="search-row">
              <form action="">
                <div class="search-container">
                  <input class="form-control" type="text" placeholder="Tìm kiếm" name="search">
                  <button type="submit"><i class="fa fa-search"></i></button>
                </div>
              </form>
            </div>
            <table class="table table-hover table-bordered" id="sampleTable">
              <thead>
                <tr>
                  <th width="100">Mã nhà cung cấp</th>
                  <th>Tên nhà cung cấp</th>
                  <th>Số điện thoại</th>
                  <th>Email</th>
                  <th>Mã số thuế</th>
                  <th>Địa chỉ</th>
                  <th>Nợ cần trả</th>
                  <th>Tổng mua</th>
                  <th width="80">Trạng thái</th>
                  <th width="100">Tuỳ chọn</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="supplier" items="${listSupplier}">
                <tr>
                  <td>${supplier.code}</td>
                  <td>${supplier.name}</td>
                  <td>${supplier.phone}</td>
                  <td>${supplier.email}</td>
                  <td>${supplier.tax_code}</td>
                  <td>${supplier.address}</td>
                  <td class="currency-text">${supplier.debt}</td>
                  <td class="currency-text" c>${supplier.total_purchase}</td>
                  <td>
                    <div class="switch">
                      <input class="status-checkbox" onclick="return false" type="checkbox"  name="check" <c:if test="${supplier.active == 1}"> checked</c:if>/>

                      <span class="slider round"></span>
                      <div style="position:absolute; left:0; right:0; top:0; bottom:0;" onclick="updateSupplierStatus(this)"data-toggle="modal"
                              <c:if test="${supplier.active == 1}"> data-target="#disableStatus"</c:if> <c:if test="${supplier.active == 0}"> data-target="#enableStatus"</c:if> ></div>
                    </div>
                  </td>
                  <td>
                    <a href="${pageContext.request.contextPath}/admin/suppliers/detail?sid=${supplier.id}" class="btn btn-primary btn-sm edit" type="button" title="Sửa">Chi tiết hàng nhập</a>
                    <a href="${pageContext.request.contextPath}/admin/suppliers/edit/${supplier.id}" class="btn btn-primary btn-sm edit" type="button" title="Sửa"><i class="fas fa-edit"></i></a>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
            <div class="pagination-row">
              <div class="pagination-container">
                <div class="dataTables_paginate paging_simple_numbers" id="sampleTable_paginate">
                  <ul class="pagination">
                    <li class="paginate_button page-item previous disabled" id="sampleTable_previous"><a href="#"
                        aria-controls="sampleTable" data-dt-idx="0" tabindex="0" class="page-link">Lùi</a></li>
                    <li class="paginate_button page-item active"><a href="#" aria-controls="sampleTable" data-dt-idx="1"
                        tabindex="0" class="page-link">1</a></li>
                    <li class="paginate_button page-item "><a href="#" aria-controls="sampleTable" data-dt-idx="2"
                        tabindex="0" class="page-link">2</a></li>
                    <li class="paginate_button page-item next" id="sampleTable_next"><a href="#"
                        aria-controls="sampleTable" data-dt-idx="3" tabindex="0" class="page-link">Tiếp</a></li>
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
  MODAL CONFIRM STATUS 
-->
  <div class="modal fade" id="disableStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
              <label class="control-label">Bạn có chắc chắn vô hiệu hoá nhà cung cấp này này</label>
            </div>
          </div>
          <div style="display: flex; justify-content: center; padding: 10px;">
            <button style="margin: 5px;" class="btn btn-save" type="button" id="disableS" data-dismiss="modal" href="#">Xác nhận</button>
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
  <!--
  MODAL ENABLE STATUS 
-->
  <div class="modal fade" id="enableStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
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
              <label class="control-label">Bạn có chắc chắn kích hoạt nhà cung cấp này</label>
            </div>
          </div>
          <div style="display: flex; justify-content: center; padding: 10px;">
            <button style="margin: 5px;" class="btn btn-save" type="button" id="enableS" data-dismiss="modal" href="#">Xác nhận</button>
            <a style="margin: 5px;" class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
          </div>
        </div>
        <div class="modal-footer">
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="result" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
       data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">

        <div class="modal-body">
          <div class="row">
            <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thông báo</h5>
              </span>
            </div>
            <div class="form-group col-md-12" style="text-align: center;">
              <label class="control-label" style="font-size: medium" id="resultLabel"></label>
            </div>
          </div>
          <div style="display: flex; justify-content: center; padding: 10px;">
            <a href="${pageContext.request.contextPath}/admin/suppliers" style="margin: 5px;" class="btn btn-cancel">Đóng</a>
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

  <!-- Add supplier model -->
  <div class="modal fade" id="addSupplierModel" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <form action="${pageContext.request.contextPath}/admin/suppliers/add" method="post">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Thêm nhà cung cấp</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row justify-content-between">

              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="Mã mặc định" name="s_code" id="code" required />
                <label for="code" class="form__label" required-field>Mã nhà cung cấp</label>
              </div>


              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="Name" name="s_name" id="supplier_name" required />
                <label for="supplier_name" class="form__label" required-field>Tên  nhà cung cấp</label>
              </div>

              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="s_email" name="s_email" id="supplier_email" required />
                <label for="supplier_email" class="form__label" required-field>Email</label>
              </div>

              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="Name" name="phone" id="supplier_phone" required />
                <label for="supplier_phone" class="form__label" required-field>Điện thoại</label>
              </div>

              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="Name" name="company" id="supplier_company"  />
                <label for="supplier_company" class="form__label">Công ty</label>
              </div>

              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="Name" name="address" id="supplier_address" required />
                <label for="supplier_address" class="form__label" required-field>Địa chỉ</label>
              </div>
              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="Name" name="tax_code" id="supplier_taxcode"  />
                <label for="supplier_taxcode" class="form__label">Mã số thuế</label>
              </div>


              <div class="form__group field col-5">
                <input type="input" class="form__field" placeholder="Name" name="note" id="supplier_note"  />
                <label for="supplier_note" class="form__label">Ghi chú</label>
              </div>

            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa-solid fa-ban mr-2"></i>Huỷ</button>
          <button type="submit" class="btn btn-primary"><i class="fa-regular fa-floppy-disk mr-2"></i>Lưu</button>
        </div>
      </div>
      </form>
    </div>
  </div>
  <!-- Essential javascripts for application to work-->

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets_onlinepage/js/common.js"></script>
  <script src="<c:url value="/js/jquery-3.2.1.min.js"/>"></script>
  <script src="<c:url value="/js/popper.min.js"/>"></script>
  <script src="<c:url value="/js/bootstrap.min.js"/>"></script>
  <script src="<c:url value="/js/main.js"/>"></script>
  <script src="<c:url value="/js/plugins/pace.min.js"/>"></script>

  <!-- The javascript plugin to display page loading on top-->
  <!-- Page specific javascripts-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
  <script>
    $(document).ready(function (){

    });
    function updateSupplierStatus(e){
      var id = $(e.parentNode.parentNode.parentNode).find('td').eq(0).html();
      var element =$(e.parentNode).find('input');
      if($(element).is(":checked")){

        disableProduct(id);
      } else enableProduct(id);
    }
    function disableProduct(id){
      var dis = document.getElementById("disableS");
      alert("hoang");
      dis.addEventListener('click',()=>{
        $.ajax({
          type:"POST",
          url:"/admin/suppliers/disable?id=" + id,
          contentType:"application/json",
          success: function (response){
            var  result = document.getElementById("resultLabel");
            result.innerHTML= response;
            $('#result').modal('show');
          }
        });
      });
    }
    function enableProduct(id){
      var en = document.getElementById("enableS");
      en.addEventListener('click', ()=>{
        $.ajax({
          type:"POST",
          url:"/admin/suppliers/enable?id=" + id,
          contentType:"application/json",
          success: function (response){
            var  result = document.getElementById("resultLabel");
            result.innerHTML= response;
            $('#result').modal('show');
          }
        });
      });
    }

  </script>
</body>

</html>