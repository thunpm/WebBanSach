<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đăng nhập</title>
    
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div style="background-color: white;" class="main-block">
	    <div class="login-block">
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${message}</p>
	    	<div style="text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">ĐĂNG NHẬP</div>
	        <form action="checkLogin" method="POST">
	        	<label>Tên đăng nhập:</label>
        		<input type="text" name="tendangnhap" placeholder="Tên đăng nhập" value="${requestScope.user.tenDangNhap}">
	        	<label>Mật khẩu:</label>
	        	<input type="password" name="matkhau" placeholder="Mật khẩu" value="${requestScope.user.matKhau}">
	        	<input type="submit" value="ĐĂNG NHẬP">
	        </form>
	        <a class="link-dang-ki" href="showRegister">Bạn chưa có tài khoản? Đăng kí ngay!</a>
	    </div>	    
    </div>
    
    <%@ include file="include/footer.jsp" %>
    
   <script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>