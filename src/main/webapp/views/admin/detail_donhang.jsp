<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chi tiết đơn hàng</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
</head>
<body>
    <div class="main-block">
    	<c:if test="${! empty sessionScope.admin}">
	    	<div class="khoi">
	   			<%@ include file="include/danhmuc.jsp" %>
	   			
		   		<div class="content">
		   		
		   			<%@ include file="include/menu.jsp" %>
		   			
			    	<div class="noi-dung">
			   			<c:if test="${detail eq 'matHang'}">
			   			<h5>Chi tiết đơn hàng</h5>
				    	<div class="">
					    	<c:if test="${! empty listMatHang}">
				   		    	<c:set var="tongTien" value="${0}"/>
							    <table style="display: inline-block;">
							    	<tr>
							    		<th>Tên sản phẩm</th>
							    		<th>Giá</th>
							    		<th>Khuyến mãi</th>
							    		<th>Số lượng</th>
							    		<th>Thành tiền</th>
							    	</tr>
									<c:forEach items="${listMatHang}" var="matHang">
										<tr>
											<td>${matHang.sanPham.tenSanPham}</td> 
											<td>
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.donGia}"/> đ
											</td>
											<td>
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.khuyenMai}"/>%
											</td>
											<td>
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${matHang.soLuong}"/>
											</td>
											<c:set var="tien" value="${matHang.soLuong * matHang.donGia*(1 - matHang.khuyenMai/100.0)}" />
											<c:set var="tongTien" value="${tongTien + tien}" /> 
											<td class="thanh-tien">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${tien}"/> đ
											</td>
										</tr>	
									</c:forEach>	
								</table>
							</c:if>
						</div>
						<div style="margin-left: 100px;">
							<p>Tổng tiền phải trả:
								<b style="color: #d95719; font-size: 20px;">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${tongTien}" /> đ
								</b>
							</p>
						</div>
					</c:if>
					<c:if test="${detail eq 'khachHang'}">
						<h5>Thông tin khách hàng</h5>
						<c:forEach items="${khachHang.diaChi}" var="diaChi">
						<c:if test="${diaChi.macDinh eq 1}">
							<i style="display: inline;">Địa chỉ giao hàng: </i>
							<p style="text-overflow: ellipsis;">${diaChi.diaChi} - ${diaChi.xa} - ${diaChi.huyen} - ${diaChi.tinh}</p>
						</c:if>      							
						</c:forEach>
						<table class="">
						    	<tr>
						    		<th>Id</th>
						    		<th>Tên đăng nhập</th>
						    		<th>Họ tên</th>
						    		<th>Số điện thoại</th>
						    		<th>Email</th>
						    		<th>Giới tính</th>
						    		<th>Ngày sinh</th>
						    	</tr>
								<tr>
									<td>${khachHang.id}</td> 
									<td>${khachHang.tenDangNhap}</td>
									<td>${khachHang.hoTen}</td>
									<td>${khachHang.soDienThoai}</td>
									<td>${khachHang.email}</td>
									<td>${khachHang.gioiTinh}</td>
									<td>${khachHang.ngaySinh}</td>
    							</tr>	
							</table>
						</c:if>
			   		</div>
		   		</div>
	   		</div>
   		</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>