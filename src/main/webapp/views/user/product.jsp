<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Sản phẩm</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div class="content">
	   		<div style="width: 100%; height: auto; display: flex; justify-content: space-between; margin: 0px 0px 30px 0px;">
	   			<div style="width: 22%; display: flex; flex-direction: column;">
			   		<div style="width: 100%" class="danh-muc">
			   			<h5 class="tieu-de list-group">Danh Mục Sản Phẩm</h5>
						<c:forEach items="${listDanhMuc}" var="danhMuc">
							<div class="list-group-item dropdown dropright">
								<div data-toggle="dropdown">${danhMuc.tenDanhMuc}</div>
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
<%-- 		   			<div id="loc" style="margin-top: 30px; height: auto; background-color: white;">
		   				<form action="showProductByLoai">
		   					<input type="hidden" name="sanPham" value="${sanPham}">
		   					<input type="hidden" name="maLoai" value="${maLoai}">
		   					<input type="hidden" name="tenLoai" value="${tenLoai}">
			   				<div class="loc-item">
				   				<h6>Giá</h6>
								<input type="radio" name="gia" value="0đ - 100,000đ">  0đ - 100,000đ </br>
								<input type="radio" name="gia" value="100,000đ - 200,000đ">  100,000đ - 200,000đ </br>								<input type="radio" name="gia" value="200,000đ - 300,000đ">  200,000đ - 300,000đ </br>
								<input type="radio" name="price" value="400,000đ - Trở lên">  400,000đ - Trở lên </br>
							</div>
							<div class="loc-item">
				   				<h6>Nhà xuất bản</h6>
								<input type="radio" name="nxb" value="NXB Trẻ">  NXB Trẻ </br>
								<input type="radio" name="nxb" value="NXB Phụ nữ">  NXB Phụ nữ </br>
								<input type="radio" name="nxb" value="NXB Kim Đồng">  NXB Kim Đồng </br>
								<input type="radio" name="nxb" value="NXB Tổng hợp TPHCM">  NXB Tổng hợp TPHCM </br>
							</div>
							<input style="margin: 0px; width: 100%;" type="submit" value="Lọc">
						</form>
		   			</div> --%>
	   			</div>
		   		<div class="banner">
		   			 <div class="sach">
				        <div class="tieu-de">
				        	<c:if test="${sanPham eq 'sanPhamMoi'}">
				       			<a style="border-bottom: 2px solid #F08121;" href="showProductByLoai?sanPham=sanPhamMoi&maLoai=${maLoai}&tenLoai=${tenLoai}">Hàng Mới</a>
				       		</c:if>
				       		<c:if test="${sanPham ne 'sanPhamMoi'}">
				       			<a href="showProductByLoai?sanPham=sanPhamMoi&maLoai=${maLoai}&tenLoai=${tenLoai}">Hàng Mới</a>
				       		</c:if>
				       		<c:if test="${sanPham eq 'sanPhamBanChay'}">   
				       			<a style="border-bottom: 2px solid #F08121;" href="showProductByLoai?sanPham=sanPhamBanChay&maLoai=${maLoai}&tenLoai=${tenLoai}">Bán Chạy</a>
				      			</c:if>
				      			<c:if test="${sanPham ne 'sanPhamBanChay'}">   
				       			<a href="showProductByLoai?sanPham=sanPhamBanChay&maLoai=${maLoai}&tenLoai=${tenLoai}">Bán Chạy</a>
				      			</c:if>
				      			<c:if test="${sanPham eq 'sanPhamKhuyenMai'}"> 
				       			<a style="border-bottom: 2px solid #F08121;" href="showProductByLoai?sanPham=sanPhamKhuyenMai&maLoai=${maLoai}&tenLoai=${tenLoai}">Giảm Giá</a>
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
						        			<div style="float: left; font-weight: bold; margin-right: 5px; font-size: 17px;" class="gia-tien">${sanPham.giaString}</div>
						        			<div style="color: red;" class="khuyen-mai">-${sanPham.khuyenMaiString}%</div>
				        				</div>
				        			</div>
				       			</a>
							</c:forEach>
						</div>
			       </div>
		   		</div>
	   		</div>
			<div class="danh-trang">
				<c:if test="${trangHienTai gt 1}">			    	
		        	<a style="color: black;" href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${trangHienTai - 1}&maLoai=${maLoai}&tenLoai=${tenLoai}">Trước</a>
		        </c:if>	
		        <c:forEach items="${listSoTrang}" var="soTrang">
		        	<c:if test="${trangHienTai eq soTrang}">			    	
			        	<a style="color: red;" href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${soTrang}&maLoai=${maLoai}&tenLoai=${tenLoai}">${soTrang}</a>
			        </c:if>		
			        <c:if test="${trangHienTai ne soTrang}">    	
		        		<a href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${soTrang}"&maLoai=${maLoai}&tenLoai=${tenLoai}">${soTrang}</a>
	        		</c:if>
				</c:forEach>
				<c:if test="${trangHienTai lt (tongSoTrang - 1)}">			    	
		        	<a style="color: black;" href="showProductByLoai?sanPham=${sanPham}&trangHienTai=${trangHienTai + 1}"&maLoai=${maLoai}&tenLoai=${tenLoai}">Sau</a>
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