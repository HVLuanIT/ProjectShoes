<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!-- directive của JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<link rel="shortcut icon" href="${classpath }/backend/img/icons/icon-48x48.png" />
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

					<h1 class="h3 mb-3">Danh sách quyền</h1>
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
                                <div class="table-responsive">
                                	
                               	<div class="row">
                       		 		<div class="col-md-6">
										<div class="form-group mb-4">
	                                        <a href="${classpath }/admin/role/add" role="button" class="btn btn-primary">Thêm mới</a>
                                      	</div>
                                   	</div>
                                </div>
                                
                                    <table id="zero_config" class="table table-striped table-bordered no-wrap">
                                        <thead>
                                            <tr>
                                            	<th scope="col">STT</th>
                                                <th scope="col">ID</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Người tạo</th>
                                                <th scope="col">Người cập nhập</th>
                                                <th scope="col">Ngày tạo</th>
                                                <th scope="col">Ngày cập nhập</th>
                                                <th scope="col">Trạng thái</th>  
                                                <th scope="col">Mô tả</th> 
                                                <th scope="col">Hoạt động</th>                                             
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="role" items="${roles }" varStatus="loop">
                                        		<tr>
		                                        	<td>${loop.index + 1 }</td>
		                                        	<td>${role.id }</td>
		                                        	<td>${role.name }</td>
		                                        	<td>${role.userCreateRole.username }</td>
		                                        	<td>${role.userUpdateRole.username }</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${role.createDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>
		                                        		<fmt:formatDate value="${role.updateDate }" pattern="dd-MM-yyyy"/>
		                                        	</td>
		                                        	<td>${role.status }</td>
	                                        		<td>${role.description }</td>
	                                        		<td>
	                                        			<a href="${classpath }/admin/role/edit/${role.id }" role="button" 
	                                                							class="btn btn-primary">Sửa</a>
	                                                	<a href="${classpath }/admin/role/delete/${role.id }" role="button" 
	                                                							class="btn btn-secondary">Xóa</a>
	                                        		</td>
                                        		</tr>
                                        	</c:forEach>
                                        </tbody>
                                    </table>
                                    
                                    <div class="row">
	                                    <div class="row">
											<%--Phân trang --%>
		                                    <div class="col-md-12">
			                                    <div class="pagination justify-content-center">
													<div id="paging"></div>
												</div>
		                                    </div>
		                                </div>
	                                  </div>
	                            </div>
                            </div>
                        </div>
                    </div>
                </div>
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
		$(document ).ready(function(){
			$("#paging").pagination({
				currentPage: ${roleSearch.currentPage},// Trang hiện tại
				items: ${roleSearch.totalItems},// Tổng số sản phẩm
				itemsOnPage: ${roleSearch.sizeOfPage},
				cssStyle: 'light-theme',
				onPageClick: function(pageNumber, event){
					window.location.href = "${classpath}/admin/role/list?currentPage=" + pageNumber;
				},
			});
		});
	</script>
</body>

</html>