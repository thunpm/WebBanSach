<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chi tiết đơn hàng của tôi</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<h5 style="margin-left: 100px;">Chi tiết đơn hàng</h5>
    	<div class="content-gio-hang">
	    	<c:if test="${! empty listMatHang}">
   		    	<c:set var="tongTien" value="${0}"/>
			    <table class="bang-sp">
			    	<tr style="width: 100%; height: 60px; margin-bottom: 30px; border-bottom: 20px solid #F0F0F0;">
			    		<th>Tên sản phẩm</th>
			    		<th>Giá</th>
			    		<th>Khuyến mãi</th>
			    		<th>Số lượng</th>
			    		<th>Thành tiền</th>
			    	</tr>
					<c:forEach items="${listMatHang}" var="matHang">
						<tr style="width: 100%; height: 280px; margin-bottom: 30px; border-bottom: 20px solid #F0F0F0;">
							<td>${matHang.sanPham.tenSanPham}</td> 
							<td>${matHang.sanPham.gia}</td>
							<td>${matHang.sanPham.khuyenMai}</td>
							<td>${matHang.soLuong}</td>
							<c:set var="tien" value="${matHang.soLuong * matHang.sanPham.gia*(1 - matHang.sanPham.khuyenMai/100.0)}" />
							<c:set var="tongTien" value="${tongTien + tien}" /> 
							<td class="thanh-tien">${tien}</td>
						</tr>	
					</c:forEach>	
				</table>
			</c:if>
		</div>
		<div style="margin-left: 100px;">
			<p>Tạm tính: <i>${tongTien}</i></p>
		</div>
	</div>
	
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>