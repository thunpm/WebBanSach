<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    		<a href="showKhachHang?tendangnhap=${sessionScope.khachHang.tenDangNhap}">Thay đổi thông tin</a>
    		<a href="#">Thay đổi mật khẩu</a>
    		<a href="#">Cập nhật địa chỉ giao hàng</a>
    	</div>
	    <div class="login-block">
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${requestScope.message}</p>
	        <form action="checkLogin" method="POST">
	        	<label>Tên đăng nhập:</label>
	        	<input type="text" name="tendangnhap" disabled="disabled" value="${requestScope.khachHang.tenDangNhap}">
	        	<label>Họ tên:</label>
	        	<input type="text" name="hoTen" value="${requestScope.khachHang.hoTen}">
	        	<label>Số điện thoại:</label>
	        	<input type="text" name="soDienThoai" value="${requestScope.khachHang.soDienThoai}">
	        	<label>Email:</label>
	        	<input type="text" name="email" value="${requestScope.khachHang.email}">
	        	<label>Giới tính:</label>
	        	<select name="gioiTinh">
	        		<option value="NONE" label="${requestScope.khachHang.gioiTinh}"></option>
	        		<option value="nam" label="Nam"></option>
	        		<option value="nu" label="Nữ"></option>
	        		<option value="khac" label="Khác"></option>
	        	</select>
	        	<input type="submit" value="CẬP NHẬT">
	        	<input type="button" value="RESET">
	        </form>
	    </div>	    
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>