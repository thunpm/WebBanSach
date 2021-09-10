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
    	<div class="sach">
    		<div class="danh-muc">
   				<c:forEach items="${listDanhMuc}" var="danhMuc">
   					<div class="dropdown">
		   				<div class="btn" data-toggle="dropdown">${danhMuc.tenDanhMuc}</div>
					  	<ul class="dropdown-menu">
					  		<c:forEach items="${danhMuc.listLoaiSanPham}" var="loaiSanPham">
						    	<li><a class="dropdown-item" href="#">${loaiSanPham.tenLoaiSanPham}</a></li>
		    				</c:forEach>
					  	</ul>
				  	</div>
			  	</c:forEach>
    		</div>
    	</div>
        <div class="sach">
        	<h4 class="tieu-de">SẢN PHẨM MỚI</h4>
        	<c:forEach items="${listSanPhamBanChay}" var="sanPham">			    	
	        	<div class="card">
	        		<div class="hinh-anh">hinh anh</div>
	        		<div class="ten-sach">${sanPham.tenSanPham}</div>
	        		<div class="tac-gia">${sanPham.tacGia}</div>
	        		<div class="da-ban">da ban</div>
	        		<div class="gia-tien">${sanPham.gia}</div>
	        		<div class="khuyen-mai">${sanPham.khuyenMai}</div>
	        	</div>
			</c:forEach>
        </div>
        <div class="sach">
        	<h4 class="tieu-de">SẢN PHẨM BÁN CHẠY</h4>
        	<c:forEach items="${listSanPhamMoi}" var="sanPham">			    	
	        	<div class="card">
	        		<div class="hinh-anh">hinh anh</div>
	        		<div class="ten-sach">${sanPham.tenSanPham}</div>
	        		<div class="tac-gia">${sanPham.tacGia}</div>
	        		<div class="da-ban">da ban</div>
	        		<div class="gia-tien">${sanPham.gia}</div>
	        		<div class="khuyen-mai">${sanPham.khuyenMai}</div>
	        	</div>
			</c:forEach>
        </div>
        <div class="sach">
        	<h4 class="tieu-de">SẢN PHẨM KHUYẾN MÃI</h4>
        	<c:forEach items="${listSanPhamKhuyenMai}" var="sanPham">			    	
	        	<div class="card">
	        		<div class="hinh-anh">hinh anh</div>
	        		<div class="ten-sach">${sanPham.tenSanPham}</div>
	        		<div class="tac-gia">${sanPham.tacGia}</div>
	        		<div class="da-ban">da ban</div>
	        		<div class="gia-tien">${sanPham.gia}</div>
	        		<div class="khuyen-mai">${sanPham.khuyenMai}</div>
	        	</div>
			</c:forEach>
        </div>
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>