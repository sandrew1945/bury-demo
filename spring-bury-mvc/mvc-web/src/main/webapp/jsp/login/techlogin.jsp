<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String isAuthenticate = (String)request.getAttribute("isAuthenticate");
	System.out.println("isAuthenticate ================ " + isAuthenticate);
	String noRole = (String)request.getAttribute("noRole");
	Subject subject = SecurityUtils.getSubject();
	if(null != subject && subject.isAuthenticated())
	{
		subject.logout();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>长春市科技企业数据库</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
	<c:import url="/common/jsp_head_lib.jsp"/>
	<!-- BEGIN PAGE LEVEL STYLES -->
	<link href="<%=path %>/style/login.css" rel="stylesheet" type="text/css"/>
	<!-- END PAGE LEVEL SCRIPTS -->
	<link rel="shortcut icon" href="favicon.ico" />
	
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="<%=path %>/js/login/demo.js" type="text/javascript"></script>
	<script src="<%=path %>/js/login/login.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	
	<style type="text/css">
	.login {
	  background-color: #444;
	}
	.login .content .form-control {
	  border: none;
	  background-color: #444;
	  border: 1px solid #555;
	  height: 43px;
	  color: #d9ecf9;
	}
	.login .btn-primary {
	  background-color: #555;
	  border: 1px solid #444;
	  color: #fff;
	  font-weight: 600;
	  padding: 10px 25px !important;
	}
	.login .btn-primary:hover {
	  border: 1px solid #555;
	  background-color: #444;
	  color: #fff;
	}
	</style>
	
	<script type="text/javascript">
		if (($("body").size()+1)>=2){
			window.top.location="${pageContext.request.contextPath}"; 
		}
		window.history.forward(1);
	</script>
</head>
<!-- BEGIN BODY -->
	<body class="login">
		<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
		<div class="menu-toggler sidebar-toggler">
		</div>
		<!-- END SIDEBAR TOGGLER BUTTON -->
		<!-- BEGIN LOGO -->
		<div class="logo">
			<a href="index.html">
			<img src="<%=path %>/images/logo-big-white.png" style="height: 30px;" alt=""/>
			</a>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN LOGIN -->
		<div class="content">
			<!-- BEGIN LOGIN FORM -->
			<form class="login-form" id="fm" method="post" action="techLogin.action">
				<div class="form-title">
					<span class="form-title">欢迎.</span>
					<span class="form-subtitle">请登录.</span>
				</div>
				<div class="alert alert-warning display-hide">
					<button class="close" data-close="alert"></button>
					<span> 请输入用户名及密码. </span>
				</div>
				<div class="alert alert-danger <%if(!"false".equals(isAuthenticate)) {%>display-hide<%} %>">
					<button class="close" data-close="alert"></button>
					<span>用户名或密码不正确,请重新输入</span>
				</div>
				<div class="alert alert-danger <%if(!"ture".equals(noRole)) {%>display-hide<%} %>">
					<button class="close" data-close="alert"></button>
					<span>没有系统权限,请使用其他用户重新登录</span>
				</div>
				<div class="form-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">账号</label>
					<input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="账号" name="userCode"/>
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">密码</label>
					<input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"/>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary btn-block uppercase">登 &nbsp;&nbsp;&nbsp;&nbsp;录</button>
				</div>
				<!-- 删除 Remember me 和  forget-password
				<div class="form-actions">
					
					<div class="pull-left">
						<label class="rememberme check">
						<input type="checkbox" name="remember" value="1"/>Remember me </label>
					</div>
					
					<div class="pull-right forget-password-block">
						<a href="javascript:;" id="forget-password" class="forget-password">Forgot Password?</a>
					</div>
				</div>
				 -->
			</form>
			<!-- END LOGIN FORM -->
			<!-- BEGIN FORGOT PASSWORD FORM -->
			<form class="forget-form" action="index.html" method="post">
				<div class="form-title">
					<span class="form-title">Forget Password ?</span>
					<span class="form-subtitle">Enter your e-mail to reset it.</span>
				</div>
				<div class="form-group">
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"/>
				</div>
				<div class="form-actions">
					<button type="button" id="back-btn" class="btn btn-default">Back</button>
					<button type="submit" class="btn btn-primary uppercase pull-right">Submit</button>
				</div>
			</form>
			<!-- END FORGOT PASSWORD FORM -->
			<!-- BEGIN REGISTRATION FORM -->
			<form class="register-form" action="index.html" method="post">
				<div class="form-title">
					<span class="form-title">Sign Up</span>
				</div>
				<p class="hint">
					 Enter your account details below:
				</p>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">公司名称</label>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="公司名称" id="companyName" name="companyName"/>
				</div>
				<div class="form-group">
					<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
					<label class="control-label visible-ie8 visible-ie9">所属行政区</label>
					<div class="" id="regionDiv"><script type="text/javascript">getSelect('region','region','2006','',true,'form-control placeholder-no-fix','','regionDiv');</script></div>
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">注册用户名</label>
					<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="注册用户名" id="userCode" name="userCode"/>
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">密码</label>
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" id="password" name="password"/>
				</div>
				<div class="form-group">
					<label class="control-label visible-ie8 visible-ie9">重复密码</label>
					<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="重复密码" id="rpassword" name="rpassword"/>
				</div>
				<div class="form-group margin-top-20 margin-bottom-20">
					<label class="check">
					<input type="checkbox" name="tnc"/>
					<span class="loginblue-font">I agree to the </span>
					<a href="javascript:;" class="loginblue-link">Terms of Service</a>
					<span class="loginblue-font">and</span>
					<a href="javascript:;" class="loginblue-link">Privacy Policy </a>
					</label>
					<div id="register_tnc_error">
					</div>
				</div>
				<div class="form-actions">
					<button type="button" id="register-back-btn" class="btn btn-default">Back</button>
					<button type="submit" id="register-submit-btn" class="btn btn-primary uppercase pull-right">Submit</button>
				</div>
			</form>
			<!-- END REGISTRATION FORM -->
		</div>
		<div class="copyright">
			 Copyright&copy; ccst.gov.cn,All Rights Reserved&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;推荐浏览器：IE9及以上、Firefox、Chrome.
		</div>
		<!-- END LOGIN -->
		<script>
		jQuery(document).ready(function() {     
		Metronic.init(); // init metronic core components
		Layout.init(); // init current layout
		Login.init();
		Demo.init();
		});
		</script>
		<!-- END JAVASCRIPTS -->
	</body>
<!-- END BODY -->
</html>