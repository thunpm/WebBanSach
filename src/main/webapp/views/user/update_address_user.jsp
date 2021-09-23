<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ĐĂNG NHẬP</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <div class="main-block">
    	<div class="menu-update-kh">
    		<a href="showKhachHang?tenDangNhap=${sessionScope.user.tenDangNhap}">Thay đổi thông tin</a>
    		<a href="showKhachHang?tenDangNhap=${sessionScope.user.tenDangNhap}&key=password">Thay đổi mật khẩu</a>
    		<a href="showKhachHang?tenDangNhap=${sessionScope.user.tenDangNhap}&key=address">Cập nhật địa chỉ giao hàng</a>
    	</div>
	    <div class="login-block">
	    	<c:set var="key1" value="information"></c:set>
			<c:set var="key2" value="password"></c:set>
			<c:set var="key3" value="address"></c:set>
			<c:if test="${key eq key1}">
   				<h5>Thay đổi thông tin</h5>
   			</c:if>
   			<c:if test="${key eq key2}">
   				<h5>Thay đổi mật khẩu</h5>
   			</c:if>
   			<c:if test="${key eq key3}">
   				<h5>Thay đổi địa chỉ giao hàng</h5>
   			</c:if>
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${requestScope.message}</p>
	        <form action="updateKhachHang" method="POST">
	        	<!-- phải làm sao đây, bây giờ em phải làm sao đây... -->
	        	<input type="hidden" name="key" value="${key}">
	        	<input type="hidden" name="idKhachHang" value="${sessionScope.user.id}">
	        	<label>Tỉnh/Thành phố:</label>
	        	<input type="text" name="tinh" value="${requestScope.user.diaChi}">
	        	<label>Quận/Huyện:</label>
	        	<input type="text" name="huyen" value="${requestScope.user.diaChi.huyen}">
	        	<label>Xã/Phường:</label>
	        	<input type="text" name="xa" value="${requestScope.user.diaChi.xa}">
	        	<label>Địa chỉ:</label>
	        	<input type="text" name="diaChi" value="${requestScope.user.diaChi.diaChi}">
	        	<input type="submit" value="CẬP NHẬT">
	        </form>
	    </div>	    
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>