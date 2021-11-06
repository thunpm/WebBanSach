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
   	
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
  	<link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
  	<link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
  	
  	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
   
<!--   	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
  	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
  	<script src="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"></script>
 
   	<script>
    	$(document).ready(function(){
     
    	// Cấu hình các nhãn phân trang
    		$('#example').dataTable({
        		"language": {
        			"sInfo":         "",
        			"sInfoEmpty":    "",
        			"sInfoPostFix":  "",
        			"sSearch":       "",
        			"sUrl":          "",
        			"oPaginate": {
	            		"sFirst":    "Đầu",
	            		"sPrevious": "Trước",
	            		"sNext":     "Sau",
	            		"sLast":     "Cuối"
            		}
        		},
        		"processing": true
    		});     
    	}); 
  	</script>   
  	<style type="text/css">
  		#example_length {
  			display: none;
  		}
  		#example_filter {
  			display: none;
  		}
  	</style> -->
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
			   			<h5 style="margin: auto; margin-bottom: 50px;">SẢN PHẨM</h5>
				    	<p style="color: red;">${message}</p>
				    	<div class="find">
							<a class="btn btn-warning" href="${root}/admin/quanLySanPham/add">Thêm sản phẩm</a>
							<div class="search-box">
				           		<input id="search" type="text" placeholder="Tìm" name="searchText" value="${searchText}">
					           	<button style="padding: 0px 9px 0px 9px;" type="button" class="fa fa-search btn-warning"></button>
					        </div>
					   	</div>
					   	<div>
					   		<form action="${root}/admin/quanLySanPham" class="sap-xep">
						   		<select name="cotSapXep" style="width: 23%;">
						   			<option value="${cotSapXep}">${cotSapXep}</option>
									<option value="id">Id</option>
									<option value="tenSanPham">Tên sản phẩm</option>
									<option value="gia">Giá</option>
									<option value="khuyenMai">Khuyến mãi</option>
								</select>
								<select name="thuTuSapXep" style="width: 23%;">
									<option value="${thuTuSapXep}">${thuTuSapXep}</option>
									<option value="az">Thấp đến cao</option>
									<option value="za">Cao đến thấp</option>
								</select>
								<button class="btn btn-warning" type="submit">Sắp xếp</button>
							</form>
					   	</div>
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
											<tr class="hang">
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
																	<p>Đơn giá: <fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.gia}"/> đ</p>
																	<p>Khuyến mãi: <fmt:formatNumber type="number" maxFractionDigits="3" value="${sanPham.khuyenMai}"/>%</p>
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
	   		</div>
   		</c:if>
    </div>
    
    <script>
    	$(document).ready(function() {
   			$('#search').on('keyup', function() {
      			var tukhoa = $(this).val().toLowerCase();
      			/* filter: loc cac thanh phan */
      			$('#example .hang').filter(function() {
      				/* toggle hiển thị và ẩn thành phần
      				indexOf tra ve vi tri dau tien tim thay, khong tim thay tra ve -1 */
         			$(this).toggle($(this).text().toLowerCase().indexOf(tukhoa) > -1);
      			});
  		 	});
		});
   	</script>
    
</body>
</html>