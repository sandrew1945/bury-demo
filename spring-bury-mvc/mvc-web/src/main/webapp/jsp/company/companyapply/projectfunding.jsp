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
									<input type="text" class="form-control" placeholder="0.00" id="actFunding" name="actFunding" value="${company.projectFunding.actFunding}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技活动经费内部支出（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="actFundingInterExp" name="actFundingInterExp" value="${company.projectFunding.actFundingInterExp}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">本年科技项目数（项）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="techProjCount" name="techProjCount" value="${company.projectFunding.techProjCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技活动经费外部支出（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="actFundingExterExp" name="actFundingExterExp" value="${company.projectFunding.actFundingExterExp}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技项目经费筹集额（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="projectFunds" name="projectFunds" value="${company.projectFunding.projectFunds}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">金融机构贷款额（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="finInsLoans" name="finInsLoans" value="${company.projectFunding.finInsLoans}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">企业资金（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="enterpriseFunds" name="enterpriseFunds" value="${company.projectFunding.enterpriseFunds}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">国外资金（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="foreignFunds" name="foreignFunds" value="${company.projectFunding.foreignFunds}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">区、开发区财政拨款额（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="finDisAppro" name="finDisAppro" value="${company.projectFunding.finDisAppro}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">其他资金来源（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="otherFunds" name="otherFunds" value="${company.projectFunding.otherFunds}" />
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
							<c:if test="${company.companyInfo.companyStatus!=20071002}">
							<a href="javascript:;" onclick="showAddStateFunding()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
							</c:if>
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="pageStateFunding" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
							<div id="gridStateFunding" class="table-responsive table-scrollable"></div>
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
							<c:if test="${company.companyInfo.companyStatus!=20071002}">
							<a href="javascript:;" onclick="showAddCityFunding()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
							</c:if>
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="pageCityFunding" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
							<div id="gridCityFunding" class="table-responsive table-scrollable"></div>
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
		 url:"companyapply/queryStateFundingDetail",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridStateFunding",
		 blankId:"pageStateFunding",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "来源部门", width: "40%", dataIndex: "source"},
			{header: "金额(万元)", width: "40%", dataIndex: "count"},
			{header: "操作", width: "10%", dataIndex: "stateFundingDetailId", renderer: stateFundingLink}
		]
	};
	
	function stateFundingLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
	   		return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteStateFunding("+value+")\"><i class=\"fa fa-trash-o\"></i>Delete</a>";
	   }
	   else
	   {
	   		return "";
	   }
	}
	function deleteStateFunding(stateFundingId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteStateFundingDetail","stateFundingId="+stateFundingId, delStateFundingCallback);
			}
		});
	}
	function delStateFundingCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(stateFundingOpt);
		});
	}
	/**
	 *    国家拨款列表 end
	 */
	/**
	 * 添加国家拨款弹出层 start
	 */
	var $statefundingModal = $('#statefunding-modal');
	function showAddStateFunding()
	{
		$statefundingModal.load('jsp/company/companyapply/modals/addstatefundingmodal.jsp', '', function(){
			$statefundingModal.modal();
		});
	}
	/**
	 * 添加国家拨款弹出层 end
	 */
	 
	 
	 
	 
	 
	/**
	 *    市拨款列表 start
	 */
	var cityFundingOpt =
	{
		 url:"companyapply/queryCityFundingDetail",
		 choiceType:null,
		 formId: "fm",
		 gridId: "gridCityFunding",
		 blankId: "pageCityFunding",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "来源部门", width: "40%", dataIndex: "source"},
			{header: "金额(万元)", width: "40%", dataIndex: "count"},
			{header: "操作", width: "10%", dataIndex: "cityFundingDetailId", renderer: cityFundingLink}
		]
	};
	
	function cityFundingLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
	   		return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteCityFunding("+value+")\"><i class=\"fa fa-trash-o\"></i>Delete</a>";
	   }
	   else
	   {
	   		return "";
	   }
	}
	function deleteCityFunding(cityFundingId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteCityFundingDetail","cityFundingId="+cityFundingId, delCityFundingCallback);
			}
		});
	}
	function delCityFundingCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(cityFundingOpt);
		});
	}
	/**
	 *    市拨款列表 end
	 */	 
	/**
	 * 添加市拨款弹出层 start
	 */
	var $cityfundingModal = $('#cityfunding-modal');
	function showAddCityFunding()
	{
		$cityfundingModal.load('jsp/company/companyapply/modals/addcityfundingmodal.jsp', '', function(){
			$cityfundingModal.modal();
		});
	}
	/**
	 * 添加市拨款弹出层 end
	 */
</script>