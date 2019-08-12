<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane" id="tab_7">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">享受研究开发费用价计扣除减免税（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="developTaxRelief" name="developTaxRelief" value="${company.companyOther.developTaxRelief}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">享受高新技术企业减免税（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="highTechTaxRelief" name="highTechTaxRelief" value="${company.companyOther.highTechTaxRelief}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">企业近三年内有无安全生产或环境污染重大责任事故：</label>
								<div id="hasAccidentsDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('hasAccidents','hasAccidents','1003','${company.companyOther.hasAccidents}',true,'form-control','','hasAccidentsDiv');</script>
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">企业获得各级政府科技奖励情况：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reward" name="reward">${company.companyOther.reward}</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4 class="caption-subject bold" style="text-align:left">享受其它政策</h4>
				<!-- BEGIN OTHER DETAIL PORTLET -->
				<div class="portlet light bordered">
					<div class="portlet-title">
						
						<div class="actions">
							<c:if test="${company.companyInfo.companyStatus!=20071002}">
							<a href="javascript:;" onclick="showAddOtherDetail()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-user-follow"></i> 添加 </a>
							</c:if>
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">
						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="pageOtherDetail" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
							<div id="gridOtherDetail" class="table-responsive table-scrollable"></div>
						</div>
					</div>
				</div>
				<!-- END OTHER DETAIL PORTLET-->
			</div>		
		</div>
	</div>
</div>
<script type="text/javascript">
	/**
	 *    企业其他政策列表 start
	 */
	var otherDetailOpt =
	{
		 url:"companyapply/queryOtherDetail",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridOtherDetail",
		 blankId:"pageOtherDetail",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "政策名称", width: "20%", dataIndex: "policyName"},
			{header: "政策代码", width: "10%", dataIndex: "policyCode"},
			{header: "免税金额(万元)", width: "10%", dataIndex: "taxRelief"},
			{header: "操作", width: "5%", dataIndex: "companyOtherDetailId", renderer: otherDetailLink}
		]
	};
	
	function otherDetailLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
	   		return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteOtherDetail("+value+")\"><i class=\"fa fa-trash-o\"></i>Delete</a>";
	   }
	   else
	   {
		   return "";
	   }
	}
	function deleteOtherDetail(otherDetailId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteOtherDetail","otherDetailId="+otherDetailId, delOtherDetailCallback);
			}
		});
	}
	function delOtherDetailCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(otherDetailOpt);
		});
	}
	/**
	 *    企业其他政策列表 end
	 */
	/**
	 * 添加自主知识产权弹出层 start
	 */
	var $otherDetailModal = $('#otherdetail-modal');
	function showAddOtherDetail()
	{
		$otherDetailModal.load('jsp/company/companyapply/modals/addotherdetailmodal.jsp', '', function(){
			$otherDetailModal.modal();
		});
	}
	/**
	 * 添加自主知识产权弹出层 end
	 */
</script>