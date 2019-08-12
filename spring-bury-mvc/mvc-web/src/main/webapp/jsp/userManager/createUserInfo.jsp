<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
</head>
<body onload="">
<!-- BEGIN PAGE HEADER-->
 <div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			<span class="icon-svg2 icon-pad"></span> 
			用户管理 - 新增&nbsp;&nbsp;<small>User Management - New</small>
		</h3>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div> 
<!-- BEGIN PAGE CONTENT-->    
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN VALIDATION STATES-->
		<h3 class="form-section"></h3>
			<div class="portlet-body form">
				<!-- BEGIN FORM-->
				<form action="#" id="fm" class="form-horizontal form-horizontal" name="addUser" method="post" enctype="multipart/form-data">
					<div class="form-body">
						<div class="alert alert-danger display-hide" id="formErr">
							<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
						</div>
						<div class="alert alert-danger display-hide" id="avatarWrongType">
							<button class="close" data-close="alert"></button>请选择正确的图片格式.
						</div>
						<div class="col-md-4">
						  	<div class="form-group">
						  	
						  	
							<div class="col-md-12">
								<div class="form-group">
									<div class="">
										<div class="fileinput fileinput-new col-md-12" data-provides="fileinput">
											<div class="fileinput-new thumbnail col-md-12" style="min-height: 436px"> <!-- style="width: 400px; height: 300px;" -->
												<img src="<%=path %>/images/placeholder.jpg" alt="" style="width: 100% ; height: 100%" />
											</div>
												<div class="fileinput-preview fileinput-exists thumbnail" style="min-height: 436px"> <!-- style="width: 400px; height: 300px;" -->
											</div>
											<div>
												<span class="btn green-haze btn-file">
												<span class="fileinput-new"> 请选择头像 </span>
												<span class="fileinput-exists"> 更换 </span>
												<input type="file" class="btn blue" id="file" name="file" value="">
												</span>
												<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> 移除 </a>
											</div>
										</div>
									</div>
								</div>
							</div>

						  	 
						  	 
						  	 	<!-- 
								<div class="col-md-10">
								<span id="fileError" style="display:none"><font color="red">请选择图片格式</font></span>
									<div class="fileupload fileupload-new" data-provides="fileupload">
										<img src="/images/photo.gif" alt="" class="fileinput thumbnail" style="width: 200px; height: 200px;"/>
										<!-- <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 200px; line-height: 20px;"></div>
										<div>
											<span class="btn default btn-file">
											<span class="fileupload-new"><i class="fa fa-paper-clip"></i> 选择图片</span>
											<span class="fileupload-exists"><i class="fa fa-undo"></i> 更改</span>
											<input type="file" class="default" id="file" name="file"/>
											</span>
											<a href="#" class="btn red fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash-o"></i> 移除 </a>
										</div>
									</div>
								</div>
								 -->
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
										<!-- <a class="btn dark btn-block ajaxify" href="UserMain.action" id="btn_back" >返      回</a> -->
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
									<div class="col-md-9"><!-- id="pulsate-regular"添加脉动 -->
										<div class="input-group">                                       
											<input type="text" class="form-control" id="userCode" name="userCode" placeholder="请输入正确用户代码" maxlength="20"/>
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
											<input type="text" class="form-control" id="userName" name="userName" placeholder="请输入正确姓名" maxlength="20"/>
											<span class="input-group-addon">
												<i class="fa fa-dedent"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">密码<span class="required">*</span></label>
									<div class="col-md-9">
										<div class="input-group">                                       
											<input class="form-control" name="password" id="password" type="password" placeholder="请输入正确密码" maxlength="32"/>
											<span class="input-group-addon">
												<i class="fa fa-dedent"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">性别</label>
									<div class="col-md-9" id="genderDiv">
										<script type="text/javascript">getSelect('sex','sex','1002','',true,'form-control','','genderDiv');
										</script>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">邮箱<span class="required"></span></label>
									<div class="col-md-9">
										<div class="input-group">                                       
											<input type="text" class="form-control" id="email" name="email" placeholder="请输入正确邮箱"/>
											<span class="input-group-addon">
												<i class="fa fa-envelope"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">电话</label>
									<div class="col-md-9">
										<div class="input-group ">                                       
											<input type="text" class="form-control" id="phone" name="phone" placeholder="请输入正确联系电话"/>
											<span class="input-group-addon">
												<i class="fa fa-phone"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">手机</label>
									<div class="col-md-9">
										<div class="input-group">                                       
											<input type="text" class="form-control" id=mobile name="mobile" placeholder="请输入正确手机电话"/>
											<span class="input-group-addon">
												<i class="fa fa-mobile"></i>
											</span>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">状态<span class="required">*</span></label>
									<div class="col-md-9" id="statusDiv">
										<script type="text/javascript">getSelect('userStatus','userStatus','1001','',true,'form-control','','statusDiv');
										</script>
									</div>
								</div>
							</div>	
					</div>
				</form>
				<!-- END FORM-->
			</div>
		<!-- END VALIDATION STATES-->
	</div>
</div>
</body>
</html>
<script type="text/javascript">
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
//	 座机验证
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
	}, "");
$.validator.addMethod("password", function(value, element, params) {
	 if (value!= null && value != '') {
  	 var regu =/^[a-zA-Z]\w{5,}$/; 
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
$.validator.addMethod("email", function(value, element, params) {
	 if (value!= null && value != '') {
 	 var regu =/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
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
</script>
<script type="text/javascript">


var formOption = {
   		formId : "fm",
   		formRoles : {
			   			userCode: {
			                required: true
			            },
			            password: {
			                required: true,
			                password: true
			            },
			            userName: {
			                required: true
			            },
			            email: {
			            	email: true
			            },
			            phone:{
			            	phone: true
			            },
			            mobile: {
			            	mobile: true
			            },
			            userStatus: {
			                required: true
			            }
   					},
   		formMessages: { 
			   			userCode: {
			                required: "用户代码必须填写"
			            },
			            password: {
			                required: "密码必须填写",
			                password: "请填写以字母开头,字母下划线数字结尾,长度至少6位以上"
			            },
			            email: {
			            	email: "请输入正确的邮箱格式"
			            },
			            userName: {
			                required: "用户名称必须填写"
			            },
			            phone:{
			            	phone:"请填写正确的的电话号码" 
			            },
			            mobile: {
			            	mobile:"请填写正确的手机号码"
			            },
			            userStatus: {
			            	required: "请选择状态"
			            }
   					},
   		formCallBack: {
   					url:  "usermanager/createUserInfo",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加用户失败");							// 处理失败的回调
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

	
jQuery(document).ready(function() {
	CommonFormVaildate.init(formOption);
});

function mySubmit(){
	 $("#fm").submit();
}
</script>
