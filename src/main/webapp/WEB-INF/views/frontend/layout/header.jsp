<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <header>
        <div class="conatiner">
            <div class="middle-header">
                <div class="header-top">
                    <div class="align-item-center">
                        <div class="logo">
                             <a href="${classpath }/index">
                                <img src="${classpath}/frontend/images/logo.webp" alt="">
                             </a>
                        </div>
                        <div class="menu">
                            <ul>
                                <li class="nav-item active">
                                    <a href="${classpath }/index">Trang chủ</a>
                                </li>
                                <li class="nav-item">
                                    <a  href="${classpath }/Introduce">Giới thiệu</a>
                                </li>
                                <li class="nav-item nav-hover">
                                    <a href="${classpath }/allproduct">Sản phẩm
                                        <svg class="icon-menu" fill="white" xmlns="http://www.w3.org/2000/svg" height="16" width="10" viewBox="0 0 320 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z"/></svg>
                                    </a>
                                    <ul class="sub-menu">
                                    <c:forEach items="${categories }" var="category">
                                        <li class="sub-li">
                                            <a href="${classpath }/allproduct?categoryId=${category.id}">${category.name }</a>
                                        </li>
                                    </c:forEach>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a href="${classpath }/news">Tin tức</a>
                                </li>
                                <li class="nav-item">
                                    <a href="${classpath}/contact">Liên hệ</a>
                                </li>
                            </ul>
                        </div>
                        <div class="header-right">
                            <div class="group-account">
                                <ul>
                                    <li class="block-search">
                                        <div class="icon" >
                                            <a href="">
                                                <svg class="icon-header" fill="white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                                            </a>
                                        </div>
                                        <div class="nd-header-search nd-search">
                                            <form action="">
                                                <input type="text" value="${keyword}" name="keyword" id="keyword" placeholder="Tìm kiếm sản phẩm ">
                                                <button type = "submit" id ="btnSearch" name ="btnSearch">
                                                    <svg class="icon-search" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z"/></svg>
                                                </button>
                                            </form>
                                        </div>
                                    </li>
                                    <li class="user">
                                        <div class="icon">
                                            <a href="${classpath }/profile" title="Đăng nhập/Đăng ký">
                                                <svg class="icon-header" fill="white" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M304 128a80 80 0 1 0 -160 0 80 80 0 1 0 160 0zM96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM49.3 464H398.7c-8.9-63.3-63.3-112-129-112H178.3c-65.7 0-120.1 48.7-129 112zM0 482.3C0 383.8 79.8 304 178.3 304h91.4C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7H29.7C13.3 512 0 498.7 0 482.3z"/></svg>
                                        </div>
                                        <div class="drop-account">
                                            <a href="${classpath }/login">Đăng nhập</a>
                                            <a href="${classpath }/signup">Đăng ký</a>
                                            <%--<a href="${classpath}/manageorders">Đơn hàng</a> --%>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="icon">
                                            <a href="" class="wishlist-header" title="Sản phẩm yêu thích">
                                                <svg class="icon-header" xmlns="http://www.w3.org/2000/svg" width="18" height="17" viewBox="0 0 18 17" fill="black"><path d="M1.34821 8.7354C0.330209 5.77575 1.60274 2.00897 4.40225 1.2018C5.92926 0.663681 7.96523 1.20177 8.98323 2.81612C10.0012 1.20177 12.0372 0.663681 13.5642 1.2018C16.6182 2.27803 17.6363 5.77575 16.6183 8.7354C15.3458 13.3094 10.2557 16 8.98323 16C7.71073 15.7309 2.87522 13.5784 1.34821 8.7354Z" stroke="white" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path></svg>
                                                <span class="headerwishlistcount">0</span>
                                            </a>
                                        </div>
                                    </li>
                                    <li class="cart-drop">
                                        <div class="icon">
                                            <a class="list-cart" href="${classpath }/cart-view" title="Danh sách giỏ hàng">
                                                <svg class="icon-header" xmlns="http://www.w3.org/2000/svg" width="19" height="17" viewBox="0 0 19 17" fill="none">
                                                    <circle cx="9" cy="15.7368" r="1.26316" fill="white"></circle>
                                                    <circle cx="14.0526" cy="15.7368" r="1.26316" fill="white"></circle>
                                                    <path d="M2.68421 6.05273L1.8421 6.05273" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    <path d="M3.52631 11.1055L2.6842 11.1055" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    <path d="M3.52632 8.5791L1 8.5791" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                    <path d="M5.01003 3.94737L6.72226 11.6163C6.87534 12.3019 7.48373 12.7895 8.18622 12.7895H14.6659C15.3684 12.7895 15.9768 12.3019 16.1299 11.6163L17.4342 5.77422C17.6435 4.83706 16.9305 3.94737 15.9703 3.94737H14.6341H12.7895M5.01003 3.94737L4.50902 2.10616C4.33133 1.45315 3.73839 1 3.06164 1H1M5.01003 3.94737H8.21804H9.42105" stroke="white" stroke-width="1.5" stroke-linecap="round"></path>
                                                </svg>
                                            <span class="count-item" id="totalCartProductsId">${totalCartproducts }</span>
                                            </a>
                                        </div>
                                        <%-- 
                                        <div class="drop-cart-content">
                                            <div class="cartHeaderContainer">
                                                <div class="cart-empty-message">
                                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--! Font Awesome Pro 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M388.32,104.1a4.66,4.66,0,0,0-4.4-4c-2,0-37.23-.8-37.23-.8s-21.61-20.82-29.62-28.83V503.2L442.76,472S388.72,106.5,388.32,104.1ZM288.65,70.47a116.67,116.67,0,0,0-7.21-17.61C271,32.85,255.42,22,237,22a15,15,0,0,0-4,.4c-.4-.8-1.2-1.2-1.6-2C223.4,11.63,213,7.63,200.58,8c-24,.8-48,18-67.25,48.83-13.61,21.62-24,48.84-26.82,70.06-27.62,8.4-46.83,14.41-47.23,14.81-14,4.4-14.41,4.8-16,18-1.2,10-38,291.82-38,291.82L307.86,504V65.67a41.66,41.66,0,0,0-4.4.4S297.86,67.67,288.65,70.47ZM233.41,87.69c-16,4.8-33.63,10.4-50.84,15.61,4.8-18.82,14.41-37.63,25.62-50,4.4-4.4,10.41-9.61,17.21-12.81C232.21,54.86,233.81,74.48,233.41,87.69ZM200.58,24.44A27.49,27.49,0,0,1,215,28c-6.4,3.2-12.81,8.41-18.81,14.41-15.21,16.42-26.82,42-31.62,66.45-14.42,4.41-28.83,8.81-42,12.81C131.33,83.28,163.75,25.24,200.58,24.44ZM154.15,244.61c1.6,25.61,69.25,31.22,73.25,91.66,2.8,47.64-25.22,80.06-65.65,82.47-48.83,3.2-75.65-25.62-75.65-25.62l10.4-44s26.82,20.42,48.44,18.82c14-.8,19.22-12.41,18.81-20.42-2-33.62-57.24-31.62-60.84-86.86-3.2-46.44,27.22-93.27,94.47-97.68,26-1.6,39.23,4.81,39.23,4.81L221.4,225.39s-17.21-8-37.63-6.4C154.15,221,153.75,239.8,154.15,244.61ZM249.42,82.88c0-12-1.6-29.22-7.21-43.63,18.42,3.6,27.22,24,31.23,36.43Q262.63,78.68,249.42,82.88Z"/></svg>
                                                    <p>Không có sản phẩm nào trong giỏ hàng của bạn</p>
                                                </div>
                                            </div>
                                        </div> 
                                        --%>
                                    </li>
                                    <li class="d-lg-none d-inline-block" id="toggleMenu">
                                        <div class="category-action">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="12" viewBox="0 0 18 12" fill="none">
                                                <path d="M6 2V0H18V2H6Z" fill="#F97E6C"></path>
                                                <path d="M0 7H18V5H0V7Z" fill="#F97E6C"></path>
                                                <path d="M6 12H18V10H6V12Z" fill="#F97E6C"></path>
                                             </svg>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
    </header>