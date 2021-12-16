<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<nav class="menu navbar navbar-expand-lg justify-content-center align-items-center">
	<button class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
		<i style="color: white; font-size: 26px; padding: 6px 0px; background-color: #d95719;" class="fas fa-bars"></i>
	</button>
	<div class="collapse navbar-collapse" id="myNavbar">
		<ul class="navbar-nav">
			<li class="menu-item">
				<a href="showIndex">TRANG CHỦ</a>
			</li>
			<li class="menu-item">
				<a href="showIntroduce">GIỚI THIỆU</a>
			</li>
			<li class="menu-item">
				<a href="showContact">LIÊN HỆ</a>
			</li>
			<li class="menu-item">
				<a href="showNews">TIN TỨC</a>
			</li>
			<li class="menu-item">
		   		<c:if test="${!empty sessionScope.user}">
		   			<div class="dropdown">
		    			<a data-toggle="dropdown" href="#">
		    				<i class="far fa-user-circle"></i> 
		    				${sessionScope.user.tenDangNhap}
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
		   	</li>
	   	</ul>
   	</div>
</nav>
<script>
	function myFunction() {
	  var x = document.getElementById("myMenu");
	  if (x.className === "menu") {
	    x.className += " responsive";
	  } else {
	    x.className = "menu";
	  }
	}
</script>
        