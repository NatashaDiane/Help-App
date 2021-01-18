<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
	<section class="content-header">
      <h1>Students List</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Students List</li>
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
	                  <th>Username</th>
	                  <th>Full Name</th>
	                  <th>Email</th>
	                  <th>Role</th>
	                  <th>Status</th>
	                  <th>Action</th>
	                </tr>
                </thead>
                <tbody>
                	<c:forEach var="account" items="${accounts}">
	                	<tr>
		                  <td>${account.accountId}</td>
		                  <td>${account.username}</td>
		                  <td>${account.fullName}</td>
		                  <td>${account.email}</td>
		                  <td>${account.role.name}</td>
		                  <td>${account.status ? "Show" : "Hide"}</td>
		                  <td>
		                  	<a href="${pageContext.request.contextPath}/account/edit/${category.accountId}">Edit</a> 
		                  | <a href="${pageContext.request.contextPath}/account/delete/${category.accountId}" 
		                  	onclick="return confirm('Are you sure?')">Delete</a> 
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
	                  <th>Role</th>
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
    <!-- /.content -->
	    
	<!-- page script -->
	<script>
	  $(function () {
	    $('#example1').DataTable()
	    $('#example2').DataTable({
	      'paging'      : true,
	      'lengthChange': false,
	      'searching'   : false,
	      'ordering'    : true,
	      'info'        : true,
	      'autoWidth'   : false
	    })
	  })
	</script>