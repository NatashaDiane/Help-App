<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Hjälpinatorn | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">

			<!-- Logo -->
			<a href="${pageContext.request.contextPath}/dashboard" class="logo">
				<!-- mini logo for sidebar mini 50x50 pixels --> <span
				class="logo-mini"><b>Hjälp</b>i</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Hjälp</b>inatorn</span>
			</a>

			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">

						<li class="dropdown user user-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <span
								class="hidden-xs">Signed in as
									${pageContext.request.userPrincipal.name}</span>
						</a>
							<ul class="dropdown-menu">

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="${pageContext.request.contextPath}/account/profile"
											class="btn btn-default btn-flat">Edit Profile</a>
									</div>
									<div class="pull-right">
										<a href="${pageContext.request.contextPath}/process-logout"
											class="btn btn-default btn-flat">Sign out</a>
									</div>
								</li>
							</ul></li>
						<!-- Control Sidebar Toggle Button -->
						<li><a href="#" data-toggle="control-sidebar"><i
								class="fa fa-gears"></i></a></li>
					</ul>
				</div>

			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">

				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu" data-widget="tree">

					<sec:authorize access="hasRole('ROLE_TEACHER')">
						<li class="treeview"><a href="#"> <i
								class="fa ion-person-add"></i> <span>Manage Students
									Account</span> <span class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
							<ul class="treeview-menu">
								<li><a
									href="${pageContext.request.contextPath}/account/add"><i
										class="fa fa-circle-o"></i>Add a student</a></li>
								<li><a
									href="${pageContext.request.contextPath}/account/index"><i
										class="fa fa-circle-o"></i>Show all students</a></li>
							</ul></li>

						<li class="treeview"><a href="#"> <i class="fa fa-laptop"></i>
								<span>Help Category</span> <span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
							<ul class="treeview-menu">
								<li><a
									href="${pageContext.request.contextPath}/category/add"><i
										class="fa fa-circle-o"></i>Add a category</a></li>
								<li><a
									href="${pageContext.request.contextPath}/category/index"><i
										class="fa fa-circle-o"></i>Show all categories</a></li>
							</ul></li>
							
						<li class="treeview"><a href="#"> <i
								class="fa fa-files-o"></i> <span> Help Requests</span> <span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
							<ul class="treeview-menu">
								<li><a
									href="${pageContext.request.contextPath}/help/history"><i
										class="fa fa-circle-o"></i>Show all help requests</a></li>
							</ul></li>
					</sec:authorize>


					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="treeview"><a href="#"> <i
								class="fa ion-person-add"></i> <span>Manage Teachers Account</span> <span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
							<ul class="treeview-menu">
								<li><a
									href="${pageContext.request.contextPath}/account/add"><i
										class="fa fa-circle-o"></i>Add a teacher</a></li>
								<li><a
									href="${pageContext.request.contextPath}/account/index"><i
										class="fa fa-circle-o"></i>Show all teachers</a></li>
							</ul></li>
						<li><a href="https://adminlte.io/docs"><i
								class="fa fa-book"></i> <span>Template Documentation</span></a></li>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_STUDENT')">
						<li class="treeview"><a href="#"> <i
								class="fa fa-files-o"></i> <span>Send Help Requests</span> <span
								class="pull-right-container"> <i
									class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
							<ul class="treeview-menu">
								<li><a
									href="${pageContext.request.contextPath}/help/send"><i
										class="fa fa-circle-o"></i>Send help request</a></li>
								<!--<li><a
									href="${pageContext.request.contextPath}/help/history"><i
										class="fa fa-circle-o"></i>Show history</a></li>-->
							</ul></li>
					</sec:authorize>
				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">

			<tiles:insertAttribute name="content"></tiles:insertAttribute>

		</div>
		<!-- /.content-wrapper -->

		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.4.0
			</div>
			<strong>Copyright &copy; 2014-2016 <a
				href="https://adminlte.io">AdminLTE.IO.</a></strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<div class="tab-content">
				<div class="tab-pane" id="control-sidebar-home-tab"></div>
			</div>
		</aside>
		<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap  -->
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- ChartJS -->
	<script
		src="${pageContext.request.contextPath}/resources/bower_components/Chart.js/Chart.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="${pageContext.request.contextPath}/resources/dist/js/pages/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath}/resources/dist/js/demo.js"></script>

	<!-- page script -->
	<script>
		$(function() {
			$('#example1').DataTable()
			$('#example2').DataTable({
				'paging' : true,
				'lengthChange' : false,
				'searching' : false,
				'ordering' : true,
				'info' : true,
				'autoWidth' : false
			})
		})
	</script>

</body>
</html>

