<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<div class="header">
   	<div class="logo">
   		<a href="showIndex">NPMT BOOK</a>
   	</div>
   	<div class="find">
		<div class="search-box">
			<form action="searchSanPham" method="POST">
           		<input type="text" placeholder="Bạn cần tìm gì?" name="searchText" value="${searchText}">
           		<button type="submit" class="fa fa-search"></button>
           	</form>
        </div>
   	</div>
   	<div class="cart">
		<a href="showCart">GIỎ HÀNG <span class="fas fa-shopping-cart"></span></a>
   	</div>
</div>