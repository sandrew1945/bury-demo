<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane" id="tab_4">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">申请专利(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="applyPatent" name="applyPatent" value="${company.intelPropertyRecord.applyPatent}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">授权发明专利(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="authInventionPatent" name="authInventionPatent" value="${company.intelPropertyRecord.authInventionPatent}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">授权专利(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="authPatent" name="authPatent" value="${company.intelPropertyRecord.authPatent}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">拥有有效发明专利(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="validInventionPatent" name="validInventionPatent" value="${company.intelPropertyRecord.validInventionPatent}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">拥有有效专利(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="validPatent" name="validPatent" value="${company.intelPropertyRecord.validPatent}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">拥有企业标准(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="enterpriseStandard" name="enterpriseStandard" value="${company.intelPropertyRecord.enterpriseStandard}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">拥有软件著作权(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="softwareCopyright" name="softwareCopyright" value="${company.intelPropertyRecord.softwareCopyright}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">其它专有技术服务(项)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="otherPropTech" name="otherPropTech" value="${company.intelPropertyRecord.otherPropTech}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">注册商标(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="trademark" name="trademark" value="${company.intelPropertyRecord.trademark}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">申请发明专利(件)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="applyInventionPatent" name="applyInventionPatent" value="${company.intelPropertyRecord.applyInventionPatent}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">集成电路布图设计：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="integCircuitLayout" name="integCircuitLayout" value="${company.intelPropertyRecord.integCircuitLayout}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">植物新品种：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="newPlant" name="newPlant" value="${company.intelPropertyRecord.newPlant}" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4 class="caption-subject bold" style="text-align:center">具体专利、标准或其他专有技术(服务)列表</h4>
					<div class="portlet light bordered">
					
						<!-- BEGIN DATAGRID PORTLET 自主知识产权-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-grey-gallery">
									<span class="caption-subject bold">自主知识产权</span>
								</div>
								<div class="actions">
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
									<div id="gridRightDetail" class="table-responsive table-scrollable">
										<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
											<thead>
												<tr>
													<th style="text-align:center;" width="20%">自主知识产权名称</th>
													<th style="text-align:center;" width="10%">类别</th>
													<th style="text-align:center;" width="10%">授权时间</th>
													<th style="text-align:center;" width="20%">授权号</th>
													<th style="text-align:center;" width="10%">获得方式</th>
													<th style="text-align:center;" width="30%">备注</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${company.intelPropertyRightsDetailRecords}" var="intelPropertyRecordRights">
												<tr class="odd gradeX" onclick="javascript:DataGrid.selectTheRrRadio(this)" ondblclick="javascript:DataGrid.checkYouSee(this)" style="">
													<td style="vertical-align: middle;">${intelPropertyRecordRights.intelPropertyName }</td>
													<td style="vertical-align: middle;">${intelPropertyRecordRights.intelPropertyType }</td>
													<td style="vertical-align: middle;"><fmt:formatDate value="${intelPropertyRecordRights.authDate}" pattern="yyyy-MM-dd"/></td>
													<td style="vertical-align: middle;">${intelPropertyRecordRights.authCode}</td>
													<td style="vertical-align: middle;">${intelPropertyRecordRights.authWay}</td>
													<td style="vertical-align: middle;">${intelPropertyRecordRights.remark}</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- END DATAGRID PORTLET-->
							
						<!-- BEGIN DATAGRID PORTLET  专有技术-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-grey-gallery">
									<span class="caption-subject bold">专有技术</span>
								</div>
								<div class="actions">
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height: 100%; overflow: hidden; width: auto;" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd" data-initialized="1">
									<div id="gridPriTechDetail" class="table-responsive table-scrollable">
										<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
											<thead>
											<tr>
											<th style="text-align:center;" width="20%">专有技术名称</th>
											<th style="text-align:center;" width="10%">类别</th>
											<th style="text-align:center;" width="10%">授权时间</th>
											<th style="text-align:center;" width="10%">获得方式</th>
											<th style="text-align:center;" width="30%">备注</th>
											</tr>
											</thead>
											<tbody>
												<c:forEach items="${company.priTechDetailRecords}" var="priTech">
												<tr class="odd gradeX" onclick="javascript:DataGrid.selectTheRrRadio(this)" ondblclick="javascript:DataGrid.checkYouSee(this)" style="">
													<td style="vertical-align: middle;">${priTech.priTechName }</td>
													<td style="vertical-align: middle;">${priTech.priTechType }</td>
													<td style="vertical-align: middle;"><fmt:formatDate value="${priTech.authDate}" pattern="yyyy-MM-dd"/></td>
													<td style="vertical-align: middle;">${priTech.authWay}</td>
													<td style="vertical-align: middle;">${priTech.remark}</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- END DATAGRID PORTLET-->
							
						<!-- BEGIN DATAGRID PORTLET  企业主营产品-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-grey-gallery">
									<span class="caption-subject bold">企业主营产品</span>
								</div>
								<div class="actions">
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height: 100%; overflow: hidden; width: auto;" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd" data-initialized="1">
									<div id="gridMainProDetail" class="table-responsive table-scrollable">
										<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
											<thead>
											<tr>
											<th style="text-align:center;" width="20%">主营产品名称</th>
											<th style="text-align:center;" width="20%">所属技术领域</th>
											<th style="text-align:center;" width="45%">备注</th>
											</tr>
											</thead>
											<tbody>
												<c:forEach items="${company.mainProductDetails}" var="mainProduct">
												<tr class="odd gradeX" onclick="javascript:DataGrid.selectTheRrRadio(this)" ondblclick="javascript:DataGrid.checkYouSee(this)" style="">
													<td style="vertical-align: middle;">${mainProduct.mainProductsName }</td>
													<td style="vertical-align: middle;">${mainProduct.proDomainName }</td>
													<td style="vertical-align: middle;">${mainProduct.remark}</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- END DATAGRID PORTLET-->
							
						<!-- BEGIN DATAGRID PORTLET  技术转让及合作项目-->
						<div class="portlet light bordered">
							<div class="portlet-title">
								<div class="caption font-grey-gallery">
									<span class="caption-subject bold">技术转让及合作项目</span>
								</div>
								<div class="actions">
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height: 100%; overflow: hidden; width: auto;" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd" data-initialized="1">
									<div id="gridTechTransDetail" class="table-responsive table-scrollable">
										<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
										<thead>
											<tr>
												<th style="text-align:center;" width="20%">技术转让及合作项目名称</th>
												<th style="text-align:center;" width="20%">转让及合作方式</th>
												<th style="text-align:center;" width="45%">备注</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${company.techTransDetailRecords}" var="techTrans">
											<tr class="odd gradeX" onclick="javascript:DataGrid.selectTheRrRadio(this)" ondblclick="javascript:DataGrid.checkYouSee(this)" style="">
												<td style="vertical-align: middle;">${techTrans.techTransName }</td>
												<td style="vertical-align: middle;">${techTrans.techTransType }</td>
												<td style="vertical-align: middle;">${techTrans.remark}</td>
											</tr>
											</c:forEach>
										</tbody>
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
</div>
<script type="text/javascript">
/**
 *    自主知识产权列表 start
 */
var rightDetailOpt =
{
	 url:"companyrecord/queryRightDetailRecord",
	 choiceType:null,
	 formId:"fm",
	 gridId:"gridRightDetail",
	 blankId:"pageRightDetail",
	 columns : [
		{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
		{header: "自主知识产权名称", width: "20%", dataIndex: "intelPropertyName"},
		{header: "类别", width: "10%", dataIndex: "intelPropertyType", renderer: getfixCodeDesc},
		{header: "授权时间", width: "10%", dataIndex: "authDate", renderer: CommonUtil.getDateStr},
		{header: "授权号", width: "20%", dataIndex: "authCode"},
		{header: "获得方式", width: "10%", dataIndex: "authWay"},
		{header: "备注", width: "30%", dataIndex: "remark"},
		{header: "操作", width: "11%", dataIndex: "intelPropertyRightsDetailId", renderer: rightDetailLink}
	]
};

/**
 *    专有技术列表 start
 */
var priTechDetailOpt =
{
	 url:"companyrecord/queryPriTechDetailRecord",
	 choiceType:null,
	 formId:"fm",
	 gridId:"gridPriTechDetail",
	 blankId:"pagePriTechDetail",
	 columns : [
		{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
		{header: "专有技术名称", width: "20%", dataIndex: "priTechName"},
		{header: "类别", width: "10%", dataIndex: "priTechType",renderer: getfixCodeDesc},
		{header: "授权时间", width: "10%", dataIndex: "authDate", renderer: CommonUtil.getDateStr},
		{header: "获得方式", width: "10%", dataIndex: "authWay"},
		{header: "备注", width: "30%", dataIndex: "remark"}
	]
};

/**
 *    主营产品列表 start
 */
var mainProDetailOpt =
{
	 url:"companyrecord/queryMainProDetailRecord",
	 choiceType:null,
	 formId:"fm",
	 gridId:"gridMainProDetail",
	 blankId:"pageMainProDetail",
	 columns : [
		{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
		{header: "主营产品名称", width: "20%", dataIndex: "mainProductsName"},
		{header: "所属技术领域", width: "20%", dataIndex: "proDomainName",},
		{header: "备注", width: "45%", dataIndex: "remark"}
	]
};

/**
 *    技术转让列表 start
 */
var techTransDetailOpt =
{
	 url:"companyrecord/queryTechTransDetailRecord",
	 choiceType:null,
	 formId:"fm",
	 gridId:"gridTechTransDetail",
	 blankId:"pageTechTransDetail",
	 columns : [
		{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
		{header: "技术转让及合作项目名称", width: "20%", dataIndex: "techTransName"},
		{header: "转让及合作方式", width: "20%", dataIndex: "techTransType",},
		{header: "备注", width: "45%", dataIndex: "remark"}
	]
};

function rightDetailLink(value,metaDate,record){
	var attachmentPath = record.data.attachmentPath;
   if(attachmentPath != null && '' != attachmentPath){
 	 	return 	"<a class=\"btn default btn-xs blue\" href=\"javascript:void(0)\" onclick=\"downloadAttachment4RightDetail("+record.data.intelPropertyRightsDetailRecordId+")\"><i class=\"fa fa-download\"></i> 下载</a>";
   }
}

//下载自主知识产权附件功能
function downloadAttachment4RightDetail(intelPropertyRightsDetailId){
	download("companyrecord/downloadAttachment4RightDetail", "intelPropertyRightsDetailId", intelPropertyRightsDetailId);
}
</script>