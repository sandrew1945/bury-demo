<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">添加自主知识产权明细</h4>
		</div>
		<div class="portlet-body">
			<form action="#" id="fmrightdetail" name="fmrightdetail" class="form-horizontal" method="post">
			<input type="hidden" name="attachmentName" id="attachmentName">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 填写自主知识产权信息</span>
					</div>
					<div class="actions">
						<a href="javascript:;" onclick="cityFundingSubmit()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
					</div>
				</div>
				<div class="portlet-body">
				<div class="alert alert-danger display-hide" id="formErr">
					<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label col-md-3">自主知识产权名称<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="intelPropertyName" name="intelPropertyName" placeholder="自主知识产权名称" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">类别<span class="required">*</span></label>
							<div class="col-md-9" id="intelPropertyTypeDiv"><script type="text/javascript">getSelect('intelPropertyType','intelPropertyType','2018','',true,'form-control','','intelPropertyTypeDiv');</script></div>
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
							<label class="control-label col-md-3">授权号<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="authCode" name="authCode" placeholder="授权号" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
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
							<div class="form-group">
								<label class="control-label col-md-3">上传附件</label>
								<div class="col-md-9">
								<div class="fileinput-new" data-provides="fileinput">
									<div class="input-group col-md-12">
										<div
											class="uneditable-input col-md-12"
											data-trigger="fileinput">
											<i class="fa fa-file fileinput-exists"></i>&nbsp; <span
												class="fileinput-filename" id='attaNameElement'> </span>
										</div>
										<span class="input-group-addon btn default btn-file"> <span
											class="fileinput-new"> 选择文件 </span> <span
											class="fileinput-exists"> 替换 </span> <img id="tempimg"
											dynsrc="" src="" style="display: none" /> <input type="file"
											id="file" name="file" >
										</span> <a href="javascript:;"
											class="input-group-addon btn red fileinput-exists"
											data-dismiss="fileinput"> 移除 </a>
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
$.validator.addMethod("filesize", function(value, element, params) {
	var obj_file = document.getElementById("file");
	var filesize = 0;
	if (browserCfg.firefox || browserCfg.chrome) {
		if(obj_file.files[0] == undefined){
			return true;
		}
		filesize = obj_file.files[0].size;
	} else if (browserCfg.ie) {
		DataGrid.addMask();
		return true;
	}
	if (filesize == -1) {
		return false;
	} else if (filesize > 10 * 1024 * 1024) {
		return false;
	} else {
		DataGrid.addMask();
		return true;
	}

}, " ");

var rightDetailValOpt = {
   		formId : "fmrightdetail",
   		formRoles : {
   						intelPropertyName: {
			                required: true
			            },
			            authDate: {
			                required: true
			            },
			            authCode: {
			            	required: true
			            },
			    		file : {
			    			filesize : true
			    		},
			    		intelPropertyType: {
			            	required: true
			            }
   					},
   		formMessages: { 
   						intelPropertyName: {
			                required: "自主知识产权名称必须填写"
			            },
			            authDate: {
			            	required: "认证时间必须填写"
			            },
			            authCode: {
			            	required: "授权号必须填写"
			            },
			    		file : {
			    			filesize : "文件不能超过10M"
			    		},
			    		intelPropertyType: {
			            	required: "类别必须填写"
			            }
   					},
   		formCallBack: {
   					url:  "companyapply/createRightDetail",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleRightDetailSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加企业核心人员失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function cityFundingSubmit(){
	CommonFormVaildate.init(rightDetailValOpt);
	$("#attachmentName").val($("#attaNameElement").text());
	$("#fmrightdetail").submit();
}
// 处理成功回调方法
var handleRightDetailSuccess = function ()
{
	bootbox.alert("保存成功");
	// 关闭弹出层
	$rightDetailModal.modal('hide');
	// 刷新自主知识产权列表
	DataGrid.__extQueryAll__(rightDetailOpt);
}

jQuery(document).ready(function() {
	if (jQuery().datepicker) {
		$.fn.datepicker.defaults.language = "zh-CN";
           $('.date-picker').datepicker({
               rtl: Metronic.isRTL(),
               orientation: "left",
               language : "",
               autoclose: true
           });
           //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
    }

});
</script>
