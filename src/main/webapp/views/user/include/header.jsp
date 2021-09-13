<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<div class="header">
    <div class="header-2">
    	<div class="logo">NPMT BOOK</div>
    	<div class="find">
    		<div>
    			<div>
                	<input type="text" placeholder="Bạn cần tìm gì?" name="#">
                </div>
                <div>
                	<span class="fa fa-search"></span>
            	</div>
            </div>
    	</div>
    	<div class="cart">
			<a href="#">GIỎ HÀNG <span class="fas fa-shopping-cart"></span></a>
    	</div>
    </div>
</div>