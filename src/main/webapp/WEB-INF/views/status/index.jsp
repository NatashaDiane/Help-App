<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="content-header">
	<h1>Status List</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li class="active">Status List</li>
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
								<th>Id</th>
								<th>Name</th>
								<th>Color</th>
								<th>Display</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="status" items="${statuses}">
								<tr>
									<td>${status.statusId}</td>
									<td>${status.name}</td>
									<td><span class="label label-${status.color}">&nbsp;</span></td>
									<td>${status.display ? "Show" : "Hide"}</td>
									<td>
										<a href="${pageContext.request.contextPath}/status/edit/${status.statusId}"><i class="fa fa-edit"></i></a>
										<span>&nbsp;&nbsp;</span> 
										<a href="${pageContext.request.contextPath}/status/delete/${status.statusId}"
										onclick="return confirm('Are you sure?')"><i class="fa fa-trash"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th>Id</th>
								<th>Name</th>
								<th>Color</th>
								<th>Status</th>
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