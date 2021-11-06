<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Tin tức</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_user.css"/>
    
    <style>
    	.main-block .danh-muc .tieu-de {width: 100%; padding: 20px 0px 0px 15px;}
  		.main-block .danh-muc {display: flex; flex-direction: row; width: 100%; height: auto; margin-bottom: 30px;}
		.main-block .khoi-banner-danh-muc {flex-direction: column;}
		.main-block .danh-muc .list-group-item {width: 100%;}
		.main-block .banner {width: 100%;}
		.block-tin-tuc {
    		margin-bottom: 50px;
    	}
    	
    	.tin-tuc {
    		margin: 20px 0px 20px 0px;
    	}
    	
    	.media-body {
    		color: black;
    		font-size: 15px;
    	}
    	
    	.media:hover {
    		transform: scale(1.01);
    		color: black;
    		text-decoration: none;
    	}
    	
    	.media {
    		height: 250px;
    	}
    </style>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div style="background-color: white;" class="main-block">
    <c:if test="${! empty listTinTuc}">
    	<div style="width: 90%;" class="content">
    		<div style="position: relative; width: 100%; height: auto; display: flex; justify-content: space-between; margin: 0px 0px 30px 0px;">
		   		<div class="danh-muc">
		   			<h5 class="tieu-de list-group">Danh Mục Sản Phẩm</h5>
					<c:forEach items="${listDanhMuc}" var="danhMuc">
						<div class="list-group-item dropdown">
							<div data-toggle="dropdown">${danhMuc.tenDanhMuc}</div>
		  					<div class="dropdown-menu">
								<c:forEach items="${danhMuc.listLoaiSanPham}" var="loaiSanPham">
		   							<li>
		   								<a class="dropdown-item" href="showProductByLoai?maLoai=${loaiSanPham.id}&tenLoai=${loaiSanPham.tenLoaiSanPham}">${loaiSanPham.tenLoaiSanPham}</a>
	   								</li>
								</c:forEach>
		  					</div>
		  				</div>
				  	</c:forEach>
		   		</div>
	   		</div>
	        <div class="block-tin-tuc">
	        	<c:forEach items="${listTinTuc}" var="tinTuc" begin="${batDauSP}" end="${ketThucSP}">		
		        	<div class="tin-tuc">
		        		<a class="media" href="showDetailNews?idTinTuc=${tinTuc.id}">	   	    	
			        		<img style="width: 50%; height: 250px; margin-right: 20px" src="views/images/news/${tinTuc.urlHinh}"></img>
			        		<div class="media-body">
				        		<h5 style="color: #d95719; font-weight: bold;" class="mt-0">${tinTuc.tieuDe}</h5>
				        		<p style="color: #545b62;">${tinTuc.tomTat}</p>
				        		<p style="color: #545b62; font-size: 14px;"><i>Đăng ngày ${tinTuc.ngayDang} bởi ${tinTuc.idAdmin}</i></p>
		        			</div>
	        			</a>
					</div>
				</c:forEach>
	        </div>
	        <div class="danh-trang">
			<ul class="pagination justify-content-center">
			<c:if test="${trangHienTai gt 1}">			    	
	        	<li class="page-item"><a class="page-link" href="showIndex?sanPham=${sanPham}&trangHienTai=${trangHienTai - 1}">Trước</a></li>
	        </c:if>	
	        <c:forEach items="${listSoTrang}" var="soTrang">
	        	<c:if test="${trangHienTai eq soTrang}">			    	
		        	<li class="page-item"><a class="page-link" style="color: red;" href="showIndex?sanPham=${sanPham}&trangHienTai=${soTrang}">${soTrang}</a></li>
		        </c:if>		
		        <c:if test="${trangHienTai ne soTrang}">    	
	        		<li class="page-item"><a class="page-link" href="showIndex?sanPham=${sanPham}&trangHienTai=${soTrang}">${soTrang}</a></li>
        		</c:if>
			</c:forEach>
			<c:if test="${trangHienTai lt (tongSoTrang - 1)}">			    	
	        	<li class="page-item"><a class="page-link" href="showIndex?sanPham=${sanPham}&trangHienTai=${trangHienTai + 1}">Sau</a></li>
	        </c:if>	
	        </ul>
		</div>
		</div>	
		</c:if>
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
</body>
</html>