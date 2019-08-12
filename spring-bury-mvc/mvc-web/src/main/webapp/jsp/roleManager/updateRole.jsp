<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
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
	<%-- <script src="<%=path%>/js/jquery.form.js" type="text/javascript"></script> --%>
</head>
<body onload="">
<!-- BEGIN PAGE HEADER-->
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			<span class="icon-svg2 icon-pad"></span> 
			角色管理 - 编辑
		</h3>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- BEGIN PAGE CONTENT-->    
<div class="row">
	<div class="col-md-12">
<!-- END PAGE HEADER-->
		<!-- BEGIN VALIDATION STATES-->
		<h3 class="form-section"></h3>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" id="fm" class="form-horizontal form-horizontal" name="updaeUser" enctype="multipart/form-data" method="post">
				<!-- BEGIN USER INFO MODI PORTLET -->
					<div class="portlet light">
						<div class="portlet-title">
							<div class="caption font-grey-gallery">
								<i class="fa fa-group"></i>
								<span class="caption-subject bold"> 维护角色信息</span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						
						<div class="portlet-body">
							<div class="alert alert-danger display-hide" id="formErr">
								<button class="close" data-close="alert"></button>
									表单填写错误,请重新填写.
							</div>
							<div class="alert alert-success display-hide" id="avatarWrongType">
								<button class="close" data-close="alert"></button>
									用户信息填写正确!
							</div>
							<div class="row">
								<div class="col-md-10">
									<div class="form-group">
										<label class="control-label col-md-3">角色代码<span class="required">*</span></label>
										<div class="col-md-9">
											<div class="input-group">    
											<input type="hidden" name="roleId" id="roleId" value="${role.roleId }">                                   
												<input type="text" class="form-control" id="roleCode" name="roleCode" placeholder="请输入正确角色代码" maxlength="20" value="${role.roleCode }" readonly="readonly"/>
												<span class="input-group-addon">
													<i class="fa fa-dedent"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">角色名称<span class="required">*</span></label>
										<div class="col-md-9">
											<div class="input-group">                                       
												<input type="text" class="form-control" id="roleName" name="roleName" value="${role.roleName }" placeholder="请输入姓名" maxlength="20"/>
												<span class="input-group-addon">
														<i class="fa fa-dedent"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">角色类型<span class="required">*</span></label>
										<div class="col-md-9 col-sm-12 col-xs-12" id="roleTypeDiv">
											<script type="text/javascript">getSelect('roleType','roleType','2012','${role.roleType}',true,'form-control','','roleTypeDiv');
											</script>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">状态<span class="required">*</span></label>
										<div class="col-md-9 col-sm-12 col-xs-12" id="statusDiv">
											<script type="text/javascript">getSelect('roleStatus','roleStatus','1001','${role.roleStatus}',true,'form-control','','statusDiv');
											</script>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-2"></label>
										<div class="col-md-10">
											<div class="input-icon right">                                       
											<button type="button" class="btn red btn-block" onclick="mySubmit()">
												<i class="fa fa-save"></i>&nbsp;&nbsp;保存
											</button>
											</div>
										</div>
									 </div>
									<div class="form-group">
									<label class="control-label col-md-2"></label>
									<div class="col-md-10">
										<div class="input-icon right">                                       
											<!-- <a class="btn dark btn-block ajaxify" href="UserMain.action" id="btn_back" >返      回</a> -->
											<a class="btn blue btn-block ajaxify" href="rolemanager/rolemanagerPre" id="btn_back" >
												<i class="fa fa-reply "></i>&nbsp;&nbsp;返      回
											</a>
										</div>
									</div>
								 	</div>
								</div>
							</div>
						</div>
					</div>
				<!-- END USER INFO MODI PORTLET -->
				</form>
				
				<!-- BEGIN ROLE MANAGER PORTLET -->
				<div class="portlet light">
				
					<div class="portlet-title">
						<div class="caption font-grey-gallery">
							<i class="icon-list"></i>
							<span class="caption-subject bold"> 维护功能信息</span>
						</div>
						<div class="actions">
							<a href="javascript:;" onclick="showFuncList()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-equalizer"></i> 维护功能 </a>
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
				<!-- END ROLE MANAGER PORTLET -->
				
				<!-- END FORM-->
			</div>
		<!-- END VALIDATION STATES-->
	</div>
</div>
<!-- END FORM-->  
</body>
<div class="modal fade container" id="func-modal">
</html>
<script type="text/javascript">
var formOption = {
 		formId : "fm",
 		formRoles : {
	            roleName: {
	                required: true
	            },
	            roleStatus: {
	                required: true
	            }
 					},
 		formMessages: { 
	            roleName: {
	                required: "角色名称必须填写"
	            },
	            roleStatus: {
	            	required: "请选择状态"
	            }
		},
		formCallBack: {
				url:  "rolemanager/updateRole",	// 验证通过调用的后台连接
				type: "POST",  
				dataType: "json", 
				success: function(ajaxResult)
				{
					// altConfirm(alt_param);							// 处理成功的回调
					AjaxAnyWhere.handleResult(ajaxResult, handleSuccess);
					
				},
				error: function(data)
				{
					bootbox.alert("编辑角色失败");							// 处理失败的回调
					return;
				}
		}
   		
   }
 
 // 处理成功回调方法
 var handleSuccess = function ()
 {
	Metronic.loadContentData("rolemanager/rolemanagerPre");
 }

	
jQuery(document).ready(function() {
	CommonFormVaildate.init(formOption);
});

function mySubmit(){
	 $("#fm").submit();
}


var optionUpdateRole = 
{
	 url:"rolemanager/queryRelationFunc",
	 formId: 'fm',
	 gridId:"myGrid",
	 blankId:"_page",
	 choiceType:null,
	 columns : [
		{header: "", width: "3%", renderer:DataGrid.getIndex},//设置序号的方式
	{header: "功能代码", width: "10%", dataIndex: "functionCode"},
	{header: "功能名称", width: "10%", dataIndex: "functionName"},
	{header: "操作", width: "10%", dataIndex: "functionId", renderer: myLink}
	]
};

function myLink(value,metaDate,record){
	   //return "<a href=\"userModifyPre.action?userId="+value+"\">[删除]</a>";
	   var roleId = $("#roleId").val();
	   return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteFuncRelation("+roleId+","+value+")\"><i class=\"fa fa-trash-o\"></i>Delete</a>";
}

function deleteFuncRelation(roleId, functionId)
{
	bootbox.confirm("是否删该角色?", function(result){
		if(result)
		{
			AjaxAnyWhere.sendRequestByData("rolemanager/deleteFuncRelation","roleId="+roleId+"&functionId="+functionId, delFuncCallback);
		}
	});
}
function delFuncCallback(ajaxResult)
{
	AjaxAnyWhere.handleResult(ajaxResult, function(){
		DataGrid.__extQueryAll__(optionUpdateRole);
	});
}


jQuery(document).ready(function() {
	DataGrid.__extQueryAll__(optionUpdateRole);
});

var $funcModal = $('#func-modal');
/**
 * 打开组织选择树弹出层
 */
function showFuncList()
{
	$funcModal.load('jsp/roleManager/funcrelationmanager.jsp', '', function(){
		$funcModal.modal();
	});
}

</script>
