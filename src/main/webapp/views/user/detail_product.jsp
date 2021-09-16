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
    	<div class="content">
			<div class="chi-tiet-sp">
				<div class="hinh-anh">
					<img src="views/images/doc-vi-bat-ki-ai.jpg">
				</div>
				<div class="noi-dung">
					<div style="font-size: 25px; font-weight: bold;">${sanPham.tenSanPham}</div>
					<div style="color: #525852; margin-left: 400px;" class="da-ban">Đã bán ...</div>
					<div>Tác giả/Xuất xứ: ${sanPham.tacGia}</div>
					<div>Nhà xuất bản/Nơi sản xuất: ${sanPham.nhaXuatBan}</div>
					<div>Còn ${sanPham.soLuongCoString} sản phẩm</div>
					<div>
	        			<div style="float: left; font-weight: bold; margin-right: 5px; font-size: 23px;">${sanPham.giaString}</div>
	        			<div style="color: red;">-${sanPham.khuyenMaiString}%</div>
       				</div>
					<a class="them" href="addToCart?idProduct=${sanPham.id}">THÊM GIỎ HÀNG</a>
				</div>
			</div>	
			<div class="mo-ta">
				<h5>Mô tả sản phẩm</h5>
				<div>${sanPham.moTa}</div>	
			</div>
		</div>	
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>