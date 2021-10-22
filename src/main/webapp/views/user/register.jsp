<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đăng kí</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div style="background-color: white;" class="main-block">
	    <div class="login-block">
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${message}</p>
	    	<div style="text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">ĐĂNG KÝ</div>
	        <form action="checkRegister" method="POST">
	        	<label>Tên đăng nhập *:</label>
	        	<input type="text" name="tenDangNhap" value="${khachHang.tenDangNhap}">
	        	<label>Họ tên:</label>
	        	<input type="text" name="hoTen" value="${khachHang.hoTen}">
	        	<label>Số điện thoại *:</label>
	        	<input type="text" name="soDienThoai" value="${khachHang.soDienThoai}">
	        	<label>Mật khẩu *:</label>
	        	<input type="password" name="matKhau" value="">
	        	<label>Nhập lại mật khẩu *:</label>
	        	<input type="password" name="nhapLaiMatKhau" value="">
	        	<label>Email:</label>
	        	<input type="text" name="email" value="${khachHang.email}">
	        	<label>Giới tính:</label>
	        	<select name="gioiTinh">
	        		<option value="${khachHang.gioiTinh}" label="${khachHang.gioiTinh}"></option>
	        		<option value="Nam" label="Nam"></option>
	        		<option value="Nữ" label="Nữ"></option>
	        		<option value="Khác" label="Khác"></option>
	        	</select>
	        	<fmt:formatDate var="day" value="${khachHang.ngaySinh}" pattern="d" />
				<fmt:formatDate var="month" value="${khachHang.ngaySinh}" pattern="M" />
				<fmt:formatDate var="year" value="${khachHang.ngaySinh}" pattern="y" />
	        	<label>Ngày sinh:</label>
		        <div class="birthday">
		        	<select name="ngaySinh" class="nhap">
		        		<option value="${day}" label="${day}"></option>
		        		<c:forEach begin="1" end="31" var="dayy">
		        			<option value="${dayy}" label="${dayy}"></option> 
		        		</c:forEach>
		        	</select>
		        	<select name="thangSinh" class="nhap">
		        		<option value="${month}" label="${month}"></option>
		        		<c:forEach begin="1" end="12" var="monthh">
		        			<option value="${monthh}" label="${monthh}"></option>
		        		</c:forEach>
		        	</select>
		        	<input class="nhap" type="text" placeholder="2021" name="namSinh" value="${year}">
		        </div>
	        	<input type="submit" value="ĐĂNG KÍ">
	        </form>
	    </div>	    
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>