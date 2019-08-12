<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>角色管理</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
</head>
<body>
<!-- BEGIN FORM-->
<form class="form-horizontal" id="fm" name="fm" >
<input type="hidden" id="curPage" value="" />
<!-- BEGIN PAGE HEADER-->
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			<span class="icon-svg2 icon-pad"></span> 角色管理
		</h3>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- BEGIN PAGE CONTENT-->    
<div class="tab-pane " id="tab_2">
	<!-- BEGIN CONDITION PORTLET-->
	<div class="portlet light">
		<!-- 标题及收起工具栏 -->
		<div class="portlet-title">
			<div class="caption font-grey-gallery">
				<i class="icon-bulb font-grey-gallery"></i>
				<span class="caption-subject bold"> 查询条件</span>
			</div>
			<div class="tools">
				<a href="javascript:;" class="collapse"></a>
			</div>
		</div>
		<!-- 查询条件主体 -->
		<div class="portlet-body">
			<div class="form-body">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">角色代码</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input type="text" class="form-control" placeholder="角色代码" id="roleCode" name="roleCode" value="" />
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">角色名称</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input type="text" class="form-control" placeholder="角色名称" id="roleName" name="roleName" value="" />
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">角色类型</label>
								<div class="col-md-9" id="roleTypeDiv"><script type="text/javascript">getSelect('roleType','roleType','2012','',true,'form-control','','roleTypeDiv');</script></div>
						</div>
					</div>
				</div>
				<!--/span-->
				<div class="row">
					<div class="form-group col-md-12">
						<div class="pull-right">
							<button class="btn red btn-sm" type="button" id="btn_search"><i class="fa fa-search"></i> 查  询</button>  
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- BEGIN CONDITION PORTLET-->


	<!-- BEGIN DATAGRID PORTLET-->
	<div class="portlet light">
		<div class="portlet-title">
			<div class="caption font-grey-gallery">
				<i class="icon-list font-grey-gallery"></i>
				<span class="caption-subject bold"> 查询结果</span>
			</div>
			<div class="actions">
				<a href="rolemanager/createRolePre" class="btn btn-circle red-sunglo btn-sm ajaxify"><i class="icon-magnifier-add"></i> 添加 </a>
				<div class="btn-group">
					<a class="btn btn-circle btn-default btn-sm" href="javascript:;" data-toggle="dropdown">
					<i class="fa fa-navicon"></i> 操作 <i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu pull-right">
						<li><a href="javascript:void(0)" onclick="updateRole()"><i class="fa fa-pencil"></i> 编辑 </a></li>
						<li><a href="javascript:void(0)" onclick="deleteRole()"><i class="fa fa-trash-o"></i> 删除</a></li>
					</ul>
				</div>
				<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
			</div>
		</div>
		<div class="portlet-body">
			<div class="scroller" style="height:450px" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
				<%@ include file="/queryPage/orderHidden.html" %>
				<%@ include file="/queryPage/pageDiv.html" %>
				<br />
			</div>
		</div>
	</div>
	<!-- END DATAGRID PORTLET-->

<!-- END PAGE CONTENT-->

</form>
<!-- END FORM-->  
</body>
</html>

<script type="text/javascript">

 	var option = 
 	{
 		 url:"rolemanager/roleManagerPageQuery",
 		 choiceType:'radio',
 		 formId:"fm",
 		 gridId:"myGrid",
 		 blankId:"_page",
 		 pageId:"myPage",
 		 columns : [
 			{header: "", width: "10%", dataIndex: "roleId",renderer: CommonUtil.getRadio},//设置序号的方式
			{header: "角色代码", width: "20%", dataIndex: "roleCode"},
			{header: "角色名称", width: "30%", dataIndex: "roleName"},
			{header: "角色类型", width: "20%", dataIndex: "roleType", renderer: getfixCodeDesc},
			{header: "角色状态", width: "20%", dataIndex: "roleStatus", renderer: getfixCodeDesc}
 		]
 	};
	jQuery(document).ready(function() {
		DataGrid.__extQuery__(1,option);
	});
	$("#btn_search").click(function() {
		DataGrid.__extQuery__(1,option);
	});
	
	function deleteRole()
	{
		var intHot = CommonUtil.getRadioVal();
		bootbox.confirm("是否删该条记录?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("rolemanager/deleteRole","roleId="+intHot, delRoleCallback);
			}
		});
	}
	
	function updateRole(){
		var intHot = CommonUtil.getRadioVal();
		if(intHot==null){
			bootbox.alert("请选择需要编辑的角色?");
			return false;
		}
		Metronic.loadContentData("rolemanager/updateRolePre?roleId="+intHot);
	}
	function delRoleCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQuery__(1,option);
		});
	}
</script>
	
