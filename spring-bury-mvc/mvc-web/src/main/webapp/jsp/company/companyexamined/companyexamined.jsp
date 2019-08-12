<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!--> <html lang="en" class="no-js"> <!--<![endif]-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>科技企业年审管理</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<meta name="MobileOptimized" content="320">
</head>
<body>
<!-- BEGIN FORM-->
<form class="form-horizontal" id="fm" name="fm" >
<input type="hidden" id="curPage" value="" />
<!-- BEGIN PAGE HEADER-->
<div class="row">
	<div class="col-md-12">
		<!-- BEGIN PAGE TITLE & BREADCRUMB-->
		<h3 class="page-title">
			<span class="icon-svg2 icon-pad"></span> 科技企业年审管理
		</h3>
		<!-- END PAGE TITLE & BREADCRUMB-->
	</div>
</div>
<!-- BEGIN PAGE CONTENT-->    
<div class="tab-pane " id="tab_2">
	<!-- BEGIN CONDITION PORTLET-->
	<div class="portlet light">
		<!-- 标题及收起工具栏 -->
		<div class="portlet-title">
			<div class="caption font-grey-gallery">
				<i class="icon-bulb font-grey-gallery"></i>
				<span class="caption-subject bold"> 查询条件</span>
			</div>
			<div class="tools">
				<a href="javascript:;" class="collapse"></a>
			</div>
		</div>
		<!-- 查询条件主体 -->
		<div class="portlet-body">
			<div class="form-body">
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">企业名称</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input type="text" class="form-control" placeholder="企业名称" id="companyName" name="companyName" value="" />
							</div>
						</div>
					</div>
					<!--/span-->
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">所属地区</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<div class="col-md-12" id="regionDiv">
									<script type="text/javascript">getSelect('region','region','2006','',true,'form-control','','regionDiv');
									</script>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">企业类型</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<div class="col-md-12" id="companyTypeDiv">
									<script type="text/javascript">getSelect('companyType','companyType','2014','',true,'form-control','','companyTypeDiv');
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/span-->
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">组织机构代码</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input type="text" class="form-control" placeholder="组织机构代码" id="orgCode" name="orgCode" value="" />
							</div>
						</div>
					</div>
					<div class="form-group col-md-8">
						<div class="pull-right">
							<button class="btn red btn-sm" type="button" id="btn_search"><i class="fa fa-search"></i> 查  询</button>  
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END CONDITION PORTLET-->


	<!-- BEGIN DATAGRID PORTLET-->
	<div class="portlet light">
		<div class="portlet-title">
			<div class="caption font-grey-gallery">
				<i class="icon-list font-grey-gallery"></i>
				<span class="caption-subject bold"> 查询结果</span>
			</div>
			<div class="actions">
<!-- 				<a href="" class="btn btn-circle red-sunglo btn-sm ajaxify"><i class="icon-badge"></i> 审批通过 </a> -->
				<div class="btn-group">
					<a class="btn btn-circle btn-default btn-sm" href="javascript:;" data-toggle="dropdown">
					<i class="fa fa-navicon"></i> 操作 <i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu pull-right">
						<li><a href="javascript:void(0)" onclick="companyDetail()" class=""><i class="icon-magnifier"></i> 查看企业申请表  </a></li>
						<li><a href="javascript:void(0)" onclick="deleteCompany()"><i class="fa fa-trash-o"></i> 删除企业 </a></li>
					</ul>
				</div>
				<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
			</div>
		</div>
		<div class="portlet-body">
			<div class="scroller" style="height:450px" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
				<%@ include file="/queryPage/orderHidden.html" %>
				<%@ include file="/queryPage/pageDiv.html" %>
				<br />
			</div>
		</div>
	</div>
	<!-- END DATAGRID PORTLET-->

<!-- END PAGE CONTENT-->

</form>
<!-- END FORM-->  
</body>
</html>

<script type="text/javascript">

 	var option = 
 	{
 		 url:"companyexamined/companyExaminedPageQuery",
 		 choiceType:'radio',
 		 formId:"fm",
 		 gridId:"myGrid",
 		 blankId:"_page",
 		 pageId:"myPage",
 		 columns : [
 			{header: "", width: "3%", dataIndex: "companyId",renderer: CommonUtil.getRadio},//设置序号的方式
			{header: "企业名称", width: "20%", dataIndex: "companyName"},
			{header: "所属行政区", width: "10%", dataIndex: "region", renderer: getfixCodeDesc},
			{header: "组织机构代码证", width: "10%", dataIndex: "orgCode"},
			{header: "五证合一", width: "5%", dataIndex: "fiveInOne"},
			{header: "税务登记号", width: "10%", dataIndex: "taxRegCode"},
			{header: "公司类型", width: "10%", dataIndex: "companyType", renderer: getfixCodeDesc},
			{header: "认证编码", width: "5%", dataIndex: "authCode"},
			{header: "联系人", width: "5%", dataIndex: "linkman"},
			{header: "联系人电话", width: "5%", dataIndex: "linkmanTel"},
			{header: "提交日期", width: "10%", dataIndex: "updateDate", renderer: CommonUtil.getDateStr}
 		]
 	};
	jQuery(document).ready(function() {
		DataGrid.__extQuery__(1,option);
	});
	
	$("#btn_search").click(function() {
		DataGrid.__extQuery__(1,option);
	});
	
	/**
	 * 删除 start
	 */
	function deleteCompany() {
		bootbox.confirm("确认删除该企业?", function(result) {
			if (result) {
				AjaxAnyWhere.sendRequestByForms(
						"companyexamined/deleteCompany", "fm", deleteCallback);
			}
		});
	}
	function deleteCallback(ajaxResult) {
		Metronic.loadContentData("companyexamined/companyExaminedPre");
	}
	/**
	 * 删除 end
	 */
	
	function companyDetail(){
		var intHot = CommonUtil.getRadioVal();
		if(intHot==null){
			bootbox.alert("请选择需要查看的企业?");
			return false;
		}
		Metronic.loadContentData("companyexamined/viewCompanyApplyInfo?companyId="+intHot);
	}
	
	function delUserCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQuery__(1,option);
		});
	}
</script>
	
