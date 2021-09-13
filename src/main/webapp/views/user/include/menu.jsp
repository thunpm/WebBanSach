<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<div class="menu">
	<div class="trang-chu">
		<a href="showIndex">TRANG CHỦ</a>
	</div>
	<div class="gioi-thieu">
		<a href="#">GIỚI THIỆU</a>
	</div>
	<div class="khuyen-mai">
		<a href="#">KHUYẾN MÃI</a>
	</div>
	<div class="tin-tuc">
		<a href="#">TIN TỨC</a>
	</div>
	<div class="login">
   		<c:if test="${!empty sessionScope.user}">
   			<div class="dropdown">
    			<a data-toggle="dropdown" href="#"><label>CHÀO: ${sessionScope.user.tenDangNhap}</label></a>
    			<ul class="dropdown-menu" style="background-color: #F0F0F0;">
    				<li><a class="dropdown-item" href="#">Đơn hàng của tôi</a></li>
    				<li><a class="dropdown-item" href="showKhachHang?tendangnhap=${sessionScope.user.tenDangNhap}&key=infomation">Chỉnh sửa thông tin</a></li>
    				<li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
  				</ul>
			</div>
   		</c:if>
   		<c:if test="${empty sessionScope.user}">
   			<a href="showLogin">ĐĂNG NHẬP</a>
   		</c:if>
   	</div>
</div>
        