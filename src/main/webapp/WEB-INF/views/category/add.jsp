<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Add Category</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Add Category</li>
      </ol>
    </section>
    
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
          
          	<c:if test="${error != null }">
          		<div class="callout callout-danger">
                	<h4>Failed to save. The name is already on the list. No duplicates please!</h4>
              </div>
          	
          	</c:if>
            
            <!-- form start -->
            <s:form method="post" modelAttribute="category" 
            action="${pageContext.request.contextPath}/category/add" role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="name">Name</label>
                  <s:input  path="name" cssClass="form-control" id="name"/>
                </div>
                
                <div class="checkbox">
                	<label><s:checkbox path="status"/>Status</label>
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