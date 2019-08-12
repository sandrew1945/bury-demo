<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane" id="tab_3">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技活动经费筹集额（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="actFunding" name="actFunding" value="${company.projectFundingRecord.actFunding}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技活动经费内部支出（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="actFundingInterExp" name="actFundingInterExp" value="${company.projectFundingRecord.actFundingInterExp}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">本年科技项目数（项）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="techProjCount" name="techProjCount" value="${company.projectFundingRecord.techProjCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技活动经费外部支出（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="actFundingExterExp" name="actFundingExterExp" value="${company.projectFundingRecord.actFundingExterExp}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技项目经费筹集额（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="projectFunds" name="projectFunds" value="${company.projectFundingRecord.projectFunds}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">金融机构贷款额（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="finInsLoans" name="finInsLoans" value="${company.projectFundingRecord.finInsLoans}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">企业资金（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="enterpriseFunds" name="enterpriseFunds" value="${company.projectFundingRecord.enterpriseFunds}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">国外资金（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="foreignFunds" name="foreignFunds" value="${company.projectFundingRecord.foreignFunds}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">区、开发区财政拨款额（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="finDisAppro" name="finDisAppro" value="${company.projectFundingRecord.finDisAppro}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">其他资金来源（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="otherFunds" name="otherFunds" value="${company.projectFundingRecord.otherFunds}" />
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- BEGIN STATE FUNDING DATAGRID PORTLET-->
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption font-grey-gallery">
							
							<span class="caption-subject bold">国家拨款明细</span>
						</div>
						<div class="actions">
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="gridStateFunding" class="table-responsive table-scrollable">
								<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
									<thead>
									<tr>
									<th style="text-align:center;" width="40%">来源部门</th>
									<th style="text-align:center;" width="40%">金额(万元)</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${company.stateFundingDetailRecords}" var="statefunding">
									<tr class="odd gradeX" style="">
										<td style="vertical-align: middle;">${statefunding.source}</td>
										<td style="vertical-align: middle;">${statefunding.count}</td>
									</tr>
									</c:forEach>
								</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- END STATE FUNDING DATAGRID PORTLET-->
				<!-- BEGIN CITY FUNDING DATAGRID PORTLET-->
				<div class="portlet light bordered">
					<div class="portlet-title">
						<div class="caption font-grey-gallery">
							<span class="caption-subject bold">市拨款明细</span>
						</div>
						<div class="actions">
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="gridCityFunding" class="table-responsive table-scrollable">
								<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
									<thead>
									<tr>
									<th style="text-align:center;" width="40%">来源部门</th>
									<th style="text-align:center;" width="40%">金额(万元)</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach items="${company.cityFundingDetailRecords}" var="cityfunding">
									<tr class="odd gradeX" style="">
										<td style="vertical-align: middle;">${cityfunding.source}</td>
										<td style="vertical-align: middle;">${cityfunding.count}</td>
									</tr>
									</c:forEach>
								</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<!-- END CITY FUNDING DATAGRID PORTLET-->
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
/**
 *    国家拨款列表 start
 */
var stateFundingOpt =
{
	 url:"companyrecord/queryStateFundingDetailRecord",
	 choiceType:null,
	 formId:"fm",
	 gridId:"gridStateFunding",
	 blankId:"pageStateFunding",
	 columns : [
		{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
		{header: "来源部门", width: "40%", dataIndex: "source"},
		{header: "金额(万元)", width: "40%", dataIndex: "count"}
	]
};
 
/**
 *    市拨款列表 start
 */
var cityFundingOpt =
{
	 url:"companyrecord/queryCityFundingDetailRecord",
	 choiceType:null,
	 formId: "fm",
	 gridId: "gridCityFunding",
	 blankId: "pageCityFunding",
	 columns : [
		{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
		{header: "来源部门", width: "40%", dataIndex: "source"},
		{header: "金额(万元)", width: "40%", dataIndex: "count"}
	]
};
/**
 *    市拨款列表 end
 */	 
</script>