<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="hasRole('ROLE_TEACHER')">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Add a Student's Account</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/dashboard"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Add a student</li>
		</ol>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<c:if test="${error != null }">
						<div class="callout callout-danger">
							<h4>${error}</h4>
						</div>
					</c:if>

					<!-- form start -->
					<s:form method="post" modelAttribute="account"
						action="${pageContext.request.contextPath}/account/add"
						role="form">
						<div class="box-body">
							<div class="form-group">
								<label for="username">Username</label>
								<s:input path="username" cssClass="form-control" id="username" />
							</div>

							<div class="form-group">
								<label for="password">Password</label>
								<s:password path="password" cssClass="form-control"
									id="password" />
							</div>

							<div class="form-group">
								<label for="fullName">Full Name</label>
								<s:input path="fullName" cssClass="form-control" id="fullName" />
							</div>

							<div class="form-group">
								<label for="email">Email</label>
								<s:input path="email" cssClass="form-control" id="email" />
							</div>

							<div class="form-group">
								<label>Role</label>
								<s:select path="role.roleId" class="form-control">
									<s:option value="2">Student</s:option>
								</s:select>
							</div>

							<div class="checkbox">
								<label><s:checkbox path="status" />Status</label>
							</div>
						</div>

						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Save</button>
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</section>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')">

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Add a Teacher's Account</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/dashboard"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Add a teacher</li>
		</ol>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">

					<c:if test="${error != null }">
						<div class="callout callout-danger">
							<h4>${error}</h4>
						</div>

					</c:if>

					<!-- form start -->
					<s:form method="post" modelAttribute="account"
						action="${pageContext.request.contextPath}/account/add"
						role="form">
						<div class="box-body">
							<div class="form-group">
								<label for="username">Username</label>
								<s:input path="username" cssClass="form-control" id="username" />
							</div>

							<div class="form-group">
								<label for="password">Password</label>
								<s:password path="password" cssClass="form-control"
									id="password" />
							</div>

							<div class="form-group">
								<label for="fullName">Full Name</label>
								<s:input path="fullName" cssClass="form-control" id="fullName" />
							</div>

							<div class="form-group">
								<label for="email">Email</label>
								<s:input path="email" cssClass="form-control" id="email" />
							</div>

							<div class="form-group">
								<label>Role</label>
								<s:select path="role.roleId" class="form-control">
									<s:option value="1">Teacher</s:option>
								</s:select>
							</div>

							<div class="checkbox">
								<label><s:checkbox path="status" />Status</label>
							</div>
						</div>

						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Save</button>
						</div>
					</s:form>
				</div>
			</div>
		</div>
	</section>
</sec:authorize>
