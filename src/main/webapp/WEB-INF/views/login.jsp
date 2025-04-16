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
    <title>${title }</title>
    <link rel="stylesheet" href="${classpath}/frontend/css/login.css">
	<jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="bread-crumb">
            <div class="container">
                <div class="nd-main-title-breadcrumb text-center">
                    Đăng nhập tài khoản
                </div>
                <ul class="breadcrumb">
                    <li class="home" itemprop="itemListElement">
                        <a href="${classpath }/index" itemprop="item" title="Trang chủ">
                            <span itemprop="name">Trang Chủ</span>
                        </a>
                    </li>
                    <li itemprop="itemListElement">
                        <strong itemprop="name">Đăng nhập tài khoản</strong>
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
                                    <li class="active">
                                        <a href="#">Đăng nhập</a>
                                    </li>
                                    <li>
                                        <a href="${classpath }/signup">Đăng ký</a>
                                    </li>
                                </ul>
                                <div id="nd-login">
                                <%-- Kiểm tra nếu có thông báo lỗi --%>
								<c:if test="${not empty param.login_error}">
    								<div class="alert alert-danger" role="alert">
        								Tên đăng nhập hoặc mật khẩu không chính xác. Vui lòng thử lại.
    								</div>
								</c:if>
                                    <form method="POST" action="${classpath }/login_processing_url" id="customer_login" accept-charset="utf-8">
                                        <input type="hidden" name="FormType" value="customer_login">
                                        <input type="hidden" name="utf8" value="true">
                                        <div class="form-signup"></div>
                                        <div class="form-signup clearfix">
                                            <fieldset class="form-group margin-bottom-10">
                                                <label for="">
                                                    Tên đăng nhập:
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="username" type="text" autocomplete="off" placeholder="Nhập tài khoản"
                                                class="form-control form-control-lg" id="username">
                                            </fieldset>
                                            <fieldset class="form-group margin-bottom-0">
                                                <label for="">
                                                    Mật khẩu:
                                                    <span class="required">*</span>
                                                </label>
                                                <input name="password" type="password" autocomplete="off" placeholder="Nhập mật khẩu"
                                                class="form-control form-control-lg" id="password">
                                            </fieldset>
                                            <div class="clearfix">

                                            </div>
                                            <p class="text-right recover">
                                                <a href="" title="Quên mật khẩu" class="btn-link-style" onclick="showRecoverPasswordForm();">Quên mật khẩu?</a>
                                            </p>
                                            <div class="pull-xs-left text-center">
                                                <button class="btn btn-style btn-blues" type="submit" value="Đăng nhập">&nbspĐăng nhập&nbsp</button>
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
</html>