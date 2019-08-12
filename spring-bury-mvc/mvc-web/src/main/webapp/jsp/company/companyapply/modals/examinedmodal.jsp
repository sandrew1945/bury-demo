<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true"></button>
	<h4 class="modal-title">年审申请</h4>
</div>
<div class="portlet-body">
	<form action="#" id="examinedForm" name="examinedForm"
		class="form-horizontal" method="post">
		<input type="hidden" name="companyId" id="companyId4Examined" /> 
		<!-- BEGIN ROLE LIST PORTLET-->
		<div class="portlet light">
			<div class="portlet-title">
				<div class="caption font-grey-gallery">
					<i class="icon-list font-grey-gallery"></i> <span
						class="caption-subject bold">填写年审时间</span>
				</div>
				<div class="actions">
					<button type="button" class="btn bg-purple-plum"
										onclick="commitExaminedApply()">
										<i class="icon-loop"></i>&nbsp;&nbsp;年审申请
									</button>
				</div>
			</div>
			<div class="portlet-body">
				<div class="row">
					<div class="form-group">
						<label class="control-label col-md-3">申请年审年份<span
							class="required">*</span></label>
						<div class="col-md-6">
							<div class="input-group col-md-12">
								<select id="examinedYear" name="examinedYear"
									class="select2_category form-control" tabindex="1"
									placeholder="....">
									<option value="">-Option-</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END ROLE LIST PORTLET-->
	</form>
</div>
<div class="modal-footer"></div>
<script type="text/javascript">
jQuery(document).ready(function() {
	$('#examinedYear').append(
			'<option value="' + new Date().getFullYear() + '">'
					+ new Date().getFullYear() + '</option>');
	$('#examinedYear').append(
			'<option value="' + (new Date().getFullYear() - 1)
					+ '">' + (new Date().getFullYear() - 1)
					+ '</option>');
	});
		
	var saveOption = {
		formId : "examinedForm",
		formRoles : {
			examinedYear : {
				required : true
			}
		},
		formMessages : {
			examinedYear : {
				required : "请选择申请年审年份"
			}
		},
		formCallBack : {
			url : "companyapply/commitExaminedApply", // 验证通过调用的后台连接
			type : "POST",
			dataType : "json",
			success : function(ajaxResult) {
				AjaxAnyWhere.handleResult(ajaxResult, saveSuccess);
			},
			error : function(data) {
				bootbox.alert("年审申请失败"); // 处理失败的回调
				return;
			}
		}
	}
	
	// 处理成功回调方法
	var saveSuccess = function() {
		bootbox.alert("年审申请提交成功");
		//关闭弹出框
		$examinedModal.modal('hide');
		// 跳转到备案申请表管理页面
		Metronic.loadContentData("companyapply/authenticateApplyPre");
		$('.make-switch').bootstrapSwitch();
	}
	
	function commitExaminedApply() {
		$('#companyId4Examined').val(companyId);
		CommonFormVaildate.init(saveOption);
		$("#examinedForm").submit();
	}


</script>
