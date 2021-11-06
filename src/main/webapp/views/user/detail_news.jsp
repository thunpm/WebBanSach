<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>${tinTuc.tieuDe}</title>
    
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/font-awesome/css/all.css">
    <link rel="stylesheet" type="text/css" href="${root}/views/lib/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${root}/views/styles/style_user.css"/>
</head>
<body>
    <%@ include file="include/header.jsp" %>
    <%@ include file="include/menu.jsp" %>
    
    <div style="background-color: white;" class="main-block">
	    <c:if test="${! empty tinTuc}">
	    	<div style="width: 90%;" class="content">
		        <div class="block-tin-tuc">	  	  
		        	<h5 style="color: #d95719; font-weight: bold;" class="mt-0">${tinTuc.tieuDe}</h5>  	
	        		<img style="width: 75%; height: 300px; margin: auto;" class="mr-5" src="views/images/news/${tinTuc.urlHinh}"></img>
	        		<p style="color: #545b62;">${tinTuc.tomTat}</p>
		        	<p>${tinTuc.noiDung}</p>
				</div>
	        </div>
		</c:if>
    </div>
    <%@ include file="include/footer.jsp" %>
    
   	<script src="${root}/views/lib/jquery-3.3.1.min.js"></script>
    <script src="${root}/views/lib/popper.min.js"></script>
    <script src="${root}/views/lib/bootstrap/js/bootstrap.min.js"></script>
    
    <script>
		function myFunction() {
		  var x = document.getElementsByClassName("item-danh-muc");
		  for (var i = 0; i < x.length; i++) {
			  if (x[i].className === "item-danh-muc") {
				  x[i].className += " item-danh-muc-show";
			  } else {
				  x[i].className = "item-danh-muc";
			  }
		  }
		}
	</script>
    
</body>
</html>