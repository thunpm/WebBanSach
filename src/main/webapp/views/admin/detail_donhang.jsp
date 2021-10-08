<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <div class="main-block">
    	<c:if test="${! empty sessionScope.admin}">
	    	<div class="menu">
	    		<a class="menu-item" href="${root}/admin/trangchu">Trang chủ</a>
	    		<div style="cursor: pointer;" class="dropdown menu-item">
	    			<a data-toggle="dropdown">
	    				<i class="far fa-bell"></i> Duyệt đơn hàng
	    			</a>
	    			<ul class="dropdown-menu">
	    				<li><a class="dropdown-item" href="${root}/admin/quanLyHoaDon?don=mua">Đơn mua mới</a></li>
	    				<li><a class="dropdown-item" href="${root}/admin/quanLyHoaDon?don=huy">Đơn hủy mới</a></li>
	  				</ul>
				</div>
	    		<div style="cursor: pointer;" class="dropdown menu-item">
	    			<a data-toggle="dropdown">
	    				<i class="fas fa-user-shield"></i> ${sessionScope.admin.tenDangNhap}
	    			</a>
	    			<ul class="dropdown-menu">
	    				<li><a class="dropdown-item" href="${root}/admin/showAdmin">Thông tin Admin</a></li>
	    				<li><a class="dropdown-item" href="${root}/admin/logoutAdmin">Đăng xuất</a></li>
	  				</ul>
				</div>
	    	</div>
	   		<div class="khoi">
	   			<div class="danh-muc list-group">
			   		<a class="list-group-item" href="${root}/admin/quanLyKhachHang">Quản lý khách hàng</a>
			   		<a class="list-group-item" data-toggle="collapse" href=".quan">Quản lý sản phẩm</a>
			   		<a style="margin: 20px 0px 10px 40px; border-right: 1px solid #F0F0F0" class="collapse quan" href="${root}/admin/quanLyDanhMuc">Quản lý danh mục</a>
			   		<a style="margin: 10px 0px 10px 40px; border-right: 1px solid #F0F0F0" class="collapse quan" href="${root}/admin/quanLyTheLoai">Quản lý thể loại</a>
			   		<a style="margin: 10px 0px 20px 40px; border-right: 1px solid #F0F0F0" class="collapse quan" href="${root}/admin/quanLySanPham">Quản lý sản phẩm</a>
			   		<a class="list-group-item" href="${root}/admin/quanLyHoaDon">Quản lý hóa đơn</a>
			   		<a class="list-group-item" href="${root}/admin/thongKe">Thống kê</a>
		   		</div>
		   		<div class="content">
		   			<c:if test="${detail eq 'matHang'}">
			   			<h5>Chi tiết đơn hàng</h5>
				    	<div class="">
					    	<c:if test="${! empty listMatHang}">
				   		    	<c:set var="tongTien" value="${0}"/>
							    <table style="display: inline-block;">
							    	<tr>
							    		<th>Tên sản phẩm</th>
							    		<th>Giá</th>
							    		<th>Khuyến mãi</th>
							    		<th>Số lượng</th>
							    		<th>Thành tiền</th>
							    	</tr>
									<c:forEach items="${listMatHang}" var="matHang">
										<tr>
											<td>${matHang.sanPham.tenSanPham}</td> 
											<td>${matHang.sanPham.gia}</td>
											<td>${matHang.sanPham.khuyenMai}</td>
											<td>${matHang.soLuong}</td>
											<c:set var="tien" value="${matHang.soLuong * matHang.sanPham.gia*(1 - matHang.sanPham.khuyenMai/100.0)}" />
											<c:set var="tongTien" value="${tongTien + tien}" /> 
											<td class="thanh-tien">${tien}</td>
										</tr>	
									</c:forEach>	
								</table>
							</c:if>
						</div>
						<div style="margin-left: 100px;">
							<p>Tạm tính: <i>${tongTien}</i></p>
						</div>
					</c:if>
					<c:if test="${detail eq 'khachHang'}">
						<h5>Thông tin khách hàng</h5>
						<table class="">
						    	<tr>
						    		<th>Id</th>
						    		<th>Tên đăng nhập</th>
						    		<th>Họ tên</th>
						    		<th>Số điện thoại</th>
						    		<th>Email</th>
						    		<th>Giới tính</th>
						    		<th>Ngày sinh</th>
						    		<th>Địa chỉ</th>
						    	</tr>
								<tr>
									<td>${khachHang.id}</td> 
									<td>${khachHang.tenDangNhap}</td>
									<td>${khachHang.hoTen}</td>
									<td>${khachHang.soDienThoai}</td>
									<td>${khachHang.email}</td>
									<td>${khachHang.gioiTinh}</td>
									<td>${khachHang.ngaySinh}</td>
									<td>${khachHang.diaChi.diaChi}, ${khachHang.diaChi.xa}, ${khachHang.diaChi.huyen}, ${khachHang.diaChi.tinh}</td>
								</tr>	
							</table>
					</c:if>
		   		</div>
	   		</div>
   		</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>