<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">添加国家拨款明细</h4>
		</div>
		<div class="portlet-body">
			<form action="#" id="fmstatefunding" name="fmstatefunding" class="form-horizontal" method="post">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 填写国家拨款信息</span>
					</div>
					<div class="actions">
						<a href="javascript:;" onclick="stateFundingSubmit()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
					</div>
				</div>
				<div class="portlet-body">
				<div class="alert alert-danger display-hide" id="formErr">
					<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label col-md-3">来源部门<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="source" name="source" placeholder="来源部门" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-user"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">金额(万元)<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="count" name="count" placeholder="金额" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-user"></i>
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




var stateFundingValOpt = {
   		formId : "fmstatefunding",
   		formRoles : {
   						source: {
			                required: true
			            },
			            count: {
			                required: true,
			                number: true
			            }
   					},
   		formMessages: { 
   						name: {
			                required: "来源部门必须填写"
			            },
			            dept: {
			            	required: "金额必须填写",
			            	number: "金额必须是数字"
			            }
   					},
   		formCallBack: {
   					url:  "companyapply/createStateFundingDetail",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleStateFundingSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加企业核心人员失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function stateFundingSubmit(){
	$("#fmstatefunding").submit();
}
// 处理成功回调方法
var handleStateFundingSuccess = function ()
{
	// 关闭弹出层
	$statefundingModal.modal('hide');
	// 刷新国家拨款列表
	DataGrid.__extQueryAll__(stateFundingOpt);
}

jQuery(document).ready(function() {
	CommonFormVaildate.init(stateFundingValOpt);
});
</script>
