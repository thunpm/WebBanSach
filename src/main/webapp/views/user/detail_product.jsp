<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chi tiết sản phẩm</title>
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
					<img src="views/images/${sanPham.anhSanPham.tenHinhAnh}">
				</div>
				<div class="noi-dung">
					<div style="font-size: 25px; font-weight: bold;">${sanPham.tenSanPham}</div>
					<div style="color: #525852; margin-left: 400px;" class="da-ban">Đã bán ${sanPham.daBan}</div>
					<div>Tác giả/Xuất xứ: ${sanPham.tacGia}</div>
					<div>Nhà xuất bản/Nơi sản xuất: ${sanPham.nhaXuatBan}</div>
					<div>Còn <fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.soLuongCo}"/> sản phẩm</div>
					<div>
	        			<div style="float: left; font-weight: bold; margin-right: 5px; font-size: 23px;">
	        				<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.gia}"/> đ
	        			</div>
	        			<div style="color: red;">
	        				-<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.khuyenMai}"/>%
	        			</div>
       				</div>
       				<form action="addToCart" method="POST">
       					<input type="hidden" name="idProduct" value="${sanPham.id}">
       					<input type="submit" value="THÊM GIỎ HÀNG">
       				</form>
				</div>
			</div>	
			<div class="mo-ta-sp">
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