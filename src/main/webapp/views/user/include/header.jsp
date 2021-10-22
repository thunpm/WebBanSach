<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<div class="header">
   	<div class="logo">
   		<a href="showIndex">NPMT BOOK</a>
   	</div>
   	<div class="find">
		<div class="search-box">
			<form action="searchSanPham" method="POST" onsubmit="return check()">
           		<input id="searchText" type="text" placeholder="Bạn cần tìm gì?" name="searchText" value="${searchText}">
           		<button type="submit" class="fa fa-search"></button>
           	</form>
        </div>
   	</div>
   	<div class="cart">
   		<div style="float: right; position: relative; z-index: 1; top: -7px; left: -10px; background-color: #C92127; width: 22px; height: 23px; padding: 0px 0px 0px 6px; border-radius: 10px;">
   			<c:if test="${empty sessionScope.cart or sessionScope.cart.matHang.size() eq 0}">
   				<p style="font-size: 15px; color: white;">0<p>
   			</c:if>
   			<c:if test="${! empty sessionScope.cart and sessionScope.cart.matHang.size() gt 0}">
   				<p style="font-size: 15px;">${sessionScope.cart.matHang.size()}<p>
   			</c:if>
   		</div>
   		<div style="position: absolute;">
			<a href="showCart">GIỎ HÀNG <span class="fas fa-shopping-cart"></span></a>
		</div>
   	</div>
   	
   	<script type="text/javascript">
   		function check() {
   			var s = document.getElementById('searchText').value;
   			
   			if (s == null || s == "") {
   				return false;
   			}
   			
   			return true;
   		}
   	</script>
</div>