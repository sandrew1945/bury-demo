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
	<title>用户管理</title>
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
			用户管理 - 编辑
		</h3>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- BEGIN PAGE CONTENT-->    
<div class="row">
	<div class="col-md-12">
<!-- END PAGE HEADER-->
		<h3 class="form-section"></h3>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" id="updaeUser" class="form-horizontal form-horizontal" name="updaeUser" enctype="multipart/form-data" method="post">
					<!-- BEGIN USER INFO MODI PORTLET -->
					<input type="hidden" name="avatar" id="avatar" value="${userPO.avatar}" />
					<div class="portlet light">
						<div class="portlet-title">
							<div class="caption font-grey-gallery">
								<i class="fa fa-user"></i>
								<span class="caption-subject bold"> 维护用户信息</span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
									<div class="col-md-12">
										<div class="form-group">
											<div class="">
												<div id='photoDiv' class="fileinput fileinput-new col-md-12" data-provides="fileinput">
													<div class="fileinput-new thumbnail col-md-12" style="min-height: 436px;min-width: 436px;max-height: 436px;max-width: 436px;"> 
														<img src="<%=path%>/images/placeholder.jpg" style="width: 100% ; height: 100%"/>
													</div>
													<div class="fileinput-preview fileinput-exists thumbnail" style="min-height: 436px;min-width: 436px;max-height: 436px;max-width: 436px;"> 
														<img id="photo" src="<%=path%>/images/placeholder.jpg" style="width: 100% ; height: 100%"/>
													</div>
													<div>
														<span class="btn green-haze btn-file">
														<span class="fileinput-new"> 请选择头像 </span>
														<span class="fileinput-exists"> 更换 </span>
														<input type="file" class="btn blue" id="file" name="file" value="">
														</span>
														<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" onclick="clearPhoto()"> 移除 </a>
													</div>
												</div>
											</div>
										</div>
									</div>
									</div> 
									<div class="form-group">
										<label class="control-label col-md-2"></label>
										<div class="col-md-10">
											<div class="input-icon right">
												<button type="button" class="btn red btn-block " onclick="mySubmit()">
													<i class="fa fa-save"></i>&nbsp;保存
												</button>
											</div>
										</div>
									 </div>
									 <div class="form-group">
										<label class="control-label col-md-2"></label>
										<div class="col-md-10">
											<div class="input-icon right">                                       
												<a class="btn blue btn-block ajaxify" href="usermanager/usermanagerPre" id="btn_back" >
													<i class="fa fa-reply "></i>&nbsp;返      回
												</a>
											</div>
										</div>
									 </div>
									 <br>
								</div>
								<div class="col-md-8">
									<div class="form-group">
										<label class="control-label col-md-3">用户代码<span class="required">*</span></label>
										<div class="col-md-9">
											<div class="input-group">    
											<input type="hidden" name="userId" id="userId" value="${userPO.userId }">                                   
												<input type="text" class="form-control" id="userCode" name="userCode" placeholder="请输入正确用户代码" maxlength="20" value="${userPO.userCode }" readonly="readonly"/>
												<span class="input-group-addon">
													<i class="fa fa-dedent"></i>
												</span>
											</div>
										</div>
									</div>
							
									<div class="form-group">
										<label class="control-label col-md-3">姓名<span class="required">*</span></label>
										<div class="col-md-9">
											<div class="input-group">                                       
												<input type="text" class="form-control" id="userName" name="userName" value="${userPO.userName }" placeholder="请输入姓名" maxlength="20"/>
												<span class="input-group-addon">
														<i class="fa fa-dedent"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">性别</label>
										<div class="col-md-9" id="genderDiv">
											<script type="text/javascript">getSelect('sex','sex','1002','${userPO.sex}',true,'form-control','','genderDiv');
											</script>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">邮箱<span class="required">*</span></label>
										<div class="col-md-9">
											<div class="input-group">                                       
												<input type="text" class="form-control" id="email" name="email" value='${userPO.email}' placeholder="请输入邮箱"/>
												<span class="input-group-addon">
													<i class="fa fa-envelope"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">联系电话</label>
										<div class="col-md-9">
											<div class="input-group ">                                       
												<input type="text" class="form-control" id="phone" name="phone" value="${userPO.phone}" placeholder="请输入联系电话"/>
												<span class="input-group-addon">
													<i class="fa fa-phone"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">手机电话</label>
										<div class="col-md-9">
											<div class="input-group">                                       
												<input type="text" class="form-control" id=mobile name="mobile" value='${userPO.mobile}' placeholder="请输入正确手机电话"/>
													<span class="input-group-addon">
														<i class="fa fa-mobile"></i>
													</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">状态<span class="required">*</span></label>
										<div class="col-md-9 col-sm-12 col-xs-12" id="statusDiv">
											<script type="text/javascript">getSelect('userStatus','userStatus','1001','${userPO.userStatus}',true,'form-control','','statusDiv');
											</script>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END USER INFO MODI PORTLET -->
				</form>
				<!-- END FORM-->
				
				<!-- BEGIN ROLE MANAGER PORTLET -->
				<div class="portlet light">
				
					<div class="portlet-title">
						<div class="caption font-grey-gallery">
							<i class="icon-list"></i>
							<span class="caption-subject bold"> 维护角色信息</span>
						</div>
						<div class="actions">
							<a href="javascript:;" onclick="showRoleList()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-equalizer"></i> 维护角色 </a>
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
				<!-- <div id="role-modal" class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1"></div> -->
				<!-- <div class="modal fade bs-modal-lg" id="role-modal" tabindex="-1" role="dialog" aria-hidden="true"> -->
			</div>
	</div>
</div>
<!-- END FORM-->  
</body>
<div class="modal fade container" id="role-modal">

</html>
 <script type="text/javascript">
 //文件类型校验
 $.validator.addMethod("filetype",function(value,element,param) {
	    var fileType = value.substring(value.lastIndexOf(".") + 1).toLowerCase(); 
	    return this.optional(element) || $.inArray(fileType, param) != -1;
	},$.validator.format("invalid file type"));
//文件大小校验
	var  browserCfg = {};
	var ua = window.navigator.userAgent;
	if (ua.indexOf("MSIE")>=1)
	{
		browserCfg.ie = true;
	}
	else if(ua.indexOf("Firefox")>=1)
	{
		browserCfg.firefox = true;
	}
	else if(ua.indexOf("Chrome")>=1)
	{
		browserCfg.chrome = true;
	}
$.validator.addMethod("filesize", function(value, element, params) {
	var obj_file = document.getElementById("file");
	if(obj_file.value == ''){
		return true;
	}
	var filesize = 0;
	if (browserCfg.firefox || browserCfg.chrome)
	{
		filesize = obj_file.files[0].size;
	}
	else if (browserCfg.ie) {
		return true;
	}
	if (filesize == -1) {
		return false;
	} else if (filesize > 10*1024*1024) {
		return false;
	} else {
		return true;
	}
}, $.validator.format("invalid file size"));
 $.validator.addMethod("mobile", function(value, element, params) {
	 if (value.length > 1) {
   	 var regu =/^[1][0-9][0-9]{9}$/;
   	 var re = new RegExp(regu);
   	 if (re.test(value)) {
   	 	return true;
   	 }else{
   		 return false;
   	 } 
	 }
	 else {
			return true;
		}
	}, " ");
//	 座机验证 联系电话
$.validator.addMethod("phone", function(value, element, params) {
	 if (value.length > 1) {
   	 var regu =/^(\(\d{3,4}\)|\d{3,4}-)?\d{7,8}$/;
   	 var re = new RegExp(regu);
   	 if (re.test(value)) {
   	 	return true;
   	 }else{
   		 return false;
   	 } 
	 }
	 else {
			return true;
		}
	}, "正确格式为：0555-XXXXXXX，0566-XXXXXXXX，021-XXXXXXX，010-XXXXXXXX，85858585，XXXXXXXX");
</script>
<script type="text/javascript">
var formOption = {
 		formId : "updaeUser",
 		formRoles : {
	            userName: {
	                required: true
	            },
	            phone : {
                	phone: true
                },
                  mobile:{
                	  mobile: true
                },  
                email:{
                	required: true,
                	email: true
                },
	            status: {
	                required: true
	            },
				file: {
	                filetype: ["png","gif","jpeg","jpg"],
	                filesize: true
	            }
 					},
 		formMessages: { 
	            userName: {
	                required: "用户名称必须填写"
	            },
	            phone:{
	            	  phone:"请填写正确的的联系电话" 
	            },  
	            status: {
	            	required: "请选择状态"
	            },
	            email :{
	            	required: "邮箱不能为空",
	            	email:"邮箱格式不正确，请重新输入"
	            },
	            mobile:{
                	mobile:"请填写正确的的手机电话号码" 
                },  
				file: {
	                filetype: "请选择png,gif,jpeg,jpge格式的文件",
	                filesize: "文件不能超过10M"
	            }
		},
		formCallBack: {
				url:  "usermanager/updateProfile",	// 验证通过调用的后台连接
				type: "POST",  
				dataType: "json", 
				success: function(ajaxResult)
				{
					// altConfirm(alt_param);							// 处理成功的回调
					AjaxAnyWhere.handleResult(ajaxResult, handleSuccess);
					
				},
				error: function(data)
				{
					bootbox.alert("编辑用户失败");							// 处理失败的回调
					return;
				}
		}
   		
   }
 
 // 处理成功回调方法
 var handleSuccess = function ()
 {
	$('.alert-success').hide();
	bootbox.alert("修改用户信息成功");	
	Metronic.loadContentData("usermanager/usermanagerPre");
 }

function mySubmit(){
	 $("#updaeUser").submit();
}

	var optionUpdateUser = 
 	{
 		 url:"usermanager/queryRelationRoles",
 		 formId: 'updaeUser',
 		 gridId:"myGrid",
 		 blankId:"_page",
 		 choiceType:null,
 		 columns : [
 			{header: "", width: "3%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "角色代码", width: "10%", dataIndex: "roleCode"},
			{header: "角色名称", width: "10%", dataIndex: "roleName"},
			{header: "角色类型", width: "10%", dataIndex: "roleType", renderer: getfixCodeDesc},
			{header: "操作", width: "10%", dataIndex: "roleId", renderer: myLink}
 		]
 	};
	jQuery(document).ready(function() {
		CommonFormVaildate.init(formOption);
		//头像回显
		var avatarPath = '${userPO.avatar}';
		if(avatarPath != null && '' != avatarPath){
			//回填头像
			$("#photo").attr("src", "usermanager/showAvatar?avatarPath="+avatarPath);
			//切换头像操作按钮
			$("#photoDiv").addClass('fileinput-exists').removeClass('fileinput-new');
		} 
		DataGrid.__extQueryAll__(optionUpdateUser);
	});

	function myLink(value,metaDate,record){
		   //return "<a href=\"userModifyPre.action?userId="+value+"\">[删除]</a>";
		   var userId = $("#userId").val();
		   return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteRoleRelation("+userId+","+value+")\"><i class=\"fa fa-trash-o\"></i>Delete</a>";
	}
	
	function deleteRoleRelation(userId, roleId)
	{
		bootbox.confirm("是否删该角色?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("usermanager/deleteRoleRelation","userId="+userId+"&roleId="+roleId, delRoleCallback);
			}
		});
	}
	function delRoleCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(optionUpdateUser);
		});
	}
	
	
	var $roleModal = $('#role-modal');
	/**
	 * 打开组织选择树弹出层
	 */
	function showRoleList()
	{
		  // create the backdrop and wait for next modal to be triggered
		  //$('body').modalmanager('loading');
		  setTimeout(function(){
		      $roleModal.load('jsp/userManager/rolerelationmanager.jsp', '', function(){
		      	$roleModal.modal();
		    });
		  }, 100);
	}
	
	//清除头像
	function clearPhoto(){
		//清除对象上的图片地址
		$('#avatar').val(null);
		//清除file属性
		$("#file").val(null);
		//清除页面上的IMG
		$("#photo").attr("src", "<%=path%>/images/placeholder.jpg");
	}
</script>
