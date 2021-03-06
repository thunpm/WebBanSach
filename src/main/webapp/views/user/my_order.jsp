<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đơn hàng của tôi</title>
    
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div style="background-color: white;" class="main-block">
    	<div style="width: 70%;" class="content">
    		<div style="margin-bottom: 30px;" class="name">ĐƠN HÀNG CỦA TÔI</div>
	    	<c:if test="${! empty listHoaDon}">
			    <table style="width: 100%; margin: 0px;"class="bang-sp">
			    	<tr style="margin-bottom: 30px; border-bottom: 5px solid #F0F0F0; padding: 10px;">
			    		<th>Ngày đặt</th>
			    		<th>Trạng thái</th>
			    		<th>Xem chi tiết</th>
			    		<th>Hủy đơn</th>
			    	</tr>
					<c:forEach items="${listHoaDon}" var="hoaDon">
						<tr style="width: 100%; margin-bottom: 30px; border-bottom: 5px solid #F0F0F0;">
							<td>${hoaDon.thoiGianLap}</td> 
							<td>${hoaDon.trangThai}</td>
							<td>
								<a href="showDetailDonHang?idDonHang=${hoaDon.id}">Chi tiết</a>
							</td>
							<c:if test='${hoaDon.trangThai ne "Đang giao" and hoaDon.trangThai ne "Đã hủy" and hoaDon.trangThai ne "Đã giao"}'>
			    				<td>
									<a href="updateDonHang?idDonHang=${hoaDon.id}">Hủy đơn</a>
								</td>
			    			</c:if>
						</tr>	
					</c:forEach>	
				</table>
			</c:if>
			<c:if test="${empty listHoaDon}">
				<div style="margin: 30px 60px 10px 60px; height: 340px; background-color: white; display: flex; justify-content: center; align-items: center; flex-direction: column;">
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