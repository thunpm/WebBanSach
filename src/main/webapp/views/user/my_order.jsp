<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đơn hàng của tôi</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<h5 style="margin-left: 100px;">Đơn hàng đã đặt</h5>
    	<div class="content-gio-hang">
	    	<c:if test="${! empty listHoaDon}">
			    <table class="bang-sp">
			    	<tr style="width: 100%; height: 60px; margin-bottom: 30px; border-bottom: 20px solid #F0F0F0;">
			    		<th>Ngày đặt</th>
			    		<th>Trạng thái</th>
			    		<th>Xem chi tiết</th>
			    	</tr>
					<c:forEach items="${listHoaDon}" var="hoaDon">
						<tr style="width: 100%; height: 280px; margin-bottom: 30px; border-bottom: 20px solid #F0F0F0;">
							<td>${hoaDon.thoiGianLap}</td> 
							<td>${hoaDon.trangThai}</td>
							<td>
								<a href="showDetailMyDonHang?idDonHang=${hoaDon.id}">Chi tiết</a>
							</td>
						</tr>	
					</c:forEach>	
				</table>
			</c:if>
			<c:if test="${empty listHoaDon}">
				<div style="width: 1200px; height: 340px; margin: auto; background-color: white; display: flex; justify-content: center; align-items: center; flex-direction: column;">
					<div style="margin-bottom: 30px;">Bạn chưa đặt đơn hàng nào cả!.</div>
					<a style="display: block;" href="showIndex">Mua sắm ngay nào!</a>
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