<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
   <title>Quản lý danh mục</title>
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
		   			<h5 style="margin: auto;">DANH MỤC</h5>
			    	<a class="btn btn-warning" href="${root}/admin/quanLyDanhMuc/add">Thêm danh mục</a>
			    	<p style="color: red;">${message}</p>
			    	<div class="">
				    	<c:if test="${! empty listDanhMuc}">
						    <table class="">
						    	<tr>
						    		<th>Id</th>
						    		<th>Tên danh mục</th>
						    		<th>Sửa danh mục</th>
						    		<th>Xóa danh mục</th>
						    	</tr>
								<c:forEach items="${listDanhMuc}" var="danhMuc">
									<tr>
										<td>${danhMuc.id}</td> 
										<td>${danhMuc.tenDanhMuc}</td>
										<td>
											<a class="btn btn-danger" href="${root}/admin/quanLyDanhMuc/update?idDanhMuc=${danhMuc.id}">Sửa</a>
										</td>
										<td>
											<a class="btn btn-danger" href="${root}/admin/quanLyDanhMuc/delete?idDanhMuc=${danhMuc.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
										</td>
									</tr>	
								</c:forEach>	
							</table>
						</c:if>
					</div>
		   		</div>
	   		</div>
   		</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>