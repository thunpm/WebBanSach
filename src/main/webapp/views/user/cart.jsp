<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div class="content">
	    	<c:if test="${(! empty sessionScope.cart) and (sessionScope.cart.matHang.size() gt 0)}">
	    	<h5 style="margin-left: 100px;">GIỎ HÀNG</h5>
   	    	<c:set var="tongTien" value="${0}"/>
    		<p style="color: red; margin-left: 60px;">${message}</p>
		    <table class="bang-sp">
		    	<tr style="margin-bottom: 30px; border-bottom: 10px solid #F0F0F0; padding: 10px;">
		    		<th>Sản phẩm</th>
		    		<th style="width: 12%;">Đơn giá</th>
		    		<th style="width: 15%;">Số lượng</th>
		    		<th style="width: 12%;">Thành tiền</th>
		    		<th style="width: 6%;"><i class="far fa-trash-alt"></i></th>
		    	</tr>
				<c:forEach items="${sessionScope.cart.matHang}" var="matHang">
					<tr style="width: 100%; margin-bottom: 30px; border-bottom: 10px solid #F0F0F0;">
						<td>${matHang.sanPham.tenSanPham}</td> 
						<td>${matHang.sanPham.giaString} -${matHang.sanPham.khuyenMaiString}%</td>
						<td>
							<input class="id" type="hidden" name="id" value="${matHang.sanPham.id}">
							<input class="doi" style="width: 25px; padding: 0px;" type="button" name="giam" value="-">
							<input class="soLuong" type="text" name="soLuong" value="${matHang.soLuong}">
							<input class="doi" style="width: 25px; padding: 0px;" type="button" name="tang" value="+">
						</td>
						<!-- thành tiền chỗ ni làm ren đưa cái hàm định dạng dô -->
						<c:set var="tien" value="${matHang.soLuong * matHang.sanPham.gia*(1 - matHang.sanPham.khuyenMai/100.0)}" />
						<c:set var="tongTien" value="${tongTien + tien}" /> 
						<td class="thanh-tien">${tien}</td>
						<td>
							<a style="color: red;" href="updateCart?doi=xoa&id=${matHang.sanPham.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">
								<i class="far fa-trash-alt"></i>
							</a>
						</td>
					</tr>	
				</c:forEach>	
			</table>
			<div class="thanh-toan">
				<div style="height: 100px; margin-bottom: 20px; padding: 10px; background-color: white;">
					<c:if test="${! (empty sessionScope.user) and (sessionScope.user.diaChi.diaChi != null)}">
						<p>Giao hàng về địa chỉ ${sessionScope.user.diaChi.diaChi}, ${sessionScope.user.diaChi.xa}, ${sessionScope.user.diaChi.huyen}, ${sessionScope.user.diaChi.tinh}</p>
					</c:if>
					<c:if test="${(empty sessionScope.user) or (sessionScope.user.diaChi.diaChi == null)}">
						<p>Chưa có địa chỉ giao hàng, vui lòng đăng nhập và cập nhật thông tin về địa chỉ để chúng tôi phục vụ bạn tốt nhất!</p>
					</c:if>
				</div>
				<div style="height: 100px; margin-bottom: 20px; padding: 10px; background-color: white;">
					<p>Tiền tạm tính: ${tongTien}</p>
				</div>
				<a style="cursor: pointer; font-size: 18px; font-weight: bold; background-color: #FAC47C;
					padding: 5px; border: 1px solid #FAC47C; margin-top: 30px; margin-bottom: 30px; color: black; text-decoration: none;" 
					href="showOrder?tongTien=${tongTien}">
					THANH TOÁN
				</a>
			</div>	
			</c:if>
			<c:if test="${(empty sessionScope.cart) or (sessionScope.cart.matHang.size() eq 0)}">
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