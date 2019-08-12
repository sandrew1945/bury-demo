<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>审批记录查询</title>
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
			<h3 class="page-title">
				<span class="icon-svg2 icon-pad"></span> 审批记录查询 
			</h3>
			<!-- END PAGE TITLE & BREADCRUMB-->
		</div>
	</div>
	<!-- BEGIN PAGE CONTENT-->
	<div class="row">
		<div class="col-md-12">
			<!-- BEGIN VALIDATION STATES-->
			<h3 class="form-section"></h3>
			<!-- BEGIN FORM-->
			<form action="#" id="fm" class="form-horizontal form-horizontal"
				name="fm" method="post">
				<input type="hidden" id="companyRecordId" name="companyRecordId"
					value="${company.companyInfoRecord.companyRecordId} ">
				<input type="hidden" id="companyId" name="companyId"
					value="${company.companyInfoRecord.companyId} ">
			</form>
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					<div class="portlet light" style="">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-user"></i>审批记录
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse"></a>
							</div>
						</div>
						<div class="portlet-body form">
							<div
								class="tabbable tabbable-custom tabbable-noborder tabbable-reversed">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab_0" data-toggle="tab">企业概况
									</a></li>
<!-- 									<li><a href="#tab_1" data-toggle="tab">财务状况 </a></li> -->
<!-- 									<li><a href="#tab_2" data-toggle="tab">人员状况 </a></li> -->
<!-- 									<li><a href="#tab_3" data-toggle="tab">科技项目与经费 </a></li> -->
									<li><a href="#tab_4" data-toggle="tab">知识产权 </a></li>
<!-- 									<li><a href="#tab_5" data-toggle="tab">企业需求 </a></li> -->
<!-- 									<li><a href="#tab_6" data-toggle="tab">党组织信息 </a></li> -->
<!-- 									<li><a href="#tab_7" data-toggle="tab">其它 </a></li> -->
									<li><a href="#tab_8" data-toggle="tab">附件 </a></li>
								</ul>
								<div class="tab-content">
									<!-- 企业概述-->
									<c:import url="simplecompanyinfo.jsp" />
									<!--财务状况 -->
<%-- 									<c:import url="companyfinancerecordreveal.jsp" /> --%>
									<!--人员状况 -->
<%-- 									<c:import url="companypersonnelrecordreveal.jsp" /> --%>
									<!--科技项目与经费 -->
<%-- 									<c:import url="projectfundingrecordreveal.jsp" /> --%>
									<!--知识产权 -->
									<c:import url="intelpropertyrecoredreveal.jsp" />
									<!--企业需求 -->
<%-- 									<c:import url="companyreqrecordreveal.jsp" /> --%>
									<!--党组织信息 -->
<%-- 									<c:import url="companypartyorgrecordreveal.jsp" /> --%>
									<!--其它 -->
<%-- 									<c:import url="companyotherrecordreveal.jsp" /> --%>
									<!--附件 -->
									<c:import url="companyattachmentrecordreveal.jsp" />
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-md-offset-6 col-md-9">
								<button type="button" class="btn blue" onclick="goBack()">
									<i class="fa fa-reply"></i>&nbsp;&nbsp;返回
								</button>
							</div>
						</div>

						<br />
						<br />
					</div>
				</div>
				<!-- END PAGE CONTENT-->

				<!-- END FORM-->
				<!-- END VALIDATION STATES-->
			</div>
		</div>
			<!-- 查看附件modal -->
<div class="modal fade container" id="showattachment-modal">

</body>
</html>
<script type="text/javascript">
	function goBack(){
		Metronic.loadContentData("companyrecord/companyRecordPre");
	}
	
	// 异步查询
	// 查询科技项目附件明细
	DataGrid.__extQueryAll__(proFunDetailOpt);
	// 查询企业核心人员列表
// 	DataGrid.__extQueryAll__(coreStaffOpt);
	// 查询国家拨款数据
// 	DataGrid.__extQueryAll__(stateFundingOpt);
	// 查询市拨款数据
// 	DataGrid.__extQueryAll__(cityFundingOpt);
	// 查询自主知识产权明细
	DataGrid.__extQueryAll__(rightDetailOpt);
	// 查询专有技术明细
	DataGrid.__extQueryAll__(priTechDetailOpt);
	// 查询主营产品明细
	DataGrid.__extQueryAll__(mainProDetailOpt);
	// 查询技术转让明细
	DataGrid.__extQueryAll__(techTransDetailOpt);
	// 查询其他政策明细
// 	DataGrid.__extQueryAll__(otherDetailOpt);
	// 查询附件明细
	DataGrid.__extQueryAll__(companyAttachmentOpt);
	
	function download(url, name, value) {
		var form = $("<form>");//定义一个form表单
		form.attr("style", "display:none");
		form.attr("target", "");
		form.attr("method", "post");
		form.attr("action", url);
		var input = $("<input>");
		input.attr("type", "hidden");
		input.attr("name", name);
		input.attr("value", value);
		$("body").append(form);
		form.append(input).submit().remove();
	}
</script>
