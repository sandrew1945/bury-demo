<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色选择</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="MobileOptimized" content="320">
<c:import url="/common/jsp_head_lib.jsp"/>
<link rel="stylesheet" href="<%=path %>/style/zTree/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=path %>/js/jquery.ztree.all-3.5.min.js"></script>
</head>
<body onload="">
	<form id="fm" action="showIndex" method="post">
		<input id="roleId" name="roleId" type="hidden">
		<div id="ajax-modal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1"></div>
	</form>
</body>
</html>
<script>
var $modal = $('#ajax-modal');
/**
 * 打开组织选择树弹出层
 */
function showPostRole()
{
	  // create the backdrop and wait for next modal to be triggered
	  //$('body').modalmanager('loading');
	  setTimeout(function(){
	      $modal.load('jsp/login/postRoleChoiceTree.jsp', '', function(){
	      $modal.modal();
	    });
	  }, 100);
}

jQuery(document).ready(function() {
	showPostRole();
});
</script>