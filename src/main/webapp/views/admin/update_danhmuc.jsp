<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chỉnh sửa danh mục</title>
    
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
			   			<h5>Chỉnh sửa danh mục</h5>
				    	<p style="color: red;">${message}</p>
				        <form action="${root}/admin/quanLyDanhMuc/updated" method="POST">
				        	<input type="hidden" name="idDanhMuc" value="${danhMuc.id}">
				        	<label>Mã danh mục:</label>
				        	<input type="text" disabled="disabled" value="${danhMuc.id}">
				        	<label>Tên danh mục:</label>
				        	<input type="text" name="tenDanhMuc" value="${danhMuc.tenDanhMuc}">
				        	<input type="submit" value="CHỈNH SỬA">
				        	<input type="reset" value="RESET">
				        </form>
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