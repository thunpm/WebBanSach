<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Trang chủ Admin</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
    <div class="main-block">
    	<c:if test="${! empty sessionScope.admin}">
	   		<div class="khoi">
	   		
	   			<%@ include file="include/danhmuc.jsp" %>
	   			
		   		<div class="content">
		   		
		   			<%@ include file="include/menu.jsp" %>
		   			<div class="thong-ke-so-luong">
		   				<div class="block"><p style="font-size: 30px;">${tongSanPham}</p><p>Sản phẩm</p></div>
		   				<div class="block"><p style="font-size: 30px;">${tongKhachHang}</p><p>Khách hàng</p></div>
		   				<div class="block"><p style="font-size: 30px;">${tongDonHang}</p><p>Đơn hàng</p></div>
		   				<div class="block"><p style="font-size: 30px;">${tongPhanHoi}</p><p>Phản hồi</p></div>
	   				</div>
	   				<!-- <div class="thong-ke-so-luong">
			   			<div id="columnchart"></div>
		   			</div> -->
		   		</div>
	   		</div>
   		</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
	
	<!-- <script type="text/javascript">
			google.charts.load("current", {packages:['corechart']});
		    google.charts.setOnLoadCallback(drawChart);
		    function drawChart() {
		      var data = google.visualization.arrayToDataTable([
		        ["Thứ", "Doanh thu (VND)", { role: "style" } ],
		        ["Thứ 2", 119982, "color: #5ab1ff;"],
		        ["Thứ 3", 100949, "color: #5ab1ff;"],
		        ["Thứ 4", 198130, "color: #5ab1ff;"],
		        ["Thứ 5", 21045, "color: #5ab1ff;"],
		        ["Thứ 6", 21745, "color: #5ab1ff;"],
		        ["Thứ 7", 10845, "color: #5ab1ff;"],
		        ["Chủ nhật", 11545, "color: #5ab1ff;"]
		      ]);
		
		      var view = new google.visualization.DataView(data);
		      view.setColumns([0, 1,
		                       { calc: "stringify",
		                         sourceColumn: 1,
		                         type: "string",
		                         role: "annotation",
		                         bar: {groupWidth: "95%"} },
		                       2]);
		
		      var options = {
		        title: "Doanh thu tuần hiện tại",
		        width: 900,
		        height: 600,
		        bar: {groupWidth: "95%"},
		        legend: { position: "none" },
		      };
		      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart"));
		      chart.draw(view, options);
		  }
	</script> -->
    
</body>
</html>