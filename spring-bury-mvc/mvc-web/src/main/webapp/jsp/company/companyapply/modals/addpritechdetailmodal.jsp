<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">添加专有技术明细</h4>
		</div>
		<div class="portlet-body">
			<form action="#" id="fmpritechdetail" name="fmpritechdetail" class="form-horizontal" method="post">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 填写专有技术信息</span>
					</div>
					<div class="actions">
						<a href="javascript:;" onclick="priTechSubmit()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
					</div>
				</div>
				<div class="portlet-body">
				<div class="alert alert-danger display-hide" id="formErr">
					<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label col-md-3">专有技术名称<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="priTechName" name="priTechName" placeholder="专有技术名称" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">类别<span class="required">*</span></label>
							<div class="col-md-9" id="priTechTypeDiv"><script type="text/javascript">getSelect('priTechType','priTechType','2019','',true,'form-control','','priTechTypeDiv');</script></div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">授权时间<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group col-md-12">
									<input id="authDate" name="authDate" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value=""/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">获得方式<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="authWay" name="authWay" placeholder="获得方式" maxlength="20" value="" />
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



var priTechDetailValOpt = {
   		formId : "fmpritechdetail",
   		formRoles : {
   						priTechName: {
			                required: true
			            },
			            authDate: {
			                required: true
			            }
			            ,
			            priTechType: {
			                required: true
			            }
   					},
   		formMessages: { 
   						priTechName: {
			                required: "专有技术名称必须填写"
			            },
			            authDate: {
			            	required: "授权时间必须填写"
			            },
			            priTechType: {
			            	required: "类别必须填写"
			            }
   					},
   		formCallBack: {
   					url:  "companyapply/createPriTechDetail",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handlePriTechDetailSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加专有技术失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function priTechSubmit(){
	$("#fmpritechdetail").submit();
}
// 处理成功回调方法
var handlePriTechDetailSuccess = function ()
{
	bootbox.alert("保存成功");
	// 关闭弹出层
	$priTechDetailModal.modal('hide');
	// 刷新专有技术列表
	DataGrid.__extQueryAll__(priTechDetailOpt);
}

jQuery(document).ready(function() {
	if (jQuery().datepicker) {
           $('.date-picker').datepicker({
               rtl: Metronic.isRTL(),
               orientation: "left",
               autoclose: true
           });
           //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
    }
	 
	CommonFormVaildate.init(priTechDetailValOpt);
});
</script>
