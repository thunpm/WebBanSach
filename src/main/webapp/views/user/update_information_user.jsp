<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cập nhật thông tin</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div class="menu-update-kh">
    		<a href="showKhachHang">Thay đổi thông tin</a>
    		<a href="showKhachHang?key=password">Thay đổi mật khẩu</a>
    		<a href="showKhachHang?key=address">Cập nhật địa chỉ giao hàng</a>
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
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${message}</p>
	        <form action="updateKhachHang" method="POST">
	        	<input type="hidden" name="key" value="${key}">
	        	<label>Tên đăng nhập *:</label>
	        	<input type="hidden" name="tenDangNhap" value="${sessionScope.user.tenDangNhap}">
	        	<input type="text" disabled="disabled" value="${sessionScope.user.tenDangNhap}">
	        	<label>Họ tên:</label>
	        	<input type="text" name="hoTen" value="${sessionScope.user.hoTen}">
	        	<label>Số điện thoại *:</label>
	        	<input type="text" name="soDienThoai" value="${sessionScope.user.soDienThoai}">
	        	<label>Email:</label>
	        	<input type="text" name="email" value="${sessionScope.user.email}">
	        	<label>Giới tính:</label>
	        	<select name="gioiTinh">
	        		<option value="${sessionScope.user.gioiTinh}" label="${sessionScope.user.gioiTinh}"></option>
	        		<option value="Nam" label="Nam"></option>
	        		<option value="Nữ" label="Nữ"></option>
	        		<option value="Khác" label="Khác"></option>
	        	</select>
				<fmt:formatDate var="day" value="${sessionScope.user.ngaySinh}" pattern="d" />
				<fmt:formatDate var="month" value="${sessionScope.user.ngaySinh}" pattern="M" />
				<fmt:formatDate var="year" value="${sessionScope.user.ngaySinh}" pattern="y" />
	        	<label>Ngày sinh:</label>
		        <div class="birthday">
		        	<select name="ngaySinh" class="nhap">
		        		<option value="${day}" label="${day}"></option>
		        		<c:forEach begin="1" end="31" var="dayy">
		        			<option value="${dayy}" label="${dayy}"></option> 
		        		</c:forEach>
		        	</select>
		        	<select name="thangSinh"  class="nhap">
		        		<option value="${month}" label="${month}"></option>
		        		<c:forEach begin="1" end="12" var="monthh">
		        			<option value="${monthh}" label="${monthh}"></option>
		        		</c:forEach> 
		        	</select>
		        	<input class="nhap" type="text" placeholder="2021" name="namSinh" value="${year}">
		        </div>
	        	<input type="submit" value="CHỈNH SỬA">
	        	<input type="reset" value="RESET">
	        </form>
	    </div>	    
    </div>
    
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>