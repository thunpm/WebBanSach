<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Quản lý khách hàng</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_admin.css"/>
</head>
<body>
    <div class="main-block">
	    <c:if test="${! empty sessionScope.admin}">
	    	<div class="khoi">
	   			<%@ include file="include/danhmuc.jsp" %>
	   			
		   		<div class="content">
		   		
		   			<%@ include file="include/menu.jsp" %>
		   			
			    	<div class="noi-dung">
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
				           		<input id="search" type="text" placeholder="Tìm" name="searchText" value="${searchText}">
					           	<button style="padding: 0px 9px 0px 9px;" type="button" class="fa fa-search btn-warning"></button>
					        </div>
					   	</div>
				    	<div class="">
						    <table id="myTable">
						    	<tr>
						    		<th>Id</th>
						    		<th>Tên đăng nhập</th>
						    		<!-- <th>Mật khẩu</th> -->
						    		<th>Họ tên</th>
						    		<th>Số điện thoại</th>
						    		<th>Chi tiết</th>
						    		<th>Xóa</th>
						    	</tr>
					    		<c:if test="${! empty listKhachHang}">
									<c:forEach items="${listKhachHang}" var="khachHang">
										<tr class="hang">
											<td>${khachHang.id}</td> 
											<td>${khachHang.tenDangNhap}</td>
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
																<p>Địa chỉ      :</p>
																<c:forEach items="${khachHang.diaChi}" var="diaChi">
	   																<c:if test="${diaChi.macDinh eq 1}">
	       																<i style="display: inline;">Địa chỉ mặc định: </i>
	       															</c:if> 
	   																<p style="text-overflow: ellipsis;">${diaChi.diaChi} - ${diaChi.xa} - ${diaChi.huyen} - ${diaChi.tinh}</p>   															       							
	    														</c:forEach>
															</div>
								               				<div class="modal-footer">
								                  				<button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
								               				</div>
								            			</div>
										         	</div>
										      	</div>
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