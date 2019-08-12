<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal"
		aria-hidden="true"></button>
	<h4 class="modal-title">添加企业科技项目附件</h4>
</div>
<div class="portlet-body">
	<form action="#" id="proFunDetattAchment" name="proFunDetattAchment"
		class="form-horizontal" method="post">
		<input type="hidden" name="projectFundingId" id="projectFundingId">
		<input type="hidden" name="attachmentName" id="attachmentName">
		<!-- BEGIN ROLE LIST PORTLET-->
		<div class="portlet light">
			<div class="portlet-title">
				<div class="caption font-grey-gallery"></div>
				<div class="actions">
					<a href="javascript:;" onclick="proFunDetSubmit()"
						class="btn btn-circle green btn-sm"><i class="fa fa-upload"></i>
						上传 </a>
				</div>
			</div>
			<div class="portlet-body">
				<div class="alert alert-danger display-hide" id="formErr">
					<button class="close" data-close="alert"></button>
					表单填写错误,请重新填写.
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<label class="control-label col-md-3">上传附件</label>
							<div class="fileinput fileinput-new" data-provides="fileinput">
								<div class="input-group input-large">
									<div
										class="form-control uneditable-input input-fixed input-medium"
										data-trigger="fileinput">
										<i class="fa fa-file fileinput-exists"></i>&nbsp; <span
											class="fileinput-filename" id='fileNameElement'> </span>
									</div>
									<span class="input-group-addon btn default btn-file"> <span
										class="fileinput-new"> 选择文件 </span> <span
										class="fileinput-exists"> 替换 </span> <img id="tempimg"
										dynsrc="" src="" style="display: none" /> <input type="file"
										id="file" name="file">
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
<div class="modal-footer"></div>
<script type="text/javascript">
	$.validator.addMethod("filesize", function(value, element, params) {
		var obj_file = document.getElementById("file");
		var filesize = 0;
		if (browserCfg.firefox || browserCfg.chrome) {
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

	var proFunAttachmentValOpt = {
		formId : "proFunDetattAchment",
		formRoles : {
			file : {
				required : true,
				filesize : true
			}
		},
		formMessages : {
			file : {
				required : "请选择文件",
				filesize : "文件不能超过10M"
			}
		},
		formCallBack : {
			url : "companyapply/uploadProFunAttachment", // 验证通过调用的后台连接
			type : "POST",
			dataType : "json",
			success : function(ajaxResult) {
				AjaxAnyWhere.handleResult(ajaxResult, handleUploadSuccess);

			},
			error : function(data) {
				bootbox.alert("添加企业科技项目附件失败"); // 处理失败的回调
				return;
			}
		}
	}

	function proFunDetSubmit() {
		CommonFormVaildate.init(proFunAttachmentValOpt);
		$('#attachmentName').val($('#fileNameElement').text());
		$("#proFunDetattAchment").submit();
	}
	// 处理成功回调方法
	var handleUploadSuccess = function() {
		bootbox.alert("附件上传成功");
		DataGrid.removeMask();
		// 关闭弹出层
		$attachmentModal.modal('hide');
		// 刷新企业其他政策列表
		DataGrid.__extQueryAll__(proFunDetailOpt);
		
	}
	
</script>
