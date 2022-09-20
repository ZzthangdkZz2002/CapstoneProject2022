<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Trang chủ| Quản trị</title>
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

<!-- Chart content -->
<%
  Gson gsonObj = new Gson();
  Map<Object,Object> map = null;
  List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();

  map = new HashMap<Object,Object>(); map.put("label", "T1"); map.put("y", 450); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T2"); map.put("y", 198.3); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T3"); map.put("y", 206.1); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T4"); map.put("y", 224.8); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T5"); map.put("y", 238.2); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T6"); map.put("y", 271.6); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T7"); map.put("y", 290.2); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T8"); map.put("y", 319); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T9"); map.put("y", 332.9); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T10"); map.put("y", 120); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T11"); map.put("y", 305); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T12"); map.put("y", 600.5); list.add(map);

  String dataPoints1 = gsonObj.toJson(list);

  list = new ArrayList<Map<Object,Object>>();
  map = new HashMap<Object,Object>(); map.put("label", "T1"); map.put("y", 136.4); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T2"); map.put("y", -2000); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T3"); map.put("y", 143.3); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T4"); map.put("y", 162.6); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T5"); map.put("y", 173.1); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T6"); map.put("y", 206.6); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T7"); map.put("y", 225.2); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T8"); map.put("y", 254); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T9"); map.put("y", 267.9); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T10"); map.put("y", 267.9); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T11"); map.put("y", 267.9); list.add(map);
  map = new HashMap<Object,Object>(); map.put("label", "T12"); map.put("y", 267.9); list.add(map);

  String dataPoints2 = gsonObj.toJson(list);
%>
<%--Script for Chart--%>
<script type="text/javascript">
  window.onload = function() {

    var chart = new CanvasJS.Chart("chartContainer", {
      animationEnabled: true,
      theme: "light2",
      title: {
        text: "Doanh thu thuần theo Tháng"
      },
      axisY: {
        title: "Theo VNĐ",
        includeZero: true
      },
      toolTip: {
        shared: true
      },
      legend: {
        cursor: "pointer",
        itemclick: toggleDataSeries
      },
      data: [{
        type: "column",
        name: "Doanh Thu",
        yValueFormatString: "#0.0# Triệu VNĐ",
        showInLegend: true,
        dataPoints: <%out.print(dataPoints1);%>
      }, {
        type: "column",
        name: "Lợi Nhuận",
        yValueFormatString: "#0.## Triệu VNĐ",
        showInLegend: true,
        dataPoints: <%out.print(dataPoints2);%>
      }]
    });

    var chart2 = new CanvasJS.Chart("chartContainer2", {
      animationEnabled: true,
      theme: "light1",
      title: {
        text: "Doanh thu thuần theo Tháng"
      },
      axisY: {
        title: "Theo VNĐ",
        includeZero: true
      },
      toolTip: {
        shared: true
      },
      legend: {
        cursor: "pointer",
        itemclick: toggleDataSeries
      },
      data: [{
        type: "column",
        name: "Doanh Thu",
        yValueFormatString: "#0.0# Triệu VNĐ",
        showInLegend: true,
        dataPoints: <%out.print(dataPoints1);%>
      }, {
        type: "column",
        name: "Lợi Nhuận",
        yValueFormatString: "#0.## Triệu VNĐ",
        showInLegend: true,
        dataPoints: <%out.print(dataPoints2);%>
      }]
    });
    chart.render();
    chart2.render();

    function toggleDataSeries(e) {
      if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
        e.dataSeries.visible = false;
      }
      else {
        e.dataSeries.visible = true;
      }
      chart.render();
      chart2.render();
    }

  }
</script>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<main class="app-content">
  <div class="row">
    <div class="col-md-12">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><a href="#"><b>Trang chủ</b></a></li>
        </ul>
        <div id="clock"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <!--Left-->
    <div class="col-md-12 col-lg-6">
      <div class="row">
        <!-- col-6 -->
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
            <div class="info">
              <h4>Doanh thu trong tháng</h4>
              <p><b>50.000.000 đ</b></p>
              <p class="info-tong">Tổng số khách hàng được quản lý.</p>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-6">
          <div class="widget-small info coloured-icon"><i class='icon bx bx-purchase-tag-alt fa-3x'></i>
            <div class="info">
              <h4>Tổng số sản phẩm</h4>
              <p><b>850 sản phẩm</b></p>
              <p class="info-tong">Tổng số sản phẩm được quản lý.</p>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-6">
          <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-badge fa-3x'></i>
            <div class="info">
              <h4>Số lượng nhân viên</h4>
              <p><b>5 nhân viên</b></p>
              <p class="info-tong">Tổng số nhân viên trong hệ thống.</p>
            </div>
          </div>
        </div>
        <!-- col-6 -->
        <div class="col-md-6">
          <div class="widget-small info coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
            <div class="info">
              <h4>Số lượng khách hàng</h4>
              <p><b>300 khách hàng</b></p>
              <p class="info-tong">Tổng số khách hàng được quản lý.</p>
            </div>
          </div>
        </div>
        <!-- col-12 -->
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Sắp hết hàng</h3>
            <div>
              <table class="table table-bordered">
                <thead>
                <tr>
                  <th>ID Sản phẩm</th>
                  <th>Tên Sản phẩm</th>
                  <th>Số lượng còn lại</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>1-A-9-5</td>
                  <td>Tụ Cao Áp 221K- 2KV</td>
                  <td>
                    5
                  </td>
                </tr>
                <tr>
                  <td>1-A-9-4</td>
                  <td>Transistor S8550 TO-92 40V 1.5A PNP</td>
                  <td>
                    10
                  </td>
                </tr>
                <tr>
                  <td>1-A-10-4</td>
                  <td>Transistor S9014 TO-92 45V 0.1A NPN </td>
                  <td>
                    9
                  </td>
                </tr>
                <tr>
                  <td>1-A-9-7</td>
                  <td>Tụ Hóa 6.3V</td>
                  <td>
                    6
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
            <!-- / div trống-->
          </div>
        </div>
        <!-- / col-12 -->
        <!-- col-12 -->
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Đơn hàng gần nhất</h3>
            <div>
              <table class="table table-hover">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>Tên khách hàng</th>
                  <th>Ngày đặt hàng</th>
                  <th>Số điện thoại</th>
                  <th>Trạng thái</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>DH3835</td>
                  <td>Biến trở 10KΩ 1/2W 3.56mm</td>
                  <td>21/7/1992</td>
                  <td><span class="tag tag-success">0921387221</span></td>
                  <td><span class="badge bg-danger">Đã hủy </span></td>
                </tr>
                <tr>
                  <td>DH5686</td>
                  <td>Chiết áp 1/2W 100KΩ 24mm 20% 4cm</td>
                  <td>30/4/1975</td>
                  <td><span class="tag tag-warning">0912376352</span></td>
                  <td><span class="badge bg-success">Thành công</span></td>
                </tr>
                <tr>
                  <td>DH7865</td>
                  <td>Tụ Đỏ CBB 474J400V</td>
                  <td>12/3/1999</td>
                  <td><span class="tag tag-primary">01287326654</span></td>
                  <td><span class="badge bg-danger">Đã hủy </span></td>
                </tr>
                <tr>
                  <td>DH7456</td>
                  <td>Tụ Mica 104 275V</td>
                  <td>04/01/2022</td>
                  <td><span class="tag tag-danger">0912376763</span></td>
                  <td><span class="badge bg-danger">Đã hủy </span></td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- / col-12 -->
      </div>
    </div>
    <!--END left-->
    <!--Right-->
    <div class="col-md-12 col-lg-6">
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Dữ liệu tháng hiện</h3>
            <div class="embed-responsive">
<%--              <div id="chartContainer" style="height: 600px; width: 100%;"></div>--%>
            </div>
          </div>
        </div>
        <div class="col-md-12">
          <div class="tile">
            <h3 class="tile-title">Thống kê 6 tháng doanh thu</h3>
            <div class="embed-responsive">
<%--              <div id="chartContainer2" style="height: 600px; width: 100%;"></div>--%>
            </div>
          </div>
        </div>
      </div>

    </div>
    <!--END right-->
  </div>

  <!--
  <div class="text-center" style="font-size: 13px">
    <p><b>Copyright
        <script type="text/javascript">
          document.write(new Date().getFullYear());
        </script> Phần mềm quản lý bán hàng | Dev By Bùi Minh Hiệu
      </b></p>
  </div>
  -->

</main>
<script src="<c:url value="/js/jquery-3.2.1.min.js"/></script>
<script src="<c:url value="/js/popper.min.js"/></script>
<script src="<c:url value="/js/bootstrap.min.js"/></script>
<script src="<c:url value="/js/main.js"/></script>
<script src="<c:url value="/js/plugins/pace.min.js"/></script>
<script src="<c:url value="/js/plugins/chart.js"/></script>
<script type="text/javascript">
  var data = {
    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
    datasets: [{
      label: "Dữ liệu đầu tiên",
      fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
      strokeColor: "rgb(255, 212, 59)",
      pointColor: "rgb(255, 212, 59)",
      pointStrokeColor: "rgb(255, 212, 59)",
      pointHighlightFill: "rgb(255, 212, 59)",
      pointHighlightStroke: "rgb(255, 212, 59)",
      data: [20, 59, 90, 51, 56, 100]
    },
      {
        label: "Dữ liệu kế tiếp",
        fillColor: "rgba(9, 109, 239, 0.651)  ",
        pointColor: "rgb(9, 109, 239)",
        strokeColor: "rgb(9, 109, 239)",
        pointStrokeColor: "rgb(9, 109, 239)",
        pointHighlightFill: "rgb(9, 109, 239)",
        pointHighlightStroke: "rgb(9, 109, 239)",
        data: [48, 48, 49, 39, 86, 10]
      }
    ]
  };
  var ctxl = $("#lineChartDemo").get(0).getContext("2d");
  var lineChart = new Chart(ctxl).Line(data);

  var ctxb = $("#barChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxb).Bar(data);
</script>
<script type="text/javascript">
  //Thời Gian
  function time() {
    var today = new Date();
    var weekday = new Array(7);
    weekday[0] = "Chủ Nhật";
    weekday[1] = "Thứ Hai";
    weekday[2] = "Thứ Ba";
    weekday[3] = "Thứ Tư";
    weekday[4] = "Thứ Năm";
    weekday[5] = "Thứ Sáu";
    weekday[6] = "Thứ Bảy";
    var day = weekday[today.getDay()];
    var dd = today.getDate();
    var mm = today.getMonth() + 1;
    var yyyy = today.getFullYear();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    m = checkTime(m);
    s = checkTime(s);
    nowTime = h + " giờ " + m + " phút " + s + " giây";
    if (dd < 10) {
      dd = '0' + dd
    }
    if (mm < 10) {
      mm = '0' + mm
    }
    today = day + ', ' + dd + '/' + mm + '/' + yyyy;
    tmp = '<span class="date"> ' + today + ' - ' + nowTime +
            '</span>';
    document.getElementById("clock").innerHTML = tmp;
    clocktime = setTimeout("time()", "1000", "Javascript");

    function checkTime(i) {
      if (i < 10) {
        i = "0" + i;
      }
      return i;
    }
  }
</script>
</body>

</html>