<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Send Help Request</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/dashboard"><i
					class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Send help request</li>
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
					
					<c:if test="${success != null }">
						<div class="callout callout-success">
							<h4>${success}</h4>
						</div>
					</c:if>

					<!-- form start -->
					<s:form method="post" modelAttribute="help"
						action="${pageContext.request.contextPath}/help/send"
						role="form">
						<div class="box-body">
							<div class="form-group">
								<label for="title">Title</label>
								<s:input path="title" cssClass="form-control" id="title" />
							</div>

							<div class="form-group">
								<label for="description">Description</label>
								<s:textarea path="description" cols="50" rows="10" cssClass="form-control" id="description" />
							</div>

							<div class="form-group">
								<label>Category</label>
								<s:select path="category.categoryId" 
								items="${categories}" 
								itemLabel="name" 
								itemValue="categoryId"
								class="form-control">
								</s:select>
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