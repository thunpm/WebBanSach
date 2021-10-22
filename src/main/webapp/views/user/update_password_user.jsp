<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cập nhật mật khẩu</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block info-user">
    	<div class="menu-update-kh ">
    		<a href="showKhachHang">Thay đổi thông tin</a>
    		<a href="showKhachHang?key=password">Thay đổi mật khẩu</a>
    		<a href="showKhachHang?key=address">Sổ địa chỉ</a>
    	</div>
		<div class="update-kh login-block">
			<c:set var="key1" value="information"></c:set>
			<c:set var="key2" value="password"></c:set>
			<c:set var="key3" value="address"></c:set>
			<c:if test="${key eq key1}">
   				<div style="text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">Thay đổi thông tin</div>
   			</c:if>
   			<c:if test="${key eq key2}">
   				<div style="text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">Thay đổi mật khẩu</div>
   			</c:if>
   			<c:if test="${key eq key3}">
   				<div style="text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">Sổ địa chỉ</div>
   			</c:if>
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${message}</p>
	        <form action="updateKhachHang" method="POST">
	        	<input type="hidden" name="key" value="${key}">
	        	<input type="hidden" name="tenDangNhap" value="${sessionScope.user.tenDangNhap}">
	        	<label>Mật khẩu cũ *:</label>
	        	<input type="text" name="matKhauCu" value="">
	        	<label>Mật khẩu mới *:</label>
	        	<input type="text" name="matKhauMoi" value="">
	        	<label>Nhập lại mật khẩu *:</label>
	        	<input type="text" name="nhapLaiMatKhau" value="">
	        	<input type="submit" value="CHỈNH SỬA">
	        </form>
	    </div>	    
    </div>
    
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>