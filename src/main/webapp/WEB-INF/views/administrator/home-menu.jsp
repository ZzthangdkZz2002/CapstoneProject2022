<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
<%--    <link href="<c:url value="/css/main.css"/>" rel="stylesheet" type="text/css">--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    <!-- or -->
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type="text/javascript">
        // var str=location.href.toLowerCase();
        // $(".app-menu li a").each(function() {
        //     if (str.indexOf($(this).attr("href").toLowerCase()) > -1) {
        //         $("a.active").removeClass("active");
        //         $(this).addClass("active");
        //     }
        // });
        // $("li.active").parents().each(function(){
        //     if ($(this).is("li")){
        //         $(this).addClass("active");
        //     }
        // });
    </script>
    <style>
        .Choicefile {
            display: block;
            background: #14142B;
            border: 1px solid #fff;
            color: #fff;
            width: 150px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            padding: 5px 0px;
            border-radius: 5px;
            font-weight: 500;
            align-items: center;
            justify-content: center;
        }

        .Choicefile:hover {
            text-decoration: none;
            color: white;
        }

        #uploadfile,
        .removeimg {
            display: none;
        }

        #thumbbox {
            position: relative;
            width: 100%;
            margin-bottom: 20px;
        }

        .removeimg {
            height: 25px;
            position: absolute;
            background-repeat: no-repeat;
            top: 5px;
            left: 5px;
            background-size: 25px;
            width: 25px;
            /* border: 3px solid red; */
            border-radius: 50%;

        }

        .removeimg::before {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            content: '';
            border: 1px solid red;
            background: red;
            text-align: center;
            display: block;
            margin-top: 11px;
            transform: rotate(45deg);
        }

        .removeimg::after {
            /* color: #FFF; */
            /* background-color: #DC403B; */
            content: '';
            background: red;
            border: 1px solid red;
            text-align: center;
            display: block;
            transform: rotate(-45deg);
            margin-top: -2px;
        }
    </style>
</head>
<body class="app sidebar-mini rtl">
<aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${pageContext.request.contextPath}/img/avatar.jpg" width="50px"
                                        alt="User Image">
        <div>
            <p class="app-sidebar__user-name"><b>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.name}</b></p>
            <p class="app-sidebar__user-designation">
                <sec:authorize access="hasRole('ROLE_MANAGER')">
                    Quản lí
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                    Nhân viên
                </sec:authorize>
            </p>
        </div>
    </div>
    <hr>
    <ul class="app-menu">
        <sec:authorize access="hasRole('ROLE_MANAGER')">
            <li>
                <a class="app-menu__item active" href="${pageContext.request.contextPath}/admin/home">
                    <i class='app-menu__icon bx bx-cart-alt'></i>
                    <span class="app-menu__label">Trang chủ</span>
                </a>
            </li>
        </sec:authorize>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/products"><i
                class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Quản lý sản
            phẩm</span></a>
        </li>
        <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/orders/waiting"><i class='app-menu__icon bx bx-task'></i><span
                class="app-menu__label">Quản lý đơn hàng</span></a></li>

            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/accounts/customer-account"><i class='app-menu__icon bx bx-id-card'></i>
                <span class="app-menu__label">Quản lý tài khoản</span>
            </a>

            </li>
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/categories"><i class='app-menu__icon bx bx-category'></i><span
                    class="app-menu__label">Quản lý danh mục</span></a></li>

            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/suppliers"><i
                    class='app-menu__icon bx bxs-user-account'></i><span class="app-menu__label">Quản lý nhà cung cấp
          </span></a></li>
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/warehouses"><i
                    class='app-menu__icon bx bx-building-house'></i><span class="app-menu__label">Quản lý kho
            hàng
          </span></a></li>
        <sec:authorize  access="hasRole('ROLE_MANAGER')">
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/feedbacks"><i class='app-menu__icon bx bx-user-voice'></i><span
                    class="app-menu__label">Feedback</span></a>
            </li>
            <li><a class="app-menu__item" href="${pageContext.request.contextPath}/admin/reports"><i class='app-menu__icon bx bx-pie-chart-alt-2'></i><span
                    class="app-menu__label">Báo cáo thống kê</span></a>
            </li>
        </sec:authorize>

    </ul>
</aside>

<script>
    // Add active class to the current button (highlight it)
    // var appMenu = document.querySelector(".app-menu");
    // var items = appMenu.getElementsByClassName("app-menu__item");
    // for (var i = 0; i < items.length; i++) {
    //     items[i].addEventListener("click", function () {
    //         var current = document.getElementsByClassName("active");
    //         current[0].className = current[0].className.replace(" active", "");
    //         this.className += " active";
    //         console.log('active')
    //     });
    // }
    window.onload = function (){
        var url = window.location.href;
        var items = document.querySelectorAll('.app-menu__item');
        if(url.includes('admin/home')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[0].className += " active";
        }
        else if(url.includes('admin/products')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[1].className += " active";
        }
        else if(url.includes('admin/orders')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[2].className += " active";
        }
        else if(url.includes('admin/accounts')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[3].className += " active";
        }
        else if(url.includes('admin/categories')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[4].className += " active";
        }
        else if(url.includes('admin/suppliers')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[5].className += " active";
        }
        else if(url.includes('admin/warehouses')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[6].className += " active";
        }
        else if(url.includes('admin/feedbacks')){
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[7].className += " active";
        }
        else{
            let current = document.getElementsByClassName("app-menu__item active");
            current[0].className = current[0].className.replace(" active", "");
            items[8].className += " active";
        }
    }
</script>

</body>