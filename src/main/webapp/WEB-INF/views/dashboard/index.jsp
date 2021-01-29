<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<sec:authorize access="hasRole('ROLE_TEACHER')">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Teacher <small>Dashboard</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<section class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>
							<%
								try {
								Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
								Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hjalpinatorn", "aoife", "martin");
								Statement st = con.createStatement();
								String strQuery = "SELECT COUNT(*) FROM account WHERE role_id = 1";
								ResultSet rs = st.executeQuery(strQuery);
								String Countrow = "";
								while (rs.next()) {
									Countrow = rs.getString(1);
									out.println(Countrow);
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
						</h3>

						<p>Teachers</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<div class="small-box-footer">&nbsp;</div>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-yellow">
					<div class="inner">
						<h3>
							<%
								try {
								Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
								Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hjalpinatorn", "aoife", "martin");
								Statement st = con.createStatement();
								String strQuery = "SELECT COUNT(*) FROM account WHERE role_id = 2";
								ResultSet rs = st.executeQuery(strQuery);
								String Countrow = "";
								while (rs.next()) {
									Countrow = rs.getString(1);
									out.println(Countrow);
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
						</h3>

						<p>Students</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="${pageContext.request.contextPath}/account/index"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
	</section>
</sec:authorize>



<sec:authorize access="hasRole('ROLE_ADMIN')">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>
			Admin <small>Dashboard</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li class="active">Dashboard</li>
		</ol>
	</section>

	<section class="content">
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-red">
					<div class="inner">
						<h3>
							<%
								try {
								Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
								Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hjalpinatorn", "aoife", "martin");
								Statement st = con.createStatement();
								String strQuery = "SELECT COUNT(*) FROM account WHERE role_id = 3";
								ResultSet rs = st.executeQuery(strQuery);
								String Countrow = "";
								while (rs.next()) {
									Countrow = rs.getString(1);
									out.println(Countrow);
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
						</h3>

						<p>Admins</p>
					</div>
					<div class="icon">
						<i class="ion ion-person"></i>
					</div>
					<div class="small-box-footer">&nbsp;</div>
				</div>
			</div>
			<!-- ./col -->

			<div class="col-lg-3 col-xs-6">
				<!-- small box -->
				<div class="small-box bg-green">
					<div class="inner">
						<h3>
							<%
								try {
								Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
								Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Hjalpinatorn", "aoife", "martin");
								Statement st = con.createStatement();
								String strQuery = "SELECT COUNT(*) FROM account WHERE role_id = 1";
								ResultSet rs = st.executeQuery(strQuery);
								String Countrow = "";
								while (rs.next()) {
									Countrow = rs.getString(1);
									out.println(Countrow);
								}
							} catch (Exception e) {
								e.printStackTrace();
							}
							%>
						</h3>

						<p>Teachers</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="${pageContext.request.contextPath}/account/index"
						class="small-box-footer">More info <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>
			</div>
		</div>
	</section>
</sec:authorize>

