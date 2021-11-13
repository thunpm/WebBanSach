<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Thống kê doanh thu</title>
    
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
			   			<div id="acc">
			   				<h5 style="margin: auto">THỐNG KÊ DOANH THU</h5>
			   				<p style="color: red;">${message}</p>
					   		 <form action="${root}/admin/thongKe/doanhThu" method="POST">
					   		 	<p>Ngày bắt đầu</p>
					   		 	<div class="ngay">
						   		 	<div class="nhap">
						   		 		<label>Ngày: </label>
							   		 	<select name="ngay1">
							        		<option value="${day1}" label="${day1}"></option>
							        		<c:forEach begin="1" end="31" var="dayy">
							        			<option value="${dayy}" label="${dayy}"></option> 
							        		</c:forEach>
							        	</select>
						   		 	</div>
						   		 	<div class="nhap">
							        	<label>Tháng: </label>
							        	<select name="thang1" class="nhap">
							        		<option value="${month1}" label="${month1}"></option>
							        		<c:forEach begin="1" end="12" var="monthh">
							        			<option value="${monthh}" label="${monthh}"></option>
							        		</c:forEach>
							        	</select>
						        	</div>
						        	<%
							        	Date date = new Date();
						        		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
						        		int y = Integer.valueOf(formatter.format(date));
						        		System.out.print(y);
						        	%>
						        	<div class="nhap">
							        	<label>Năm: </label>
							        	<select name="nam1" class="nhap">
							        		<option value="${year1}" label="${year1}"></option>
							        		<option value="2021" label="2021"></option>
							        		<c:forEach begin="2019" end="${y}" var="yearr">
							        			<option value="${yearr}" label="${yearr}"></option>
							        		</c:forEach>
							        	</select>
						        	</div>
						        </div>
						   		<p>Ngày kết thúc</p>
						        <div class="ngay">
						        	<div class="nhap">
							        	<label>Ngày: </label>
							        	<select name="ngay2" class="nhap">
							        		<option value="${day2}" label="${day2}"></option>
							        		<c:forEach begin="1" end="31" var="dayy">
							        			<option value="${dayy}" label="${dayy}"></option> 
							        		</c:forEach>
							        	</select>
						        	</div>
						        	<div class="nhap">
							        	<label>Tháng: </label>
							        	<select name="thang2" class="nhap">
							        		<option value="${month2}" label="${month2}"></option>
							        		<c:forEach begin="1" end="12" var="monthh">
							        			<option value="${monthh}" label="${monthh}"></option>
							        		</c:forEach>
							        	</select>
							        </div>
							        <div class="nhap">
							        	<label>Năm: </label>
							        	<select name="nam2" class="nhap">
							        		<option value="${year2}" label="${year2}"></option>
							        		<option value="2021" label="2021"></option>
							        		<c:forEach begin="2019" end="${y}" var="yearr">
							        			<option value="${yearr}" label="${yearr}"></option>
							        		</c:forEach>
							        	</select>
							        </div>
						        </div>
					        	<input type="submit" value="XEM">
					        	<input type="reset" value="RESET">
					   		 </form>
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