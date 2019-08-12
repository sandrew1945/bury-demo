<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.hexnology.stes.bean.AclUserBean"%>
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Metronic | Form Stuff - Form Controls</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<link rel="shortcut icon" href="favicon.ico" />
	<link rel="stylesheet" href="<%=path %>/style/zTree/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="<%=path %>/js/jquery.ztree.all-3.5.min.js"></script>
</head>
<!-- BEGIN BODY -->
<body class="page-header-fixed">
	<input type="hidden" id="curPage" value="1" />
	<form id="fm" name="fm" class="form-horizontal form-bordered" method="post" action="">
		<div class="portlet box grey" style="margin-top:-20px">
			<div class="portlet-title">
				<div class="caption"><i class="fa fa-user"></i>用户信息</div>
				<div class="tools">
					<a href="javascript:;" class="collapse"></a>
				</div>
			</div>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
					<div class="form-body">
						<div class="form-group">
							<label class="control-label col-md-3">状态</label>
							<div class="col-md-6" id="statusDiv"><script type="text/javascript">getSelect('status','status','1001','',true,'form-control','','statusDiv');</script></div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">性别</label>
							<div class="col-md-6" id="sexDiv"><script type="text/javascript">getSelect('sex','sex','1002','',true,'form-control','','sexDiv');</script></div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">角色</label>
							<div id="roleDiv" class="col-md-6"><script type="text/javascript">SelectUtil.getRoleList('roleId', 'roleId', '', true, '', '', 'roleDiv');</script></div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">所属组织</label>
							<div class="input-group col-md-6">
								<input class="form-control" id="parentOrgName" name="parentOrgName" type="text" disabled="" value="">
								<input type="hidden" id="orgId"  name="orgId" value="" />
								<span class="input-group-btn">
								<button id="orgTree" class="btn red" type="button" onclick="showOrgTree('')">>></button>
								</span>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">显示条数下拉框</label>
							<div class="col-md-6"><span id="pageSizeDiv"><script type="text/javascript">CommonUtil.getPageSizeSelect('pageSize','pageSize','',"onchange='function(){alert(123);}'",'','pageSizeDiv');</script></span></div>
						</div>
						<div class="form-actions fluid">
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-offset-3 col-md-9">
										<button class="btn red" type="button" id="save" name="save">
											<i class="fa fa-save"></i> 保存
										</button>
										<a class="ajaxify btn default" href="#"><i class="fa fa-reply"></i> 返回</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				<!-- END FORM-->  
			</div>
		</div>
		
		<div id="ajax-modal" class="modal fade" tabindex="-1"></div>
	</form>
</body>
<!-- END BODY -->
</html>
<script type="text/javascript">
	jQuery(document).ready(function() {
	});
	
</script>