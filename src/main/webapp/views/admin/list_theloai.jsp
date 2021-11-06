<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quản lý thể loại</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
</head>
<body>
    <div class="main-block">
    	<c:if test="${! empty sessionScope.admin}">
	    	<div class="khoi">
	   			<div class="danh-muc list-group">
	   				<div class="muc-quan-ly">TRANG QUẢN LÝ</div>
			   		<a class="list-group-item" href="${root}/admin/quanLyKhachHang">Quản lý khách hàng</a>
			   		<a class="list-group-item" href="${root}/admin/quanLyDanhMuc">Quản lý danh mục</a>
			   		<a class="list-group-item" href="${root}/admin/quanLyTheLoai">Quản lý thể loại</a>
			   		<a class="list-group-item" href="${root}/admin/quanLySanPham">Quản lý sản phẩm</a>
			   		<a class="list-group-item" href="${root}/admin/quanLyHoaDon">Quản lý hóa đơn</a>
			   		<a class="list-group-item" href="${root}/admin/thongKe">Thống kê</a>
			   		<a class="list-group-item" href="${root}/admin/phanHoi">Phản hồi của khách</a>
		   		</div>
		   		<div class="content">
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
			    	<div class="noi-dung">
			   			<h5 style="margin: auto; margin-bottom: 50px;">THỂ LOẠI</h5>
				    	<p style="color: red;">${message}</p>
				    	<div class="find">
							<a class="btn btn-warning" href="${root}/admin/quanLyTheLoai/add">Thêm thể loại</a>
							<div class="search-box">
				           		<input id="search" type="text" placeholder="Tìm" name="searchText" value="${searchText}">
					           	<button style="padding: 0px 9px 0px 9px;" type="button" class="fa fa-search btn-warning"></button>
					        </div>
					   	</div>
				    	<div class="">
					    	<c:if test="${! empty listDanhMuc}">
							    <table id="myTable">
							    	<tr>
							    		<th>Id</th>
							    		<th>Tên thể loại</th>
							    		<th>Danh mục</th>
							    		<th>Sửa danh mục</th>
							    		<th>Xóa danh mục</th>
							    	</tr>
									<c:forEach items="${listDanhMuc}" var="danhMuc">
										<c:forEach items="${danhMuc.listLoaiSanPham}" var="loaiSanPham">
											<tr class="hang">
												<td>${loaiSanPham.id}</td> 
												<td>${loaiSanPham.tenLoaiSanPham}</td>
												<td>${danhMuc.tenDanhMuc}</td>
												<td>
													<a class="btn btn-danger" href="${root}/admin/quanLyTheLoai/update?idTheLoai=${loaiSanPham.id}">Sửa</a>
												</td>
												<td>
													<a class="btn btn-danger" href="${root}/admin/quanLyTheLoai/delete?idTheLoai=${loaiSanPham.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
												</td>
											</tr>	
										</c:forEach>
									</c:forEach>	
								</table>
							</c:if>
						</div>
					</div>
		   		</div>
	   		</div>
   		</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
    <script>
    	$(document).ready(function() {
   			$('#search').on('keyup', function() {
      			var tukhoa = $(this).val().toLowerCase();
      			/* filter: loc cac thanh phan */
      			$('#myTable .hang').filter(function() {
      				/* toggle hiển thị và ẩn thành phần
      				indexOf tra ve vi tri dau tien tim thay, khong tim thay tra ve -1 */
         			$(this).toggle($(this).text().toLowerCase().indexOf(tukhoa) > -1);
      			});
  		 	});
		});
   	</script>
</body>
</html>