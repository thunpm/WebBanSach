<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

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
	        	<label>Tên đăng nhập *:</label>
	        	<input type="text" name="tenDangNhap" value="${requestScope.khachHang.tenDangNhap}">
	        	<label>Họ tên:</label>
	        	<input type="text" name="hoTen" value="${requestScope.khachHang.hoTen}">
	        	<label>Số điện thoại *:</label>
	        	<input type="text" name="soDienThoai" value="${requestScope.khachHang.soDienThoai}">
	        	<label>Mật khẩu *:</label>
	        	<input type="text" name="matKhau" value="">
	        	<label>Nhập lại mật khẩu *:</label>
	        	<input type="text" name="nhapLaiMatKhau" value="">
	        	<label>Email:</label>
	        	<input type="text" name="email" value="${requestScope.khachHang.email}">
	        	<label>Giới tính:</label>
	        	<select name="gioiTinh">
	        		<option value="${requestScope.khachHang.gioiTinh}" label="${requestScope.khachHang.gioiTinh}"></option>
	        		<option value="Nam" label="Nam"></option>
	        		<option value="Nữ" label="Nữ"></option>
	        		<option value="Khác" label="Khác"></option>
	        	</select>
	        	<fmt:formatDate var="day" value="${user.ngaySinh}" pattern="d" />
				<fmt:formatDate var="month" value="${sessionScope.user.ngaySinh}" pattern="M" />
				<fmt:formatDate var="year" value="${sessionScope.user.ngaySinh}" pattern="y" />
	        	<label>Ngày sinh:</label>
		        <div class="birthday">
		        	<select name="ngaySinh" class="nhap">
		        		<option value="1" label="1"></option>
		        		<c:forEach begin="1" end="31" var="dayy">
		        			<option value="${dayy}" label="${dayy}"></option> 
		        		</c:forEach>
		        	</select>
		        	<select name="thangSinh" class="nhap">
		        		<option value="1" label="1"></option>
		        		<c:forEach begin="1" end="12" var="monthh">
		        			<option value="${monthh}" label="${monthh}"></option>
		        		</c:forEach>
		        	</select>
		        	<input class="nhap" type="text" placeholder="2021" name="namSinh" value="">
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