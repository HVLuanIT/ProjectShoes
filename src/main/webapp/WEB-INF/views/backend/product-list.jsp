<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="${classpath }/backend/img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/pages-blank.html" />

	<title>projectshoes</title>
	<jsp:include page="/WEB-INF/views/backend/layout/css.jsp"></jsp:include>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
	<div class="wrapper">
			<jsp:include page="/WEB-INF/views/backend/layout/header.jsp"></jsp:include>

		<div class="main">
			<jsp:include page="/WEB-INF/views/backend/layout/mainnav.jsp"></jsp:include>	
			<main class="content">
				<div class="container-fluid p-0">

					<h1 class="h3 mb-3">Danh sách sản phẩm</h1>
					<!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- basic table -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                        	
                            <div class="card-body">
	                        	<form action="${classpath }/admin/product/list" method="get">
		                            <div class="table-responsive">
	                                	
	                               	<div class="row">
										<div class="col-md-2">
											<div class="form-group mb-4">
												<a href="${classpath }/admin/product/add" role="button"
													class="btn btn-primary">Thêm mới</a>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group mb-4">
												<h3>Tổng sản phẩm: &nbsp ${productSearch.totalItems }</h3>
											</div>
											<div class="form-group mb-4">
												
												<h3>Số lượng sản phầm còn: <fmt:formatNumber value="${totalProducts}"
																minFractionDigits="0"></fmt:formatNumber></h3>
											</div>
										</div>	
										
										<div class="col-md-6">
											<div class="form-group mb-4">
												<label>Trang số</label>
												<input id="currentPage" name="currentPage" class="form-control"
														value="${productSearch.currentPage }">
											</div>
										</div>	
	
									</div>	
										<!-- Tìm kiếm -->
										<div class="row">
											<div class="col-md-2">
												<div class="form-group mb-4">
													<!-- 
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<input type="checkbox" class="form-check-input" id="status" name="status" checked="checked" />
			                                        <label for="status">Active</label>
			                                         -->
			                                        <select class="form-control"
														id="status" name="status">
															<option value="2">Tất cả</option>
															<option value="1">Hoạt động</option>
															<option value="0">Không hoạt động</option>
													</select>
												</div>
											</div>
											
											<div class="col-md-2">
												<select class="form-control" id="categoryId" name="categoryId" style="margin-right: 10px;">
													<option value="0">Loại sản phẩm</option>
													<c:forEach items="${categories }" var="category">
														<option value="${category.id }">${category.name }</option>
													</c:forEach>
												</select>
											</div>
											
											<div class="col-md-2">
												<input class="form-control" type="date" 
													id="beginDate" name="beginDate"/>		
											</div>
											<div class="col-md-2">
												<input class="form-control"
																type="date" id="endDate" name="endDate" />		
											</div>
											
											<div class="col-md-3">
												<input type="text" class="form-control" id="keyword"
														name="keyword" placeholder="Tìm theo tên" />		
											</div>
											
											<div class="col-md-1">
												<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Tìm</button>
											</div>
										</div>
										<!-- Hết tìm kiếm -->
	                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
	                                        <thead>
	                                            <tr align="center">
	                                            	<th scope="col">STT</th>
	                                                <th scope="col">ID</th>
	                                                <th scope="col">Loại sản phẩm</th>
	                                                <th scope="col">Tên</th>
	                                                <th scope="col">Số lượng</th>
	                                                <th scope="col">Giá</th>
	                                                <th scope="col">Giảm giá</th>
	                                                <th scope="col">Size</th>
	                                                <th scope="col">Ảnh</th>
	                                                <th scope="col">Mô tả</th>
	                                                <th scope="col">Mô tả chi tiết</th>
	                                                <th scope="col">Người tạo</th>
	                                                <th scope="col">Người cập nhập</th>
	                                                <th scope="col">Ngày tạo</th>
	                                                <th scope="col">Ngày cập nhập</th>
	                                                <th scope="col">Trạng thái</th>
	                                                <th scope="col">Bán chạy</th>
	                                                <th scope="col">Seo</th>
	                                                <th scope="col">Hoạt động</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach var="product" items="${products }" varStatus="loop">
	                                            <tr>
	                                            	<th scope="row">${loop.index + 1 }</th>
	                                                <td>${product.id }</td>
	                                                <td>${product.category.name }</td>
	                                                <td>${product.name }</td>
	                                                <td align="right">${product.productQuantity }</td>
	                                                <td align="right">
	                                                	<fmt:formatNumber value="${product.price }" minFractionDigits="0"></fmt:formatNumber>
	                                                </td>
	                                                <td align="right">${product.salePrice }</td>
	                                                <td>${product.size }</td>
	                                                <td>
	                                                	<img width="40px" height="40px" 
	                                                		src="${classpath }/FileUploads/${product.avatar }" class="light-logo">
	                                                </td>
	                                                
	                                                <td>${product.shortDescription }</td>
	                                                <td>${product.detailDescription }</td>
	                                                <td>${product.userCreateProduct.username }</td>
	                                                <td>${product.userUpdateProduct.username }</td>
	                                                
	                                                <td>
	                                                	<fmt:formatDate value="${product.createDate }" pattern="dd-MM-yyyy"/>
	                                                </td>
	                                                <td>${product.updateDate }</td>
	                                                
	                                                <td>
	                                                	<span id="_product_status_${product.id }">
	                                                		<c:choose>
	                                                			<c:when test="${product.status }">
	                                                				<span>Hoạt động</span>
	                                                			</c:when>
	                                                			<c:otherwise>
	                                                				<span>Không hoạt động</span>
	                                                			</c:otherwise>
	                                                		</c:choose>
	                                                	</span>
	                                                	
	                                                </td>
	                                                <td>
	                                                	<span id="_product_isHot_${product.id }">
	                                                		<c:choose>
	                                                			<c:when test="${product.isHot }">
	                                                				<span>Có</span>
	                                                			</c:when>
	                                                			<c:otherwise>
	                                                				<span>Không</span>
	                                                			</c:otherwise>
	                                                		</c:choose>
	                                                	</span>
	                                                </td>
	                                               	<td>${product.seo }</td>
	                                                <td>
	                                                	<a href="${classpath }/admin/product/edit/${product.id }" role="button" 
	                                                							class="btn btn-primary">Sửa</a>
	                                                	<a href="${classpath }/admin/product/delete/${product.id }" role="button" 
	                                                							class="btn btn-secondary">Xóa</a>
	                                                </td>
	                                            </tr>
	                                            </c:forEach>
	                                        </tbody>
	                                    </table>
	                                    
	                                    <div class="row">
											<%--Phân trang --%>
		                                    <div class="col-md-12">
			                                    <div class="pagination justify-content-center">
													<div id="paging"></div>
												</div>
		                                    </div>
		                                </div>
		                            </div>	                           
	                        	</form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
					
				</div>
			</main>

		</div>
	</div>

<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
<script type="text/javascript">
		$( document ).ready(function() {
			//Dat gia tri cua status ung voi dieu kien search truoc do
			$("#status").val(${productSearch.status});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			$("#categoryId").val(${productSearch.categoryId});
			//Dat gia tri cua category ung voi dieu kien search truoc do
			//$("#keyword").val(${productSearch.keyword});
			
			
			$("#paging").pagination({
				currentPage: ${productSearch.currentPage}, //Trang hien tai
				items: ${productSearch.totalItems}, //Tong so san pham (total products)
				itemsOnPage: ${productSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event) {
					$('#currentPage').val(pageNumber);
					$('#btnSearch').trigger('click');
				},
			});
		});
	</script>
</body>

</html>