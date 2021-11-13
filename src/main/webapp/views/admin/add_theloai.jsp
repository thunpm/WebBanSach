<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Thêm thể loại</title>
    
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
			   			<h5 style="margin: auto">Thêm thể loại</h5>
				    	<p style="color: red;">${message}</p>
				        <form action="${root}/admin/quanLyTheLoai/added" method="POST">	
				        	<label>Tên thể loại:</label>
				        	<input type="text" name="tenTheLoai" value="${tenTheLoai}">
				        	<label>Danh mục:</label>
				        	<select name="idDanhMuc">
				        		<option value="${idDanhMuc}" label="${idDanhMuc}"></option>
				        		<c:forEach items="${listDanhMuc}" var="danhMuc">
				        			<option value="${danhMuc.id}" label="${danhMuc.id} - ${danhMuc.tenDanhMuc}"></option>
				        		</c:forEach>
				        	</select>
				        	<input type="submit" value="THÊM">
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