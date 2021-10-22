<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Trang chủ Admin</title>
   	<meta name="viewport" content="width=device-width, initial-scale=1">
   	<link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
  	<link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
  	
  	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
   
  	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
  	<script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>
 
  	<script>
    	$(document).ready(function(){
     
    	// Cấu hình các nhãn phân trang
    		$('#example').dataTable({
        		"language": {
        			"sProcessing":   "Đang xử lý...",
        			"sLengthMenu":   "Số sản phẩm trên một trang _MENU_",
        			"sZeroRecords":  "Không tìm thấy dòng nào phù hợp",
        			"sInfo":         "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
        			"sInfoEmpty":    "Đang xem 0 đến 0 trong tổng số 0 mục",
        			"sInfoFiltered": "(được lọc từ _MAX_ mục)",
        			"sInfoPostFix":  "",
        			"sSearch":       "Tìm",
        			"sUrl":          "",
        			"oPaginate": {
	            		"sFirst":    "Đầu",
	            		"sPrevious": "Trước",
	            		"sNext":     "Sau",
	            		"sLast":     "Cuối"
            		}
        		},
        		"processing": true, // tiền xử lý trước
        		"aLengthMenu": [[10, 15, 20, 25], [10, 15, 20, 25]], // danh sách số trang trên 1 lần hiển thị bảng
        		"order": [[ 1, 'asc' ]] //sắp xếp tăng dần theo cột thứ 1
    		});     
    	}); 
  	</script>   
  	<style type="text/css">
  		.content select, .content input[type="search"]{
  			    width: 200px;
    			height: 31px;
    			margin: 10px 0px 10px 5px;
    			padding: 0px;
  		}
  	</style>
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
		   			<h5 style="margin: auto;">SẢN PHẨM</h5>
			    	<a class="btn btn-warning" href="${root}/admin/quanLySanPham/add">Thêm sản phẩm</a>
			    	<p style="color: red;">${message}</p>
			    	<div class="">
				    	<c:if test="${! empty listSanPham}">
						    <table id="example">
						    	<thead>
							    	<tr>
							    		<th>Id</th>
							    		<th>Tên sản phẩm</th>
									   	<th>Hình ảnh</th>						 
							    		<th>Chi tiết</th>
							    		<th>Sửa</th>
							    		<th>Xóa</th>
							    	</tr>
						    	</thead>
 								<tbody>
									<c:forEach items="${listSanPham}" var="sanPham">
										<tr>
											<td>${sanPham.id}</td> 
											<td>${sanPham.tenSanPham}</td>
											<td><img style="width:200px; height:150px;" src="${root}/views/images/${sanPham.anhSanPham.tenHinhAnh}"></td>
											<td>
												<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#myModal">
		           									Chi tiết
		     				 					</button>
		     				 					<div class="modal" id="myModal">
										        	<div class="modal-dialog">
										        		<div class="modal-content">          
								               				<div class="modal-header">
								                				<h4 class="modal-title">Thông tin sản phẩm ${sanPham.id}</h4>
								                				<button type="button" class="close" data-dismiss="modal">&times;</button>
								               				</div>
										        			<div class="modal-body">															
																<p>Tên sản phẩm: ${sanPham.tenSanPham}</p>
																<p>Hình ảnh: <img style="width:200px; height:150px;" src="${root}/views/images/${sanPham.anhSanPham.tenHinhAnh}"></p>
																<p>Tác giả/Nhà sản xuất: ${sanPham.tacGia}</p>
																<p>Nhà xuất bản/Xuất xứ: ${sanPham.nhaXuatBan}</p>
																<p>Đơn giá: <fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.gia}"/></p> đ
																<p>Khuyến mãi: <fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.khuyenMai}"/></p>%
																<p>Số lượng có: <fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.soLuongCo}"/></p>
																<p>Mô tả: ${sanPham.moTa}</p>
																<p>Mã thể loại: ${sanPham.idTheLoai}</p>
															</div>
								               				<div class="modal-footer">
								                  				<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
								               				</div>
								            			</div>
										         	</div>
										      	</div>
		     				 				</td>
											<td>
												<a class="btn btn-danger" href="${root}/admin/quanLySanPham/update?idSanPham=${sanPham.id}">Sửa</a>
											</td>
											<td>
												<a class="btn btn-danger" href="${root}/admin/quanLySanPham/delete?idSanPham=${sanPham.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
											</td>
										</tr>	
									</c:forEach>
								</tbody>	
							</table>
						</c:if>
					</div>
		   		</div>
	   		</div>
   		</c:if>
    </div>
    
</body>
</html>