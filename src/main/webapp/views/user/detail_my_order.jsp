<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    
    <div style="background-color: white;" class="main-block">
    	<div class="content">
    		<div style="width: 80%; margin: auto; text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">Chi tiết đơn hàng</div>
	    	<c:if test="${! empty listMatHang}">
   		    	<c:set var="tongTien" value="${0}"/>
			    <table class="bang-sp">
			    	<tr style="margin-bottom: 30px; border-bottom: 5px solid #F0F0F0; padding: 10px;">
			    		<th>Sản phẩm</th>
			    		<th style="width: 20%;">Đơn giá</th>
		    			<th style="width: 15%;">Số lượng</th>
		    			<th style="width: 12%;">Thành tiền</th>
			    	</tr>
					<c:forEach items="${listMatHang}" var="matHang">
						<tr style="width: 100%; margin-bottom: 30px; border-bottom: 5px solid #F0F0F0;">
							<td>${matHang.sanPham.tenSanPham}</td> 
							<td>
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.sanPham.gia}"/> đ
								-<fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.sanPham.khuyenMai}"/>%
							</td>
							<td>${matHang.soLuong}</td>
							<c:set var="tien" value="${matHang.soLuong * matHang.sanPham.gia*(1 - matHang.sanPham.khuyenMai/100.0)}" />
							<c:set var="tongTien" value="${tongTien + tien}" /> 
							<td class="thanh-tien">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${tien}"/> đ
							</td>
						</tr>	
					</c:forEach>	
				</table>
				<div style="width: 80%; margin: auto;">
					<p>Tổng tiền phải trả:
						<b style="color: #d95719; font-size: 20px;">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${tongTien}" /> đ
						</b>
					</p>
				</div>
			</c:if>
		</div>
	</div>
	
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>