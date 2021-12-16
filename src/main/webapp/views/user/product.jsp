<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Sản phẩm</title>
    
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
    	<div class="content">
	   		<div class="khoi-banner-danh-muc" style="width: 100%; height: auto; display: flex; justify-content: space-between; margin: 0px 0px 30px 0px;">
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
		   		<div class="banner">
		   			<div class="ten-danh-muc"></div>
		   			<div class="sach">
				        <div class="tieu-de">
				        	<div class="name">
				        		${tenLoai}
				        		<div class="label-name"></div>
				        	</div>
				        	<c:if test="${sanPham eq 'sanPhamMoi'}">    
				        		<a style="border-bottom: 2px solid #d95719;" href="showProductByLoai?sanPham=sanPhamMoi&maLoai=${maLoai}&tenLoai=${tenLoai}">Hàng Mới</a>
				        	</c:if>
				        	<c:if test="${sanPham ne 'sanPhamMoi'}">    
				        		<a href="showProductByLoai?sanPham=sanPhamMoi&maLoai=${maLoai}&tenLoai=${tenLoai}">Hàng Mới</a>
				        	</c:if>
				        	<c:if test="${sanPham eq 'sanPhamBanChay'}">    
				        		<a style="border-bottom: 2px solid #d95719;" href="showProductByLoai?sanPham=sanPhamBanChay&maLoai=${maLoai}&tenLoai=${tenLoai}">Bán Chạy</a>
			        		</c:if>
			        		<c:if test="${sanPham ne 'sanPhamBanChay'}">    
				        		<a href="showProductByLoai?sanPham=sanPhamBanChay&maLoai=${maLoai}&tenLoai=${tenLoai}">Bán Chạy</a>
			        		</c:if>
			        		<c:if test="${sanPham eq 'sanPhamKhuyenMai'}"> 
				        		<a style="border-bottom: 2px solid #d95719;" href="showProductByLoai?sanPham=sanPhamKhuyenMai&maLoai=${maLoai}&tenLoai=${tenLoai}">Giảm Giá</a>
			        		</c:if>
			        		<c:if test="${sanPham ne 'sanPhamKhuyenMai'}"> 
				        		<a href="showProductByLoai?sanPham=sanPhamKhuyenMai&maLoai=${maLoai}&tenLoai=${tenLoai}">Giảm Giá</a>
			        		</c:if>
				       	</div>	
				        <div class="san-pham">
			        		<c:forEach items="${listSanPham}" var="sanPham" begin="${batDauSP}" end="${ketThucSP}">		
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
						<div class="danh-trang">
							<ul class="pagination justify-content-center">
								<c:if test="${trangHienTai gt 1}">			    	
		        					<li class="page-item"><a class="page-link" style="color: black;" href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${trangHienTai - 1}&maLoai=${maLoai}&tenLoai=${tenLoai}"><i class="fas fa-chevron-left"></i></a></li>
		        				</c:if>	
		        				<c:forEach items="${listSoTrang}" var="soTrang">
		        					<c:if test="${trangHienTai eq soTrang}">			    	
			        					<li class="page-item"><a class="page-link" style="color: red;" href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${soTrang}&maLoai=${maLoai}&tenLoai=${tenLoai}">${soTrang}</a></li>
			        				</c:if>		
			        				<c:if test="${trangHienTai ne soTrang}">    	
		        						<li class="page-item"><a class="page-link" href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${soTrang}"&maLoai=${maLoai}&tenLoai=${tenLoai}">${soTrang}</a></li>
	        						</c:if>
								</c:forEach>
								<c:if test="${trangHienTai lt (tongSoTrang - 1)}">			    	
		        					<li class="page-item"><a class="page-link" style="color: black;" href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${trangHienTai + 1}"&maLoai=${maLoai}&tenLoai=${tenLoai}"><i class="fas fa-chevron-right"></i></a></li>
		        				</c:if>
		        			</ul>	
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