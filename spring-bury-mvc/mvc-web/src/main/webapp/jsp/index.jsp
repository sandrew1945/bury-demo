<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="com.sandrew.mvc.bean.AclUserBean"%>
<%@page import="com.sandrew.mvc.core.common.Constants"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.session.Session"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	Subject subject = SecurityUtils.getSubject();
	Session ShiroSession = subject.getSession();
	System.out.println(ShiroSession.getAttribute(Constants.LOGIN_USER));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- BEGIN HEAD -->
	<head>
		<meta charset="utf-8"/>
		<title>Demo</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta content="width=device-width, initial-scale=1" name="viewport"/>
		<meta content="" name="description"/>
		<meta content="" name="author"/>
		<c:import url="/common/jsp_head_lib.jsp"/>
		<script src="<%=path %>/js/index/quick-sidebar.js" type="text/javascript"></script>
		<script src="<%=path %>/js/index/demo.js" type="text/javascript"></script>
		<script src="<%=path %>/js/index/index.js" type="text/javascript"></script>
		<link rel="shortcut icon" href="<%=path %>/images/ico/favicon.ico"/>
	</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-fixed-mobile" and "page-footer-fixed-mobile" class to body element to force fixed header or footer in mobile devices -->
<!-- DOC: Apply "page-sidebar-closed" class to the body and "page-sidebar-menu-closed" class to the sidebar menu element to hide the sidebar by default -->
<!-- DOC: Apply "page-sidebar-hide" class to the body to make the sidebar completely hidden on toggle -->
<!-- DOC: Apply "page-sidebar-closed-hide-logo" class to the body element to make the logo hidden on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-hide" class to body element to completely hide the sidebar on sidebar toggle -->
<!-- DOC: Apply "page-sidebar-fixed" class to have fixed sidebar -->
<!-- DOC: Apply "page-footer-fixed" class to the body element to have fixed footer -->
<!-- DOC: Apply "page-sidebar-reversed" class to put the sidebar on the right side -->
<!-- DOC: Apply "page-full-width" class to the body element to have full width page without the sidebar menu -->
<!-- DOC: Apply "page-sidebar-fixed" class to the body element to 菜单增加滚动条，但是子菜单不能弹出，只能用折叠式菜单 -->
	<body class="page-sidebar-closed-hide-logo page-container-bg-solid page-sidebar-closed-hide-logo page-header-fixed page-footer-fixed">
	<!-- BEGIN HEADER -->
	<div class="page-header navbar navbar-fixed-top">
		<!-- BEGIN HEADER INNER -->
		<div class="page-header-inner">
			<!-- BEGIN LOGO -->
			<div class="page-logo">
				<img src="<%=path %>/images/logo-default.png" alt="logo" class="logo-default"/>
				<div class="menu-toggler sidebar-toggler">
					<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
				</div>
			</div>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
			</a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN PAGE ACTIONS -->
			<!-- DOC: Remove "hide" class to enable the page header actions -->
			<div class="page-actions hide">
				<div class="btn-group">
					<button type="button" class="btn btn-circle red-pink dropdown-toggle" data-toggle="dropdown">
					<i class="icon-bar-chart"></i>&nbsp;<span class="hidden-sm hidden-xs">New&nbsp;</span>&nbsp;<i class="fa fa-angle-down"></i>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li>
							<a href="javascript:;">
							<i class="icon-user"></i> New User </a>
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-present"></i> New Event <span class="badge badge-success">4</span>
							</a>
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-basket"></i> New order </a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-flag"></i> Pending Orders <span class="badge badge-danger">4</span>
							</a>
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-users"></i> Pending Users <span class="badge badge-warning">12</span>
							</a>
						</li>
					</ul>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-circle green-haze dropdown-toggle" data-toggle="dropdown">
					<i class="icon-bell"></i>&nbsp;<span class="hidden-sm hidden-xs">Post&nbsp;</span>&nbsp;<i class="fa fa-angle-down"></i>
					</button>
					<ul class="dropdown-menu" role="menu">
						<li>
							<a href="javascript:;">
							<i class="icon-docs"></i> New Post </a>
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-tag"></i> New Comment </a>
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-share"></i> Share </a>
						</li>
						<li class="divider">
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-flag"></i> Comments <span class="badge badge-success">4</span>
							</a>
						</li>
						<li>
							<a href="javascript:;">
							<i class="icon-users"></i> Feedbacks <span class="badge badge-danger">2</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- END PAGE ACTIONS -->
			<!-- BEGIN PAGE TOP -->
			<div class="page-top">
				<!-- BEGIN HEADER SEARCH BOX -->
				<!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
				<form class="search-form search-form-expanded hide" action="extra_search.html" method="GET">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search..." name="query">
						<span class="input-group-btn">
						<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
						</span>
					</div>
				</form>
				<!-- END HEADER SEARCH BOX -->
				<!-- BEGIN TOP NAVIGATION MENU -->
				<div class="top-menu">
					<ul class="nav navbar-nav pull-right">
						<!-- BEGIN USER LOGIN DROPDOWN -->
						<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
						<li class="dropdown dropdown-user">
							<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
							<img alt="" class="img-circle" id="imgAvatar" src="<%=path %>/images/avatar.png"/>
							<span class="username username-hide-on-mobile"><%= ((AclUserBean)ShiroSession.getAttribute(Constants.LOGIN_USER)).getUserCode() %></span>
							<i class="fa fa-angle-down"></i>
							</a>
							<ul class="dropdown-menu dropdown-menu-default">
								<li>
									<!-- <a href="extra_profile.html"> -->
									<a class="ajaxify " href="usermanager/profilePre?userId=<%=((AclUserBean)ShiroSession.getAttribute(Constants.LOGIN_USER)).getUserId() %>">
									<i class="icon-user"></i> 个人信息 </a>
								</li>
								<!-- 
								<li class="divider"></li>
								<li>
									<a href="extra_lock.html">
									<i class="icon-lock"></i> Lock Screen </a>
								</li>
								 -->
								<li>
									<a href="logout">
									<i class="icon-key"></i> 登出系统 </a>
								</li>
							</ul>
						</li>
						<!-- END USER LOGIN DROPDOWN -->
					</ul>
				</div>
				<!-- END TOP NAVIGATION MENU -->
			</div>
			<!-- END PAGE TOP -->
		</div>
		<!-- END HEADER INNER -->
	</div>
	<!-- END HEADER -->
	<div class="clearfix">
	</div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<div class="page-sidebar-wrapper">
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<div class="page-sidebar navbar-collapse collapse">
				<!-- BEGIN SIDEBAR MENU -->
				<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
				<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
				<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
				<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
				<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
				<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
				<ul class="page-sidebar-menu page-sidebar-menu-hover-submenu page-sidebar-menu-compact" data-keep-expanded="false" data-auto-scroll="false" data-slide-speed="200">
					<li class="start active" data-original-title="AngularJS version demo">
						<a href="homepage/showHomePage" class="ajaxify start">
						<i class="icon-home"></i>
						<span class="title">首&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;页</span>
						<span class="selected"></span>
						</a>
					</li>
					<% String menu =(String)request.getAttribute("menu"); out.print(menu);%>
				</ul>
				<!-- END SIDEBAR MENU -->
			</div>
		</div>
		<!-- END SIDEBAR -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<div class="page-content-body"></div>
			</div>
			<!-- BEGIN QUICK SIDEBAR -->
			<a href="javascript:;" class="page-quick-sidebar-toggler"><i class="icon-login"></i></a>
			<!-- END QUICK SIDEBAR -->
		</div>
		<!-- END CONTENT -->
		<!-- BEGIN QUICK SIDEBAR -->
		<!-- END QUICK SIDEBAR -->
	</div>
	<!-- END CONTAINER -->
	<!-- BEGIN FOOTER -->
	<div class="page-footer">
		<div class="page-footer-inner">
			主办单位：长春市科学技术局 <a href="mailto:ccstadmin@changchun.gov.cn">Email:ccstadmin@changchun.gov.cn</a>&nbsp;&nbsp;吉ICP备05001838号　Copyright&copy; ccst.gov.cn,All Rights Reserved&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;推荐浏览器：IE9及以上、Firefox、Chrome.
		</div>
		<div class="scroll-to-top">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
		<!-- END FOOTER -->
	<script>
	jQuery(document).ready(function() {    
	   Metronic.init(); // init metronic core componets
	   Layout.init(); // init layout
	   Demo.init(); // init demo features 
	   QuickSidebar.init(); // init quick sidebar
	   Index.init();   
	   Index.initDashboardDaterange();
	   Index.initJQVMAP(); // init index page's custom scripts
	   Index.initCalendar(); // init index page's custom scripts
	   Index.initCharts(); // init index page's custom scripts
	   Index.initChat();
	   Index.initMiniCharts();
	   
	   $('.page-sidebar .ajaxify.start').click() // load the content for the dashboard page.
		//头像回显
		var avatarPath = "<%=((AclUserBean)ShiroSession.getAttribute(Constants.LOGIN_USER)).getAvatarPath() %>";
		if(avatarPath != null && '' != avatarPath && avatarPath != 'null'){
			$("#imgAvatar").attr("src", "usermanager/showAvatar?avatarPath="+avatarPath);
		}
	});
	</script>
	<!-- END JAVASCRIPTS -->
	</body>
	<!-- END BODY -->
</html>