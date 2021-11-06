<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Trang Chủ</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_user.css"/>
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
						<div class="list-group-item dropdown dropright">
							<div data-toggle="dropdown">${danhMuc.tenDanhMuc}</div>
		  					<div class="dropdown-menu">
								<c:forEach items="${danhMuc.listLoaiSanPham}" var="loaiSanPham">
		   							<div>
		   								<a class="dropdown-item" href="showProductByLoai?maLoai=${loaiSanPham.id}&tenLoai=${loaiSanPham.tenLoaiSanPham}">${loaiSanPham.tenLoaiSanPham}</a>
	   								</div>
								</c:forEach>
		  					</div>
		  				</div>
				  	</c:forEach>
		   		</div>
		   		<div class="banner">
		   			<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
					    	<div class="carousel-item active">
					        	<img src="${root}/views/images/common/banner1.jpg" class="d-block w-100">
					    	</div>
						    <div class="carousel-item">
						      	<img src="${root}/views/images/common/banner2.jpg" class="d-block w-100">
					    	</div>
						    <div class="carousel-item">
						      	<img src="${root}/views/images/common/banner3.jpg" class="d-block w-100">
						    </div>
						</div>
					</div>
		   		</div>
	   		</div>
	        <div class="sach">
		        <div class="tieu-de">
		        	<div class="name">TẤT CẢ SẢN PHẨM</div>
		        	<c:if test="${sanPham eq 'sanPhamMoi'}">    
		        		<a style="border-bottom: 2px solid #d95719;" href="showIndex?sanPham=sanPhamMoi">Hàng Mới</a>
		        	</c:if>
		        	<c:if test="${sanPham ne 'sanPhamMoi'}">    
		        		<a href="showIndex?sanPham=sanPhamMoi">Hàng Mới</a>
		        	</c:if>
		        	<c:if test="${sanPham eq 'sanPhamBanChay'}">    
		        		<a style="border-bottom: 2px solid #d95719;" href="showIndex?sanPham=sanPhamBanChay">Bán Chạy</a>
	        		</c:if>
	        		<c:if test="${sanPham ne 'sanPhamBanChay'}">    
		        		<a href="showIndex?sanPham=sanPhamBanChay">Bán Chạy</a>
	        		</c:if>
	        		<c:if test="${sanPham eq 'sanPhamKhuyenMai'}"> 
		        		<a style="border-bottom: 2px solid #d95719;" href="showIndex?sanPham=sanPhamKhuyenMai">Giảm Giá</a>
	        		</c:if>
	        		<c:if test="${sanPham ne 'sanPhamKhuyenMai'}"> 
		        		<a href="showIndex?sanPham=sanPhamKhuyenMai">Giảm Giá</a>
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
	        				<li class="page-item"><a class="page-link" href="showIndex?sanPham=${sanPham}&trangHienTai=${trangHienTai - 1}"><i class="fas fa-chevron-left"></i></a></li>
	        			</c:if>	
	        			<c:forEach items="${listSoTrang}" var="soTrang">
	        				<c:if test="${trangHienTai eq soTrang}">			    	
		        				<li class="page-item"><a class="page-link" style="color: red;" href="showIndex?sanPham=${sanPham}&trangHienTai=${soTrang}">${soTrang}</a></li>
		        			</c:if>		
		        			<c:if test="${trangHienTai ne soTrang}">    	
	        					<li class="page-item"><a class="page-link" href="showIndex?sanPham=${sanPham}&trangHienTai=${soTrang}">${soTrang}</a></li>
        					</c:if>
						</c:forEach>
						<c:if test="${trangHienTai lt (tongSoTrang - 1)}">			    	
	        				<li class="page-item"><a class="page-link" href="showIndex?sanPham=${sanPham}&trangHienTai=${trangHienTai + 1}"><i class="fas fa-chevron-right"></i></a></li>
	        			</c:if>	
	        		</ul>
				</div>
	        </div>
		</div>	
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>