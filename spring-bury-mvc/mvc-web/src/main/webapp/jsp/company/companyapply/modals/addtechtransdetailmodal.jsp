<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">添加技术转让及合作项目明细</h4>
		</div>
		<div class="portlet-body">
			<form action="#" id="fmtechtransdetail" name="fmtechtransdetail" class="form-horizontal" method="post">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 填写技术转让及合作项目信息</span>
					</div>
					<div class="actions">
						<a href="javascript:;" onclick="mainProSubmit()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
					</div>
				</div>
				<div class="portlet-body">
				<div class="alert alert-danger display-hide" id="formErr">
					<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label col-md-3">技术转让及合作项目名称<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="techTransName" name="techTransName" placeholder="技术转让及合作项目名称" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">转让及合作方式<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="techTransType" name="techTransType" placeholder="转让及合作方式" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">备注<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="remark" name="remark" placeholder="备注" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
			<!-- END ROLE LIST PORTLET-->
			</form>
		</div>
		<div class="modal-footer">
		</div>
<script type="text/javascript">



var techTransDetailValOpt = {
   		formId : "fmtechtransdetail",
   		formRoles : {
   						techTransName: {
			                required: true
			            },
			            techTransType: {
			                required: true
			            }
   					},
   		formMessages: { 
   						techTransName: {
			                required: "技术转让及合作项目名称必须填写"
			            },
			            techTransType: {
			            	required: "转让及合作方式必须填写"
			            }
   					},
   		formCallBack: {
   					url:  "companyapply/createTechTransDetail",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleTechTransDetailSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加主营产品失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function mainProSubmit(){
	$("#fmtechtransdetail").submit();
}
// 处理成功回调方法
var handleTechTransDetailSuccess = function ()
{
	// 关闭弹出层
	$techTransDetailModal.modal('hide');
	// 刷新技术转让列表
	DataGrid.__extQueryAll__(techTransDetailOpt);
}

jQuery(document).ready(function() {
	CommonFormVaildate.init(techTransDetailValOpt);
});
</script>
