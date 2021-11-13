<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Phản hồi khách hàng</title>
    
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
				    	<h5 style="margin: auto">PHẢN HỒI KHÁCH HÀNG</h5>
				    	<p style="color: red;">${message}</p>
						<div class="find">
							<div class="search-box">
				           		<input id="search" type="text" placeholder="Tìm" name="searchText" value="${searchText}">
					           	<button style="padding: 0px 9px 0px 9px;" type="button" class="fa fa-search btn-warning"></button>
					        </div>
					   	</div>
				    	<div class="">
						    <table id="myTable">
						    	<tr>
						    		<th>Id</th>
						    		<th>Họ và tên</th>
						    		<th>Email</th>
						    		<th>Số điện thoại</th>
						    		<th>Ý kiến phản hồi</th>
						    		<th>Xóa</th>
						    	</tr>
					    		<c:if test="${! empty listPhanHoi}">
									<c:forEach items="${listPhanHoi}" var="phanHoi">
										<tr class="hang">
											<td>${phanHoi.id}</td> 
											<td>${phanHoi.hoTen}</td>
											<td>${phanHoi.email}</td>
											<td>${phanHoi.soDienThoai}</td>
											<td>${phanHoi.yKien}</td>
											<td>
												<a class="btn btn-danger" href="${root}/admin/phanHoi/delete?idPhanHoi=${phanHoi.id}" onclick="return confirm('Bạn có chắc chắn muốn xóa không?');">Xóa</a>
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