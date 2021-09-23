<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Trang Chủ</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div class="content">
	   		<div class="danh-muc">
	   			<h5 class="tieu-de">Danh Mục Sản Phẩm</h5>
				<c:forEach items="${listDanhMuc}" var="danhMuc">
					<div class="dropdown">
						<div class="ten-danh-muc" data-toggle="dropdown">${danhMuc.tenDanhMuc}</div>
	  					<ul class="dropdown-menu">
							<c:forEach items="${danhMuc.listLoaiSanPham}" var="loaiSanPham">
	   							<li>
	   								<a class="dropdown-item" href="showProductByLoai?maLoai=${loaiSanPham.id}&tenLoai=${loaiSanPham.tenLoaiSanPham}">${loaiSanPham.tenLoaiSanPham}</a>
   								</li>
							</c:forEach>
	  					</ul>
	 				</div>
			  	</c:forEach>
	   		</div>
	        <div class="sach">
		        <div class="tieu-de">
		        	<a href="showIndex?sanPham=sanPhamMoi">Hàng Mới</a>
		        	<a href="showIndex?sanPham=sanPhamBanChay">Bán Chạy</a>
		        	<a href="showIndex?sanPham=sanPhamKhuyenMai">Giảm Giá</a>
		        </div>	 
		        <div class="san-pham">
		        	<c:forEach items="${listSanPham}" var="sanPham" begin="${batDauSP}" end="${ketThucSP}">		
		        		<a href="showDetailProduct?idProduct=${sanPham.id}" class="card">	   	    	
			        		<img class="hinh-anh" src="views/images/${sanPham.anhSanPham.tenHinhAnh}"></img>
			        		<div class="mo-ta">
				        		<div class="ten-sach">${sanPham.tenSanPham}</div>
				        		<div style="color: #525852;" class="da-ban">Đã bán ${sanPham.daBan}</div>
				        		<div>
				        			<div style="float: left; font-weight: bold; margin-right: 5px; font-size: 17px;" class="gia-tien">${sanPham.giaString}</div>
				        			<div style="color: red;" class="khuyen-mai">-${sanPham.khuyenMaiString}%</div>
		        				</div>
		        			</div>
	        			</a>
					</c:forEach>
				</div>
	        </div>
			<div class="danh-trang">
				<c:if test="${trangHienTai gt 1}">			    	
		        	<a style="color: black;" href="showIndex?sanPham=${sapXep}&trangHienTai=${trangHienTai - 1}">Trước</a>
		        </c:if>	
		        <c:forEach items="${listSoTrang}" var="soTrang">
		        	<c:if test="${trangHienTai eq soTrang}">			    	
			        	<a style="color: red;" href="showIndex?sanPham=${sapXep}&trangHienTai=${soTrang}">${soTrang}</a>
			        </c:if>		
			        <c:if test="${trangHienTai ne soTrang}">    	
		        		<a href="showIndex?sanPham=${sapXep}&trangHienTai=${soTrang}">${soTrang}</a>
	        		</c:if>
				</c:forEach>
				<c:if test="${trangHienTai lt (tongSoTrang - 1)}">			    	
		        	<a style="color: black;" href="showIndex?sanPham=${sapXep}&trangHienTai=${trangHienTai + 1}">Sau</a>
		        </c:if>	
			</div>
		</div>
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>