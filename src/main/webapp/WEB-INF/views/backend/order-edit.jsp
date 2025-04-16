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

	<title>${title }</title>
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

					<h1 class="h3 mb-3">Cập nhập</h1>
					<div class="container-fluid">
						<!-- ============================================================== -->
						<!-- Start Page Content -->
						<!-- ============================================================== -->
						<div class="row">
							<div class="col-12">
								<div class="card">
									<div class="card-body">
										<sf:form class="form"
											action="${classpath }/admin/order/edit-save" method="post"
											modelAttribute="saleOrder" enctype="multipart/form-data">

											<div class="form-body">
												<!-- Thực hiện việc sửa với hidden -->
												<sf:hidden path="id" />
												<!-- id > 0 -> Edit -->

												<div class="row">
													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="code">Mã</label>
															<sf:input path="code" type="text" class="form-control"
																id="code" name="code" placeholder="Code" readonly="true"></sf:input>
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="customerName">Tên khách hàng</label>
															<sf:input path="customerName" type="text"
																class="form-control" id="customerName"
																name="customerName" placeholder="Tên khách hàng" readonly="true"></sf:input>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="customerMobile">Điện thoại</label>
															<sf:input path="customerMobile" type="number"
																 id="customerMobile"
																name="customerMobile" class="form-control"
																placeholder="Điện thoại"></sf:input>
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="customerAddress">Địa chỉ</label>
															<sf:input path="customerAddress" type="text"
																autocomplete="off" id="customerAddress"
																name="customerAddress" class="form-control"
																placeholder="Địa chỉ"></sf:input>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="total">Tổng tiền</label>
															<sf:input path="total" type="number" autocomplete="off"
																id="total" name="total" class="form-control"
																placeholder="total" readonly="true"></sf:input>
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="saleOrder">Người tạo</label>
															<sf:select path="userCreateSaleOrder.id"
																class="form-control" id="userCreateSaleOrder">
																<sf:options items="${users }" itemValue="id"
																	itemLabel="username"></sf:options>
															</sf:select>
														</div>
													</div>


												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="createDate">Ngày tạo</label>

															<sf:input path="createDate" class="form-control"
																type="date" id="createDate" name="createDate"></sf:input>
														</div>
													</div>

													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="updatedate">Ngày giao hàng</label>

															<sf:input path="updateDate" class="form-control"
																type="date" id="updateDate" name="updateDate"></sf:input>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-10">
														<div class="form-group mb-4">
															<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
															<sf:checkbox path="status" class="form-check-input"
																id="status" name="status"></sf:checkbox>
															<label for="status">Đã giao hàng</label>
														</div>
													</div>

												</div>
												<div class="row">
													<div class="col-md-12">
														<div class="form-group mb-4">
															<a href="${classpath }/admin/order/list"
																class="btn btn-secondary active" role="button"
																aria-pressed="true"> Quay lại </a>
															<button type="submit" class="btn btn-primary">Lưu</button>
														</div>
													</div>
												</div>

											</div>
										</sf:form>
									</div>
								</div>
							</div>

						</div>
					</div>
					<%--===================================================================== --%>
				</div>
			</main>


		</div>
	</div>

	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
</body>

</html>