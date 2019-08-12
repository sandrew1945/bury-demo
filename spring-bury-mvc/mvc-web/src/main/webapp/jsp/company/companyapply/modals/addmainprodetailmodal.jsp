<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">添加主营产品明细</h4>
		</div>
		<div class="portlet-body">
			<form action="#" id="fmmainprodetail" name="fmmainprodetail" class="form-horizontal" method="post">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 填写主营产品信息</span>
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
							<label class="control-label col-md-3">主营产品名称<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="mainProductsName" name="mainProductsName" placeholder="主营产品名称" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">所属技术领域<span class="required">*</span></label>
							<div class="col-md-9">
								<div id="proDomainDiv" class="input-group col-md-12 col-sm-12 col-xs-12">
									<script type="text/javascript">SelectUtil.getProDomainList('proDomainId','proDomainId','',true,'form-control','','proDomainDiv');</script>
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



var mainProDetailValOpt = {
   		formId : "fmmainprodetail",
   		formRoles : {
   						mainProductsName: {
			                required: true
			            },
			            proDomainId: {
			                required: true
			            }
   					},
   		formMessages: { 
   						mainProductsName: {
			                required: "主营产品名称必须填写"
			            },
			            proDomainId: {
			            	required: "请选择所属技术领域"
			            }
   					},
   		formCallBack: {
   					url:  "companyapply/createMainProDetail",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleMainProDetailSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加主营产品失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function mainProSubmit(){
	$("#fmmainprodetail").submit();
}
// 处理成功回调方法
var handleMainProDetailSuccess = function ()
{
	// 关闭弹出层
	$mainProDetailModal.modal('hide');
	// 刷新专有技术列表
	DataGrid.__extQueryAll__(mainProDetailOpt);
}

jQuery(document).ready(function() {
	CommonFormVaildate.init(mainProDetailValOpt);
});
</script>
