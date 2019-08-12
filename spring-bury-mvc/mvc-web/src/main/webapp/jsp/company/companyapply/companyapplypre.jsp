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
<title>备案申请表管理</title>
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
				<span class="icon-svg2 icon-pad"></span> 备案申请表管理
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
			<form action="#" id="fm" class="form-horizontal" name="fm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="companyId" id="companyId" value="${company.companyInfo.companyId}">
				<input type="hidden" name="isCertCompany" id="isCertCompany">
				<input type="hidden" name="isGiantCompany" id="isGiantCompany">
				<input type="hidden" id="certAttaName" name="certAttaName" value="${company.companyInfo.certAttaName}">
				<input type="hidden" id="giantAttaName" name="giantAttaName" value="${company.companyInfo.giantAttaName}">
				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light" style="">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-info"></i>科技企业申请表
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
<!-- 										<li><a href="#tab_1" data-toggle="tab">财务状况 </a></li> -->
<!-- 										<li><a href="#tab_2" data-toggle="tab">人员状况 </a></li> -->
<!-- 										<li><a href="#tab_3" data-toggle="tab">科技项目与经费 </a></li> -->
										<li><a href="#tab_4" data-toggle="tab">知识产权 </a></li>
<!-- 										<li><a href="#tab_5" data-toggle="tab">企业需求 </a></li> -->
<!-- 										<li><a href="#tab_6" data-toggle="tab">党组织信息 </a></li> -->
<!-- 										<li><a href="#tab_7" data-toggle="tab">其它 </a></li> -->
										<li><a href="#tab_8" data-toggle="tab">附件 </a></li>
									</ul>
									<div class="tab-content">
										<!-- 企业概述-->
										<c:import url="companyInfo.jsp" />
										<!-- 财务状况-->
<%-- 										<c:import url="companyfinance.jsp" /> --%>
										<!-- 人员状况-->
<%-- 										<c:import url="companypersonnel.jsp" /> --%>
										<!-- 科技项目与经费-->
<%-- 										<c:import url="projectfunding.jsp" /> --%>
										<!-- 知识产权-->
										<c:import url="intelproperty.jsp" />
										<!-- 企业需求-->
<%-- 										<c:import url="companyreq.jsp" /> --%>
										<!-- 党组织信息-->
<%-- 										<c:import url="companypartyorg.jsp" /> --%>
										<!-- 其它-->
<%-- 										<c:import url="companyother.jsp" /> --%>
										<!-- 附件-->
										<c:import url="companyattachment.jsp" />
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-offset-4 col-md-9">
									<c:if test="${company.companyInfo.companyStatus!=20071002}">
										<button type="button" class="btn green" onclick="saveApplyInfo()">
											<i class="fa fa-save"></i>&nbsp;&nbsp;保 存
										</button>
										<button type="button" class="btn red" onclick="commitSubmit()">
											<i class="fa fa-share "></i>&nbsp;&nbsp;提 交
										</button>
									</c:if>
									<c:if test="${company.companyInfo.examined != 20131002 && company.companyInfo.companyStatus==20071003}">
										<button type="button" class="btn bg-purple-plum"
											onclick="examined()">
											<i class="icon-loop"></i>&nbsp;&nbsp;年审申请
										</button>
									</c:if>
<!-- 									暂时屏蔽PDF下载 -->
<!-- 									<button type="button" class="btn blue" onclick="exportInfo()"> -->
<!-- 										<i class="fa fa-file-pdf-o"></i>&nbsp;&nbsp;下载申请书 -->
<!-- 									</button> -->
								</div>
							</div>
							<br /> <br />
						</div>
					</div>
					<!-- END PAGE CONTENT-->
			</form>
			<!-- END FORM-->
			<!-- END VALIDATION STATES-->
		</div>
	</div>
</body>
<!-- 企业核心人员添加modal -->
<div class="modal fade container" id="corestaff-modal">
<!-- 国家拨款明细添加modal -->
<div class="modal fade container" id="statefunding-modal">
	<!-- 市拨款明细添加modal -->
<div class="modal fade container" id="cityfunding-modal">
	<!-- 自主知识产权明细添加modal -->
<div class="modal fade container" id="rightdetail-modal">
	<!-- 专有技术明细添加modal -->
<div class="modal fade container" id="pritechdetail-modal">
	<!-- 主营产品明细添加modal -->
<div class="modal fade container" id="mainprodetail-modal">
	<!-- 技术转让明细添加modal -->
<div class="modal fade container" id="techtransdetail-modal">
	<!-- 其他政策明细添加modal -->
<div class="modal fade container" id="otherdetail-modal">
	<!-- 附件添加modal -->
<div class="modal fade" data-backdrop="static" id="attachment-modal">
	<!-- 查看附件modal -->
<div class="modal fade container" id="showattachment-modal">
<!-- 提交年审modal -->
<div class="modal fade " id="examined-modal"></html>
<!-- 科技项目添加modal -->
<div class="modal fade container" id="proFun-modal">
<script type="text/javascript">
//文件大小校验
$.validator.addMethod("certFileSize", function(value, element, params) {
	var obj_file = document.getElementById("certFile");
	if(obj_file == null || obj_file.value == ''){
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

$.validator.addMethod("giantFileSize", function(value, element, params) {
	var obj_file = document.getElementById("giantFile");
	if(obj_file == null || obj_file.value == ''){
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

	var saveOption = {
	   		formId : "fm",
	   		formRoles : {
	   						companyName: {
				                required: true
				            },
				            certFile: {
				            	certFileSize: true
				            },
				            giantFile: {
				            	giantFileSize: true
				            }
	   					},
	   		formMessages: { 
	   						companyName: {
				                required: "公司名称必须填写"
				            },
				            certFile: {
				            	certFileSize: "文件不能超过10M"
				            },
				            giantFile: {
				            	giantFileSize: "文件不能超过10M"
				            }
	   					},
	   		formCallBack: {
	   					url:  "companyapply/saveCompanyApplyInfo",	// 验证通过调用的后台连接
	   					type: "POST",  
	   					dataType: "json", 
	   					success: function(ajaxResult)
	   					{
	   						// altConfirm(alt_param);							// 处理成功的回调
	   						AjaxAnyWhere.handleResult(ajaxResult, saveSuccess);
	   						
	   					},
	   					error: function(data)
	   					{
	   						bootbox.alert("申请表保存失败");							// 处理失败的回调
	   						return;
	   					}
	   		}
	   		
	   }
	var commitOption = {
	   		formId : "fm",
	   		formRoles : {
	   						companyName: {
				                required: true
				            },
				            orgCode: {
				                required: true
				            }
	   					},
	   		formMessages: { 
	   						companyName: {
				                required: "公司名称必须填写"
				            },
				            orgCode: {
				            	required: "组织机构代码必须填写"
				            }
	   					},
	   		formCallBack: {
	   					url:  "companyapply/commitCompanyApplyInfo",	// 验证通过调用的后台连接
	   					type: "POST",  
	   					dataType: "json", 
	   					success: function(ajaxResult)
	   					{
	   						// altConfirm(alt_param);							// 处理成功的回调
	   						AjaxAnyWhere.handleResult(ajaxResult, commitSuccess);
	   						
	   					},
	   					error: function(data)
	   					{
	   						bootbox.alert("申请表保存失败");							// 处理失败的回调
	   						return;
	   					}
	   		}
	   		
	   }
   
   
	function saveApplyInfo(){
		
		//为复选框设置值
		if($('#isCertCompany_box').attr('checked') == 'checked'){
			$('#isCertCompany').val('10031001');
			$('#certAttaName').val($('#certAttaNameSpan').text().trim());
		}else {
			$('#isCertCompany').val('10031002');
		}
		
		if($('#isGiantCompany_box').attr('checked') == 'checked'){
			$('#isGiantCompany').val('10031001');
			$('#giantAttaName').val($('#giantAttaNameSpan').text().trim());
			
		}else{
			$('#isGiantCompany').val('10031002');
		}
		CommonFormVaildate.init(saveOption);
		$("#fm").submit();
	}
	function commitSubmit(){
		CommonFormVaildate.init(commitOption);
		bootbox.confirm("申请表提交后将无法修改,确认是否提交?", function(result){
			if(result)
			{
				$("#fm").submit();
			}
		});

	}
	
	//年审
	var $examinedModal = $('#examined-modal');
	function examined(){
		$examinedModal.load('jsp/company/companyapply/modals/examinedmodal.jsp','', function(){
			$examinedModal.modal();
		});
	}

	function exportInfo() {
		download("companyapply/exportInfo", "companyId", companyId);
	}

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

	// 处理成功回调方法
	var saveSuccess = function() {
		bootbox.alert("申请表保存成功，但并未提交，如想提交申请表请点击提交按钮");
		Metronic.loadContentData("companyapply/authenticateApplyPre");
		$('.make-switch').bootstrapSwitch();
	}
	var commitSuccess = function() {
		bootbox.alert("申请表提交成功");
		Metronic.loadContentData("companyapply/authenticateApplyPre");
		$('.make-switch').bootstrapSwitch();
	}

	jQuery(document).ready(function() {
		//PDFObject.embed("companyapply/showAttachment", "#pdfDiv");
		// 初始化日期框
		if (jQuery().datepicker) {
			$('.date-picker').datepicker({
				rtl : Metronic.isRTL(),
				orientation : "left",
				language: 'zh-CN',
				autoclose : true
			});
			//$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
		}
		// 异步查询
		// 查询科技项目附件明细
		DataGrid.__extQueryAll__(proFunDetailOpt);
		// 查询企业核心人员列表
// 		DataGrid.__extQueryAll__(coreStaffOpt);
		// 查询国家拨款数据
// 		DataGrid.__extQueryAll__(stateFundingOpt);
		// 查询市拨款数据
// 		DataGrid.__extQueryAll__(cityFundingOpt);
		// 查询自主知识产权明细
		DataGrid.__extQueryAll__(rightDetailOpt);
		// 查询专有技术明细
		DataGrid.__extQueryAll__(priTechDetailOpt);
		// 查询主营产品明细
		DataGrid.__extQueryAll__(mainProDetailOpt);
		// 查询技术转让明细
		DataGrid.__extQueryAll__(techTransDetailOpt);
		// 查询其他政策明细
// 		DataGrid.__extQueryAll__(otherDetailOpt);
		// 查询附件明细
		DataGrid.__extQueryAll__(companyAttachmentOpt);
	});
</script>
