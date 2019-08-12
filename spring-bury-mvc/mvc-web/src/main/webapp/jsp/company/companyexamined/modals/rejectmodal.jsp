<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title">请填写驳回原因</h4>
</div>
<div class="portlet-body">
	<form action="#" id="rejectfm" name="rejectfm" class="form-horizontal" method="post">
		<input type="hidden" id="modalcompanyId" name="modalcompanyId" value="">
	<!-- BEGIN ROLE LIST PORTLET-->
	<div class="portlet light">
		<div class="portlet-title">
			<div class="caption font-grey-gallery">
			</div>
			<div class="actions">
				<a href="javascript:;" onclick="rejectSubmit()" class="btn btn-circle yellow btn-sm"><i class="icon-action-undo"></i> 驳 回</a>
			</div>
		</div>
		<div class="portlet-body">
		<div class="alert alert-danger display-hide" id="formErr">
			<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
		</div>
		<div class="row">
			<div class="col-md-12 right">
				<div class="col-md-1">
				原&nbsp;&nbsp;因：
				</div>
				<div class="col-md-11">
					<div class="col-md-12">
						<textarea rows="7" cols="100" class="form-control" id="rejectReason" name="rejectReason" value="" placeholder="驳回原因" ></textarea>
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

var formOpt = {
   		formId : "rejectfm",
   		formRoles : {
   						rejectReason: {
			                required: true
			            }
   					},
   		formMessages: { 
   						rejectReason: {
			                required: "请输入驳回原因"
			            }
   					},
   		formCallBack: {
   					url:  "companyexamined/approvalReject",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("审批驳回失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function rejectSubmit(){
	
	$("#rejectfm").submit();
	DataGrid.addMask();
}
// 处理成功回调方法
var handleSuccess = function ()
{
	DataGrid.removeMask();
	// 关闭弹出层
	$rejectModal.modal('hide');
	// 跳转到科技企业审批查询页面
	Metronic.loadContentData("companyexamined/companyExaminedPre");
}

jQuery(document).ready(function() {
	CommonFormVaildate.init(formOpt);
});
</script>
