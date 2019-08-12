<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.*"%>
<%@page import="com.hexnology.stes.model.TmCompanySourcePO"%>
<%@page import="com.hexnology.stes.core.common.Constants"%>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript">
	var companyId = "${company.companyInfo.companyId}";
</script>
<div class="tab-pane active" id="tab_0">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="alert alert-danger display-hide" id="formErr">
				<button class="close" data-close="alert"></button>
				表单填写错误,请重新填写.
			</div>
			<div class="form-body">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">科技人员数</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="科技人员数"
										id="developerCount" name="developerCount"
										value="${company.companyPersonnel.developerCount}" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">高新技术企业</label>
								<span class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="checkbox" class="make-switch"
									<c:if test="${company.companyInfo.isCertCompany == 10031001}">checked</c:if>
									<c:if test="${company.companyInfo.companyStatus==20071002}">disabled</c:if>
										onchange="changeIsCertComapny(this.checked)"
										data-size="normal" id="isCertCompany_box">
								</span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<span id='certAttaDownloadSpan'>
									<a 	class=" default btn blue " href="javascript:void(0)" onclick="downLoadCertCompany()" >
									<i class="fa fa-download"></i> 下载文件</a><c:if test="${company.companyInfo.companyStatus==20071002}">     ${company.companyInfo.certAttaName}</c:if>
								</span>
								<span id='certAttaUploadSpan'>
									<c:if test="${company.companyInfo.companyStatus!=20071002}">
									<div id='certAttaDiv' class="fileinput fileinput-new" data-provides="fileinput">
											<span class="btn default btn-file">
											<span class="fileinput-new">
											上传文件 </span>
											<span class="fileinput-exists">
											替换 </span>
											<input type="hidden"><input type="file" name="certFile" id="certFile">
											</span>
											<span class="fileinput-filename " id="certAttaNameSpan">
											${company.companyInfo.certAttaName}
											</span>
											&nbsp; <a href="javascript:;" class="close fileinput-exists" data-dismiss="fileinput">
											</a>
										</div>
									</c:if>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">小巨人企业</label>
								<div class="input-group col-md-8 ">
									<input type="checkbox" class="make-switch form-control"
										data-size="normal" id="isGiantCompany_box"
									<c:if test="${company.companyInfo.isGiantCompany == 10031001}">checked</c:if>
									<c:if test="${company.companyInfo.companyStatus==20071002}">disabled</c:if>
										onchange="changeIsGiantComapny(this.checked)">
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<span id='giantAttaDownloadSpan'>
									<a class=" default btn blue " onclick="downLoadGiantCompany()"
										href="javascript:void(0)"><i class="fa fa-download"></i> 下载文件</a><c:if test="${company.companyInfo.companyStatus==20071002}">     ${company.companyInfo.certAttaName}</c:if>
								</span>
								<span id='giantAttaUploadSpan'>
									<c:if test="${company.companyInfo.companyStatus!=20071002}">
									<div id='giantAttaDiv' class="fileinput fileinput-new" data-provides="fileinput">
											<span class="btn default btn-file">
											<span class="fileinput-new">
											上传文件 </span>
											<span class="fileinput-exists">
											替换 </span>
											<input type="hidden"> <input type="file" name="giantFile"  id="giantFile">
											</span>
											<span class="fileinput-filename " id="giantAttaNameSpan">
											${company.companyInfo.giantAttaName}
											</span>
											&nbsp; <a href="javascript:;" class="close fileinput-exists" data-dismiss="fileinput">
											</a>
										</div>
									</c:if>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">企业科技项目数量</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="企业法定代表人姓名"
										id="techProjCount" name="techProjCount"
										value="${company.projectFunding.techProjCount}" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption font-grey-gallery">
							<span class="caption-subject bold">企业科技项目附件</span>
						</div>
						<div class="actions">
							<c:if test="${company.companyInfo.companyStatus!=20071002}">
								<a href="javascript:;" onclick="showProFunDetail()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-user-follow"></i> 添加 </a>
							</c:if>
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body" >
						<div id="pageProFunDetail" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
						<div id="gridProFunDetail" class="table-responsive table-scrollable" ></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

	//展示上传和下载按钮
	function changeIsGiantComapny(isChecked) {
		//判断是否存在下载按钮
		var giantAttaPath = '${company.companyInfo.giantAttaPath}';
		if (isChecked) {
			$('#giantAttaUploadSpan').show();
			if(giantAttaPath != ''){
				//切换操作按钮
				$("#giantAttaDiv").addClass('fileinput-exists').removeClass('fileinput-new');
				$('#giantAttaDownloadSpan').show();
			}
		} else {
			$('#giantAttaUploadSpan').hide();
			$('#giantAttaDownloadSpan').hide();
		}
	}
	function changeIsCertComapny(isChecked) {
		//判断是否存在下载按钮
		var certAttaPath = '${company.companyInfo.certAttaPath}';
		if (isChecked) {
			$('#certAttaUploadSpan').show();
			if(certAttaPath != ''){
				//切换操作按钮
				$("#certAttaDiv").addClass('fileinput-exists').removeClass('fileinput-new');
				$('#certAttaDownloadSpan').show();
			}
		} else {
			$('#certAttaUploadSpan').hide();
			$('#certAttaDownloadSpan').hide();
		}
	}
	 //科技项目详细列表 start
	var proFunDetailOpt ={
		 url:"companyapply/queryProjcetFundingDetail",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridProFunDetail",
		 blankId:"pageProFunDetail",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "附件名称", width: "20%", dataIndex: "attachmentName"},
			{header: "操作", width: "5%", dataIndex: "intelPropertyRightsDetailId", renderer: proFunDetailLink}
		]
	};
	
	function proFunDetailLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag){
	  	 	return  "<a class=\"btn default btn-xs blue\" href=\"javascript:void(0)\" onclick=\"downloadAttachment4ProFun("+record.data.techProjDetailId+")\"><i class=\"fa fa-download\"></i> 下载</a>" + 
	           		"<a class=\"btn default btn-xs black \" href=\"javascript:void(0)\" onclick=\"deleteAttachment4ProFun("+record.data.techProjDetailId+")\"><i class=\"fa fa-trash-o\"></i> 删除</a>";
	   } else {
	   		return "";
	   }
	}
	function deleteRightDetail(rightDetailId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteRightDetail","rightDetailId="+rightDetailId, delRightDetailCallback);
			}
		});
	}
	function delRightDetailCallback(ajaxResult){
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(rightDetailOpt);
		});
	}
	/**
	 * 添加科技项目附件
	 */
	var $proFunModal = $('#proFun-modal');
	function showProFunDetail(){
		var projectFundingId = ${company.projectFunding.projectFundingId};
		if (browserCfg.ie) {
			bootbox.confirm("IE浏览器无法验证文件大小，请确保上传附件小于10M?", function(result){
				if(result){
					$proFunModal.load('jsp/company/companyapply/modals/addattachmentsmodal4profun.jsp?companyId='+companyId, '', function(){
						$proFunModal.modal();
						$("#projectFundingId").val(projectFundingId);
					});
				}
			});
		} else {
			$attachmentModal.load('jsp/company/companyapply/modals/addattachmentsmodal4profun.jsp?companyId='+companyId, '', function(){
				$attachmentModal.modal();
				$("#projectFundingId").val(projectFundingId);
			});
		}
	}
	
	$().ready(function() {
		//调整开关样式
		$.fn.bootstrapSwitch.defaults.onText = "是";
		$.fn.bootstrapSwitch.defaults.offText = "否";
		//文件操作按钮 
		changeIsCertComapny(document.getElementById('isCertCompany_box').checked);
		changeIsGiantComapny(document.getElementById('isGiantCompany_box').checked);
		//切换头像操作按钮
	});
	
	function deleteAttachment4ProFun(proFunDetailId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteAttachment4ProFun","proFunDetailId="+proFunDetailId, deleteAttachment4ProFunCallback);
			}
		});
	}
	function deleteAttachment4ProFunCallback(ajaxResult){
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(proFunDetailOpt);
		});
	}
	
	//下载科技项目附件功能
	function downloadAttachment4ProFun(proFunId){
		download("companyapply/downloadAttachment4ProFun", "proFunDetailId", proFunId);
	}
	
	//下载高科技附件功能
	function downLoadCertCompany(){
		download("companyapply/downloadAttachment4CertCompany", "companyId", companyId);
	}
	
	//下载小巨人附件功能
	function downLoadGiantCompany(){
		download("companyapply/downloadAttachment4GiantCompany", "companyId", companyId);
	}
	
	 
</script>