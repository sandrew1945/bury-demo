<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">请选择角色</h4>
		</div>
		<div class="modal-body">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 查询结果</span>
					</div>
					<div class="actions">
						<a href="javascript:;" onclick="addRoleRelation()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
					</div>
				</div>
				<div class="portlet-body">
					<div class="scroller" style="height:450px" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
						<div id="_page2" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
						<div id="myGrid2" class="table-responsive table-scrollable"></div>
						<div class="row">
							<div id="myPage" class="pages dataTables_paginate paging_bootstrap" style="margin-right: 20px"></div>
						</div>
						<br />
					</div>
				</div>
			</div>
			<!-- END ROLE LIST PORTLET-->
			
		</div>
		<div class="modal-footer">
		</div>
<script type="text/javascript">
	var option2 = 
 	{
 		 url:"usermanager/queryUnRelationRoles",
 		 formId: 'updaeUser',
 		 gridId: "myGrid2",
 		 blankId:"_page2",
 		 choiceType:'checkbox',
 		 columns : [
 			{header: "", width: "3%", dataIndex: "roleId",renderer: CommonUtil.getCheckBox},//设置序号的方式
			{header: "角色代码", width: "10%", dataIndex: "roleCode"},
			{header: "角色名称", width: "10%", dataIndex: "roleName"},
			{header: "角色类型", width: "10%", dataIndex: "roleType", renderer: getfixCodeDesc}
 		]
 	};
	jQuery(document).ready(function() {
		DataGrid.__extQueryAll__(option2);
	});
	
	/**
	 *   添加角色
	 */
	function addRoleRelation()
	{
		var intHot = CommonUtil.getCheckboxVals();
		if(intHot==''){
			bootbox.alert("请选择至少一个角色");
			return false;
		}
		else
		{
			var userId = $("#userId").val();
			AjaxAnyWhere.sendRequestByData("usermanager/createRelation","userId="+userId+"&rolesStr="+intHot, addRoleRelationCallback);
		}
	}
	
	function addRoleRelationCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(option2);
		  	setTimeout(function(){
				DataGrid.__extQueryAll__(optionUpdateUser);
		  	}, 100);
		});
	}
</script>
