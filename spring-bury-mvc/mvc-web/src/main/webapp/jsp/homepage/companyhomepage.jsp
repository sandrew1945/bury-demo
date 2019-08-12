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
	<title>长春市科技企业数据库</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<link href="<%=path%>/assets/global/css/timeline.css" rel="stylesheet" type="text/css"/>
</head>
<!-- BEGIN BODY -->
<body>
	<!-- BEGIN PAGE HEADER-->
	<div class="row">
	  <div class="col-md-12"> 
	    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
	    <h3 class="page-title"> <span class="icon-svg2 icon-pad"></span> 长春市科技企业数据库  </h3>
	    <!-- END PAGE TITLE & BREADCRUMB--> 
	  </div>
	</div>
	<!-- END PAGE HEADER-->
	<!-- BEGIN PAGE CONTENT-->
	<h3 class="form-section"></h3>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<form action="#" id="fm" class="form-horizontal form-horizontal" name="fm" method="post">
			<!-- BEGIN REGISTER INFO PORTLET -->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="fa fa-info"></i>
						<span class="caption-subject bold"> 企业信息</span>
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"></a>
					</div>
				</div>
				<div class="portlet-body">
					
					
					
					<div class="invoice">
							<div class="row invoice-logo">
								<div class="col-md-12">
									<div class="col-md-6 invoice-logo-space">
										<h3 class="page-title">${companyApprovalInfo.companyInfo.companyName }</h3>
									</div>
									<div class="col-md-6">
										<h3 class="page-title pull-right">当前日期：<span id="curDate"><script>CommonUtil.getCurDateStr("curDate")</script></span></h3>
									</div>
								</div>
							</div>
							<hr>
							<div class="row">
								<div class="col-xs-4">
									<h3>企业基本信息:</h3>
									<ul class="list-unstyled">
										<li>
											<strong>所属行政区：</strong><span id="region"><script>getfixCodeDescPrint("${companyApprovalInfo.companyInfo.region }", "region")</script></span>
										</li>
										<li>
											 <strong>组织机构代码：</strong>${companyApprovalInfo.companyInfo.orgCode }
										</li>
										<li>
											 <strong>企业类型：</strong><span id="companyType"><script>getfixCodeDescPrint("${companyApprovalInfo.companyInfo.companyType }", "companyType")</script></span>
										</li>
										<li>
											 <strong>注册地址：</strong>${companyApprovalInfo.companyInfo.regAddr }
										</li>
										<li>
											<strong>高新技术认定企业：</strong><span id="isTechCompany"><script>getfixCodeDescPrint("${companyApprovalInfo.companyInfo.isTechCompany }", "isTechCompany")</script></span>
										</li>
										<li>
											<strong>工商注册时间：</strong><span id="regDate"><script>CommonUtil.getDateStrPrint("${companyApprovalInfo.companyInfo.regDate }", "regDate")</script></span>
										</li>
									</ul>
								</div>
								<div class="col-xs-4">
									<h3>审批状态:</h3>
									<ul class="list-unstyled">
										<li>
											 <strong>科技企业审批状态：</strong><span id="companyStatus"><script>getfixCodeDescPrint("${companyApprovalInfo.companyStatus }", "companyStatus")</script></span><c:if test="${companyApprovalInfo.companyStatus==20071001 }"><span style="color: red;font-size: large;">&nbsp;&nbsp;尚未提交申请表!</span></c:if>
										</li>
										<li>
											 <strong>科技企业编号：</strong>${companyApprovalInfo.companyInfo.authCode }
										</li>
										<li>
											 <strong>科技企业审批意见：</strong>${companyApprovalInfo.approvalOpinion}
										</li>
										<li>
											 <strong>年审审批状态：</strong><span id="examined"><script>getfixCodeDescPrint("${companyApprovalInfo.examined }", "examined")</script></span>
										</li>
										<li>
											 <strong>年审申请年份：</strong>${companyApprovalInfo.examinedYear }年
										</li>
										<li>
											 <strong>年审审批意见：</strong>${companyApprovalInfo.examinedOpinion}
										</li>
									</ul>
								</div>
								<div class="col-xs-4 invoice-payment">
									<h3>联系人信息:</h3>
									<ul class="list-unstyled">
										<li>
											<strong>联系人姓名：</strong> ${companyApprovalInfo.companyInfo.linkman }
										</li>
										<li>
											<strong>联系人电话：</strong>${companyApprovalInfo.companyInfo.linkmanTel }
										</li>
										<li>
											<strong>联系人邮箱：</strong> ${companyApprovalInfo.companyInfo.linkmanEmail }
										</li>
										<li>
											<strong>联系人QQ:  </strong> ${companyApprovalInfo.companyInfo.linkmanQq }
										</li>
									</ul>
								</div>
							</div>
						</div>
					
					
					
					
				</div>
			</div>
		</form>
		<!-- END FORM-->
	</div>
	<!-- END PAGE CONTENT-->
</body>
</html>
<script type="text/javascript">

</script>