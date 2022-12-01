<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Đăng nhập</title>
      <link href="<c:url value="/css/style.css"/>" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href='https://fonts.googleapis.com/css?family=Alef' rel='stylesheet'>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
      </head>
      <body>
        <!--Page Header-->
        <jsp:include page="../header.jsp"/>

        <!--Page Content-->
        <main>
          <ul class="breadcrumb">
            <li><a href="home.html">Trang chủ</a></li>
            <li>Đăng nhập</li>
          </ul>
          <div class="sign_form">
            <div id="signin_content">
              <h2 style="color: white; margin-bottom: 20px;text-align: center;font-weight: bold">Đăng nhập</h2>
                <%--@elvariable id="signinRequest" type="com.example.dto.SigninRequest"--%>
              <form:form action="${pageContext.request.contextPath}/auth/signin" method="POST" modelAttribute="signinRequest" style="width: 100%;"  >
                  <label for="email">Email</label>
                  <form:input type="email" id="email" name="email" path="email" />
                  <form:errors path="email" element="div" cssClass="error" />
                  <c:if test="${wrongEmail!=null}">
                   <p class="error"> <c:out value="${wrongEmail}"/></p>
                  </c:if>
                <label for="pwd">Mật khẩu</label>
                <form:input type="password" id="pwd" name="pwd" path="password" />
                <form:errors path="password" cssClass="error" element="div"/>
                <c:if test="${wrongPassword!=null}">
                 <p class="error"> <c:out value="${wrongPassword}"/></p>
                </c:if>
                <div class="form-elements" >
                  <input type="submit" value="Đăng nhập"/>
                </div>
                <hr style="color: grey;">
                <div class="form-elements" style="text-align: center">
                  Bạn chưa có tài khoản?<a href="/signup" id="signup">Đăng ký</a>
                </div>
              </form:form>

            </div>
          </div>
        </main>

        <!--Page Footer-->
        <jsp:include page="../footer.jsp"/>

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