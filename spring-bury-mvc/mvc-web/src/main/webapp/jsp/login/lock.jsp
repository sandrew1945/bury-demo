<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%
	String path = request.getContextPath();
	String isAuthenticate = (String)request.getAttribute("isAuthenticate");
	String noRole = (String)request.getAttribute("noRole");
	Subject subject = SecurityUtils.getSubject();
	if(null != subject && subject.isAuthenticated())
	{
		subject.logout();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>苍宏供应链管理平台</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<jsp:include page="${contextPath}/common/jsp_head_lib.jsp" />
	<link href="<%=path %>/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
	<script src="<%=path %>/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
	<script src="<%=path%>/assets/scripts/login-soft.js" type="text/javascript"></script>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<body>
	<script>
		jQuery(document).ready(function() {  
			window.history.forward(1);
			App.init();
			Lock.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>