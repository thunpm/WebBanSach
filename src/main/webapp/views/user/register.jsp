<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ĐĂNG KÍ</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <div class="main-block">
	    <div class="login-block">
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${requestScope.message}</p>
	        <form action="checkRegister" method="POST">
	        	<label>Tên đăng nhập:</label>
	        	<input type="text" name="tenDangNhap" value="${requestScope.khachHang.tenDangNhap}">
	        	<label>Họ tên:</label>
	        	<input type="text" name="hoTen" value="${requestScope.khachHang.hoTen}">
	        	<label>Số điện thoại:</label>
	        	<input type="text" name="soDienThoai" value="${requestScope.khachHang.soDienThoai}">
	        	<label>Email:</label>
	        	<input type="text" name="email" value="${requestScope.khachHang.email}">
	        	<label>Giới tính:</label>
	        	<select name="gioiTinh">
	        		<option value="${requestScope.khachHang.gioiTinh}" label="${requestScope.khachHang.gioiTinh}"></option>
	        		<option value="Nam" label="Nam"></option>
	        		<option value="Nữ" label="Nữ"></option>
	        		<option value="Khác" label="Khác"></option>
	        	</select>
	        	<label>Ngày sinh:</label>
	        	<select name="ngaySinh">
	        		<option value="" label=""></option>
	        		<option value="1" label="01"></option> 
	        		<option value="2" label="02"></option> 
	        		<option value="3" label="03"></option>
	        		<option value="4" label="04"></option> 
	        		<option value="5" label="05"></option> 
	        		<option value="6" label="06"></option>
	        		<option value="7" label="07"></option> 
	        		<option value="8" label="08"></option> 
	        		<option value="9" label="09"></option>
	        		<option value="10" label="10"></option> 
	        		<option value="11" label="11"></option> 
	        		<option value="12" label="12"></option>
	        		<option value="13" label="13"></option> 
	        		<option value="14" label="14"></option> 
	        		<option value="15" label="15"></option>
	        		<option value="16" label="16"></option> 
	        		<option value="17" label="17"></option> 
	        		<option value="18" label="18"></option>
	        		<option value="19" label="19"></option> 
	        		<option value="20" label="20"></option> 
	        		<option value="21" label="21"></option>
	        		<option value="22" label="22"></option> 
	        		<option value="23" label="23"></option> 
	        		<option value="24" label="24"></option>
	        		<option value="25" label="25"></option> 
	        		<option value="26" label="26"></option> 
	        		<option value="27" label="27"></option>
	        		<option value="28" label="28"></option> 
	        		<option value="29" label="29"></option> 
	        		<option value="30" label="30"></option>
	        		<option value="31" label="31"></option>
	        	</select>
	        	<select name="thangSinh">
	        		<option value="" label=""></option>
	        		<option value="1" label="01"></option> 
	        		<option value="2" label="02"></option> 
	        		<option value="3" label="03"></option>
	        		<option value="4" label="04"></option> 
	        		<option value="5" label="05"></option> 
	        		<option value="6" label="06"></option>
	        		<option value="7" label="07"></option> 
	        		<option value="8" label="08"></option> 
	        		<option value="9" label="09"></option>
	        		<option value="10" label="10"></option> 
	        		<option value="11" label="11"></option> 
	        		<option value="12" label="12"></option>
	        	</select>
	        	<input type="text" name="namSinh" value="">
	        	<label>Mật khẩu:</label>
	        	<input type="text" name="matKhau" value="">
	        	<label>Nhập lại mật khẩu:</label>
	        	<input type="text" name="nhapLaiMatKhau" value="">
	        	<input type="submit" value="ĐĂNG KÍ">
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