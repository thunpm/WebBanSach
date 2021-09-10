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
    	<div class="login">
    		<c:if test="${!empty sessionScope.user}">
    			<div class="dropdown">
	    			<a data-toggle="dropdown" href="#"><label>CHÀO: ${sessionScope.user.tenDangNhap}</label></a>
	    			<ul class="dropdown-menu" style="background-color: #F0F0F0;">
	    				<li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
	    				<li><a class="dropdown-item" href="showKhachHang?tendangnhap=${sessionScope.user.tenDangNhap}">Chỉnh sửa thông tin</a></li>
	    				<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
	  				</ul>
				</div>
    		</c:if>
    		<c:if test="${empty sessionScope.user}">
    			<a href="showLogin">ĐĂNG NHẬP</a>
    		</c:if>
    	</div>
    </div>
</div>