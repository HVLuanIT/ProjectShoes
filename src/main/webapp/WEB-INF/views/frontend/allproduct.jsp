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
    <link rel="stylesheet" href="${classpath}/frontend/css/allproduct.css">
    <jsp:include page="/WEB-INF/views/frontend/layout/css.jsp"></jsp:include>
    <title>${title }</title>
</head>
<body>
      <jsp:include page="/WEB-INF/views/frontend/layout/header.jsp"></jsp:include>
    <nav>
        <div class="bread-crumb">
            <div class="container">
                <div class="nd-main-title-breadcrumb text-center">
                    Tất cả sản phẩm
                </div>
                <ul class="breadcrumb">
                    <li class="home" itemprop="itemListElement">
                        <a href="${classpath }/index" itemprop="item" title="Trang chủ">
                            <span itemprop="name">Trang Chủ</span>
                        </a>
                    </li>
                    <li itemprop="itemListElement">
                        <strong itemprop="name">Tất cả sản phẩm</strong>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
    <form id="productSearch" action="${classpath }/allproduct" method="GET">
        <div class="container cate-content">
            <div class="row">
                <div class="sidebar left-content col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="aside-filter clearfix">
                        <div class="aside-hidden-mobile">
                            <div class="filter-container">
                                <div class="aside-item filter-sort sort-filtster">
                                    <div class="aside-title">
                                        Sắp xếp
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>
                                    <div class="sort-cate-left aside-content filter-group">
                                    	<select class="custom-select" id="sortCheck" name="sortCheck">
										<option value="all" selected>Mặc định</option>
										<option value="nameASC"<c:if test="${searchModel.sortCheck.equals('nameASC')}">selected</c:if>>Tên A - Z</option>
										<option value="nameDESC"<c:if test="${searchModel.sortCheck.equals('nameDESC')}">selected</c:if>>Tên Z - A</option>
										<option value="priceASC"<c:if test="${searchModel.sortCheck.equals('priceASC')}">selected</c:if>>Giá thấp đến cao</option>
										<option value="priceDESC"<c:if test="${searchModel.sortCheck.equals('priceDESC')}">selected</c:if>>Giá cao đến thấp</option>
										</select>
                                    </div>
                                </div> 
                                <%-- <div class="aside-item filter-vendor">
                                    <div class="aside-title">
                                        Thương hiệu
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>
                                    <div class="aside-content filter-group">
                                        <ul class="filter-vendor">
                                            <li class="filter-item filter-item--check-box filter-item--green ">
                                                <label for="filter-adidas" data-filter="adidas" class="adidas">
                                                    <input type="checkbox" id="filter-adidas" data-text="Adidas">
                                                    <i class="fa"></i>
                                                    Adidas
                                                </label>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green ">
                                                <label for="filter-nike" data-filter="nike" class="nike">
                                                    <input type="checkbox" id="filter-nike" data-text="Nike">
                                                    <i class="fa"></i>
                                                    Nike
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="aside-item filter-tag-style-2 tag-gender">
                                    <div class="aside-title">
                                        Giới tính
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>
                                    <div class="aside-content filter-group">
                                        <ul>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-nam">
                                                        <input type="checkbox" id="filter-nam" value="Nam" data-text="Nam">
                                                        <i class="fa"></i>
                                                        Nam
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-nu">
                                                        <input type="checkbox" id="filter-nu" value="Nu" data-text="Nu">
                                                        <i class="fa"></i>
                                                        Nữ
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="filter-unisex">
                                                        <input type="checkbox" id="filter-unisex" value="Unisex" data-text="Unisex">
                                                        <i class="fa"></i>
                                                        Unisex
                                                    </label>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div> --%>
                                <div class="aside-item filter-price">
                                    <div class="aside-title">
                                        Giá sản phẩm
                                        <span class="nd-svg collapsible-plus">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="10" height="5" viewBox="0 0 10 5" fill="none">
                                                <path d="M0.993164 0.968199L5.0001 4.97514L9.00704 0.968201L8.06423 0.0253911L5.0001 3.08952L1.93597 0.0253906L0.993164 0.968199Z" fill="#333333"></path>
                                            </svg>
                                        </span>
                                    </div>     
                                    <div class="aside-content filter-group">
                                        <ul>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                    <label for="checkPrice1">
                                                        <input type="checkbox" id="checkPrice1" name="checkPrice" value="1" data-text="Duoi-1000000" 
                                                        <c:if test="${searchModel.checkPrice == 1}">checked</c:if>>
                                                        <i class="fa"></i>0 - 1.000.000đ
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                
                                                    <label for="checkPrice2">
                                                        <input type="checkbox" id="checkPrice2" name="checkPrice" value="2" data-text="1.000.000đ - 3.000.000đ"
                                                        <c:if test="${searchModel.checkPrice == 2}">checked</c:if>>
                                                        <i class="fa"></i>1.000.000đ - 3.000.000đ
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                
                                                    <label for="checkPrice3"> 
                                                        <input type="checkbox" id="checkPrice3" name="checkPrice" value="3" data-text="3.000.000đ - 5.000.000đ"
                                                        <c:if test="${searchModel.checkPrice == 3}">checked</c:if>>
                                                       <i class="fa"></i>3.000.000đ - 5.000.000đ
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                
                                                    <label for="checkPrice4">
                                                        <input type="checkbox" id="checkPrice4" name="checkPrice" value="4" data-text="5.000.000đ - 10.000.000đ"
                                                        <c:if test="${searchModel.checkPrice == 4}">checked</c:if>>
                                                        <i class="fa"></i>5.000.000đ - 10.000.000đ
                                                    </label>
                                                </span>
                                            </li>
                                            <li class="filter-item filter-item--check-box filter-item--green">
                                                <span>
                                                
                                                    <label for="checkPrice5">
                                                        <input type="checkbox" id="checkPrice5" name="checkPrice" value="5" data-text="Tren-10000000"
                                                        <c:if test="${searchModel.checkPrice == 5}">checked</c:if>>
                                                        <i class="fa"></i>Giá trên 10.000.000đ
                                                    </label>
                                                </span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            	<button type="submit" class="normal">Lọc</button>
								<a href="${classpath }/allproduct" class="normal2" type="reset">Reset</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main_container collection col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="category-products products category-products-grids clearfix">
                        <div class="products-view products-view-grid row">
                        <c:forEach items = "${products }" var="product" varStatus="loop">
                            <div class=" mb-3 col-lg-4 col-md-4 col-sm-6 col-6 product-col">
                                <a href="${classpath }/product-detail/${product.id}">
                                    <div class="card">
                                    	<c:if test="${product.salePrice > 0}">
											<div class="sale-flash product-thumbnail sale" data-sale="<fmt:formatNumber value="${discounts[loop.index] * -1}" type="number" pattern="#,##0'%'" />">

											</div>
										</c:if>
                                        <div class="btn-action">
                                            <a href="" title="Sản phẩm yêu thích">
                                                <svg class="icon-heart" xmlns="http://www.w3.org/2000/svg" width="16" height="15" viewBox="0 0 16 15" fill="none">
                                                    <path d="M1.30469 7.70401C0.413933 5.13899 1.5274 1.87444 3.97697 1.17489C5.3131 0.708524 7.09458 1.17487 7.98533 2.57397C8.87608 1.17487 10.6576 0.708524 11.9937 1.17489C14.6659 2.10763 15.5567 5.13899 14.666 7.70401C13.5525 11.6681 9.09877 14 7.98533 14C6.87189 13.7668 2.64081 11.9013 1.30469 7.70401Z" stroke="#949494" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
                                                </svg>
                                            </a>
                                            <div class="action-cart">
                                                <button title="Thêm vào giỏ hàng" >
                                                	<c:set var="firstSize" value="${fn:split(product.size, ',')[0]}" />
                                                	<a onclick="addToCart(event, ${product.id}, 1, '${product.name }', '${firstSize }')">
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
                                            <img src="${classpath}/FileUploads/${product.avatar}" class="card-img-top card-img" alt="...">
                                        </div>
                                        <div class="card-body">
                                          <h3 class="card-title"><a href="${classpath }/product-detail/${product.id}">${product.name }</a></h3>
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
                        <%-- <div class="col-md-6" >
							<!-- Phan trang -->
							<div class="pagination float-right">
									<div id="paging"></div>
							</div>
						</div> --%>
                    </div>
                </div>
               </div>
            </div>
        </div>
        </form>
    </main>
	 <jsp:include page="/WEB-INF/views/frontend/layout/footer.jsp"></jsp:include>
	 <script src="${classpath}/frontend/js/allproduct.js"></script>
    <jsp:include page="/WEB-INF/views/frontend/layout/js.jsp"></jsp:include>
    <%--addToCart --%>
	<script type="text/javascript">
		addToCart = function(event, _productId, _quantity, _productName, _size){
			// alert("Thêm" + _quantity + "sản phẩm '" + _productName + "'vào giỏ hàng");
			event.preventDefault();
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