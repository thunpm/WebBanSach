<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Doanh thu</title>
    
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
			   			<h5 style="margin: auto;">SẢN PHẨM</h5>
			   			<p>Doanh thu từ ${ngay1}/${thang1}/${nam1} đến ${ngay2}/${thang2}/${nam2}</p>
				    	<p style="color: red;">${message}</p>
				    	<div class="">
					    	<c:if test="${(! empty listSanPham)}">
						    	<c:set var="tongTien" value="0" /> 
						    	<c:set var="tongSanPham" value="0" /> 
						    	<form action="" method="post">
								    <table class="">
								    	<tr>
								    		<th>Id hàng hóa</th>
								    		<th style="width: 60%;">Tên sản phẩm</th>
								    		<th>Đã bán</th>
								    		<th>Tiền thu</th>		
								    	</tr>
										<c:forEach items="${listSanPham}" var="thongKe">
											<tr>
												<td>${thongKe.idHangHoa}</td> 
												<td style="width: 60%;">${thongKe.tenSanPham}</td>
												<td>
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${thongKe.daBan}"/>
												</td>
												<td>
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${thongKe.tienThu}"/> đ
												</td>
											</tr>	
											<c:set var="tongTien" value="${tongTien + thongKe.tienThu}" /> 
											<c:set var="tongSanPham" value="${tongSanPham + thongKe.daBan}" /> 
										</c:forEach>	
									</table>
								</form>
								<div>Tổng doanh thu: 
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${tongTien}"/> đ
								</div>
								<div>Tổng sản phẩm đã bán: 
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${tongSanPham}"/> sản phẩm
								</div>
							</c:if>
							<c:if test="${(empty listSanPham)}">
								Không có dữ liệu
							</c:if>
						</div>
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