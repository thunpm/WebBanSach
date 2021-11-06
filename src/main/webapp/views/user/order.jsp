<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đặt hàng</title>
    
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div style="background-color: white;" class="main-block">
   		<div class="content">
    		<p style="color: red; display: inline-block; margin: 20px 0px 0px 30px;">${message}</p>
    		<c:if test="${! empty sessionScope.user}">
    			<form action="order" method="post">
	    			<div class="thong-tin-thanh-toan">
		    			<div class="thong-tin-van-chuyen">
					    	<div>
					    		<!-- khúc này chỉ xử lí client cho vui chớ chưa đưa vô cơ sở dữ liệu -->
					    		<h5>1. Chọn hình thức giao hàng</h5>
				    			<input name="giaoHang" type="radio" checked="checked" value="Giao hàng nhanh" onclick="tinhPhiShip()">  Giao hàng nhanh</br>
				    			<input name="giaoHang" type="radio" value="Giao hàng tiết kiệm" onclick="tinhPhiShip()">  Giao hàng tiết kiệm</br>
					    	</div>
					    	<div>
					    		<!-- khúc này chọn cho vui chớ không xử lí gì cả -->
					    		<h5>2. Chọn hình thức thanh toán</h5>
				    			<input name="thanhToan" type="radio" checked="checked" value="Thanh toán khi nhận hàng">  Thanh toán khi nhận hàng</br>
				    			<input name="thanhToan" type="radio" value="Thanh toán qua Momo">  Thanh toán qua Momo</br>
				    			<input name="thanhToan" type="radio" value="Thanh toán qua ZaloPay">  Thanh toán qua ZaloPay</br>
					    	</div>	
					    </div>
						<div class="thong-tin-giao-hang">
							<div class="dia-chi">
				    			<c:set var="diaChiMacDinh" value="${null}" />
								<c:if test="${sessionScope.user.diaChi.size() eq 0}">
									<h5>Địa chỉ</h5>
									<p>Chưa có địa chỉ giao hàng!</p>
									<a href="showKhachHang?key=address">Cập nhật địa chỉ</a>
								</c:if>
								<c:if test="${sessionScope.user.diaChi.size() ne 0}">
									<h5>Địa chỉ</h5>
									<a type="button" href="showKhachHang?key=address">Sửa</a>
									<c:forEach items="${sessionScope.user.diaChi}" var="diaChi">
										<c:if test="${diaChi.macDinh eq 1}">
											<p>${diaChi.diaChi}, ${diaChi.xa}, ${diaChi.huyen}, ${diaChi.tinh}</p>
											<c:set var="diaChiMacDinh" value="${diaChi.id}"></c:set>
										</c:if>
									</c:forEach>
								</c:if>
							</div>
							<div class="thanh-toan">
								<h5>Đơn hàng</h5>
								<a type="button" href="showCart">Xem đơn hàng</a>
								<p>Tiền tạm tính: 
									<i id="tongTien">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${tongTien}"/> đ
									</i>
								</p>
								<!-- <p>Phí ship: <i id="phiShip">30000</i></p> -->
								<p>Tổng thanh toán: 
									<i style="color: #d95719; font-size: 20px; font-weight: bold;" id="tongThanhToan">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${tongTien}"/> đ
									</i>
								</p>
							</div>		
						</div>
					</div>
					<input type="hidden" name="tongTien" value="${tongTien}">
					<input type="hidden" name="tongThanhToan" value="${tongThanhToan}">
					<input type="hidden" name="diaChiMacDinh" value="${diaChiMacDinh}">
					<input type="submit" value="ĐẶT MUA">
				</form>
			</c:if>
		</div>
	</div>
	
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    	function tinhPhiShip() {
    		var listHinhThuc = document.getElementsByName('giaoHang'),
    			tongTien = document.getElementById('tongTien');
    		    phiShip = document.getElementById('phiShip');
    		    tongThanhToan = document.getElementById('tongThanhToan');
    		for (var i = 0; i < listHinhThuc.length; i++) {
    			if (listHinhThuc[i].checked) {
    				if (listHinhThuc[i].value == "Giao hàng nhanh") {
    					phiShip.innerHTML = '30000';
    					tongThanhToan.innerHTML = String(Number(tongTien.innerHTML) + 30000);
    				} else {
    					phiShip.innerHTML = '15000';
    					tongThanhToan.innerHTML = String(Number(tongTien.innerHTML) + 15000);
    				}
    				break;
    			}
    		}
    		
    	}
    </script>
      
</body>
</html>