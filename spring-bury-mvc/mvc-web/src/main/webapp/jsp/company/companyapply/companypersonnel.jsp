<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane" id="tab_2">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">上年末从业人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="employeeCount" name="employeeCount" value="${company.companyPersonnel.employeeCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">从事研究开发人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="developerCount" name="developerCount" value="${company.companyPersonnel.developerCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">高级职称（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="seniorCount" name="seniorCount" value="${company.companyPersonnel.seniorCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">中级职称（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="intermediateCount" name="intermediateCount" value="${company.companyPersonnel.intermediateCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">大专学历（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="collegeCount" name="collegeCount" value="${company.companyPersonnel.collegeCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">本科学历（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="underGradCount" name="underGradCount" value="${company.companyPersonnel.underGradCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">研究生学历（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="postGradCount" name="postGradCount" value="${company.companyPersonnel.postGradCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">硕士以上学位（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="upPostGradCount" name="upPostGradCount" value="${company.companyPersonnel.upPostGradCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">留学归国人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="returnees" name="returnees" value="${company.companyPersonnel.returnees}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">外聘研发人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="exterDeveloperCount" name="exterDeveloperCount" value="${company.companyPersonnel.exterDeveloperCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">科技活动人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="techActCount" name="techActCount" value="${company.companyPersonnel.techActCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">中国工程院院士（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="ceaCount" name="ceaCount" value="${company.companyPersonnel.ceaCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">中国科学院院士（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="casCount" name="casCount" value="${company.companyPersonnel.casCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">何梁何利基金获得者（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="hlhlFoundCount" name="hlhlFoundCount" value="${company.companyPersonnel.hlhlFoundCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选中科院百人计划（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="casHundredCount" name="casHundredCount" value="${company.companyPersonnel.casHundredCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">国家杰出青年科学基金获得者（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="noysFoundCount" name="noysFoundCount" value="${company.companyPersonnel.noysFoundCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">973项目首席科学家（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="chiefScientistCount" name="chiefScientistCount" value="${company.companyPersonnel.chiefScientistCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">长江学者（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="yrsCount" name="yrsCount" value="${company.companyPersonnel.yrsCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">国家自然科学基金优秀创新群体带头人（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="cnnsLeaderCount" name="cnnsLeaderCount" value="${company.companyPersonnel.cnnsLeaderCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">新世纪优秀人才（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="ncetCount" name="ncetCount" value="${company.companyPersonnel.ncetCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">教育部创新团队带头人（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="eduInnteamLeaderCount" name="eduInnteamLeaderCount" value="${company.companyPersonnel.eduInnteamLeaderCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选百千万人才工程（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="nhttCount" name="nhttCount" value="${company.companyPersonnel.nhttCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选万人计划（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="ttpCount" name="ttpCount" value="${company.companyPersonnel.ttpCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选科技部创新人才推进计划（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="titpCount" name="titpCount" value="${company.companyPersonnel.titpCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">青年拔尖人才（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="yttCount" name="yttCount" value="${company.companyPersonnel.yttCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">享受政府特殊津贴专家（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="specAllowanceCount" name="specAllowanceCount" value="${company.companyPersonnel.specAllowanceCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">国家有突出贡献的中青年专家（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="nocYoungProfCount" name="nocYoungProfCount" value="${company.companyPersonnel.nocYoungProfCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选国家"千人计划"（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="tpCount" name="tpCount" value="${company.companyPersonnel.tpCount}" />
								</div>
							</div>
						</div>
					</div>
					
				</div>
				
				<!-- BEGIN DATAGRID PORTLET-->
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption font-grey-gallery">
							
							<span class="caption-subject bold">单位核心人员信息</span>
						</div>
						<div class="actions">
							<c:if test="${company.companyInfo.companyStatus!=20071002}">
							<a href="javascript:;" onclick="showAddCoreStaff()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
							</c:if>
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="pageCoreStaff" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
							<div id="gridCoreStaff" class="table-responsive table-scrollable"></div>
						</div>
					</div>
				</div>
				<!-- END DATAGRID PORTLET-->

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	
	var coreStaffOpt =
	{
		 url:"companyapply/queryCoreStaff",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridCoreStaff",
		 blankId:"pageCoreStaff",
		 columns : [
			{header: "", width: "1%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "姓名", width: "8%", dataIndex: "name"},
			{header: "性别", width: "8%", dataIndex: "sex", renderer: getfixCodeDesc},
			{header: "出生日期", width: "8%", dataIndex: "birthday", renderer: CommonUtil.getDateStr},
			{header: "学历", width: "8%", dataIndex: "educational", renderer: getfixCodeDesc},
			{header: "学位", width: "8%", dataIndex: "degree", renderer: getfixCodeDesc},
			{header: "身份证号", width: "8%", dataIndex: "idCard"},
			{header: "职务", width: "8%", dataIndex: "post"},
			{header: "职称", width: "8%", dataIndex: "title"},
			{header: "电话", width: "8%", dataIndex: "tel"},
			{header: "部门", width: "8%", dataIndex: "dept"},
			{header: "邮箱", width: "8%", dataIndex: "email"},
			{header: "现从事专业", width: "8%", dataIndex: "professional"},
			{header: "操作", width: "8%", dataIndex: "coreStaffId", renderer: coreStaffLink}
		]
	};
	
	function coreStaffLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
		   return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteCoreStaff("+value+")\"><i class=\"fa fa-trash-o\"></i>Delete</a>";
	   }
	   else
	   {
		   return "";
	   }
	}
	function deleteCoreStaff(coreStaffId){
	bootbox.confirm("是否删该数据?", function(result){
		if(result)
		{
			AjaxAnyWhere.sendRequestByData("companyapply/deleteCoreStaff","coreStaffId="+coreStaffId, delCoreStaffCallback);
		}
	});
	}
	function delCoreStaffCallback(ajaxResult)
	{
	AjaxAnyWhere.handleResult(ajaxResult, function(){
		DataGrid.__extQueryAll__(coreStaffOpt);
	});
	}





	var $corestaffModal = $('#corestaff-modal');
	/**
	 * 打开添加核心人员弹出层
	 */
	function showAddCoreStaff()
	{
		$corestaffModal.load('jsp/company/companyapply/modals/addcorestaffmodal.jsp', '', function(){
			$corestaffModal.modal();
		});
	}
</script>