<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Cập nhật địa chỉ</title>
    <link rel="stylesheet" type="text/css" href="views/styles/style_user.css"/>
    <link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>

    <div class="main-block info-user">
    	<div class="menu-update-kh">
    		<a href="showKhachHang">Thay đổi thông tin</a>
    		<a href="showKhachHang?key=password">Thay đổi mật khẩu</a>
    		<a href="showKhachHang?key=address">Sổ địa chỉ</a>
    	</div>
	    <div class="update-kh login-block">
	    	<c:set var="key1" value="information"></c:set>
			<c:set var="key2" value="password"></c:set>
			<c:set var="key3" value="address"></c:set>
			<c:if test="${key eq key1}">
   				<div style="text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">Thay đổi thông tin</div>
   			</c:if>
   			<c:if test="${key eq key2}">
   				<div style="text-align: center; font-size: 20px; margin-bottom: 30px;" class="name">Thay đổi mật khẩu</div>
   			</c:if>
   			<c:if test="${key eq key3}">
   				<div style="text-align: center; font-size: 20px; margin-bottom: 30px; margin-right: 0px;" class="name">Sổ địa chỉ</div>
   			</c:if>
	    	<p style="color: red; display: inline-block; margin-bottom: 20px;">${message}</p>
	        
        	<div class="accordion" id="accordionExample">
        		<div class="card">
    				<div class="card-header" id="headingOne">
      					<h2 class="mb-0">
        					<button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          						Thêm địa chỉ
      						</button>
    					</h2>
   					</div>
	    			<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
      					<div class="card-body">
       						<form action="updateKhachHang" method="POST">
					        	<input type="hidden" name="key" value="${key}">
					        	<input type="hidden" name="action" value="add">
					        	<input type="hidden" name="idKhachHang" value="${sessionScope.user.id}">
					        	<label>Tỉnh/Thành phố:</label>
					        	<input type="text" name="tinh" value="${tinh}">
					        	<label>Quận/Huyện:</label>
					        	<input type="text" name="huyen" value="${huyen}">
					        	<label>Xã/Phường:</label>
					        	<input type="text" name="xa" value="${xa}">
					        	<label>Địa chỉ:</label>
					        	<input type="text" name="diaChi" value="${diaChi}">
					        	<input type="submit" value="THÊM">
					        </form>
	       	 			</div>
	    			</div>
        		</div>
				<c:forEach items="${sessionScope.user.diaChi}" var="diaChi">
					<div class="card">
    					<div class="card-header" id="heading${diaChi.id}">
     						<h2 class="mb-0">
        						<button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapse${diaChi.id}" aria-expanded="false" aria-controls="collapse${diaChi.id}">
          							<p style="text-overflow: ellipsis;">${diaChi.diaChi} - ${diaChi.xa} - ${diaChi.huyen} - ${diaChi.tinh}</p>
          							<c:if test="${diaChi.macDinh eq 1}">
          								<i>Địa chỉ mặc định</i>
          							</c:if>        							
      							</button>
	    					</h2>
	    				</div>
		    			<div id="collapse${diaChi.id}" class="collapse" aria-labelledby="heading${diaChi.id}" data-parent="#accordionExample">
		      				<div class="card-body">
		      					<form style="display: inline;" action="updateKhachHang" method="POST">
						        	<input type="hidden" name="key" value="${key}">
						        	<input type="hidden" name="action" value="update">
						        	<input type="hidden" name="idDiaChi" value="${diaChi.id}">
						        	<input type="hidden" name="idKhachHang" value="${sessionScope.user.id}">
						        	<label>Tỉnh/Thành phố:</label>
						        	<input type="text" name="tinh" value="${diaChi.tinh}">
						        	<label>Quận/Huyện:</label>
						        	<input type="text" name="huyen" value="${diaChi.huyen}">
						        	<label>Xã/Phường:</label>
						        	<input type="text" name="xa" value="${diaChi.xa}">
						        	<label>Địa chỉ:</label>
						        	<input type="text" name="diaChi" value="${diaChi.diaChi}">
						        	<input type="submit" value="CẬP NHẬT">
						        </form>
						        <c:if test="${diaChi.macDinh eq 0}">
							        <form style="display: inline;" action="updateKhachHang" method="POST">
							        	<input type="hidden" name="key" value="${key}">
							        	<input type="hidden" name="action" value="delete">
							        	<input type="hidden" name="idDiaChi" value="${diaChi.id}">
							        	<input type="hidden" name="idKhachHang" value="${sessionScope.user.id}">
							        	<input type="submit" value="XÓA">
							        </form>
						       </c:if>
						        <c:if test="${diaChi.macDinh eq 0}">
          							<form style="display: inline;" action="updateKhachHang" method="POST">
						        	<input type="hidden" name="key" value="${key}">
						        	<input type="hidden" name="action" value="setDefault">
						        	<input type="hidden" name="idDiaChi" value="${diaChi.id}">
						        	<input type="hidden" name="idKhachHang" value="${sessionScope.user.id}">
						        	<input type="submit" value="ĐẶT ĐỊA CHỈ MẶC ĐỊNH">
						        </form>
          						</c:if>
		       	 			</div>
		    			</div>      	
	        		</div>
	        	</c:forEach>
		      <!-- close add-address -->
	        </div>
	    </div>	    
    </div>
    
    
    <%@ include file="include/footer.jsp" %>
    
   	<script src="views/lib/jquery-3.3.1.min.js"></script>
    <script src="views/lib/popper.min.js"></script>
    <script src="views/lib/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>