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
	<title>个人信息</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<script src="<%=path%>/js/jquery.form.js" type="text/javascript"></script>
</head>
<body onload="">
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			<span class="icon-svg4 icon-pad"></span>
			个人信息维护&nbsp;&nbsp;<small> Personal Information Maintain</small>
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
				<form action="#" id="updaeUser" class="form-horizontal form-horizontal" name="updaeUser" enctype="multipart/form-data" method="post">
					<div class="form-body">
						<div class="alert alert-danger display-hide">
							<button class="close" data-close="alert"></button>
								表单填写错误,请重新填写.
						</div>
						<div class="alert alert-success display-hide">
							<button class="close" data-close="alert"></button>
								用户信息填写正确!
						</div>
						<div class="col-md-4">
							<div class="form-group">
								<label class="control-label col-md-2"></label>
								<div class="col-md-10">
								<span id="fileError" style="display:none"><font color="red">请选择图片格式</font></span>
									<div class="fileupload fileupload-new" data-provides="fileupload">
										<div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
											<input type="hidden" name="photoAtta" id="photoAtta" value="${userPO.photoAtta }">
											 <c:choose>
												<c:when test="${userPO.photoAtta !=null && userPO.photoAtta!='' }">
													<img  style="width: 200px;height: 200px;" src="<%=path %>/showImg.action?userId=${userPO.userId }&id=<%=Math.random()%>" />
												</c:when>
												<c:otherwise>
													<img src="<%=path %>/images/photo.gif" alt="" style="width: 200px; height: 200px;" />
												</c:otherwise>
											</c:choose> 
										</div>
										<div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 200px; line-height: 20px;"></div>
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
							</div> 
							<div class="form-group">
								<label class="control-label col-md-2"></label>
								<div class="col-md-10">
									<div class="input-icon right">                                       
										<button type="button" class="btn green btn-block ajaxify" onclick="mySubmit()">
										保存
										</button>
									</div>
								</div>
							 </div>
							 
							 <br>
						</div>
						<div class="col-md-8">
								<div class="form-group">
									<label class="control-label col-md-3">用户代码<span class="required">*</span></label>
									<div class="input-group col-md-9"  ><!-- id="pulsate-regular"添加脉动 -->
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input type="hidden" name="userId" id="userId" value="${userPO.userId }">
											<input type="text" class="form-control" id="userCode" name="userCode" placeholder="请输入用户代码" value="${userPO.userCode }" readonly="readonly" maxlength="20"/>
										</div>
									</div>
								</div>
								
								<div class="form-group">
									<label class="control-label col-md-3">姓名<span class="required">*</span></label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input type="text" class="form-control" id="userName" name="userName" value="${userPO.userName }" placeholder="请输入姓名" maxlength="20"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">密码</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input class="form-control" name="password" id="password" type="password" placeholder="请输入密码"  maxlength="32"/> 
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">英文名</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input type="text" class="form-control" id="userNameEn" name="userNameEn" value="${userPO.userNameEn }"  placeholder="请输入英文名" maxlength="30"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">性别</label>
									<div class="col-md-9" id="genderDiv">
										<script type="text/javascript">getSelect('gender','gender','1003','${userPO.gender}',true,'form-control','','genderDiv');
										</script>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">身份证号</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input type="text" class="form-control" id="idNumber" name="idNumber" value='${userPO.idNumber}' placeholder="请输入身份证号"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">QQ</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input type="text" class="form-control" id="qq" name="qq" value='${userPO.qq}' placeholder="请输入qq" maxlength="20"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">微信</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input type="text" class="form-control" id="wechat" name="wechat" value='${userPO.wechat}' placeholder="请输入微信" maxlength="60"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">邮箱<span class="required">*</span></label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-envelope"></i>
											<input type="text" class="form-control" id="email" name="email" value='${userPO.email}' placeholder="请输入邮箱"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">地址</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-dedent"></i>
											<input type="text" class="form-control" id="address" name="address" value='${userPO.address}' placeholder="请输入地址" maxlength="200"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">联系电话</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-phone"></i>
											<input type="text" class="form-control" id="tel" name="tel" value='${userPO.tel}' placeholder="请输入联系电话"/>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-md-3">手机电话</label>
									<div class="input-group col-md-9">
										<div class="input-icon">                                       
											<i class="fa fa-mobile"></i>
											<input type="text" class="form-control" id="phone" name="phone" value='${userPO.phone}' placeholder="请输入手机电话"/>
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
</body>
</html>
<script type="text/javascript">
$.validator.addMethod("phone", function(value, element, params) {
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
$.validator.addMethod("tel", function(value, element, params) {
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
</script>
<script type="text/javascript">
var AddPoSTm = function () {
	var postFormValidation = function() {
    	var fm = $('#updaeUser');
        var error = $('.alert-danger', fm);
        var success = $('.alert-success', fm);
        fm.validate({
			errorElement: 'span', //default input error message container
			errorClass: 'help-block', // default input error message class
			focusInvalid: false, // do not focus the last invalid input
			ignore: "",
			rules: {
				userCode: {
                    required: true
                },
               userName: {
                    required: true
                },
                password:{
                	password: true
                },
                idNumber : {
                    minlength:15,
                    maxlength:18 
                },
                tel : {
                	tel: true
                },
                  phone:{
                	phone: true
                },  
                 qq:{
                	number: true
                }, 
                 email:{
                	required: true,
                	email: true
                }, 
                status: {
                    required: true
                } 
			},
			messages: { 
                userCode: {
                    required: "用户代码必须填写"
                },
               userName: {
                    required: "用户名称必须填写"
                },
                password:{
                	password: "请填写以字母开头,字母下划线数字结尾,长度至少6位以上"
                },
                idNumber : {
                	minlength:"请填写位数最少15位",
                	maxlength:"请填写位数最多18位"
                },
                 phone:{
                	  phone:"请填写正确的的手机电话号码" 
                },  
                qq:{
                	number: "必须是纯数字"
                }, 
                 email:{
                	 required: "邮箱名称必须填写",
                	 email:"请输入有效的email地址如:xxxx@xx.com"
                }, 
                status: {
                	required: "请选择状态"
                } 
			},
			invalidHandler: function (event, validator) {
				success.hide();
				error.show();
				App.scrollTo(error, -200);
			},
			highlight: function (element) {
				$(element).closest('.form-group').addClass('has-error');
			},
			unhighlight: function (element) {
				$(element).closest('.form-group').removeClass('has-error');
			},
			success: function (label) {
				label.closest('.form-group').removeClass('has-error');
			},
	        submitHandler: function (form) {
	            success.show();
	            error.hide();
	             var options = {
					url:  "UserUpdate.action",
					type: "post",  
					contentType: "application/x-www-form-urlencoded; charset=utf-8",  
					dataType: "json", 
					success: function(msg){  
						
						tipSuccess("修改成功");
						
					}
				};  
				$(form).ajaxSubmit(options); 
				return false;
			}
		});
	}
	var handleWysihtml5 = function() {
        if (!jQuery().wysihtml5) {
            return;
        }
        if ($('.wysihtml5').size() > 0) {
            $('.wysihtml5').wysihtml5({
                "stylesheets": ["<%=path%>/assets/plugins/bootstrap-wysihtml5/wysiwyg-color.css" ]
							});
		}
	}
	return {
		init : function() {
			handleWysihtml5();
			postFormValidation();
		}
	};
}();

jQuery(document).ready(function() {
	AddPoSTm.init();
});
function jumpUserPost(userId){
	App.loadContentData("UserPostMain.action?userId="+userId);
}
function mySubmit(){
	 var fileValue=$("#file").val();
	 if(fileValue != null && fileValue != ''){
	 	var fileType=fileValue.substring(fileValue.lastIndexOf(".")+1);
	 	if(fileType !="png"&& fileType !="gif" && fileType !="jpeg" && fileType !="jpg"){
	 		$("#fileError").show(); 
	 	}else{
	 		$("#fileError").hide(); 
	 	}
	 } 
	 $("#updaeUser").submit();
}
</script>
