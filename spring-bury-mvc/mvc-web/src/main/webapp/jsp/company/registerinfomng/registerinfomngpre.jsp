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
	<title>企业账号注册管理</title>
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
	    <h3 class="page-title"> <span class="icon-svg2 icon-pad"></span> 企业账号注册管理 </h3>
	    <!-- END PAGE TITLE & BREADCRUMB--> 
	  </div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- BEGIN PAGE CONTENT-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<h3 class="form-section"></h3>
				<div class="portlet-body form">
					<!-- BEGIN FORM-->
					<form action="#" id="fm" class="form-horizontal form-horizontal" name="addUser" method="post">
						<!-- BEGIN REGISTER INFO PORTLET -->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption font-grey-gallery">
									<i class="icon-bulb font-grey-gallery"></i>
									<span class="caption-subject bold"> 注册信息</span>
								</div>
								<div class="tools">
									<a href="javascript:;" class="collapse"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="alert alert-danger display-hide" id="formErr">
									<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
								</div>
								<div class="row">
						          <div class="col-md-30 col-lg-10">
						            <div class="form-group">
						              <label class="control-label col-md-3">系统账号：</label>
						              <div class="input-group col-md-9 col-sm-12 col-xs-12">
						             	<input type="hidden" id="userId" name="userId" value="${companyAccount.userId}" />
						                <input type="text" class="form-control" placeholder="系统账号" id="userCode" name="userCode" value="${companyAccount.userCode}" readonly="readonly"/>
						              </div>
						            </div>
						          </div>
						        </div>
						        <!--/span-->
						        <div class="row">
						          <div class="col-md-30 col-lg-10">
						            <div class="form-group">
						              <label class="control-label col-md-3">企业名称：</label>
						              <div class="input-group col-md-9 col-sm-12 col-xs-12">
						                <input type="text" class="form-control" placeholder="企业名称" id="companyName" name="companyName" value="${companyAccount.companyName}" />
						              </div>
						            </div>
						          </div>
						        </div>
								<div class="row">
						          <div class="col-md-30 col-lg-10">
						            <div class="form-group">
						              <label class="control-label col-md-3">组织机构代码证号码：</label>
						              <div class="input-group col-md-9 col-sm-12 col-xs-12">
						                <input type="text" class="form-control" placeholder="组织机构代码证号码" id="orgCode" name="orgCode" value="${companyAccount.orgCode}" />
						              </div>
						            </div>
						          </div>
						        </div>
						        <!--/span-->
						        <div class="row">
						          <div class="col-md-30 col-lg-10">
						            <div class="form-group">
						              <label class="control-label col-md-3">所属行政区域：</label>
						              <div class="input-group col-md-9 col-sm-12 col-xs-12" id="regionDiv">
									  	<script type="text/javascript">getSelect('region','region','2006','${companyAccount.region}',true,'form-control','','regionDiv');</script>
									  </div>
						            </div>
						          </div>
						        </div>
						        
						        <!--/span-->
						        <div class="row">
						          <div class="col-md-30 col-lg-10">
						            <div class="form-group">
						              <label class="control-label col-md-3">密码：</label>
						              <div class="input-group col-md-9 col-sm-12 col-xs-12">
						                <input type="password" class="form-control" placeholder="密码" id="password" name="password" value="" />
						              </div>
						            </div>
						          </div>
						        </div>
						        
						        <!--/span-->
						        <div class="row">
						          <div class="col-md-30 col-lg-10">
						            <div class="form-group">
						              <label class="control-label col-md-3">确认密码：</label>
						              <div class="input-group col-md-9 col-sm-12 col-xs-12">
						                <input type="password" class="form-control" placeholder="确认密码" id="rePassword" name="rePassword" value="" />
						              </div>
						            </div>
						          </div>
						        </div>
					            <div class="row">
						            <label class="control-label col-md-8"></label>
									<div class="col-md-2">
										<div class="input-icon right">                                       
										<button type="button" class="btn red btn-block " onclick="mySubmit()">
										<i class="fa fa-save"></i>&nbsp;&nbsp;保存
										</button>
										</div>
									</div>
					            </div>
							</div>
						</div>
						<!-- END REGISTER INFO PORTLET -->
					</form>
					<!-- END FORM-->
				</div>
		</div>
	</div>
	<!-- END PAGE CONTENT-->
</body>
</html>
<script type="text/javascript">
var formOption = {
   		formId : "fm",
   		formRoles : {
   						companyName: {
			                required: true
			            },
			            region: {
			                required: true
			            },
			            orgCode: {
			            	required: true
			            },
			            rePassword: {
			            	equalTo: "#password"
			            }
   					},
   		formMessages: { 
   						companyName: {
			                required: "公司名称必须填写"
			            },
			            region: {
			                required: "请选择所属行政区"
			            },
			            orgCode: {
			            	required: "公司组织机构代码证号码必须填写"
			            },
			            rePassword: {
			            	required: "与密码不符"
			            }
   					},
   		formCallBack: {
   					url:  "registerinfo/completeInfo",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加角色失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }
   
function mySubmit(){
	 $("#fm").submit();
}
 
 // 处理成功回调方法
 var handleSuccess = function ()
 {
	bootbox.alert("修改成功");
 }
 
 jQuery(document).ready(function() {
		CommonFormVaildate.init(formOption);
	});


</script>
