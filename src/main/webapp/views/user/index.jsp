<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>TRANG CHỦ</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    <div class="main-block">
        <div class="sach">
        	<h4 class="tieu-de">SÁCH MỚI</h4>
        	<div class="card">
        		<div class="hinh-anh">hinh anh</div>
        		<div class="ten-sach">ten sach</div>
        		<div class="tac-gia">tac gia</div>
        		<div class="da-ban">da ban</div>
        		<div class="gia-tien">gia tien</div>
        		<div class="khuyen-mai">khuyen mai</div>
        	</div>
        </div>
        <div class="sach">
        	<h4 class="tieu-de">SÁCH BÁN CHẠY</h4>
        	<div class="card">
        		<div class="hinh-anh">hinh anh</div>
        		<div class="ten-sach">ten sach</div>
        		<div class="tac-gia">tac gia</div>
        		<div class="da-ban">da ban</div>
        		<div class="gia-tien">gia tien</div>
        		<div class="khuyen-mai">khuyen mai</div>
        	</div>
        </div>
        <div class="sach">
        	<h4 class="tieu-de">SÁCH KHUYẾN MÃI</h4>
        	<div class="card">
        		<div class="hinh-anh">hinh anh</div>
        		<div class="ten-sach">ten sach</div>
        		<div class="tac-gia">tac gia</div>
        		<div class="da-ban">da ban</div>
        		<div class="gia-tien">gia tien</div>
        		<div class="khuyen-mai">khuyen mai</div>
        	</div>
        </div>
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>