<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Đặt hàng</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div class="main-block">
    	<div class="thong-tin-thanh-toan">
    		<c:if test="${! empty sessionScope.user}">
	    		<p style="color: red; display: inline-block; margin-bottom: 20px;">${message}</p>
		    	<form action="order" method="post">
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
			    	<div class="thanh-toan">
						<div style="height: 200px; margin: 20px; border-top: 10px solid #F0F0F0; border-bottom: 10px solid #F0F0F0; padding: 10px; background-color: white;">
							<p>Tiền tạm tính: <i id="tongTien">${tongTien}</i></p>
							<!-- <p>Phí ship: <i id="phiShip">30000</i></p> -->
							<p>Tổng thanh toán: <i id="tongThanhToan">${tongTien + 30000}</i></p>
						</div>
						<input type="submit" value="ĐẶT MUA">
					</div>		
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