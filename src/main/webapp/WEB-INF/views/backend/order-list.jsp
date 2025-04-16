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
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

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

					<h1 class="h3 mb-3">Danh sách đơn hàng</h1>
					<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<!-- basic table -->
				<form action="${classpath }/admin/order/list" method="get">
					
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<div class="table-responsive">
											
											<!-- Tìm kiếm -->
											<div class="row">
												<div class="col-md-2">
													<div class="form-group mb-4">
				                                        <select class="form-control"
															id="status" name="status">
																<option value="2">Tất cả</option>
																<option value="1">Đơn hàng đã giao</option>
																<option value="0">Đơn hàng chưa giao</option>
														</select>
													</div>
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
															name="keyword" placeholder="Tìm kiếm" />		
												</div>
												
												<div class="col-md-1">
													<button type="submit" id="btnSearch" name="btnSearch" class="btn btn-primary">Tìm</button>
												</div>
												<div class="col-md-1">
													<input id="currentPage" name="currentPage" 
																		class="form-control" value="${orderSearch.currentPage }">
												</div>
											</div>
											<!-- Hết tìm kiếm -->
		
											<table id="zero_config"
												class="table table-striped table-bordered no-wrap">
												<thead>
													<tr align="center">
														<th scope="col">STT</th>
														<th scope="col">ID</th>
														<th scope="col">Mã</th>
														<th scope="col">Tên khách hàng</th>
														<th scope="col">Điện thoại</th>
														<th scope="col">Địa chỉ</th>
														<th scope="col">Tổng tiền</th>
														<th scope="col">Người cập nhập</th>
														<!-- <th scope="col">Update by</th> -->
														<th scope="col">Ngày tạo</th>
														<th scope="col">Ngày giao hàng</th>
														<th scope="col">Trạng thái</th>
														<th scope="col">Hoạt động</th>
	
													</tr>
												</thead>
												<tbody>
													<c:forEach var="saleOrder" items="${saleOrders }"
														varStatus="loop">
														<tr>
															<th scope="row">${loop.index + 1 }</th>
															<th align="center">${saleOrder.id }</th>
															<td align="center">${saleOrder.code }</td>
															<td>${saleOrder.customerName }</td>
															<td align="center">${saleOrder.customerMobile }</td>
															<td>${saleOrder.customerAddress }</td>
															<td align="right"><fmt:formatNumber
																	value="${saleOrder.total }" minFractionDigits="0"></fmt:formatNumber>
															</td>
															<td>${saleOrder.userCreateSaleOrder.username }</td>
															<%-- <td>${saleOrder.updateBy }</td> --%>
															<td><fmt:formatDate pattern="dd-MM-yyyy"
																	value="${saleOrder.createDate}" /></td>
															<td><fmt:formatDate pattern="dd-MM-yyyy"
																	value="${saleOrder.updateDate}" /></td>
	
															<td>
															<c:choose>
																	<c:when test="${saleOrder.status }">
																		Đã giao hàng
																	</c:when>
																	<c:otherwise>Chưa giao hàng</c:otherwise>
																</c:choose></td>
															<td><a
																href="${classpath }/admin/order/detail/${saleOrder.id }"
																role="button" class="btn btn-primary">Chi tiết</a>
															<a
																href="${classpath }/admin/order/edit/${saleOrder.id }"
																role="button" class="btn btn-primary">Cập nhập</a>
															<a
																href="${classpath }/admin/order/delete/${saleOrder.id }"
																role="button" class="btn btn-secondary">Xóa</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>

											<div class="row">
												<div class="col-md-6">
													<div class="form-group mb-4">
														<h3>
															Tổng tiền:
															<fmt:formatNumber value="${totalSales }"
																minFractionDigits="0"></fmt:formatNumber>(vnđ)
														</h3>
													</div>
												</div>
												<div class="col-md-6" >
													<!-- Phan trang -->
													<div class="pagination float-right">
														<div id="paging"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					
				</form>
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
				</div>
			</main>


		</div>
	</div>

	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
	<script type="text/javascript">
	$( document ).ready(function() {
		//Dat gia tri cua status ung voi dieu kien search truoc do
		$("#status").val(${orderSearch.status});
		//Dat gia tri cua order ung voi dieu kien search truoc do
		$("#orderId").val(${orderSearch.orderId});
		//Dat gia tri cua order ung voi dieu kien search truoc do
		//$("#keyword").val(${orderSearch.keyword});
		
		
		$("#paging").pagination({
			currentPage: ${orderSearch.currentPage}, //Trang hien tai
			items: ${orderSearch.totalItems}, //Tong so san pham (total products)
			itemsOnPage: ${orderSearch.sizeOfPage},
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