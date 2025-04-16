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
    <link rel="stylesheet" href="${classpath}/frontend/css/Introduce.css">
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <title>${title }</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="bread-crumb">
            <div class="container">
                <div class="nd-main-title-breadcrumb text-center">
                    Giới thiệu
                </div>
                <ul class="breadcrumb">
                    <li class="home" itemprop="itemListElement">
                        <a href="${classpath }/index" itemprop="item" title="Trang chủ">
                            <span itemprop="name">Trang Chủ</span>
                        </a>
                    </li>
                    <li itemprop="itemListElement">
                        <strong itemprop="name">Giới thiệu</strong>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
        <div class="page margin-top-30 margin-bottom-30">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="page-title category-title">
                            <h1 class="title-head">Giới thiệu</h1>
                        </div>
                        <div class="content-page rte">
                            <p>Giầy dép là một trong những phụ kiện không thể thiếu góp phần tạo nên phong cách thời trang của mỗi người. Chính vì điều đó ND SHOES mong muốn đem đến những mẫu giầy mới nhất được cập nhật thường xuyên giúp các bạn dễ dàng hơn trong việc lựa chọn và cập nhật những style thịnh hành của thời trang giầy dép trong nước và thế giới.</p>
                            <p>NS SHOES có hàng hóa đa dạng với giày, dép, túi ... sẵn sàng phục vụ quý khách nhanh chóng thông qua việc bán tại cửa hàng tại Tầng 1 The Garden, Khu The Manor, Mễ Trì và đặt hàng online trên website.</p>
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