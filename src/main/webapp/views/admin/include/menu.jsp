<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="menu">
	<div class="menu-item">
		<a href="${root}/admin/trangchu">Trang chủ</a>
	</div>
	<div style="cursor: pointer;" class="dropdown menu-item">
		<a data-toggle="dropdown"> <i class="far fa-bell"></i> Duyệt đơn hàng
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item"
				href="${root}/admin/quanLyHoaDon?don=mua">Đơn mua mới</a></li>
			<li><a class="dropdown-item"
				href="${root}/admin/quanLyHoaDon?don=huy">Đơn hủy mới</a></li>
		</ul>
	</div>
	<div style="cursor: pointer;" class="dropdown menu-item">
		<a data-toggle="dropdown"> <i class="fas fa-user-shield"></i>
			${sessionScope.admin.tenDangNhap}
		</a>
		<ul class="dropdown-menu">
			<li><a class="dropdown-item" href="${root}/admin/showAdmin">Thông tin Admin</a></li>
			<li><a class="dropdown-item" href="${root}/admin/logoutAdmin">Đăng xuất</a></li>
		</ul>
	</div>
</div>