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
	<!-- làm sau -->
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <div class="main-block">
    	<div class="menu-update-kh">
    		<a href="showKhachHang?tendangnhap=${sessionScope.khachHang.tenDangNhap}&key=infomation">Thay đổi thông tin</a>
    		<a href="showKhachHang?tendangnhap=${sessionScope.khachHang.tenDangNhap}&key=password">Thay đổi mật khẩu</a> 
    		<a href="#">Cập nhật địa chỉ giao hàng</a>
    	</div>
	    <div class="login-block">
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${requestScope.message}</p>
	        <form action="checkUpdatePasswordUser" method="POST">
	        	<label>Mật khẩu cũ:</label>
	        	<input type="text" name="matKhau" value="">
	        	<label>Mật khẩu mới:</label>
	        	<input type="text" name="matKhauMoi" value="">
	        	<label>Nhập lại mật khẩu mới:</label>
	        	<input type="text" name="nhapLaiMatKhauMoi" value="">
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