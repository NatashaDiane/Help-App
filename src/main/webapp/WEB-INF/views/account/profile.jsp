<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>Profile</h1>
      <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/dashboard"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Edit Profile</li>
      </ol>
    </section>
    
    <section class="content">
      <div class="row">
        <div class="col-md-12">
          <div class="box box-primary">
            
            <!-- form start -->
            <s:form method="post" modelAttribute="account" 
            action="${pageContext.request.contextPath}/account/profile" role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="username">Username</label>
                  <s:input  path="username" cssClass="form-control" id="username"/>
                </div>
                
                <div class="form-group">
                  <label for="password">Password</label>
                  <s:password path="password" cssClass="form-control" id="password"/>
                </div>
                
                <div class="form-group">
                  <label for="fullName">Full Name</label>
                  <s:input  path="fullName" cssClass="form-control" id="fullName"/>
                </div>
                
                <div class="form-group">
                  <label for="email">Email</label>
                  <s:input  path="email" cssClass="form-control" id="email"/>
                </div>
              </div>

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
                <s:hidden path="accountId"/>
              </div>
            </s:form>
          </div>
        </div>
      </div>
    </section>