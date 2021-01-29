<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>


<sql:setDataSource var="myDatasource" driver="org.postgresql.Driver"
	url="jdbc:postgresql://localhost:5432/Hjalpinatorn" user="aoife"
	password="martin" />

<sec:authorize access="hasRole('ROLE_TEACHER')">
	<section class="content-header">
		<h1>Show All Students</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/dashboard"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Show all students</li>
		</ol>
	</section>

	<sql:query var="listUsers" dataSource="${myDatasource}">
    	SELECT * FROM account WHERE role_id = 2;
	</sql:query>

	<!-- Main content -->
	<section class="content">
		<div class="box">
			<!-- /.box-header -->
			<div class="box-body">
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>Username</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="account" items="${listUsers.rows}">
							<tr>
								<td>${account.account_id}</td>
								<td>${account.username}</td>
								<td>${account.full_name}</td>
								<td>${account.email}</td>
								<td>${account.status ? "Active" : "Deactivated"}</td>
								
								<td>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;</span> 
									<a href="${pageContext.request.contextPath}/account/delete/${account.account_Id}"
									onclick="return confirm('Are you sure?')"><i class="fa fa-trash"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th>Id</th>
							<th>Username</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<section class="content-header">
		<h1>Show all teachers</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/dashboard"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Show all teachers</li>
		</ol>
	</section>

	<sql:query var="listUsers" dataSource="${myDatasource}">
    	SELECT * FROM account WHERE role_id = 1;
	</sql:query>

	<!-- Main content -->
	<section class="content">
		<div class="box">
			<!-- /.box-header -->
			<div class="box-body">
				<table id="example1" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>Username</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="account" items="${listUsers.rows}">
							<tr>
								<td>${account.account_id}</td>
								<td>${account.username}</td>
								<td>${account.full_name}</td>
								<td>${account.email}</td>
								<td>${account.status ? "Active" : "Deactivated"}</td>

								<td>
									<!-- <a href="${pageContext.request.contextPath}/account/edit/${account.account_Id}"><i class="fa fa-edit"></i></a>--> 
									<span>&nbsp;&nbsp;</span>
									<a href="${pageContext.request.contextPath}/account/delete/${account.account_Id}"
									onclick="return confirm('Are you sure?')"><i class="fa fa-trash"></i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<th>Id</th>
							<th>Username</th>
							<th>Full Name</th>
							<th>Email</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
	</section>
</sec:authorize>


