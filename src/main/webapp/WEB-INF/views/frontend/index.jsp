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
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <title>${title }</title>
</head>
<body>
   <!-- Header -->
   <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="slider">
            <div class="carousel-inner">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators carousel-indicators2">
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="${classpath}/frontend/images/slider_1.webp" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="${classpath}/frontend/images/slider_2.jpg" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="${classpath}/frontend/images/slider_3.jpg" class="d-block w-100" alt="...">
                      </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-inner1">
            <div class="section_service">
                <div class="container-1">
                    <div class="block-content">
                        <div class="swiper-wrapper">
                            <div class="swiper-slide">
                                <div class="icon">
                                    <img src="${classpath}/frontend/images/icon_service_1.svg" alt="">
                                </div>
                                <div class="info">
                                    <h3>Giao hàng toàn quốc</h3>
                                    <p>Miễn phí vận chuyển với các đơn hàng trị giá trên 2.000.000Đ</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="icon">
                                    <img src="${classpath}/frontend/images/icon_service_2.svg" alt="">
                                </div>
                                <div class="info">
                                    <h3>Hỗ trợ online 24/24</h3>
                                    <p>Luôn hỗ trợ khách hàng 24/24 tất cả các ngày trong tuần</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="icon">
                                    <img src="${classpath}/frontend/images/icon_service_3.svg" alt="">
                                </div>
                                <div class="info">
                                    <h3>Đỗi hàng dễ dàng</h3>
                                    <p>Miễn phí đổi trả trong vòng 30 ngày đầu tiên cho tất cả các mặt hàng</p>
                                </div>
                            </div>
                            <div class="swiper-slide">
                                <div class="icon">
                                    <img src="${classpath}/frontend/images/icon_service_4.svg" alt="">
                                </div>
                                <div class="info">
                                    <h3>Quà tặng hấp dẫn</h3>
                                    <p>Chương trình khuyễn mãi cực lớn và hấp dẫn hàng tháng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </nav>
        <main>
        <div class="conatiner">
            <div class="section_product_new">
                <div class="container3">
                    <div class="block-title">
                        <h2><a href="" title="Sản phẩm mới">Sản phẩm bán chạy</a></h2>
                        <p class="title-des">Các sản phẩm bán chạy có tại cửa hàng</p>
                    </div>
                    <div class="block-product">
                        <div class="row">
                        <c:forEach items="${isHotProducts }" var="product" varStatus = "loop">
                            <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                <a href="${classpath }/product-detail/${product.id}">
                                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px">
                                    	<c:if test="${product.salePrice > 0}">
											<div class="sale-flash product-thumbnail sale" data-sale="<fmt:formatNumber value="${discountsForHotProducts[loop.index] * -1}" type="number" pattern="#,##0'%'" />">

											</div>
										</c:if>
                                        <div class="btn-action">
                                            <a href="" title="Sản phẩm yêu thích">
                                                <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                    <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                            <div class="action-cart">
                                                <button title="Thêm vào giỏ hàng">
                                                <c:set var="firstSize" value="${fn:split(product.size, ',')[0]}" />
                                                    <a onclick="addToCart(${product.id}, 1, '${product.name }', '${firstSize }')">
                                                    	<svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                        <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    </svg>
                                                    </a>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="images">
                                            <img src="${classpath}/FileUploads/${product.avatar}" class="card-img-top card-img" alt="...">
                                        </div>
                                        <div class="card-body">
                                          <h3 class="card-title"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></h3>
                                          <span class="brand">
                                          		${category.name }
                                          </span>
                                          <div class="bottom-action">
                                            <div class="price-box">
                                            	<c:choose>
													<c:when test="${product.salePrice > 0}">
														<span class="new-price"><fmt:formatNumber value="${product.salePrice}" pattern="#,##0vnd" /> </span>
														<span class="old-price compare-price"><fmt:formatNumber value="${product.price}" pattern="#,##0vnd" /> </span>
													</c:when>
													<c:otherwise>
														<span class="default-price"><fmt:formatNumber value="${product.price}" pattern="#,##0vnd" /> </span>
													</c:otherwise>
												</c:choose>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                           </c:forEach> 
                         </div>        
                        <div class="view-more">
                            <a href="${classpath }/allproduct" title="Xem tất cả">Xem tất cả</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="awe-section-4">
            <div class="section_best_sellers">
                <div class="container3">
                    <div class="block-title">
                        <h2><a href="" title="Sản phẩm mới">Sản phẩm mới</a></h2>
                        <p class="title-des">Các sản phẩm mới tại cửa hàng</p>
                    </div>
                    <div class="banner-product">
                        <a href="" title="Sản phẩm bán chạy">
                            <img src="${classpath}/frontend/images/img-best-sellers.webp" alt="">
                        </a>
                    </div>
                    <div class="block-product">
                        <div class="row">
                             <c:forEach items="${products }" var="product" varStatus = "loop">
                            <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                <a href="${classpath }/product-detail/${product.id}">
                                    <div class="card" style="box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px">
                                    	<c:if test="${product.salePrice > 0}">
											<div class="sale-flash product-thumbnail sale" data-sale="<fmt:formatNumber value="${discountsForAllProducts[loop.index] * -1}" type="number" pattern="#,##0'%'" />">

											</div>
										</c:if>
                                        <div class="btn-action">
                                            <a href="" title="Sản phẩm yêu thích">
                                                <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                    <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                            <div class="action-cart">
                                                <button title="Thêm vào giỏ hàng">
                                                	<c:set var="firstSize" value="${fn:split(product.size, ',')[0]}" />
                                                    <a onclick="addToCart(${product.id}, 1, '${product.name }', ${firstSize })">
                                                    	<svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                        <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                        <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                        <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    </svg>
                                                    </a>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="images">
                                            <img src="${classpath}/FileUploads/${product.avatar}" class="card-img-top card-img" alt="...">
                                        </div>
                                        <div class="card-body">
                                          <h3 class="card-title"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></h3>
                                          <span class="brand">
                                          		${category.name }
                                          </span>
                                          <div class="bottom-action">
                                            <div class="price-box">
                                            	<c:choose>
													<c:when test="${product.salePrice > 0}">
														<span class="new-price"><fmt:formatNumber value="${product.salePrice}" pattern="#,##0vnd" /> </span>
														<span class="old-price compare-price"><fmt:formatNumber value="${product.price}" pattern="#,##0vnd" /> </span>
													</c:when>
													<c:otherwise>
														<span class="default-price"><fmt:formatNumber value="${product.price}" pattern="#,##0vnd" /> </span>
													</c:otherwise>
												</c:choose>
                                            </div>
                                          </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                           </c:forEach> 
                        </div>
                        <div class="view-more">
                            <a href="${classpath }/allproduct" title="Xem tất cả">Xem tất cả</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="awe-section-5">
            <div class="block-tab-product">
                <div class="container3">
                    <div class="e-tabs not-dqtab ajax-tab-1" >
                        <div class="content">
                            <div class="block-title clearfix">
                                <h2><a href="">SNEAKERS</a></h2>
                                <p class="title-des">Các sản phẩm Sneakers có tại ND Shoes</p>
                                <ul class="tabs tabs-title tab-desktop ajax clearfix">
                                    <li class="tab-link current" data-tab="tab-1">
                                        <span title="Adidas">Adidas</span>
                                    </li>
                                    <li class="tab-link" data-tab="tab-2">
                                        <span title="Nike">Nike</span>
                                    </li>
                                    <li class="tab-link" data-tab="tab-3">
                                        <span title="Converse">Converse</span>
                                    </li>
                                    <li class="tab-link" data-tab="tab-4">
                                        <span title="Vans">Vans</span>
                                    </li>
                                    <li class="tab-link" data-tab="tab-5">
                                        <span title="Puma">Puma</span>
                                    </li>
                                    <li class="tab-link" data-tab="tab-6">
                                        <span title="FILA">FILA</span>
                                    </li>
                                    <li class="tab-link" data-tab="tab-7">
                                        <span title="MLB">MLB</span>
                                    </li>
                                    <li class="tab-link" data-tab="tab-8">
                                        <span title="New Balance">New Balance</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-1 tab-content current">
                                <div class="block-product">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas1.jpg" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">4.500.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="product-thumbnail sale " data-sale="-2%">
            
                                                    </div>
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas2.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">
                                                            <span class="price">5.500.000đ</span>
                                                            <span class="compare-price">5.600.000đ</span>
                                                        </div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="product-thumbnail sale " data-sale="-33%">
            
                                                    </div>
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas3.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">
                                                            <span class="price">2.000.000đ</span>
                                                            <span class="compare-price">3.000.000đ</span>
                                                        </div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas4.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">2.500.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas5.jpg" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">5.100.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas6.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">5.100.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas7.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">5.829.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/Adidas8.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">4.829.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-2 tab-content">
                                <div class="block-product">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp1.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">5.000.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp2.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">3.900.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="product-thumbnail sale " data-sale="-33%">
            
                                                    </div>
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp3.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">
                                                            <span class="price">2.000.000đ</span>
                                                            <span class="compare-price">3.000.000đ</span>
                                                        </div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp4.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">2.500.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp5.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">5.100.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp6.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">5.100.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp7.jpg" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">5.829.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
                                            <a href="">
                                                <div class="card">
                                                    <div class="btn-action">
                                                        <a href="" title="Sản phẩm yêu thích">
                                                            <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                                <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                            </svg>
                                                        </a>
                                                        <div class="action-cart">
                                                            <button title="Thêm vào giỏ hàng">
                                                                <svg class="action-icon-cart" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                                </svg>
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <div class="images">
                                                        <img src="${classpath}/frontend/images/sp8.webp" class="card-img-top card-img" alt="...">
                                                    </div>
                                                    <div class="card-body">
                                                      <h3 class="card-title"><a href="">Nike Blazer x sacai x KAWS</a></h3>
                                                      <span class="brand">Niken</span>
                                                      <div class="bottom-action">
                                                        <div class="price-box">4.829.000đ</div>
                                                      </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-3 tab-content">
                                <div class="contentfill">
                                    <div class="alert alert-warning show margin-10" role="alert">
                                        Không có sản phẩm nào trong danh mục này.
                                    </div>
                                </div>
                            </div>
                            <div class="tab-4 tab-content">
                                <div class="contentfill">
                                    <div class="alert alert-warning show margin-10" role="alert">
                                        Không có sản phẩm nào trong danh mục này.
                                    </div>
                                </div>
                            </div>
                            <div class="tab-5 tab-content">
                                <div class="contentfill">
                                    <div class="alert alert-warning show margin-10" role="alert">
                                        Không có sản phẩm nào trong danh mục này.
                                    </div>
                                </div>
                            </div>
                            <div class="tab-6 tab-content">
                                <div class="contentfill">
                                    <div class="alert alert-warning show margin-10" role="alert">
                                        Không có sản phẩm nào trong danh mục này.
                                    </div>
                                </div>
                            </div>
                            <div class="tab-7 tab-content">
                                <div class="contentfill">
                                    <div class="alert alert-warning show margin-10" role="alert">
                                        Không có sản phẩm nào trong danh mục này.
                                    </div>
                                </div>
                            </div>
                            <div class="tab-8 tab-content">
                                <div class="contentfill">
                                    <div class="alert alert-warning show margin-10" role="alert">
                                        Không có sản phẩm nào trong danh mục này.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="awe-section-6">
            <div class="section_accessories">
                <div class="container3">
                    <div class="block-title">
                        <h2><a href="" title="Sản phẩm mới">Phụ kiện</a></h2>
                        <p class="title-des">Tất cả phụ kiện có tại ND Shoes</p>
                    </div>
                    <div class="cate-list">
                        <div class="accessories-swiper swiper-container">
                            <div class="swiper-wrapper">
                                <div class="swiper-slide cate-1">
                                    <div class="cate-item">
                                        <a href="#" class="image" title="Khóa giày">
                                            <img src="${classpath}/frontend/images/accessories_1.webp" alt="">
                                        </a>
                                        <div class="info">
                                            <h3 class="title_cate_">
                                                <a href="#" title="khóa giày">Khóa giày</a>
                                            </h3>
                                            <a href="#" title="Xem thêm" class="view-more" >
                                                Xem thêm
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12" fill="none">
                                                    <path d="M10.0586 1L14.9998 6.02351L10.0586 10.9647" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    <path d="M7.17627 6.02344H14.9175" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    <path d="M1 6.02344H3.88235" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide cate-2">
                                    <div class="cate-item">
                                        <a href="#" class="image" title="Tất giày">
                                            <img src="${classpath}/frontend/images/accessories_2.webp" alt="">
                                        </a>
                                        <div class="info">
                                            <h3 class="title_cate_">
                                                <a href="#" title="Tất giày">Tất giày</a>
                                            </h3>
                                            <a href="#" title="Xem thêm" class="view-more" >
                                                Xem thêm
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12" fill="none">
                                                    <path d="M10.0586 1L14.9998 6.02351L10.0586 10.9647" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    <path d="M7.17627 6.02344H14.9175" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    <path d="M1 6.02344H3.88235" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide cate-3">
                                    <div class="cate-item">
                                        <a href="#" class="image" title="Dây giày">
                                            <img src="${classpath}/frontend/images/accessories_3.jpg" alt="">
                                        </a>
                                        <div class="info">
                                            <h3 class="title_cate_">
                                                <a href="#" title="Dây giày">Dây giày</a>
                                            </h3>
                                            <a href="#" title="Xem thêm" class="view-more" >
                                                Xem thêm
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12" fill="none">
                                                    <path d="M10.0586 1L14.9998 6.02351L10.0586 10.9647" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    <path d="M7.17627 6.02344H14.9175" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                    <path d="M1 6.02344H3.88235" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                        <div class="view-all">
                            <a href="" title="Xem tất cả">Xem tất cả</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="awe-section-7">
            <div class="section_feedback">
                <div class="container3">
                    <div class="block-title">
                        <h2>
                            <span>Feedback</span>
                        </h2>
                        <p class="title-des">Album feedback của khách hàng về ND Shoes
                        </p>
                    </div>
                    <div class="block-content responsive">
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_1.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_2.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_3.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_4.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_5.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_6.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_7.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_8.webp" alt="">
                        </div>
                        <div class="item">
                            <img src="${classpath}/frontend/images/feedback_9.webp" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="awe-section-8">
            <div class="section_blog">
                <div class="container3">
                    <div class="block-title">
                        <h2><a href="" title="Tin tức">Tin tức</a></h2>
                        <p class="title-des">Tổng hợp tin tức, mẹo vặt cho bạn</p>
                    </div>
                    <div class="row blogs_mobile_base">
                        <div class="col-lg-4 col-md-4 col-12">
                            <div class="item_blog_base">
                                <div class="block-thumb block_video_play">
                                    <a class="thumb video_play" href="https://www.youtube.com/watch?v=KriBQVhsgZk" title="King James mang đôi OFF-WHITE x Nike Air Force 1 University Yellow của Virgil Abloh có gì đặc biệt?">
                                        <img src="${classpath}/frontend/images/t7.webp" alt="">
                                    </a>
                                </div>
                                <div class="content_blog clearfix">
                                     <h3>
                                        <a class="a-title" href="" title="King James mang đôi OFF-WHITE x Nike Air Force 1 University Yellow của Virgil Abloh có gì đặc biệt?">
                                            King James mang đôi OFF-WHITE x Nike Air Force 1 University Yellow của Virgil Abloh có gì đặc biệt?
                                        </a>
                                     </h3>
                                     <div class="time-post">
                                        <span class="author">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="11" viewBox="0 0 10 11" fill="none">
                                                <path d="M6.625 2.6875C6.625 3.61948 5.86948 4.375 4.9375 4.375C4.00552 4.375 3.25 3.61948 3.25 2.6875C3.25 1.75552 4.00552 1 4.9375 1C5.14011 1 5.33437 1.03571 5.51435 1.10117" stroke="#808080" stroke-linecap="round"></path>
                                                <path d="M1 10V8.06439C1 7.45857 1.34677 6.9047 1.91417 6.69234C2.67955 6.40589 3.97001 6.0625 4.9375 6.0625C5.9254 6.0625 7.02163 6.42052 7.88588 6.71039C8.49054 6.91319 8.875 7.48924 8.875 8.12701V10" stroke="#808080" stroke-linecap="round"></path>
                                            </svg>
                                            Nguyễn Anh Dũng
                                        </span>
                                        <span class="icon posted">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11" fill="none">
                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M0.0683594 5.5C0.0683594 2.46712 2.53547 0 5.56836 0C8.60124 0 11.0684 2.46712 11.0684 5.5C11.0684 8.53288 8.60124 11 5.56836 11C2.53547 11 0.0683594 8.53288 0.0683594 5.5ZM0.920408 5.5C0.920408 8.06255 3.00581 10.148 5.56836 10.148C8.13091 10.148 10.2163 8.06255 10.2163 5.5C10.2163 2.93745 8.13134 0.852049 5.56836 0.852049C3.00581 0.852049 0.920408 2.93745 0.920408 5.5ZM5.99437 5.32102L7.52808 6.47129C7.71639 6.61231 7.75474 6.87943 7.61326 7.06733C7.52975 7.1798 7.40194 7.23817 7.27201 7.23817C7.18297 7.23817 7.09349 7.21048 7.01681 7.15297L5.31272 5.87488C5.20536 5.79479 5.1423 5.66825 5.1423 5.53406V2.97789C5.1423 2.74229 5.33274 2.55185 5.56834 2.55185C5.80393 2.55185 5.99437 2.74229 5.99437 2.97789V5.32102Z" fill="#7F7F7F"></path>
                                            </svg>
                                            Ngày 21/12/2021
                                        </span>
                                     </div>
                                    <p>
                                        OFF-WHITE x Nike Air Force 1 University Yellow là đôi sneakers được hé lộ trong website public—domain.com, một websit...
                                    </p>
                                    <div class="view-more d-md-block d-none">
                                        <a href="" title="Xem thêm">
                                            Xem thêm
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12" fill="none">
                                                <path d="M10.0586 1L14.9998 6.02351L10.0586 10.9647" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M7.17627 6.02344H14.9175" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                                <path d="M1 6.02344H3.88235" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                            </svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-12">
                            <div class="item_blog_base">
                                <div class="block-thumb">
                                    <a class="thumb" href="" title="Hàng loạt các phối màu của adidas Stan Smith được tung ra dành cho tín đồ mê sneakers">
                                        <img src="${classpath}/frontend/images/t5.webp" alt="">
                                    </a>
                                </div>
                                <div class="content_blog clearfix">
                                    <h3>
                                       <a class="a-title" href="" title="Hàng loạt các phối màu của adidas Stan Smith được tung ra dành cho tín đồ mê sneakers">
                                        Hàng loạt các phối màu của adidas Stan Smith được tung ra dành cho tín đồ mê sneakers
                                       </a>
                                    </h3>
                                    <div class="time-post">
                                       <span class="author">
                                           <svg xmlns="http://www.w3.org/2000/svg" width="10" height="11" viewBox="0 0 10 11" fill="none">
                                               <path d="M6.625 2.6875C6.625 3.61948 5.86948 4.375 4.9375 4.375C4.00552 4.375 3.25 3.61948 3.25 2.6875C3.25 1.75552 4.00552 1 4.9375 1C5.14011 1 5.33437 1.03571 5.51435 1.10117" stroke="#808080" stroke-linecap="round"></path>
                                               <path d="M1 10V8.06439C1 7.45857 1.34677 6.9047 1.91417 6.69234C2.67955 6.40589 3.97001 6.0625 4.9375 6.0625C5.9254 6.0625 7.02163 6.42052 7.88588 6.71039C8.49054 6.91319 8.875 7.48924 8.875 8.12701V10" stroke="#808080" stroke-linecap="round"></path>
                                           </svg>
                                           Nguyễn Anh Dũng
                                       </span>
                                       <span class="icon posted"pan>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11" fill="none">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M0.0683594 5.5C0.0683594 2.46712 2.53547 0 5.56836 0C8.60124 0 11.0684 2.46712 11.0684 5.5C11.0684 8.53288 8.60124 11 5.56836 11C2.53547 11 0.0683594 8.53288 0.0683594 5.5ZM0.920408 5.5C0.920408 8.06255 3.00581 10.148 5.56836 10.148C8.13091 10.148 10.2163 8.06255 10.2163 5.5C10.2163 2.93745 8.13134 0.852049 5.56836 0.852049C3.00581 0.852049 0.920408 2.93745 0.920408 5.5ZM5.99437 5.32102L7.52808 6.47129C7.71639 6.61231 7.75474 6.87943 7.61326 7.06733C7.52975 7.1798 7.40194 7.23817 7.27201 7.23817C7.18297 7.23817 7.09349 7.21048 7.01681 7.15297L5.31272 5.87488C5.20536 5.79479 5.1423 5.66825 5.1423 5.53406V2.97789C5.1423 2.74229 5.33274 2.55185 5.56834 2.55185C5.80393 2.55185 5.99437 2.74229 5.99437 2.97789V5.32102Z" fill="#7F7F7F"></path>
                                        </svg>
                                        Ngày 21/12/2021
                                       </span>
                                    </div>
                                   <p>
                                    adidas Stan Smith đã không còn xa lạ với bất cứ ai yêu mến sneakers trên toàn cầu nói chung và tại Việt Nam nói riêng...
                                   </p>
                                   <div class="view-more d-md-block d-none">
                                       <a href="" title="Xem thêm">
                                           Xem thêm
                                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12" fill="none">
                                               <path d="M10.0586 1L14.9998 6.02351L10.0586 10.9647" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                               <path d="M7.17627 6.02344H14.9175" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                               <path d="M1 6.02344H3.88235" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                           </svg>
                                       </a>
                                   </div>
                               </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-12">
                            <div class="item_blog_base">
                                <div class="block-thumb">
                                    <a class="thumb" href="" title="Nike AIR FORCE 1 Love Women – Phối màu dành riêng cho một nửa thế giới">
                                        <img src="${classpath}/frontend/images/t6.webp" alt="">
                                    </a>
                                </div>
                                <div class="content_blog clearfix">
                                    <h3>
                                       <a class="a-title" href="" title="Nike AIR FORCE 1 Love Women – Phối màu dành riêng cho một nửa thế giới">
                                        King James mang đôi OFF-WHITE x Nike Air Force 1 University Yellow của Virgil Abloh có gì đặc biệt?
                                       </a>
                                    </h3>
                                    <div class="time-post">
                                       <span class="author">
                                           <svg xmlns="http://www.w3.org/2000/svg" width="10" height="11" viewBox="0 0 10 11" fill="none">
                                               <path d="M6.625 2.6875C6.625 3.61948 5.86948 4.375 4.9375 4.375C4.00552 4.375 3.25 3.61948 3.25 2.6875C3.25 1.75552 4.00552 1 4.9375 1C5.14011 1 5.33437 1.03571 5.51435 1.10117" stroke="#808080" stroke-linecap="round"></path>
                                               <path d="M1 10V8.06439C1 7.45857 1.34677 6.9047 1.91417 6.69234C2.67955 6.40589 3.97001 6.0625 4.9375 6.0625C5.9254 6.0625 7.02163 6.42052 7.88588 6.71039C8.49054 6.91319 8.875 7.48924 8.875 8.12701V10" stroke="#808080" stroke-linecap="round"></path>
                                           </svg>
                                           Nguyễn Anh Dũng
                                       </span>
                                       <span class="icon posted"pan>
                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="11" viewBox="0 0 12 11" fill="none">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M0.0683594 5.5C0.0683594 2.46712 2.53547 0 5.56836 0C8.60124 0 11.0684 2.46712 11.0684 5.5C11.0684 8.53288 8.60124 11 5.56836 11C2.53547 11 0.0683594 8.53288 0.0683594 5.5ZM0.920408 5.5C0.920408 8.06255 3.00581 10.148 5.56836 10.148C8.13091 10.148 10.2163 8.06255 10.2163 5.5C10.2163 2.93745 8.13134 0.852049 5.56836 0.852049C3.00581 0.852049 0.920408 2.93745 0.920408 5.5ZM5.99437 5.32102L7.52808 6.47129C7.71639 6.61231 7.75474 6.87943 7.61326 7.06733C7.52975 7.1798 7.40194 7.23817 7.27201 7.23817C7.18297 7.23817 7.09349 7.21048 7.01681 7.15297L5.31272 5.87488C5.20536 5.79479 5.1423 5.66825 5.1423 5.53406V2.97789C5.1423 2.74229 5.33274 2.55185 5.56834 2.55185C5.80393 2.55185 5.99437 2.74229 5.99437 2.97789V5.32102Z" fill="#7F7F7F"></path>
                                        </svg>
                                        Ngày 21/12/2021
                                       </span>
                                    </div>
                                   <p>
                                    Nike lại tiếp tục tung ra một phối màu sử dụng tông màu trắng chủ đạo bằng chất liệu canvas kết hợp denim trên đôi sn...
                                   </p>
                                   <div class="view-more d-md-block d-none">
                                       <a href="" title="Xem thêm">
                                           Xem thêm
                                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="12" viewBox="0 0 16 12" fill="none">
                                               <path d="M10.0586 1L14.9998 6.02351L10.0586 10.9647" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                               <path d="M7.17627 6.02344H14.9175" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                               <path d="M1 6.02344H3.88235" stroke="#3F3FDB" stroke-width="1.25" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                                           </svg>
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
	<%--addToCart --%>
	<script type="text/javascript">
		addToCart = function(_productId, _quantity, _productName, _size){
			// alert("Thêm" + _quantity + "sản phẩm '" + _productName + "'vào giỏ hàng");
			let data = {
					productId: _productId, // Lấy theo id
					quantity: _quantity,
					productName: _productName,
					size: _size,
			};
			//$===jQuery
			jQuery.ajax({
				url : "/add-to-cart",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				dataType : "json",// Kiểu dữ liệu trả về từ controller là json
				
				success : function(jsonResult){
					alert(jsonResult.code + " : "+ jsonResult.message);
					let totalProducts = jsonResult.totalCartProducts;
					$("#totalCartProductsId").html(totalProducts);
				},
				
				error : function(jqXhr, textStatus, errorMessage){
					alert(jsonResult.code + ': Đã có lỗi xảy ra...!')
				},
			});
		}
	</script>
</body>
</html>