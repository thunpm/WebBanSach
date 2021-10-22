<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đăng nhập Admin</title>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <div class="main-block">
	    <div class="login-block">
	    	<c:if test="${empty sessionScope.admin}">
		    	<h5>Xin mời đăng nhập để tiếp tục!</h5>
		    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${message}</p>
		        <form action="${root}/admin/checkLogin" method="POST">
		        	<label>Tên đăng nhập:</label>
	        		<input type="text" name="tendangnhap" value="${admin.tenDangNhap}">
		        	<label>Mật khẩu:</label>
		        	<input type="password" name="matkhau" value="${admin.matKhau}">
		        	<input type="submit" value="ĐĂNG NHẬP">
		        </form>
	        </c:if>
	        <c:if test="${! empty sessionScope.admin}">
	        	<h5>Bạn đã đăng nhập rồi, vui lòng đăng xuất để đăng nhập lại!</h5>
	        	<center><a href="${root}/admin/trangchu">Trang chủ</a></center>
	        </c:if>
	    </div>	    
    </div>
    
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>