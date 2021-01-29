<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="content-header">
	<h1>Help Requests</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Help requests</li>
	</ol>
</section>

<!-- Main content -->
<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">

					<c:if test="${error != null}">
						<div class="callout callout-danger">
							<h4>${error}</h4>
						</div>
					</c:if>

					<table id="example2" class="table table-bordered table-hover">
						<thead>
							<tr>
								<th>Student</th>
								<th>Title</th>
								<th>Created Date</th>
								<th>Category</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="help" items="${requests}">
								<tr>
									<td>${help.account.fullName}</td>
									<td>${help.title}</td>
									<td><fmt:formatDate var="createdDate"
											value="${help.createdDate}" /> ${createdDate}</td>
									<td>${help.category.name}</td>
									<td><a
										href="${pageContext.request.contextPath}/help/details/${help.helpId}">Details</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Student</th>
								<th>Title</th>
								<th>Created Date</th>
								<th>Category</th>
								<th>Action</th>
							</tr>
						</tfoot>
					</table>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->
</section>