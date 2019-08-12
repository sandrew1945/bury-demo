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
									<input type="text" class="form-control" placeholder="0" id="employeeCount" name="employeeCount" value="${company.companyPersonnelRecord.employeeCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">从事研究开发人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="developerCount" name="developerCount" value="${company.companyPersonnelRecord.developerCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">高级职称（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="seniorCount" name="seniorCount" value="${company.companyPersonnelRecord.seniorCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">中级职称（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="intermediateCount" name="intermediateCount" value="${company.companyPersonnelRecord.intermediateCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">大专学历（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="collegeCount" name="collegeCount" value="${company.companyPersonnelRecord.collegeCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">本科学历（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="underGradCount" name="underGradCount" value="${company.companyPersonnelRecord.underGradCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">研究生学历（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="postGradCount" name="postGradCount" value="${company.companyPersonnelRecord.postGradCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">硕士以上学位（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="upPostGradCount" name="upPostGradCount" value="${company.companyPersonnelRecord.upPostGradCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">留学归国人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="returnees" name="returnees" value="${company.companyPersonnelRecord.returnees}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">外聘研发人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="exterDeveloperCount" name="exterDeveloperCount" value="${company.companyPersonnelRecord.exterDeveloperCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">科技活动人员数（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="techActCount" name="techActCount" value="${company.companyPersonnelRecord.techActCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">中国工程院院士（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="ceaCount" name="ceaCount" value="${company.companyPersonnelRecord.ceaCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">中国科学院院士（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="casCount" name="casCount" value="${company.companyPersonnelRecord.casCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">何梁何利基金获得者（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="hlhlFoundCount" name="hlhlFoundCount" value="${company.companyPersonnelRecord.hlhlFoundCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选中科院百人计划（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="casHundredCount" name="casHundredCount" value="${company.companyPersonnelRecord.casHundredCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">国家杰出青年科学基金获得者（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="noysFoundCount" name="noysFoundCount" value="${company.companyPersonnelRecord.noysFoundCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">973项目首席科学家（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="chiefScientistCount" name="chiefScientistCount" value="${company.companyPersonnelRecord.chiefScientistCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">长江学者（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="yrsCount" name="yrsCount" value="${company.companyPersonnelRecord.yrsCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">国家自然科学基金优秀创新群体带头人（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="cnnsLeaderCount" name="cnnsLeaderCount" value="${company.companyPersonnelRecord.cnnsLeaderCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">新世纪优秀人才（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="ncetCount" name="ncetCount" value="${company.companyPersonnelRecord.ncetCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">教育部创新团队带头人（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="eduInnteamLeaderCount" name="eduInnteamLeaderCount" value="${company.companyPersonnelRecord.eduInnteamLeaderCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选百千万人才工程（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="nhttCount" name="nhttCount" value="${company.companyPersonnelRecord.nhttCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选万人计划（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="ttpCount" name="ttpCount" value="${company.companyPersonnelRecord.ttpCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选科技部创新人才推进计划（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="titpCount" name="titpCount" value="${company.companyPersonnelRecord.titpCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">青年拔尖人才（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="yttCount" name="yttCount" value="${company.companyPersonnelRecord.yttCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">享受政府特殊津贴专家（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="specAllowanceCount" name="specAllowanceCount" value="${company.companyPersonnelRecord.specAllowanceCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">国家有突出贡献的中青年专家（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="nocYoungProfCount" name="nocYoungProfCount" value="${company.companyPersonnelRecord.nocYoungProfCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">入选国家"千人计划"（人）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="tpCount" name="tpCount" value="${company.companyPersonnelRecord.tpCount}" />
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
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="gridCoreStaff" class="table-responsive table-scrollable">
								<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
								<thead>
								<tr>
									<th style="text-align:center;" width="8%">姓名</th>
									<th style="text-align:center;" width="8%">性别</th>
									<th style="text-align:center;" width="8%">出生日期</th>
									<th style="text-align:center;" width="8%">学历</th>
									<th style="text-align:center;" width="8%">学位</th>
									<th style="text-align:center;" width="8%">身份证号</th>
									<th style="text-align:center;" width="8%">职务</th>
									<th style="text-align:center;" width="8%">职称</th>
									<th style="text-align:center;" width="8%">电话</th>
									<th style="text-align:center;" width="8%">部门</th>
									<th style="text-align:center;" width="8%">邮箱</th>
									<th style="text-align:center;" width="8%">现从事专业</th>
								</tr>
								</thead>
								</table>
							</div>
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
	 url:"companyrecord/queryCoreStaffRecord",
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
		{header: "现从事专业", width: "8%", dataIndex: "professional"}
	]
};
	
</script>