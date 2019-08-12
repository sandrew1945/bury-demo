<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<title>个人信息管理</title>
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
			 修改个人信息
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
				<form action="#" id="updateUser" class="form-horizontal form-horizontal" name="updateUser" enctype="multipart/form-data" method="post">
					<input type="hidden" id="avatar" name="avatar" value="${userPO.avatar}" />
					<div class="form-body">
						<div class="alert alert-danger display-hide" id="formErr">
							<button class="close" data-close="alert"></button>
								表单填写错误,请重新填写.
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<div class="col-md-12">
									<div class="form-group">
										<div id='photoDiv' class="fileinput fileinput-new col-md-12" data-provides="fileinput">
											<div class="fileinput-new thumbnail col-md-12" style="min-height: 436px;min-width: 436px;max-height: 436px;max-width: 436px;">
												<img src="<%=path%>/images/placeholder.jpg" style="width: 100% ; height: 100%"/>
											</div>
											<div class="fileinput-preview fileinput-exists thumbnail" style="min-height: 436px;min-width: 436px;max-height: 436px;max-width: 436px;"> 
												<img id="photo" src="<%=path%>/images/placeholder.jpg" style="width: 100% ; height: 100%"/>
											</div>
											<div>
												<span class="btn green-haze btn-file">
												<span class="fileinput-new" > 请选择头像 </span>
												<span class="fileinput-exists"> 更换 </span>
												<input type="file" id="file" class="btn blue" name="file" value="">
												</span>
												<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput" onclick="clearPhoto()"> 移除 </a>
											</div>
										</div>
									</div>
								</div>
							</div> 
							<div class="form-group">
								<label class="control-label col-md-2"></label>
								<div class="col-md-10">
									<div class="input-icon right">                                       
										<button type="button" class="btn green btn-block" onclick="mySubmit()">
										保存
										</button>
									</div>
								</div>
							 </div>
							 <div class="form-group">
								<label class="control-label col-md-2"></label>
								<div class="col-md-10">
									<div class="input-icon right">                                       
										<a class="btn blue btn-block ajaxify" href="usermanager/usermanagerPre" id="btn_back" >返      回</a>
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
								<label class="control-label col-md-3">出生日期</label>
								<div class="col-md-9">
									<div class="input-group col-md-12">
										<input id="birthday" name="birthday" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value='${userPO.birthday}'/>" > 
									</div>
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
								<label class="control-label col-md-3">联系电话<span class="required">*</span></label>
								<div class="col-md-9">
									<div class="input-group">                                       
										<input type="text" class="form-control" id="phone" name="phone" value='${userPO.phone}' placeholder="请输入联系电话"/>
										<span class="input-group-addon">
											<i class="fa fa-phone"></i>
										</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="control-label col-md-3">手机电话<span class="required">*</span></label>
								<div class="col-md-9">
									<div class="input-group">                                       
										<input type="text" class="form-control" id="mobile" name="mobile" value='${userPO.mobile}' placeholder="请输入手机电话"/>
										<span class="input-group-addon">
											<i class="fa fa-mobile"></i>
										</span>
									</div>
								</div>
							</div>
				            <div class="form-group">
				              	<label class="control-label col-md-3">密码<span class="required">*</span></label>
				              	<div class="col-md-9">
					              <div class="input-group ">
					                <input type="password" class="form-control" placeholder="密码" id="password" name="password" />
   										<span class="input-group-addon">
											<i class="fa fa-dedent"></i>
										</span>
					              </div>
				            	</div>
				            </div>
				            <div class="form-group">
				              <label class="control-label col-md-3">确认密码<span class="required">*</span></label>
				              	<div class="col-md-9">
						              <div class="input-group">
						                <input type="password" class="form-control" placeholder="确认密码" id="rePassword" name="rePassword" />
   										<span class="input-group-addon">
											<i class="fa fa-dedent"></i>
										</span>
						              </div>
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
<!-- END FORM-->  
</body>
</html>
 <script type="text/javascript">
 //密码校验
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
 //文件类型校验
 $.validator.addMethod("filetype",function(value,element,param) {
	    var fileType = value.substring(value.lastIndexOf(".") + 1).toLowerCase(); 
	    return this.optional(element) || $.inArray(fileType, param) != -1;
	},$.validator.format("invalid file type"));

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
	//文件大小校验
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
//手机校验
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
var formOption = {
 		formId : "updateUser",
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
				file: {
	                filetype: ["png","gif","jpeg","jpg"],
	                filesize: true
	            },
	            password: {
	                password: true
	            },
	            rePassword: {
	            	equalTo: "#password"
	            }
 					},
 		formMessages: { 
	            userName: {
	                required: "用户名称必须填写"
	            },
	            phone:{
	            	  phone:"请填写正确的的联系电话" 
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
	            },
	            password: {
	                password: "请填写以字母开头,字母下划线数字结尾,长度至少6位以上"
	            },
	            rePassword: {
	            	equalTo: "与密码不符"
	            }
		},
		formCallBack: {
				url:  "usermanager/updateProfile",	// 验证通过调用的后台连接
				type: "POST",  
				dataType: "json", 
				success: function(ajaxResult)
				{
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
	bootbox.alert("修改用户信息成功");	
 }

function mySubmit(){
	$('.alert-success').hide();
	$("#updateUser").submit();
}
	
jQuery(document).ready(function() {
	CommonFormVaildate.init(formOption);
	//加载时间控件
	if (jQuery().datepicker) {
		$.fn.datepicker.defaults.format = "yyyy-mm-dd";
		$.fn.datepicker.defaults.language = "zh-CN";
          $('.date-picker').datepicker({
              rtl: Metronic.isRTL(),
              orientation: "left",
              language : "",
              autoclose: true
          });
    }
	//头像回显
	var avatarPath = '${userPO.avatar}';
	if(avatarPath != null && '' != avatarPath){
		//回填头像
		$("#photo").attr("src", "usermanager/showAvatar?avatarPath="+avatarPath);
		//切换头像操作按钮
		$("#photoDiv").addClass('fileinput-exists').removeClass('fileinput-new');
	} 
});

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
