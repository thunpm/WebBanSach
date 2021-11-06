<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Trang chủ Admin</title>
    
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
			   			<h5>Chỉnh sửa sản phẩm</h5>
				    	<p style="color: red;">${message}</p>
				        <form action="${root}/admin/quanLySanPham/updated" method="POST" enctype="multipart/form-data">
				        	<input type="hidden" name="id" value="${id}">
				        	<label>Mã sản phẩm:</label>
				        	<input type="text" disabled="disabled" value="${id}">
				        	<label>Tên sản phẩm:</label>
				        	<input type="text" name="tenSanPham" value="${tenSanPham}">
				        	<label>Hình ảnh:</label>
				        	<input type="hidden" name="hinhAnhCu" value="${hinhAnh.tenHinhAnh}">
				        	<input style="border: none;" id="upload" type="file" name="hinhAnh" onchange="displayImg()">
				        	<div id="displayImg">
				        		<img id="img" style="width:200px; height:150px;" src="${root}/views/images/${hinhAnh.tenHinhAnh}">
				        	</div>
				        	<label>Tác giả:</label>
				        	<input type="text" name="tacGia" value="${tacGia}">
				        	<label>Nhà xuất bản:</label>
				        	<input type="text" name="nhaXuatBan" value="${nhaXuatBan}">
				        	<label>Giá:</label>
				        	<input type="text" name="gia" value="${gia}">
				        	<label>Khuyến mãi:</label>
				        	<input type="text" name="khuyenMai" value="${khuyenMai}">
				        	<label>Số lượng có:</label>
				        	<input type="text" name="soLuongCo" value="${soLuongCo}">
				        	<label>Mô tả:</label>
				        	<%-- <input type="text" name="moTa" value="${moTa}"> --%>
				        	<textarea style="height: auto;" rows="4" name="moTa">${moTa}</textarea>
				        	<label>Thể loại:</label>
				        	<select name="idTheLoai">
				        		<option value="${idTheLoai}" label="${idTheLoai}"></option>
				        		<c:forEach items="${listTheLoai}" var="theLoai">
				        			<option value="${theLoai.id}" label="${theLoai.id} - ${theLoai.tenLoaiSanPham}"></option>
				        		</c:forEach>
				        	</select>
				        	<input type="submit" value="CHỈNH SỬA">
				        	<input type="reset" value="RESET">
				        </form>
				    </div>
		   		</div>
	   		</div>
   		</c:if>
    </div>
   
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
    <script type="text/javascript">
    	function displayImg() {
    		var fileSelected = document.getElementById("upload").files;
    		if (fileSelected.length > 0) {
    			var fileToLoad = fileSelected[0];
    			var fileReader = new FileReader();
    			fileReader.onload = function(fileLoaderEvent) {
    				var srcData = fileLoaderEvent.target.result;
    				var newImage = document.getElementById('img');
    				newImage.src = srcData;
    				document.getElementById('displayImg').innerHTML = newImage.outerHTML;
    			}
    			fileReader.readAsDataURL(fileToLoad);
    		}
    	}
    </script>
    
</body>
</html>