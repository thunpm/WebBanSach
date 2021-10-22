<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Tìm kiếm sản phẩm</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div class="content">
    		<c:if test="${! empty listSanPham}">
		        <div class="sach">
			        <div class="tieu-de">
		        		Kết quả tìm kiếm
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
		        </div>
				<div class="danh-trang">
					<c:if test="${trangHienTai gt 1}">			    	
			        	<a style="color: black;" href="searchSanPham?searchText=${sapXep}&trangHienTai=${trangHienTai - 1}">Trước</a>
			        </c:if>	
			        <c:forEach items="${listSoTrang}" var="soTrang">
			        	<c:if test="${trangHienTai eq soTrang}">			    	
				        	<a style="color: red;" href="searchSanPham?searchText=${sapXep}&trangHienTai=${trangHienTai - 1}">${soTrang}</a>
				        </c:if>		
				        <c:if test="${trangHienTai ne soTrang}">    	
			        		<a href="searchSanPham?searchText=${sapXep}&trangHienTai=${trangHienTai - 1}">${soTrang}</a>
		        		</c:if>
					</c:forEach>
					<c:if test="${trangHienTai lt (tongSoTrang - 1)}">			    	
			        	<a style="color: black;" href="searchSanPham?searchText=${sapXep}&trangHienTai=${trangHienTai - 1}">Sau</a>
			        </c:if>	
				</div>
			</c:if>
			<c:if test="${empty listSanPham}">
				<div style="width: 1200px; height: 340px; margin: auto; background-color: white; display: flex; justify-content: center; align-items: center; flex-direction: column;">
					<div style="margin-bottom: 30px;">Không tìm thấy kết quả nào.</div>
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