<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Liên hệ</title>
	
	<link rel="stylesheet" type="text/css" href="views/lib/font-awesome/css/all.css">
	<link rel="stylesheet" type="text/css" href="views/lib/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="views/styles/style_user.css" />
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<%@ include file="include/menu.jsp"%>

	<div style="background-color: white;" class="main-block">
		<div class="content">
			<div style="width: 90%; background-color: white; margin: auto; padding: 20px;">
				<h4>
					<b>Liên hệ với chúng tôi</b>
				</h4>
				<div>
					<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.073937677685!2d108.15693531416977!3d16.061652543908824!
					2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421924682e8689%3A0x48eb0bdbeec05215!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBTxrA
					gUGjhuqFtIC0gxJBIxJBO!5e0!3m2!1svi!2s!4v1634888444663!5m2!1svi!2s"
						width="100%" height="450" style="border: 0;"> </iframe>
				</div>
				<div style="display: flex; flex-direction: row;">
					<div style="width: 40%; margin-right: 5%;">
						<div class="gap-element" style="display: block; height: auto; padding-top: 40px"></div>
						<p>
							<b>Thông tin liên hệ</b>
						</p>
						<p>- Nhà sách Thu</p>
						<p>- Địa chỉ: 459 Tôn Đức Thắng, Hoà Khánh Nam, Liên Chiểu, Đà
							Nẵng</p>
						<p>- Email: minhthu20201@gmail.com</p>
						<p>- Điện thoại: 0898 154 428</p>
					</div>
					<div style="width: 50%;">
						<div class="gap-element" style="display: block; height: auto; padding-top: 40px"></div>
						<div role="form" class="wpcf7" id="wpcf7-f43-p20-o1" lang="vi" dir="ltr">
							<div class="screen-reader-response"></div>
							<form action="contact" method="post">
								<input id="donee" type="hidden" value="${done}">
								<div class="form-group">
									<label>Họ và tên</label> 
									<input required="required" type="text" placeholder="Họ và tên" name="name" value="">
								</div>
								<div class="form-group">
									<label>Email</label> 
									<input required="required" type="text" placeholder="Email" name="email" value="">
								</div>
								<div class="form-group">
									<label>Số điện thoại</label> 
									<input required="required" type="text" placeholder="Số điện thoại" name="phone" value="">
								</div>
								<div class="form-group">
									<label>Ý kiến của bạn</label>
									<textarea required="required" style="height: auto;" rows="3" name="report"></textarea>
								</div>
								<div class="form-group">
									<input  type="submit" value="  GỬI  ">
								</div>
							</form>
						</div>
					</div>
					<div id="exampleModall" class="modal" tabindex="-1" role="dialog">
					  <div class="modal-dialog" role="document">
							<div class="modal-content">
								<div>
									<div class="modal-body">
										<p>Gửi phản hồi thành công!</p>
										<p>Cảm ơn phản hồi của bạn, chúng tôi sẽ liên hệ trong
											thời gian sớm nhất!</p>
									</div>
								</div>
								<div style="text-align: center;">
									<button style="margin-top: 0px;" type="button" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">Đóng</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>

	<script src="views/lib/jquery-3.3.1.min.js"></script>
	<script src="views/lib/popper.min.js"></script>
	<script src="views/lib/bootstrap/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			if ($('#donee').val() == "done") {
		    	$('#exampleModall').modal('show');
			}
		});
	</script>
</body>
</html>