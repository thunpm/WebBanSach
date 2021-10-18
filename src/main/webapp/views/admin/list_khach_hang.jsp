<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quản lý khách hàng</title>
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
			    	<h5 style="margin: auto">KHÁCH HÀNG</h5>
			    	<p style="color: red;">${message}</p>
					<div class="find">
					<%-- 	<div style="cursor: pointer;" class="dropdown">	
			    			<div style="border: 1px solid black; width: 150px; height: 30px; margin-right: 10px; border-radius: 2px;" data-toggle="dropdown"> 
			    				<p style="float: left; margin: 3px 6px; color: #757575;">${sapXep}</p>
			    				<i style="float: right; padding: 5px; color: #dc3545;" class="fas fa-chevron-circle-down"></i>
			    			</div>
			    			<ul class="dropdown-menu">
			    				<li><a class="dropdown-item" href="${root}/admin/quanLyKhachHang?sapXep=moiNhat">Mới nhất</a></li>
			    				<li><a class="dropdown-item" href="${root}/admin/quanLyKhachHang?sapXep=cuNhat">Cũ nhất</a></li>
			  				</ul>
						</div> --%>
						<div class="search-box">
							<form style="display: flex; flex-direction: row;" action="${root}/admin/quanLyKhachHang/tim" method="POST">
				           		<input type="text" placeholder="Tìm" name="searchText" value="${searchText}">
				           		<button style="padding: 0px 5px 0px 5px;" type="submit" class="fa fa-search btn-danger"></button>
				           	</form>
				        </div>
				   	</div>
			    	<div class="">
					    <table class="">
					    	<tr>
					    		<th>Id</th>
					    		<th>Tên đăng nhập</th>
					    		<!-- <th>Mật khẩu</th> -->
					    		<th>Họ tên</th>
					    		<th>Số điện thoại</th>
					    		<th>Chi tiết</th>
					    		<th>Đặt lại mật khẩu</th>
					    		<th>Xóa</th>
					    	</tr>
				    		<c:if test="${! empty listKhachHang}">
								<c:forEach items="${listKhachHang}" var="khachHang">
									<tr>
										<td>${khachHang.id}</td> 
										<td>${khachHang.tenDangNhap}</td>
										<%-- <td>${khachHang.matKhau}</td> --%>
										<td>${khachHang.hoTen}</td>
										<td>${khachHang.soDienThoai}</td>
										<td>
											<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
	           									Chi tiết
	     				 					</button>
	     				 					<div class="modal" id="myModal">
									        	<div class="modal-dialog">
									        		<div class="modal-content">          
							               				<div class="modal-header">
							                				<h4 class="modal-title">Thông tin khách hàng ${khachHang.id}</h4>
							                				<button type="button" class="close" data-dismiss="modal">&times;</button>
							               				</div>
									        			<div class="modal-body">
															<p>Tên đăng nhập: ${khachHang.tenDangNhap}</p>
															<p>Họ tên       : ${khachHang.hoTen}</p>
															<p>Số điện thoại: ${khachHang.soDienThoai}</p>
															<p>Email        : ${khachHang.email}</p>
															<p>Giới tính    : ${khachHang.gioiTinh}</p>
															<p>Ngày sinh    : ${khachHang.ngaySinh}</p>
															<p>Địa chỉ      : ${khachHang.diaChi.diaChi} - ${khachHang.diaChi.xa} - ${khachHang.diaChi.huyen} - ${khachHang.diaChi.tinh}</p>		
							               				</div>
							               				<div class="modal-footer">
							                  				<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
							               				</div>
							            			</div>
									         	</div>
									      	</div>
	     				 				</td>
										<td>
											<a class="btn btn-danger" href="${root}/admin/quanLyKhachHang/update?idKhachHang=${khachHang.id}">Đặt lại</a>
										</td>
										<td>
											<a class="btn btn-danger" href="${root}/admin/quanLyKhachHang/delete?idKhachHang=${khachHang.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
										</td>
									</tr>	
								</c:forEach>
							</c:if>	
						</table>
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