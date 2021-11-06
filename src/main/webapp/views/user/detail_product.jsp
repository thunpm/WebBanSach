<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chi tiết sản phẩm</title>
    
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    
    <style>
    	.main-block .danh-muc .tieu-de {width: 100%; padding: 20px 0px 0px 15px;}
  		.main-block .danh-muc {display: flex; flex-direction: row; width: 100%; height: auto; margin-bottom: 30px;}
		.main-block .khoi-banner-danh-muc {flex-direction: column;}
		.main-block .danh-muc .list-group-item {width: 100%;}
		.main-block .banner {width: 100%;}
    </style>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div style="width: 90%;" class="content">
    		<div class="danh-muc">
	   			<h5 class="tieu-de list-group">Danh Mục Sản Phẩm</h5>
				<c:forEach items="${listDanhMuc}" var="danhMuc">
					<div class="list-group-item dropdown">
						<div data-toggle="dropdown">${danhMuc.tenDanhMuc}</div>
	  					<div class="dropdown-menu">
							<c:forEach items="${danhMuc.listLoaiSanPham}" var="loaiSanPham">
	   							<li>
	   								<a class="dropdown-item" href="showProductByLoai?maLoai=${loaiSanPham.id}&tenLoai=${loaiSanPham.tenLoaiSanPham}">${loaiSanPham.tenLoaiSanPham}</a>
   								</li>
							</c:forEach>
	  					</div>
	  				</div>
			  	</c:forEach>
	   		</div>
			<div class="chi-tiet-sp">
				<div class="hinh-anh">
					<img src="views/images/${sanPham.anhSanPham.tenHinhAnh}">
				</div>
				<div class="noi-dung">
					<div style="font-size: 25px; font-weight: bold;">${sanPham.tenSanPham}</div>
					<div style="color: #525852;" class="da-ban">Đã bán ${sanPham.daBan}</div>
					<div>Tác giả/Xuất xứ: ${sanPham.tacGia}</div>
					<div>Nhà xuất bản/Nơi sản xuất: ${sanPham.nhaXuatBan}</div>
					<div>
						<c:set var="tien" value="${sanPham.gia*(1 - sanPham.khuyenMai/100.0)}" />
	        			<div style="font-weight: bold; margin-right: 5px; font-size: 23px;">
	        				<c:if test="${sanPham.khuyenMai > 0}">
								<p style="text-decoration: line-through; color: black;">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.gia}"/> đ
								</p>
								<c:set var="thanhTien" value="${sanPham.gia*(1 - sanPham.khuyenMai/100.0)}" />
								<p style="color: #C92127;">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${thanhTien}"/> đ 
									(-<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.khuyenMai}"/>%)
								</p>
							</c:if>
							<c:if test="${sanPham.khuyenMai <= 0}">
								<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.gia}"/> đ</p>
							</c:if>
	        			</div>
	        			<div style="color: #525852;">
	        				<c:set var="tietKiem" value="${sanPham.gia - tien}" />
	        				Tiết kiệm 
	        					<i style="color: red;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${tietKiem}"/> đ</i>
	        			</div>
       				</div>
       				<div style="color: #525852;">Còn <fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.soLuongCo}"/> sản phẩm</div>
       				<form action="addToCart" method="POST">
       					<input type="hidden" name="idProduct" value="${sanPham.id}">
       					<input type="submit" value="THÊM GIỎ HÀNG">
       				</form>
				</div>
			</div>	
			<div class="mo-ta-sp">
				<div style="border-bottom: 1px solid black; margin-bottom: 20px;">
					<h5>Mô tả sản phẩm</h5>
				</div>
				<div>${sanPham.moTa}</div>	
			</div>
			<div class="mo-ta-sp">
				<div class="sach">
					<div style="border-bottom: 1px solid black; margin-bottom: 20px;">
						<h5>Sản phẩm cùng loại</h5>
					</div>
					<div id="sp" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
					    	<div class="carousel-item active">
					    		<div class="san-pham">
						        	<c:forEach items="${listSanPham}" var="sanPham" end="2">		
						        		<a href="showDetailProduct?idProduct=${sanPham.id}" class="card">	   	    	
							        		<img class="hinh-anh" src="views/images/${sanPham.anhSanPham.tenHinhAnh}"></img>
							        		<div class="mo-ta">
								        		<div class="ten-sach">${sanPham.tenSanPham}</div>
								        		<div style="color: #525852;" class="da-ban">Đã bán ${sanPham.daBan}</div>
								        		<div>
								        			<div style="float: left; font-weight: bold; margin-right: 5px; font-size: 17px;" class="gia-tien">
								        				<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.gia}"/> đ
								        			</div>
								        			<div style="color: red;" class="khuyen-mai">
								        				-<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.khuyenMai}"/>%
								        			</div>
						        				</div>
						        			</div>
					        			</a>
									</c:forEach>
								</div>	
					    	</div>
						    <div class="carousel-item">
						      	<div class="san-pham">
						        	<c:forEach items="${listSanPham}" var="sanPham" begin="3" end="${ketThucSP}">		
						        		<a href="showDetailProduct?idProduct=${sanPham.id}" class="card">	   	    	
							        		<img class="hinh-anh" src="views/images/${sanPham.anhSanPham.tenHinhAnh}"></img>
							        		<div class="mo-ta">
								        		<div class="ten-sach">${sanPham.tenSanPham}</div>
								        		<div style="color: #525852;" class="da-ban">Đã bán ${sanPham.daBan}</div>
								        		<div>
								        			<div style="float: left; font-weight: bold; margin-right: 5px; font-size: 17px;" class="gia-tien">
								        				<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.gia}"/> đ
								        			</div>
								        			<div style="color: red;" class="khuyen-mai">
								        				-<fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.khuyenMai}"/>%
								        			</div>
						        				</div>
						        			</div>
					        			</a>
									</c:forEach>
								</div>	
					    	</div>
				    	</div>
				    	<a style="left: -50px; font-size: 30px;" class="carousel-control-prev" href="#sp" role="button" data-slide="prev">
					    	<span style="color: black; float: left;" class="carousel-control-prev-icon" aria-hidden="true"><i class="fas fa-chevron-left"></i></span>
					    	<span class="sr-only">Previous</span>
					  	</a>
					  	<a style="right: -50px; font-size: 30px;" class="carousel-control-next" href="#sp" role="button" data-slide="next">
					    	<span style="color: black; float: right;" class="carousel-control-next-icon" aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
					    	<span class="sr-only">Next</span>
					  	</a>
					</div>
				</div>
			</div>
		</div>	
    </div>
</div>
    
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>