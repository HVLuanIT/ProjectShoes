<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${classpath}/frontend/css/contact.css">
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <link rel="stylesheet" href="${classpath }/frontend/css/demo.css">
    <title>${title}</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/frontend/layout/toast.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="bread-crumb">
            <div class="container">
                <div class="nd-main-title-breadcrumb text-center">
                    Liên hệ
                </div>
                <ul class="breadcrumb">
                    <li class="home" itemprop="itemListElement">
                        <a href="" itemprop="item" title="Trang chủ">
                            <span itemprop="name">Trang Chủ</span>
                        </a>
                    </li>
                    <li itemprop="itemListElement">
                        <strong itemprop="name">Liên hệ</strong>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
        <div class="container contact page-contacts">
            <div class="row contact-padding">
                <div class="col-lg-6 col-sm-12 leave-your-message order-md-2">
                    <h3>Liên hệ chúng tôi</h3>
                    <p class="p-bottom">Để liên hệ và nhận các thông tin khuyến mãi sớm nhất, Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất</p>
                    <form action="/contact-send" method="post" id="contact">
                        <div class="row">
                            <div class="col-sm-12 col-xs-12">
                                <fieldset class="form-group">
                                    <label for="">
                                        Họ tên
                                        <span class="required">*</span>
                                    </label>
                                    <input type="text" value ="${loginedUser.name }" placeholder="Nhập họ tên" id="txtName" class="form-control  form-control-lg" name="txtName">
                                </fieldset>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fieldset class="form-group">
                                    <label for="">
                                        Điện thoại
                                        <span class="required">*</span>
                                    </label>
                                    <input type="text" value="${loginedUser.mobile }" placeholder="Nhập số điện thoại" id="txtMobile" 
                                    class="form-control  form-control-lg" name="txtMobile">
                                </fieldset>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fieldset class="form-group">
                                    <label for="">
                                        Email
                                        <span class="required">*</span>
                                    </label>
                                    <input type="email" value ="${loginedUser.email }" placeholder="Nhập địa chỉ email" id="txtEmail" 
                                    class="form-control  form-control-lg" name="txtEmail">
                                </fieldset>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fieldset class="form-group">
                                    <label for="">
                                        Địa chỉ
                                        <span class="required">*</span>
                                    </label>
                                    <input type="text" value="${loginedUser.address }" placeholder="Nhập địa chỉ" id="txtAddress" 
                                    class="form-control  form-control-lg" name="txtAddress">
                                </fieldset>
                            </div>
                            <div class="col-sm-12 col-xs-12">
                                <fieldset class="form-group">
                                    <label for="">
                                        Nội dung
                                        <span class="reuired">*</span>
                                    </label>
                                    <textarea name="txtMessage" id="txtMessage" rows="10" class="form-control form-control-lg" 
                                    placeholder="Nội dung liên hệ"></textarea>
                                </fieldset>
                                <fieldset class="form-group">
                                    <button type="button" class="normal" onclick="_notification()" class="btn btn-blues btn-style btn-style-active">Gửi liên hệ ngay</button>
                                </fieldset>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-lg-6 col-12 order-md-1">
                    <div class="contact-maps">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4549803802784!2d105.77436082441679!3d21.014473580631304!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454aa0fed56c7%3A0x1ba275bf03d4c1a9!2zVHJ1bmcgdMOibSB0aMawxqFuZyBt4bqhaSBUaGUgR2FyZGVu!5e0!3m2!1svi!2s!4v1716994672189!5m2!1svi!2s" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
    <script type="text/javascript">
		function _notification() {
			//javascript object
			let data = {
				
				name : jQuery("#txtName").val(),
				email : jQuery("#txtEmail").val(), //Get by Id
				mobile : jQuery("#txtMobile").val(),
				address : jQuery("#txtAddress").val(),
				message : jQuery("#txtMessage").val(),
				
			};
			
			//$ === jQuery
			jQuery.ajax({
				url : "/contact-send",
				type : "POST",
				contentType: "application/json",
				data : JSON.stringify(data),
				dataType : "json", //Kieu du lieu tra ve tu controller la json
				
				success : function(jsonResult) {
					//alert(jsonResult.code + ": " + jsonResult.message);
					//$("#notification").html(jsonResult.message);
					// Xóa các giá trị trong các trường của form	
					if (jsonResult.errorMessage) {
		                $('.toast-body-error').html(jsonResult.errorMessage);
		                $('.toast-error').toast('show');
		            } else {
		                $('.toast-body-success').html(jsonResult.message);
		                $('.toast-success').toast('show');
		                $('#txtName').val('');
						$('#txtMobile').val('');
						$('#txtEmail').val('');
						$('#txtAddress').val('');
						$('#txtMessage').val('');
		            }
				},
				
				error : function(jqXhr, textStatus, errorMessage) {
					 $('.toast-body-error').html('Đã có lỗi xảy ra: ' + errorMessage);
			         $('.toast-error').toast('show');
				}
			});
		}
	</script>
</body>
</html>