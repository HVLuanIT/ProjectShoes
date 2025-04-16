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
    <link rel="stylesheet" href="${classpath}/frontend/css/news.css">
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <title>${title }</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="bread-crumb">
            <div class="container">
                <div class="nd-main-title-breadcrumb text-center">
                    Tin tức
                </div>
                <ul class="breadcrumb">
                    <li class="home" itemprop="itemListElement">
                        <a href="${classpath }/index" itemprop="item" title="Trang chủ">
                            <span itemprop="name">Trang Chủ</span>
                        </a>
                    </li>
                    <li itemprop="itemListElement">
                        <strong itemprop="name">Tin tức</strong>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
        <div class="awe-section-8">
            <div class="section_blog">
                <div class="container">
                    <div class="row blogs_mobile_base">
                        <div class="col-lg-4 col-md-4 col-12 mb-3">
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
                        <div class="col-lg-4 col-md-4 col-12 mb-3">
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
                        <div class="col-lg-4 col-md-4 col-12 mb-3">
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
                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                            <div class="item_blog_base">
                                <div class="block-thumb">
                                    <a class="thumb" href="" title="Hàng loạt các phối màu của adidas Stan Smith được tung ra dành cho tín đồ mê sneakers">
                                        <img src="${classpath}/frontend/images/t4.webp" alt="">
                                    </a>
                                </div>
                                <div class="content_blog clearfix">
                                    <h3>
                                       <a class="a-title" href="" title="Hàng loạt các phối màu của adidas Stan Smith được tung ra dành cho tín đồ mê sneakers">
                                        Tokyo hoài niệm trong Tuần lễ Thời trang Milan
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
                                    Thương hiệu thời trang Nhật Bản Onitsuka Tiger tiếp tục trình làng bộ sưu tập (BST) đương đại kết hợp giữa thời trang...
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
                        <div class="col-lg-4 col-md-4 col-12 mb-3">
                            <div class="item_blog_base">
                                <div class="block-thumb">
                                    <a class="thumb" href="" title="Hàng loạt các phối màu của adidas Stan Smith được tung ra dành cho tín đồ mê sneakers">
                                        <img src="${classpath}/frontend/images/t3.webp" alt="">
                                    </a>
                                </div>
                                <div class="content_blog clearfix">
                                    <h3>
                                       <a class="a-title" href="" title="Hàng loạt các phối màu của adidas Stan Smith được tung ra dành cho tín đồ mê sneakers">
                                        Onitsuka Tiger ra mắt đồng phục chính thức của Intel World Open
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
                                        Ngày 21/10/2022
                                       </span>
                                    </div>
                                   <p>
                                    Thương hiệu thời trang Nhật Bản Onitsuka Tiger tự hào thông báo về việc tham gia Intel World Open – giải đấu Esports ...
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
</body>
</html>