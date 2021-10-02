<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Trang chủ Admin</title>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <div class="main-block">
    	<c:if test="${! empty sessionScope.admin}">
	    	<div class="menu">
	    		<a class="menu-item" href="${root}/admin/trangchu">Trang chủ</a>
	    		<a class="menu-item" href="#"><i class="far fa-bell"></i> Duyệt đơn hàng</a>
	    		<div class="dropdown menu-item">
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
		   			<h5>Chỉnh sửa thể loại</h5>
			    	<p style="color: red;">${message}</p>
			        <form action="${root}/admin/quanLySanPham/updated" method="POST" enctype="multipart/form-data">
			        	<input type="hidden" name="id" value="${sanPham.id}">
			        	<label>Mã sản phẩm:</label>
			        	<input type="text" disabled="disabled" value="${sanPham.id}">
			        	<label>Tên sản phẩm:</label>
			        	<input type="text" name="tenSanPham" value="${sanPham.tenSanPham}">
			        	<label>Hình ảnh:</label>
			        	<input style="border: none;" type="file" name="hinhAnh">
			        	<label>Tác giả:</label>
			        	<input type="text" name="tacGia" value="${sanPham.tacGia}">
			        	<label>Nhà xuất bản:</label>
			        	<input type="text" name="nhaXuatBan" value="${sanPham.nhaXuatBan}">
			        	<label>Giá:</label>
			        	<input type="text" name="gia" value="${sanPham.gia}">
			        	<label>Khuyến mãi:</label>
			        	<input type="text" name="khuyenMai" value="${sanPham.khuyenMai}">
			        	<label>Số lượng có:</label>
			        	<input type="text" name="soLuongCo" value="${sanPham.soLuongCo}">
			        	<label>Mô tả:</label>
			        	<input type="text" name="moTa" value="${sanPham.moTa}">
			        	<label>Thể loại:</label>
			        	<select name="idTheLoai">
			        		<option value="${sanPham.idTheLoai}" label="${sanPham.idTheLoai}"></option>
			        		<c:forEach items="${listTheLoai}" var="theLoai">
			        			<option value="${theLoai.id}" label="${theLoai.id} - ${theLoai.tenLoaiSanPham}"></option>
			        		</c:forEach>
			        	</select>
			        	<input type="submit" value="CHỈNH SỬA">
			        	<input type="reset" value="RESET">
			        </form>
		   		</div>
	   		</div>
   		</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>