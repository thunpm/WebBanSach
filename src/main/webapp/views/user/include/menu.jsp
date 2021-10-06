<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<div class="menu">
	<div class="menu-item">
		<a href="showIndex">TRANG CHỦ</a>
	</div>
	<div class="menu-item">
		<a href="showIntroduce">GIỚI THIỆU</a>
	</div>
	<div class="menu-item">
		<a href="#">KHUYẾN MÃI</a>
	</div>
	<div class="menu-item">
		<a href="#">TIN TỨC</a>
	</div>
	<div class="menu-item">
   		<c:if test="${!empty sessionScope.user}">
   			<div class="dropdown">
    			<a data-toggle="dropdown" href="#">
    				<label style="font-size: 25px;" class="far fa-user-circle"> ${sessionScope.user.tenDangNhap}</label>
    			</a>
    			<ul class="dropdown-menu">
    				<li><a class="dropdown-item" href="showDonHang">Đơn hàng của tôi</a></li>
    				<li><a class="dropdown-item" href="showKhachHang">Chỉnh sửa thông tin</a></li>
    				<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
  				</ul>
			</div>
   		</c:if>
   		<c:if test="${empty sessionScope.user}">
   			<a href="showLogin">ĐĂNG NHẬP</a>
   		</c:if>
   	</div>
</div>
        