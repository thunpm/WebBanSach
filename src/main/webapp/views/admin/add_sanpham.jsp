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
	   			<%@ include file="include/danhmuc.jsp" %>
	   			
		   		<div class="content">
		   		
		   			<%@ include file="include/menu.jsp" %>
		   			
			    	<div class="noi-dung">
			   			<h5 style="margin: auto">Thêm sản phẩm</h5>
				    	<p style="color: red;">${message}</p>
				        <form action="${root}/admin/quanLySanPham/added" method="POST" enctype="multipart/form-data">
				        	<label>Tên sản phẩm:</label>
				        	<input type="text" name="tenSanPham" value="${tenSanPham}">
				        	<label>Hình ảnh:</label>
				        	<input style="border: none;" type="file" name="hinhAnh" id="upload" onchange="displayImg()">
				        	<div id="displayImg">
				        		<img id="img" style="width:200px; height:150px;">
				        	</div>
				        	</br>
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
				        	<input type="submit" value="THÊM">
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