<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Giới thiệu</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div style="background-color: white;" class="main-block">
    	<div class="content">
    		<div style="width: 1000px; background-color: white; margin: auto; padding: 20px;">
				<p><h5><b>Giới Thiệu Nhà Sách Thu</b></h5></p>
				<p>Thu là nhà sách Trực tuyến, đối tác chính thức của hơn 20 công ty, nhà phát hành sách hàng đầu Việt Nam: NXB Trẻ, 
				NXB Kim Đồng, Nhã Nam, Alphabooks, First News,...với số lượng đầu sách đồ sộ được cập nhật liên tục hàng ngày. 
				Ngoài mua sách online tại Thu, bạn còn có rất nhiều lựa chọn quà tặng, văn phòng phẩm,... với giá niêm yết luôn bằng
				 hoặc thấp hơn giá thị trường giúp bạn tiết kiệm rất nhiều thời gian mua sắm.</p>
				<p>Được thành lập từ tháng 9/2021, Thu hy vọng sẽ trở thành sự lựa chọn hàng đầu của quý khách hàng yêu sách trên toàn quốc.</p>
	
				<p><h5><b>Thông Tin Về Thu</b></h5></p>
				<p>- Nhà sách Thu</p>
				<p>- Địa chỉ: 459 Tôn Đức Thắng, Hoà Khánh Nam, Liên Chiểu, Đà Nẵng</p>
				<p>- Email: minhthu20201@gmail.com</p>	
				<p>- Điện thoại: 0898 154 428</p>
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.073937677685!2d108.15693531416977!3d16.061652543908824!
				2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421924682e8689%3A0x48eb0bdbeec05215!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBTxrA
				gUGjhuqFtIC0gxJBIxJBO!5e0!3m2!1svi!2s!4v1634888444663!5m2!1svi!2s" width="100%" height="450" style="border:0;">
				</iframe>
			</div>
		</div>
    </div>
    
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>