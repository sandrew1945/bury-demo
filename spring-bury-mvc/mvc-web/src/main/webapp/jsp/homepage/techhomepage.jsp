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
</head>
<!-- BEGIN BODY -->
<body>
	<!-- BEGIN PAGE HEADER-->
	<div class="row">
	  <div class="col-md-12"> 
	    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
	    <h3 class="page-title"> <span class="icon-svg2 icon-pad"></span> 长春市科技企业数据库 </h3>
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
						<span class="caption-subject bold"> 待处理信息</span>
					</div>
					<div class="tools">
						<a href="javascript:;" class="collapse"></a>
					</div>
				</div>
				<div class="portlet-body">
					<div class="row">
						<div class="col-md-3">
							<div class="top-news">
					          <a href="registercompany/registerCompanyMngPre" class="btn blue ajaxify">
								<span>注册企业数量 </span>
								<em class="pull-right">数量：<span>${approvalInfo.registerCompanyCount}</span></em>
								<em class="">截止日期：<span id="registerCompanyCount"><script>CommonUtil.getCurDateStr("registerCompanyCount")</script></span></em>
								<i class="fa fa-globe top-news-icon"></i>
							  </a>
							</div>
						</div>
						<div class="col-md-3">
							<div class="top-news">
					          <a href="companyapproval/companyApprovalPre" class="btn red-intense ajaxify">
								<span>未审批数量 </span>
								<em class="pull-right">数量：<span>${approvalInfo.unApprovalCount}</span></em>
								<em class="">截止日期：<span id="unApprovalCount"><script>CommonUtil.getCurDateStr("unApprovalCount")</script></span></em>
								<i class="fa fa-edit top-news-icon"></i>
							  </a>
							</div>
						</div>
						
						<div class="col-md-3">
							<div class="top-news">
					          <a href="companyapproval/companyApprovalPre" class="btn green ajaxify">
								<span>已审批数量 </span>
								<em class="pull-right">数量：<span>${approvalInfo.approvalCount}</span></em>
								<em class="">截止日期：<span id="approvalCount"><script>CommonUtil.getCurDateStr("approvalCount")</script></span></em>
								<i class="fa fa-trophy top-news-icon"></i>
							  </a>
							</div>
						</div>
						<div class="col-md-3">
							<div class="top-news">
					          <a href="companyexamined/companyExaminedPre" class="btn yellow-casablanca ajaxify">
								<span>未年审数量 </span>
								<em class="pull-right">数量：<span>${approvalInfo.unExaminedCount}</span></em>
								<em class="">截止日期：<span id="unExaminedCount"><script>CommonUtil.getCurDateStr("unExaminedCount")</script></span></em>
								<i class="fa fa-calendar top-news-icon"></i>
							  </a>
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