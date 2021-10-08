<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quản lý hóa đơn</title>
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
	   			<c:choose>
			  		<c:when test="${don eq 'mua'}">
			  			<h5 style="margin: auto;">ĐƠN CHƯA DUYỆT</h5>
			  		</c:when>
			  		<c:when test="${don eq 'huy'}">
			   			<h5 style="margin: auto;">ĐƠN ĐÃ HỦY</h5>
			  		</c:when>
			  		<c:otherwise>
			    		<h5 style="margin: auto;">HÓA ĐƠN</h5>
			  		</c:otherwise>
				</c:choose> 
		    	<p style="color: red;">${message}</p>
		    	<div class="">
			    	<c:if test="${! empty listHoaDon}">
					    <table class="">
					    	<tr>
					    		<th>Id</th>
					    		<th>Khách hàng</th>
					    		<th>Ngày đặt</th>
					    		<th>Trạng thái</th>
					    		<th>Cập nhật</th>
					    		<th>Chi tiết</th>
					    		<th>Thông tin khách</th>
					    		<th>Xóa</th>
					    	</tr>
							<c:forEach items="${listHoaDon}" var="hoaDon">
								<tr>
									<td>${hoaDon.id}</td> 
									<td>${hoaDon.idKhachHang}</td> 
									<td>${hoaDon.thoiGianLap}</td> 
									<td>${hoaDon.trangThai}</td> 
									<td>
										<c:if test='${hoaDon.trangThai eq "Đang chờ xác nhận"}'>
											<%-- <input class="doi btn btn-danger" id="${hoaDon.id}" type="button" value="Xác nhận"> --%>
											<a class="btn btn-danger" href="${root}/admin/quanLyHoaDon/updated?id=${hoaDon.id}&trangThai=2&don=${don}">Xác nhận</a>	
										</c:if>
										<c:if test='${hoaDon.trangThai eq "Đang chuẩn bị hàng"}'>
											<%-- <input class="doi btn btn-danger" id="${hoaDon.id}" type="button" value="Giao cho vận chuyển"> --%>
											<a class="btn btn-danger" href="${root}/admin/quanLyHoaDon/updated?id=${hoaDon.id}&trangThai=3&don=${don}">Giao cho vận chuyển</a>	
										</c:if>	
										<c:if test='${hoaDon.trangThai eq "Đang giao"}'>
											<%-- <input class="doi btn btn-danger" id="${hoaDon.id}" type="button" value="Đã giao"> --%>
											<a class="btn btn-danger" href="${root}/admin/quanLyHoaDon/updated?id=${hoaDon.id}&trangThai=4&don=${don}">Đã giao</a>	
										</c:if>	
									</td>
									<td>
										<a class="btn btn-danger" href="${root}/admin/quanLyHoaDon/detail?idDonHang=${hoaDon.id}&don=${don}">Chi tiết</a>
									</td>
									<td>
										<a class="btn btn-danger" href="${root}/admin/quanLyHoaDon/detail?idKhachHang=${hoaDon.idKhachHang}&don=${don}">Xem</a>
									</td>
									<td>
										<a class="btn btn-danger" href="${root}/admin/quanLyHoaDon/delete?idDonHang=${hoaDon.id}&don=${don}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>																		
									</td>
								</tr>	
							</c:forEach>	
						</table>
					</c:if>
					<c:if test="${empty listHoaDon}">
						Không có đơn nào cả :((
					</c:if>
				</div>
	   		</div>
   		</div>
   	</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- <script type="text/javascript">
  		$(document).ready(function() {
  			$('.doi').on('click', function() {
  				var trangThai = $(this).val(),
  					id = $(this).attr('id');
  				if (trangThai == 'Xác nhận') {
  					trangThai = 'Đang chuẩn bị hàng';
  				} else if (trangThai == 'Giao cho vận chuyển') {
  					trangThai = 'Đang giao';
  				}
  				location.href = location.href + "/updated?id=" + id + "&trangThai=" + trangThai;
  			})
  		});	
  	</script>  -->
    
</body>
</html>