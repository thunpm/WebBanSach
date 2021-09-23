<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<h5 style="margin-left: 100px;">GIỎ HÀNG</h5>
    	<c:set var="tongTien" value="${0}"/>
    	<div class="content-gio-hang">
	    	<c:if test="${(! empty sessionScope.cart) and (sessionScope.cart.matHang.size() gt 0)}">
	    	<form action="updateCart" method="post">
			    <table class="bang-sp">
			    	<tr style="width: 100%; height: 60px; margin-bottom: 30px; border-bottom: 20px solid #F0F0F0;">
			    		<th style="width: 500px;">Sản phẩm</th>
			    		<th>Đơn giá</th>
			    		<th>Số lượng</th>
			    		<th>Thành tiền</th>
			    		<th><i class="far fa-trash-alt"></i></th>
			    	</tr>
					<c:forEach items="${sessionScope.cart.matHang}" var="matHang">
						<tr style="width: 100%; height: 280px; margin-bottom: 30px; border-bottom: 20px solid #F0F0F0;">
							<td style="width: 500px;">${matHang.sanPham.tenSanPham}</td> 
							<td>${matHang.sanPham.giaString} -${matHang.sanPham.khuyenMaiString}%</td>
							<td>
								<input type="hidden" class="gia" value="${matHang.sanPham.gia}">
								<input type="hidden" class="khuyenMai" value="${matHang.sanPham.khuyenMai}">
								<input style="border: 1px solid black; width: 20px; padding: 0px;" class="doi giam " type="button" value="-">
								<input style="border: 1px solid black; width: 40px; padding-left: 5px;" class="soLuong" max="10" min="1" name="${matHang.sanPham.id}" value="${matHang.soLuong}">
								<input style="border: 1px solid black; width: 20px; padding: 0px;" class="doi tang" type="button" value="+">
							</td>
							<!-- thành tiền chỗ ni làm ren đưa cái hàm định dạng dô -->
							<c:set var="tien" value="${matHang.soLuong * matHang.sanPham.gia*(1 - matHang.sanPham.khuyenMai/100.0)}" />
							<c:set var="tongTien" value="${tongTien + tien}" /> 
							<td class="thanh-tien">${tien}</td>
							<td>
								<a style="color: red;" href="deleteSanPhamFromGioHang?idProduct=${matHang.sanPham.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">
									<i class="far fa-trash-alt"></i>
								</a>
							</td>
						</tr>	
					</c:forEach>	
				</table>
				<!-- cập nhật chỉ là phía client, phải nhấn cập nhật giỏ hàng thì mới thêm vô được, có ổn hay không -->
				<input style="cursor: pointer; font-size: 18px; font-weight: bold; background-color: #FAC47C; margin-left: 100px;
						padding: 5px; border: 1px solid #FAC47C; margin-top: 30px; margin-bottom: 30px; margin: auto;"
						 type="submit" value="CẬP NHẬT GIỎ HÀNG">
			</form>	
			<div class="thanh-toan">
				<div style="height: 200px; margin-bottom: 20px; border-bottom: 10px solid #F0F0F0; padding: 10px; background-color: white;">
					<p>Tiền tạm tính: ${tongTien}</p>
					
					<p>(Quý khách vui lòng ấn cập nhật giỏ hàng trước khi thanh toán!)</p>
				</div>
				<a style="cursor: pointer; font-size: 18px; font-weight: bold; background-color: #FAC47C;
					padding: 5px; border: 1px solid #FAC47C; margin-top: 30px; margin-bottom: 30px; color: black; text-decoration: none;" 
					href="showOrder?tongTien=${tongTien}">
					THANH TOÁN
				</a>
			</div>	
			</c:if>
			<c:if test="${(empty sessionScope.cart) or (sessionScope.cart.matHang.size() eq 0)}">
				<div style="width: 1200px; height: 340px; margin: auto; background-color: white; display: flex; justify-content: center; align-items: center; flex-direction: column;">
					<div style="margin-bottom: 30px;">Không có gì trong giỏ hàng cả.</div>
					<a style="display: block;" href="showIndex">Tiếp tục mua sắm</a>
				</div>
			</c:if>
		</div>
	</div>
	
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
	    $(document).ready(function() {
	   	 	$('.doi').on('click', function() {
	   			var qty = $(this).parent().find('.soLuong'),
	   				gia = parseFloat($(this).parent().find('.gia').val()),
	   				khuyenMai = parseFloat($(this).parent().find('.khuyenMai').val()),
	   				d = parseFloat(qty.val()),
	    	    	min = parseFloat(qty.attr('min')),
	    	    	max = parseFloat(qty.attr('max')),
	    	    	tienTruoc = parseFloat($(this).parent().parent().find('.thanh-tien').text()),
	    	    	tongTienTruoc = parseFloat($('#tong-tien').text()),
	    	    	tienSau = 0;
	   	    	if ($(this).hasClass('giam')) {
	    	    	if (d > min) { 
	    	    		d -= 1;
	    	    		tienSau = -(gia - gia*khuyenMai/100.0);
	    	    	}
	 	    	} else if ($(this).hasClass('tang')) {
	    	      	if (d < max) {
	    	      		d += 1;
	    	      		tienSau = (gia - gia*khuyenMai/100.0);
	   	    		}
	 	    	}
	   	    	$(this).parent().find('.soLuong').val(d);
	   	    	$(this).parent().parent().find('.thanh-tien').text(tienTruoc + tienSau);
	   	    	$('#tong-tien').text(tongTienTruoc + tienSau);
	    	})
	    });
    </script>
    
</body>
</html>