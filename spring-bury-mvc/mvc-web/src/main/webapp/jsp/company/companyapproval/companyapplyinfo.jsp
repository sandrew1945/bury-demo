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
	<title>科技企业审批管理</title>
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
      <h3 class="page-title"> <span class="icon-svg2 icon-pad"></span> 科技企业审批管理 </h3>
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
											<c:import url="simplecompanyinfo.jsp"/>
											<!-- 财务状况-->
<%-- 											<c:import url="companyfinancereveal.jsp"/> --%>
											<!-- 人员状况-->
<%-- 											<c:import url="companypersonnelreveal.jsp"/> --%>
											<!-- 科技项目与经费-->
<%-- 											<c:import url="projectfundingreveal.jsp"/> --%>
											<!-- 知识产权-->
											<c:import url="intelpropertyreveal.jsp"/>
											<!-- 企业需求-->
<%-- 											<c:import url="companyreqreveal.jsp"/> --%>
											<!-- 党组织信息-->
<%-- 											<c:import url="companypartyorgreveal.jsp"/> --%>
											<!-- 其它-->
<%-- 											<c:import url="companyotherreveal.jsp"/> --%>
											<!-- 附件-->
											<c:import url="companyattachmentreveal.jsp"/>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-offset-6 col-md-9">
										<button type="button" class="btn green" onclick="approvalPass()">
										<i class="icon-badge"></i>&nbsp;&nbsp; 审批通过
										</button>
										<button type="button" class="btn yellow" onclick="showReject()">
										<i class="icon-action-undo"></i>&nbsp;&nbsp;驳回
										</button>
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
	 *   审批通过 START
	 */
	function approvalPass()
	{
		bootbox.confirm("确认科技企业审批通过?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByForms("companyapproval/approvalPass", "fm", passCallback);
			}
		});
	}
	function passCallback(ajaxResult)
	{
		Metronic.loadContentData("companyapproval/companyApprovalPre");
	}
	/*
	 *   审批通过 END
	 */
	
	/**
	 * 添加驳回弹出层 start
	 */
	var $rejectModal = $('#reject-modal');
	function showReject()
	{
		bootbox.confirm("确认驳回申请?", function(result){
			if(result)
			{
				$rejectModal.load('jsp/company/companyapproval/modals/rejectmodal.jsp', '', function(){
					$rejectModal.modal();
					$("#modalcompanyId").val("${company.companyInfo.companyId}");
				});
				
			}
		});
		

	}
	/**
	 * 添加驳回弹出层 end
	 */
	 
	/**
	 * 删除 start
	 */
		function deleteCompany()
		{
			bootbox.confirm("确认删除该企业?", function(result){
				if(result)
				{
					AjaxAnyWhere.sendRequestByForms("companyapproval/deleteCompany", "fm", deleteCallback);
				}
			});
		}
		function deleteCallback(ajaxResult)
		{
			Metronic.loadContentData("companyapproval/companyApprovalPre");
		}
	/**
	 * 删除 end
	 */
	 function goBack(){
			Metronic.loadContentData("companyapproval/companyApprovalPre");
		}
	jQuery(document).ready(function() {
	});
	// 查询科技项目附件明细
	DataGrid.__extQueryAll__(proFunDetailOpt);

</script>
