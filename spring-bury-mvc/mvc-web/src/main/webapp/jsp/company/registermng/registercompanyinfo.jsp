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
	<title>注册企业管理</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
	<script src="<%=path%>/js/pdfobject.js"></script>
</head>
<body onload="">
<!-- BEGIN PAGE HEADER-->
  <div class="row">
    <div class="col-md-12"> 
      <!-- BEGIN PAGE TITLE & BREADCRUMB-->
      <h3 class="page-title"> <span class="icon-svg2 icon-pad"></span> 注册企业管理  </h3>
      <!-- END PAGE TITLE & BREADCRUMB--> 
    </div>
  </div>
<!-- BEGIN PAGE CONTENT-->    
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN VALIDATION STATES-->
		<h3 class="form-section"></h3>
				<!-- BEGIN FORM-->
				<form action="#" id="fm" class="form-horizontal form-horizontal" name="fm" method="post">
					<input type="hidden" id="companyId" name="companyId" value="${company.companyInfo.companyId} ">
				</form>
					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="col-md-12">
							<div class="portlet light" style="">
								<div class="portlet-title">
									<div class="caption"><i class="fa fa-user"></i>科技企业申请表</div>
									<div class="tools">
										<a href="javascript:;" class="collapse"></a>
									</div>
								</div>
								<div class="portlet-body form">
									<div class="tabbable tabbable-custom tabbable-noborder tabbable-reversed">
										<ul class="nav nav-tabs">
											<li class="active">
												<a href="#tab_0" data-toggle="tab">企业概况 </a>
											</li>
<!-- 											<li> -->
<!-- 												<a href="#tab_1" data-toggle="tab">财务状况 </a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="#tab_2" data-toggle="tab">人员状况 </a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="#tab_3" data-toggle="tab">科技项目与经费 </a> -->
<!-- 											</li> -->
											<li>
												<a href="#tab_4" data-toggle="tab">知识产权 </a>
											</li>
<!-- 											<li> -->
<!-- 												<a href="#tab_5" data-toggle="tab">企业需求 </a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="#tab_6" data-toggle="tab">党组织信息 </a> -->
<!-- 											</li> -->
<!-- 											<li> -->
<!-- 												<a href="#tab_7" data-toggle="tab">其它 </a> -->
<!-- 											</li> -->
											<li>
												<a href="#tab_8" data-toggle="tab">附件 </a>
											</li>
										</ul>
										<div class="tab-content">
											<!-- 企业概述-->
											<c:import url="../companyapproval/simplecompanyinfo.jsp"/>
											<!-- 财务状况-->
<%-- 											<c:import url="../companyapproval/companyfinancereveal.jsp"/> --%>
											<!-- 人员状况-->
<%-- 											<c:import url="../companyapproval/companypersonnelreveal.jsp"/> --%>
											<!-- 科技项目与经费-->
<%-- 											<c:import url="../companyapproval/projectfundingreveal.jsp"/> --%>
											<!-- 知识产权-->
											<c:import url="../companyapproval/intelpropertyreveal.jsp"/>
											<!-- 企业需求-->
<%-- 											<c:import url="../companyapproval/companyreqreveal.jsp"/> --%>
											<!-- 党组织信息-->
<%-- 											<c:import url="../companyapproval/companypartyorgreveal.jsp"/> --%>
											<!-- 其它-->
<%-- 											<c:import url="../companyapproval/companyotherreveal.jsp"/> --%>
											<!-- 附件-->
											<c:import url="../companyapproval/companyattachmentreveal.jsp"/>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-offset-6 col-md-9">
										<c:if test="${company.companyInfo.companyStatus!=20071003}">
											<button type="button" class="btn green" onclick="quickApproval(${company.companyInfo.companyId})">
											<i class="icon-badge"></i>&nbsp;&nbsp; 认证科技企业
											</button>
										</c:if>
										<button type="button" class="btn red" onclick="deleteCompany()">
										<i class="icon-trash"></i>&nbsp;&nbsp;删除
										</button>
										<button type="button" class="btn blue" onclick="goBack()">
										<i class="fa fa-reply"></i>&nbsp;&nbsp;返回
										</button>
									</div>
								</div>
								
							<br/><br/>
						</div>
					</div>
					<!-- END PAGE CONTENT-->

				<!-- END FORM-->
		<!-- END VALIDATION STATES-->
	</div>
</div>
<!-- 驳回弹出层 -->
<div class="modal fade" id="reject-modal">
<!-- 查看附件modal -->
<div class="modal fade container" id="showattachment-modal">
</body>
</html>
<script type="text/javascript">
	/**
	 *  认证科技企业 start
	 */
	function quickApproval(companyId)
	{
		bootbox.confirm("是否确认认证该企业?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapproval/approvalPass","companyId="+companyId, quickApprovalCallback);
			}
		});
	}
	
	function quickApprovalCallback(ajaxResult)
	{
		Metronic.loadContentData("registercompany/registerCompanyMngPre");
	}
	/**
	 *  认证科技企业 end
	 */
	
	/**
	 * 删除 start
	 */
	function deleteCompany()
	{
		bootbox.confirm("确认删除该企业?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByForms("registercompany/deleteCompany", "fm", deleteCallback);
			}
		});
	}
	function deleteCallback(ajaxResult)
	{
		Metronic.loadContentData("registercompany/registerCompanyMngPre");
	}
	
	function goBack(){
		Metronic.loadContentData("registercompany/registerCompanyMngPre");
	}
	/**
	 * 删除 end
	 */
	jQuery(document).ready(function() {
	});


</script>
