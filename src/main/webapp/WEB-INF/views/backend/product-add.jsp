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
	<link rel="shortcut icon" href="${classpath }/img/icons/icon-48x48.png" />

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

					<h1 class="h3 mb-3">Thêm mới</h1>
					<div class="container-fluid">
						<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				
                <div class="row">
                	<div class="col-12">
	                    <div class="card">
	                        <div class="card-body">
	                        	<sf:form class="form" action="${classpath }/admin/product/add-save" method="post" modelAttribute="product" enctype="multipart/form-data">
	                        		 
	                        		 <div class="form-body">
	                        			<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="category">Loại sản phẩm</label>
			                                        <sf:select path="category.id" class="form-control" id="category">
			                                            <sf:options items="${categories }" itemValue="id" itemLabel="name"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
										
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="name">Tên sản phẩm</label>
			                                        <sf:input path="name" type="text" class="form-control" id="name" name="name" placeholder="Tên sản phẩm"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="productQuantity">Số lượng</label>
															<sf:input path="productQuantity" type="number" class="form-control"
																id="productQuantity" name="productQuantity" placeholder="product quantity"></sf:input>
														</div>
													</div>
													
													<div class="col-md-6">
														<div class="form-group mb-4">
															<label for="size">Size</label>
															<sf:input path="size" type="text" id="size" name="size"
																class="form-control" placeholder="Size"></sf:input>
														</div>
													</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="price">Giá</label>
			                                        <sf:input path="price" type="number" autocomplete="off" id="price" name="price" class="form-control" placeholder="Giá"></sf:input>
                                        		</div>
	                                    	</div>
										
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="salePrice">Giá giảm</label>
			                                        <sf:input path="salePrice" type="number" autocomplete="off" id="salePrice" name="salePrice" class="form-control" placeholder="Giá giảm"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="create">Người tạo</label>
			                                        <sf:select path="userCreateProduct.id" class="form-control" id="createBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="update">Người cập nhập</label>
			                                        <sf:select path="userUpdateProduct.id" class="form-control" id="updateBy">
			                                            <sf:options items="${users }" itemValue="id" itemLabel="username"></sf:options>
			                                        </sf:select>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="createdate">Ngày tạo</label>
			                                        
			                                        <sf:input path="createDate" class="form-control" type="date" 
			                                        			id="createDate" name="createDate"></sf:input>
                                        		</div>
	                                    	</div>
									
											<div class="col-md-6">
												<div class="form-group mb-4">
			                                        <label for="updatedate">Người cập nhập</label>
			                                       
			                                        <sf:input path="updateDate" class="form-control" type="date" 
			                                        			id="updateDate" name="updateDate"></sf:input>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="description">Mô tả</label>
			                                        <sf:textarea path="shortDescription" id="shortDescription" name="shortDescription"
																class="form-control" rows="3" placeholder="Mô tả..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="detailDescription">Mô tả chi tiết</label>
			                                        <sf:textarea path="detailDescription" id="detailDescription" name="detailDescription"
																class="form-control" rows="3" placeholder="Mô tả chi tiết..."></sf:textarea>
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-2">
												<div class="form-group mb-4">
													<label for="isHot">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="isHot" class="form-check-input" id="isHot" name="isHot"></sf:checkbox>
			                                        <label for="isHot">Bán chạy</label>
			                                       
                                        		</div>
	                                    	</div>
	                                    	
	                                    	<div class="col-md-10">
												<div class="form-group mb-4">
													<label for="status">&nbsp;&nbsp;&nbsp;&nbsp;</label>
													<sf:checkbox path="status" class="form-check-input" id="status" name="status"></sf:checkbox>
			                                        <label for="status">Hoạt động</label>
			                                       
                                        		</div>
	                                    	</div>
	                                    	
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="avatarFile">Chọn ảnh đại diện</label>
                                    				<input id="avatarFile" name="avatarFile" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Chọn ảnh</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Chọn ảnh</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Chọn ảnh</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <label for="image">Chọn ảnh</label>
                                    				<input id="imageFiles" name="imageFiles" type="file" class="form-control-file" multiple="multiple" >
                                        		</div>
	                                    	</div>
										</div>
										
										<div class="row">
	                        		 		<div class="col-md-12">
												<div class="form-group mb-4">
			                                        <a href="${classpath }/admin/product/list" class="btn btn-secondary active" role="button" aria-pressed="true">
			                                        	Quay lại
			                                        </a>
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

				<!-- End PAge Content -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
				</div>
			</main>
			
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/backend/layout/js.jsp"></jsp:include>
</body>

</html>