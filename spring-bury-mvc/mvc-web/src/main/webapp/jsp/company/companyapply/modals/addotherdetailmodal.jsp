<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">添加企业其他政策明细</h4>
		</div>
		<div class="portlet-body">
			<form action="#" id="fmotherdetail" name="fmotherdetail" class="form-horizontal" method="post">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 填写企业其他政策信息</span>
					</div>
					<div class="actions">
						<a href="javascript:;" onclick="otherSubmit()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
					</div>
				</div>
				<div class="portlet-body">
				<div class="alert alert-danger display-hide" id="formErr">
					<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label col-md-3">政策名称<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="policyName" name="policyName" placeholder="政策名称" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">政策代码<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="policyCode" name="policyCode" placeholder="政策代码" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">免税金额(万元)<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="taxRelief" name="taxRelief" placeholder="免税金额" maxlength="20" value="" />
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




var otherDetailValOpt = {
   		formId : "fmotherdetail",
   		formRoles : {
   						policyName: {
			                required: true
			            },
			            policyCode: {
			                required: true
			            },
			            taxRelief: {
			            	required: true,
			            	number: true
			            }
   					},
   		formMessages: { 
   						policyName: {
			                required: "政策名称必须填写"
			            },
			            policyCode: {
			            	required: "政策代码必须填写"
			            },
			            taxRelief: {
			            	required: "免税金额必须填写",
			            	number: "请填写数字格式"
			            }
   					},
   		formCallBack: {
   					url:  "companyapply/createOtherDetail",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleOtherDetailSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加企业核心人员失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function otherSubmit(){
	$("#fmotherdetail").submit();
}
// 处理成功回调方法
var handleOtherDetailSuccess = function ()
{
	// 关闭弹出层
	$otherDetailModal.modal('hide');
	// 刷新企业其他政策列表
	DataGrid.__extQueryAll__(otherDetailOpt);
}

jQuery(document).ready(function() {
	CommonFormVaildate.init(otherDetailValOpt);
});
</script>
