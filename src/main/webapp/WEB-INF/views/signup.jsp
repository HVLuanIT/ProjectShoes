<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="${classpath}/frontend/css/register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="${classpath}/frontend/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${classpath}/frontend/slick/slick.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="bread-crumb">
            <div class="container">
                <div class="nd-main-title-breadcrumb text-center">
                    Đăng ký tài khoản
                </div>
                <ul class="breadcrumb">
                    <li class="home" itemprop="itemListElement">
                        <a href="${classpath }/index" itemprop="item" title="Trang chủ">
                            <span itemprop="name">Trang Chủ</span>
                        </a>
                    </li>
                    <li itemprop="itemListElement">
                        <strong itemprop="name">Đăng ký tài khoản</strong>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
        <div class="container margin-bottom-40 margin-top-40">
            <div class="d-none">
                <h1 class="title-head">Đăng nhập tài khoản</h1>
            </div>
            <div class="row justify-content-md-center">
                <div class="col-lg-7 col-md-12">
                    <div class="page-login account-box-shadow">
                        <div id="login" class="row">
                            <div class="col-lg-12 col-md-12 account-content order-lg-last order-md-last order-sm-first order-first">
                                <ul class="auth-block__menu-list">
                                    <li>
                                        <a href="${classpath }/login">Đăng nhập</a>
                                    </li>
                                    <li  class="active">
                                        <a href="#">Đăng ký</a>
                                    </li>
                                </ul>
                                <div id="nd-login" style="padding: 0 5%">
                                    <form method="post" action="${classpath }/register" id="register-form" accept-charset="utf-8">
                                        <input type="hidden" name="FormType" value="customer_login">
                                        <input type="hidden" name="utf8" value="true">
                                        <div class="form-signup"></div>
                                        <div class="form-signup clearfix">
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="username">
                                                    Tên đăng nhập:
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="username" type="text" autocomplete="off" placeholder="Nhập tài khoản"
                                                class="form-control form-control-lg" id="username">
                                                <span class="form-message"></span>
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="password">
                                                    Mật khẩu: 
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="password" type="password" autocomplete="off" placeholder="Nhập mật khẩu"
                                                class="form-control form-control-lg" id="password">
                                                <span class="form-message"></span>
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="retypepassword">
                                                    Nhập lại mật khẩu:
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="retypepassword" type="password" autocomplete="off" placeholder="Nhập lại mật khẩu"
                                                class="form-control form-control-lg" id="retypepassword">
                                                <span class="form-message"></span>
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="name">
                                                    Tên
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="name" type="text" autocomplete="off" placeholder="Nhập tên"
                                                class="form-control form-control-lg" id="name">
                                                <span class="form-message"></span>
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="email">
                                                    Email
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="email" type="email" autocomplete="off" placeholder="Nhập email"
                                                class="form-control form-control-lg" id="email">
                                                <span class="form-message"></span>
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-0">
                                                <label for="mobile">
                                                    Số điện thoại: 
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="mobile" type="text" autocomplete="off" placeholder="Nhập số điện thoại"
                                                class="form-control form-control-lg" id="mobile">
                                                <span class="form-message"></span>
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-0">
                                                <label for="address">
                                                    Địa chỉ:
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="address" type="text" autocomplete="off" placeholder="Nhập địa chỉ"
                                                class="form-control form-control-lg" id="address">
                                                <span class="form-message"></span>
                                            </fieldset>
                                            <div class="clearfix">

                                            </div>
                                            <p class="text-right recover">
                                                <a href="" title="Quên mật khẩu" class="btn-link-style" onclick="showRecoverPasswordForm();">Quên mật khẩu?</a>
                                            </p>
                                            <div class="pull-xs-left text-center">
                                                <button class="btn btn-style btn-blues" type="submit" value="Đăng nhập">Đăng ký</button>
                                            </div>
                                            <p class="login--notes">
                                                ND Shoes cam kết bảo mật và sẽ không bao giờ đăng <br>
                                                hay chia sẻ thông tin mà chưa có được sự đồng ý của bạn.
                                            </p>
                                        </div>
                                    </form>
                                    <div class="clearfix"></div>
                                    <div class="line-break">
                                        <span>hoặc qua đăng nhập</span>
                                    </div>
                                    <div class="social-login text-center">
                                        <a href="" class="social-login--facebook" onclick="loginFacebook()">
                                            <img src="${classpath}/frontend/images/fb-btn.svg" alt="">
                                        </a>
                                        <a href="" class="social-login--google" onclick="loginGoogle()">
                                            <img src="${classpath}/frontend/images/gp-btn.svg" alt="">
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
</body>
<script src="${classpath }/frontend/js/validator.js"></script>
<script>
// Mong muốn của chúng ta
Validator({
	form: '#register-form',
	errorSelector: '.form-message',
	rules: [
		Validator.isRequired('#name'),
		Validator.isRequired('#email'),
		Validator.isEmail('#email'),
		Validator.isRequired('#mobile'),
		Validator.isMobile('#mobile'),
		Validator.isRequired('#address'),
		Validator.isRequired('#username'),
		Validator.isRequired('#password'),
		Validator.minLength('#password', 3),
		Validator.isRequired('#retypepassword'),
		Validator.isConfirmed('#retypepassword', function(){
			return document.querySelector('#register-form #password').value;
		}, 'Mật khẩu nhập lại không chính xác'),
	]
});
</script>
</html>