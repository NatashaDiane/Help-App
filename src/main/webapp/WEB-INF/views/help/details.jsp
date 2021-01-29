<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<section class="content-header">
	<h1>Help Request Details</h1>
	<ol class="breadcrumb">
		<li><a href="${pageContext.request.contextPath}/dashboard"><i
				class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="${pageContext.request.contextPath}/help/history">Help requests history</a></li>		
		<li class="active">Help request details</li>
	</ol>
</section>

<!-- Main content -->
<section class="invoice">
	<!-- title row -->
	<div class="row">
		<div class="col-xs-12">
			<h2 class="page-header">
				Title: ${request.title} <small class="pull-right">Date created:
					${request.createdDate}</small>
			</h2>
		</div>
		<!-- /.col -->
	</div>
	<!-- info row -->
	<div class="row invoice-info">
		<div class="col-sm-4 invoice-col">
			<address>
				From: ${request.account.fullName}
				<br>
				Email: ${request.account.email}
			</address>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

	<!-- Table row -->
	<div class="row">
		<div class="col-xs-12 table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>Category</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${request.category.name }</td>
						<td>${request.description}</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- /.col -->
	</div>
	<!-- /.row -->

	<sec:authorize access="hasRole('ROLE_STUDENT')">
	<div class="row ">
		<div class="col-xs-12">
			<button type="button" class="btn btn-primary pull-right"
				style="margin-right: 5px;">
				<i class="fa fa-edit"></i> Edit
			</button>
		</div>
	</div>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_TEACHER')">
	<div class="row ">
		<div class="col-xs-12">
			<button type="button" class="btn btn-primary pull-right"
				style="margin-right: 5px;">
				<i class="fa fa-edit"></i> Answer
			</button>
		</div>
	</div>
	</sec:authorize>
</section>
<!-- /.content -->
