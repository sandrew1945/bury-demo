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
	var companyId = "${company.companyInfoRecord.companyId}";
	var companyRecordId = "${company.companyInfoRecord.companyRecordId}";
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
										id="corporate" name="corporate"
										value="${company.companyPersonnelRecord.developerCount}" />
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
									<c:if test="${company.companyInfoRecord.isCertCompany == 10031001}">checked</c:if>
										data-size="normal" id="isCertCompany_box" disabled>
								</span>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<span id='certAttaDownloadSpan'>
									<a 	class=" default btn blue " href="javascript:void(0)" onclick="downLoadCertCompany()" >
									<i class="fa fa-download"></i> 下载文件</a>
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
									<c:if test="${company.companyInfoRecord.isGiantCompany == 10031001}">checked</c:if>
										 disabled>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<span id='giantAttaDownloadSpan'>
									<a class=" default btn blue " onclick="downLoadGiantCompany()"
										href="javascript:void(0)"><i class="fa fa-download"></i> 下载文件</a>
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
										id="corporate" name="corporate"
										value="${company.projectFundingRecord.techProjCount}" />
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
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body" >
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="pageProFunDetail" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
							<div id="gridProFunDetail" class="table-responsive table-scrollable" ></div>
						</div>
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
		var giantAttaPath = '${company.companyInfoRecord.giantAttaPath}';
		if (isChecked) {
			if(giantAttaPath != ''){
				$('#giantAttaDownloadSpan').show();
			}
		} else {
			$('#giantAttaDownloadSpan').hide();
		}
	}
	function changeIsCertComapny(isChecked) {
		//判断是否存在下载按钮
		var certAttaPath = '${company.companyInfoRecord.certAttaPath}';
		if (isChecked) {
			if(certAttaPath != ''){
				$('#certAttaDownloadSpan').show();
			}
		} else {
			$('#certAttaDownloadSpan').hide();
		}
	}
	 //科技项目详细列表 start
	var proFunDetailOpt ={
		 url:"companyrecord/queryProjcetFundingDetailRecord",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridProFunDetail",
		 blankId:"pageProFunDetail",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "附件名称", width: "20%", dataIndex: "attachmentName"},
			{header: "操作", width: "5%", dataIndex: "intelPropertyRightsDetailRecordId", renderer: proFunDetailLink}
		]
	};
	
	function proFunDetailLink(value,metaDate,record){
  	 	return  "<a class=\"btn default btn-xs blue\" href=\"javascript:void(0)\" onclick=\"downloadAttachment4ProFun("+record.data.techProjDetailRecordId+")\"><i class=\"fa fa-download\"></i> 下载</a>";
	}
	
	$().ready(function() {
		$('.make-switch').bootstrapSwitch();
		//调整开关样式
		$.fn.bootstrapSwitch.defaults.onText = "是";
		$.fn.bootstrapSwitch.defaults.offText = "否";
		//文件操作按钮 
		changeIsCertComapny(document.getElementById('isCertCompany_box').checked);
		changeIsGiantComapny(document.getElementById('isGiantCompany_box').checked);
	});
	
	//下载科技项目附件功能
	function downloadAttachment4ProFun(proFunId){
		download("companyrecord/downloadAttachment4ProFun", "proFunDetailReocordId", proFunId);
	}
	
	//下载高科技附件功能
	function downLoadCertCompany(){
		download("companyrecord/downloadAttachment4CertCompany", "companyRecordId", companyRecordId);
	}
	
	//下载小巨人附件功能
	function downLoadGiantCompany(){
		download("companyrecord/downloadAttachment4GiantCompany", "companyRecordId", companyRecordId);
	}
	
	 
</script>