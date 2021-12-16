<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Giỏ hàng</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_user.css"/>
    
    <style>
    	.main-block .danh-muc .tieu-de {width: 100%; padding: 20px 0px 0px 15px;}
  		.main-block .danh-muc {display: flex; flex-direction: row; width: 100%; height: auto; margin-bottom: 30px;}
		.main-block .danh-muc .list-group-item {width: 100%;}
    </style>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div class="content">
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
	    	<c:if test="${! empty sessionScope.cart}">
		    	<c:if test="${sessionScope.cart.matHang.size() gt 0}">
		   	    	<c:set var="tongTien" value="${0}"/>
		   	    	<p style="color: red; margin-left: 60px;">${message}</p>
		   	    	<div class="gio-hang">
					    <table class="bang-sp">
					    	<tr style="margin-bottom: 30px; border-bottom: 5px solid #F0F0F0; padding: 10px;">
					    		<th style="width: 45%; padding-left: 25px;">Sản phẩm</th>
					    		<th style="width: 12%;">Đơn giá</th>
					    		<th style="width: 20%;">Số lượng</th>
					    		<th style="width: 12%;">Thành tiền</th>
					    		<th style="width: 6%;"><i class="far fa-trash-alt"></i></th>
					    	</tr>
							<c:forEach items="${sessionScope.cart.matHang}" var="matHang">
								<tr style="width: 100%; margin-bottom: 30px; border-bottom: 5px solid #F0F0F0;">
									<td style="padding-left: 25px;">
										<a href="showDetailProduct?idProduct=${matHang.sanPham.id}">
											<p>${matHang.sanPham.tenSanPham}</p>
											<img style="margin-left: 20px; width: 150px; height: 150px;" src="views/images/${matHang.sanPham.anhSanPham.tenHinhAnh}"></img>
										</a>
									</td> 
									<td>
										<c:if test="${matHang.sanPham.khuyenMai > 0}">
											<p style="text-decoration: line-through;">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.sanPham.gia}"/> đ
											</p>
											<c:set var="thanhTien" value="${matHang.sanPham.gia*(1 - matHang.sanPham.khuyenMai/100.0)}" />
											<p style="color: #C92127;">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${thanhTien}"/> đ 
												(-<fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.sanPham.khuyenMai}"/>%)
											</p>
										</c:if>
										<c:if test="${matHang.sanPham.khuyenMai <= 0}">
											<p><fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.sanPham.gia}"/> đ</p>
										</c:if>
									</td>
									<td>
										<input class="id" type="hidden" name="id" value="${matHang.sanPham.id}">
										<input class="doi" style="width: 25px; padding: 0px;" type="submit" name="giam" value="-">
										<input class="soLuong" style="display: inline-block;"type="text" name="soLuong" value="${matHang.soLuong}">
										<input class="doi" style="width: 25px; padding: 0px;" type="submit" name="tang" value="+">
									</td>
									<c:set var="tien" value="${matHang.soLuong * matHang.sanPham.gia*(1 - matHang.sanPham.khuyenMai/100.0)}" />
									<c:set var="tongTien" value="${tongTien + tien}" /> 
									<td class="thanh-tien">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${tien}" /> đ						
									</td>
									<td>
										<a style="color: red;" href="updateCart?doi=xoa&id=${matHang.sanPham.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">
											<i class="far fa-trash-alt"></i>
										</a>
									</td>
								</tr>	
							</c:forEach>	
						</table>
						<div class="thanh-toan">
							<div style="height: auto; text-align: center; padding: 10px; background-color: white;">
								<p style="margin-bottom: 20px;">Tiền tạm tính: 
									<b style="color: #d95719; font-size: 20px;">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${tongTien}" /> đ
									</b>
								</p>
								<form action="${root}/showOrder" method="POST">
									<input type="hidden" name="tongTien" value="${tongTien}">
									<input type="submit" value="THANH TOÁN">
								</form>
							</div>
						</div>	
					</div>
				</c:if>
			</c:if>
			<c:if test="${empty sessionScope.cart or sessionScope.cart.matHang.size() eq 0}">
				<div style="margin: 30px 60px 10px 60px; height: 340px; background-color: white; display: flex; justify-content: center; align-items: center; flex-direction: column;">
					<div style="margin-bottom: 30px;">Không có gì trong giỏ hàng cả.</div>
					<a style="display: block;" href="showIndex">Tiếp tục mua sắm</a>
				</div>
			</c:if>
		</div>
	</div>
	
    <%@ include file="include/footer.jsp" %>
    
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
  	 
  	<script type="text/javascript">
  		$(document).ready(function() {
  			$('.soLuong').on('change', function() {
  				var soLuong = $(this).parent().find('.soLuong').val(),
  					id = $(this).parent().find('.id').val(),
  					doi = "nhap";
  				location.href="updateCart?id=" + id + "&soLuong=" + soLuong + "&doi=" + doi;
  			})
  			
  			$('.doi').on('click', function() {
  				var soLuong = $(this).parent().find('.soLuong').val(),
  					id = $(this).parent().find('.id').val(),
  					doi = $(this).attr('name');
  				location.href="updateCart?id=" + id + "&soLuong=" + soLuong + "&doi=" + doi;
  			})
  		});	
  	</script>
  	
</body>
</html>