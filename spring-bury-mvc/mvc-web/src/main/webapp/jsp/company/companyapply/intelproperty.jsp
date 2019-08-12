<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane" id="tab_4">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body form">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-4">
							<div class="">
								<label class="control-label">申请专利(件)</label>
								<input type="text" class="form-control" placeholder="0" id="applyPatent" name="applyPatent" value="${company.intelProperty.applyPatent}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">授权发明专利(件)</label>
								<input type="text" class="form-control" placeholder="0" id="authInventionPatent" name="authInventionPatent" value="${company.intelProperty.authInventionPatent}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">授权专利(件)</label>
								<input type="text" class="form-control" placeholder="0" id="authPatent" name="authPatent" value="${company.intelProperty.authPatent}" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="">
								<label class="control-label">拥有有效发明专利(件)</label>
								<input type="text" class="form-control" placeholder="0" id="validInventionPatent" name="validInventionPatent" value="${company.intelProperty.validInventionPatent}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">拥有有效专利(件)</label>
								<input type="text" class="form-control" placeholder="0" id="validPatent" name="validPatent" value="${company.intelProperty.validPatent}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">拥有企业标准(件)</label>
								<input type="text" class="form-control" placeholder="0" id="enterpriseStandard" name="enterpriseStandard" value="${company.intelProperty.enterpriseStandard}" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="">
								<label class="control-label">拥有软件著作权(件)</label>
								<input type="text" class="form-control" placeholder="0" id="softwareCopyright" name="softwareCopyright" value="${company.intelProperty.softwareCopyright}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">其它专有技术服务(项)</label>
								<input type="text" class="form-control" placeholder="0" id="otherPropTech" name="otherPropTech" value="${company.intelProperty.otherPropTech}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">注册商标(件)</label>
								<input type="text" class="form-control" placeholder="0" id="trademark" name="trademark" value="${company.intelProperty.trademark}" />
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4">
							<div class="">
								<label class="control-label">申请发明专利(件)</label>
								<input type="text" class="form-control" placeholder="0" id="applyInventionPatent" name="applyInventionPatent" value="${company.intelProperty.applyInventionPatent}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">集成电路布图设计</label>
								<input type="text" class="form-control" placeholder="0" id="integCircuitLayout" name="integCircuitLayout" value="${company.intelProperty.integCircuitLayout}" />
							</div>
						</div>
						<div class="col-md-4">
							<div class="">
								<label class="control-label">植物新品种</label>
								<input type="text" class="form-control" placeholder="0" id="newPlant" name="newPlant" value="${company.intelProperty.newPlant}" />
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
									<c:if test="${company.companyInfo.companyStatus!=20071002}">
									<a href="javascript:;" onclick="showAddRightDetail()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-user-follow"></i> 添加 </a>
									</c:if>
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
									<div id="pageRightDetail" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
									<div id="gridRightDetail" class="table-responsive table-scrollable"></div>
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
									<c:if test="${company.companyInfo.companyStatus!=20071002}">
									<a href="javascript:;" onclick="showAddPriTechDetail()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-user-follow"></i> 添加 </a>
									</c:if>
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
									<div id="pagePriTechDetail" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
									<div id="gridPriTechDetail" class="table-responsive table-scrollable"></div>
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
									<c:if test="${company.companyInfo.companyStatus!=20071002}">
									<a href="javascript:;" onclick="showAddMainProDetail()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-user-follow"></i> 添加 </a>
									</c:if>
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
									<div id="pageMainProDetail" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
									<div id="gridMainProDetail" class="table-responsive table-scrollable"></div>
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
									<c:if test="${company.companyInfo.companyStatus!=20071002}">
									<a href="javascript:;" onclick="showAddTechTransDetail()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-user-follow"></i> 添加 </a>
									</c:if>
									<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
								</div>
							</div>
							<div class="portlet-body">
								<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
									<div id="pageTechTransDetail" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
									<div id="gridTechTransDetail" class="table-responsive table-scrollable"></div>
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
		 url:"companyapply/queryRightDetail",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridRightDetail",
		 blankId:"pageRightDetail",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "自主知识产权名称", width: "19%", dataIndex: "intelPropertyName"},
			{header: "类别", width: "10%", dataIndex: "intelPropertyType", renderer: getfixCodeDesc},
			{header: "授权时间", width: "10%", dataIndex: "authDate", renderer: CommonUtil.getDateStr},
			{header: "授权号", width: "10%", dataIndex: "authCode"},
			{header: "获得方式", width: "10%", dataIndex: "authWay"},
			{header: "备注", width: "20%", dataIndex: "remark"},
			{header: "操作", width: "11%", dataIndex: "intelPropertyRightsDetailId", renderer: rightDetailLink}
		]
	};
	
	function rightDetailLink(value,metaDate,record){
		var attachmentPath = record.data.attachmentPath;
	    var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
		   if(attachmentPath != null && '' != attachmentPath){
	  	 	return 	"<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteRightDetail("+value+")\"><i class=\"fa fa-trash-o\"></i>删除</a>"+
	  	 			"<a class=\"btn default btn-xs blue\" href=\"javascript:void(0)\" onclick=\"downloadAttachment4RightDetail("+value+")\"><i class=\"fa fa-download\"></i> 下载</a>";
		   }else{
	  	 	return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteRightDetail("+value+")\"><i class=\"fa fa-trash-o\"></i>删除</a>";
		   }
	   }
	   else
	   {
		   if(attachmentPath != null && '' != attachmentPath){
	   			return "<a class=\"btn default btn-xs blue\" href=\"javascript:void(0)\" onclick=\"downloadAttachment4RightDetail("+value+")\"><i class=\"fa fa-download\"></i> 下载</a>";
		   } else {
			   return "";
		   }
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
	function delRightDetailCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(rightDetailOpt);
		});
	}
	/**
	 *    自主知识产权列表 end
	 */
	/**
	 * 添加自主知识产权弹出层 start
	 */
	var $rightDetailModal = $('#rightdetail-modal');
	function showAddRightDetail()
	{
		$rightDetailModal.load('jsp/company/companyapply/modals/addrightdetailmodal.jsp', '', function(){
			$rightDetailModal.modal();
		});
	}
	/**
	 * 添加自主知识产权弹出层 end
	 */
	 
	 
	 
	/**
	 *    专有技术列表 start
	 */
	var priTechDetailOpt =
	{
		 url:"companyapply/queryPriTechDetail",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridPriTechDetail",
		 blankId:"pagePriTechDetail",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "专有技术名称", width: "20%", dataIndex: "priTechName"},
			{header: "类别", width: "10%", dataIndex: "priTechType",},
			{header: "授权时间", width: "10%", dataIndex: "authDate", renderer: CommonUtil.getDateStr},
			{header: "获得方式", width: "10%", dataIndex: "authWay",},
			{header: "备注", width: "30%", dataIndex: "remark"},
			{header: "操作", width: "5%", dataIndex: "priTechDetailId", renderer: priTechLink}
		]
	};
	
	function priTechLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
	   		return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deletePriTechDetail("+value+")\"><i class=\"fa fa-trash-o\"></i>删除</a>";
	   }
	   else
	   {
	   		return "";
	   }
	}
	function deletePriTechDetail(priTechDetailId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deletePriTechDetail","priTechDetailId="+priTechDetailId, delPriTechDetailCallback);
			}
		});
	}
	function delPriTechDetailCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(priTechDetailOpt);
		});
	}
	/**
	 *   专有技术列表 end
	 */
	/**
	 * 添加专有技术列表弹出层 start
	 */
	var $priTechDetailModal = $('#pritechdetail-modal');
	function showAddPriTechDetail()
	{
		$priTechDetailModal.load('jsp/company/companyapply/modals/addpritechdetailmodal.jsp', '', function(){
			$priTechDetailModal.modal();
		});
	}
	/**
	 * 添加专有技术列表弹出层 end
	 */
	 
	 
	 
	 
	 
	/**
	 *    主营产品列表 start
	 */
	var mainProDetailOpt =
	{
		 url:"companyapply/queryMainProDetail",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridMainProDetail",
		 blankId:"pageMainProDetail",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "主营产品名称", width: "20%", dataIndex: "mainProductsName"},
			{header: "所属技术领域", width: "20%", dataIndex: "proDomainName",},
			{header: "备注", width: "45%", dataIndex: "remark"},
			{header: "操作", width: "5%", dataIndex: "mainProductsDetailId", renderer: mainProLink}
		]
	};
	
	function mainProLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
	   		return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteMainProDetail("+value+")\"><i class=\"fa fa-trash-o\"></i>删除</a>";
	   }
	   else
	   {
		   	return "";
	   }
	}
	function deleteMainProDetail(mainProDetailId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteMainProDetail","mainProDetailId="+mainProDetailId, delMainProDetailCallback);
			}
		});
	}
	function delMainProDetailCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(mainProDetailOpt);
		});
	}
	/**
	 *   主营产品列表 end
	 */
	/**
	 * 添加主营产品弹出层 start
	 */
	var $mainProDetailModal = $('#mainprodetail-modal');
	function showAddMainProDetail()
	{
		$mainProDetailModal.load('jsp/company/companyapply/modals/addmainprodetailmodal.jsp', '', function(){
			$mainProDetailModal.modal();
		});
	}
	/**
	 * 添加主营产品弹出层 end
	 */
	 
	 
	 
	 
	 
	 
	/**
	 *    技术转让列表 start
	 */
	var techTransDetailOpt =
	{
		 url:"companyapply/queryTechTransDetail",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridTechTransDetail",
		 blankId:"pageTechTransDetail",
		 columns : [
			{header: "", width: "10%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "技术转让及合作项目名称", width: "20%", dataIndex: "techTransName"},
			{header: "转让及合作方式", width: "20%", dataIndex: "techTransType",},
			{header: "备注", width: "45%", dataIndex: "remark"},
			{header: "操作", width: "5%", dataIndex: "techTransId", renderer: techTransLink}
		]
	};
	
	function techTransLink(value,metaDate,record){
	   var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	   if(modifyFlag)
	   {
	   		return "<a class=\"btn default btn-xs black\" href=\"javascript:void(0)\" onclick=\"deleteTechTransDetail("+value+")\"><i class=\"fa fa-trash-o\"></i>删除</a>";
	   }
	   else
	   {
		   return "";
	   }
	}
	function deleteTechTransDetail(techTransDetailId){
		bootbox.confirm("是否删该数据?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteTechTransDetail","techTransDetailId="+techTransDetailId, delTechTransDetailCallback);
			}
		});
	}
	function delTechTransDetailCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(techTransDetailOpt);
		});
	}
	/**
	 *   技术转让列表 end
	 */
	/**
	 * 添加技术转让弹出层 start
	 */
	var $techTransDetailModal = $('#techtransdetail-modal');
	function showAddTechTransDetail()
	{
		$techTransDetailModal.load('jsp/company/companyapply/modals/addtechtransdetailmodal.jsp', '', function(){
			$techTransDetailModal.modal();
		});
	}
	/**
	 * 添加技术转让弹出层 end
	 */
	 
	//下载自主知识产权附件功能
	function downloadAttachment4RightDetail(intelPropertyRightsDetailId){
		download("companyapply/downloadAttachment4RightDetail", "intelPropertyRightsDetailId", intelPropertyRightsDetailId);
	}
</script>