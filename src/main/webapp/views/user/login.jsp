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
	    <div class="login-block">
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${requestScope.message}</p>
	        <form action="checkLogin" method="POST">
	        	<label>Tên đăng nhập:</label>
        		<input type="text" name="tendangnhap" value="${requestScope.user.tenDangNhap}">
	        	<label>Mật khẩu:</label>
	        	<input type="text" name="matkhau" value="${requestScope.user.matKhau}">
	        	<input style=""type="submit" value="ĐĂNG NHẬP">
	        	<input type="button" value="THOÁT">
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