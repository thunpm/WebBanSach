<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>TRANG CHỦ</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <div class="main-block">
		<div>
			<div>${sanPham.tenSanPham}</div>
			<div>${sanPham.tacGia}</div>
			<div>${sanPham.nhaXuatBan}</div>
			<div>${sanPham.gia}</div>
			<div>${sanPham.khuyenMai}</div>
			<div>${sanPham.soLuongCo}</div>
			<div>${sanPham.moTa}</div>
			<a href="addToCart?idProduct=${sanPham.id}">Thêm vào giỏ hàng</a>
		</div>		
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>