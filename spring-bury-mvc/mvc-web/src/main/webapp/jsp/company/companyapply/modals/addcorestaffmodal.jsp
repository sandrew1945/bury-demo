<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
			<h4 class="modal-title">添加企业核心人员</h4>
		</div>
		<div class="portlet-body">
			<form action="#" id="fmcorestaff" name="fmcorestaff" class="form-horizontal" method="post">
			<!-- BEGIN ROLE LIST PORTLET-->
			<div class="portlet light">
				<div class="portlet-title">
					<div class="caption font-grey-gallery">
						<i class="icon-list font-grey-gallery"></i>
						<span class="caption-subject bold"> 填写核心人员信息</span>
					</div>
					<div class="actions">
						<a href="javascript:;" onclick="coreStaffSubmit()" class="btn btn-circle red-sunglo btn-sm"><i class="icon-magnifier-add "></i> 添加 </a>
					</div>
				</div>
				<div class="portlet-body">
				<div class="alert alert-danger display-hide" id="formErr">
					<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
				</div>
				<div class="row">
					<div class="col-md-10">
						<div class="form-group">
							<label class="control-label col-md-3">名字<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="name" name="name" placeholder="名字" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-user"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">性别<span class="required">*</span></label>
							<div class="col-md-9 col-sm-12 col-xs-12" id="sexDiv">
								<script type="text/javascript">getSelect('sex','sex','1002','${role.roleType}',true,'form-control','','sexDiv');
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">出生日期<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group col-md-12">
									<input id="birthday" name="birthday" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value=""/>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">学历<span class="required">*</span></label>
							<div class="col-md-9 col-sm-12 col-xs-12" id="educationalDiv">
								<script type="text/javascript">getSelect('educational','educational','2003','',true,'form-control','','educationalDiv');
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">学位<span class="required">*</span></label>
							<div class="col-md-9 col-sm-12 col-xs-12" id="degreeDiv">
								<script type="text/javascript">getSelect('degree','degree','2004','',true,'form-control','','degreeDiv');
								</script>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">身份证号<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="idCard" name="idCard" placeholder="身份证号" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-credit-card"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">职务<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="post" name="post" placeholder="职务" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">职称<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="title" name="title" placeholder="职称" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">电话<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="tel" name="tel" placeholder="电话" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-phone"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">部门<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="dept" name="dept" placeholder="部门" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-dedent"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">邮箱<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="email" name="email" placeholder="邮箱" maxlength="20" value="" />
									<span class="input-group-addon">
										<i class="fa fa-envelope"></i>
									</span>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-md-3">现从事专业<span class="required">*</span></label>
							<div class="col-md-9">
								<div class="input-group">    
									<input type="text" class="form-control" id="professional" name="professional" placeholder="现从事专业" maxlength="20" value="" />
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




var coreStaffValOpt = {
   		formId : "fmcorestaff",
   		formRoles : {
   						name: {
			                required: true
			            },
			            sex: {
			                required: true
			            },
			            post: {
			            	required: true
			            },
			            dept: {
			                required: true
			            }
   					},
   		formMessages: { 
   						name: {
			                required: "名字必须填写"
			            },
			            sex: {
			                required: "请选择性别"
			            },
			            post: {
			            	required: "职位必须填写"
			            },
			            dept: {
			            	required: "部门必须填写"
			            }
   					},
   		formCallBack: {
   					url:  "companyapply/createCoreStaff",	// 验证通过调用的后台连接
   					type: "POST",  
   					dataType: "json", 
   					success: function(ajaxResult)
   					{
   						// altConfirm(alt_param);							// 处理成功的回调
   						AjaxAnyWhere.handleResult(ajaxResult, handleSuccess);
   						
   					},
   					error: function(data)
   					{
   						bootbox.alert("添加企业核心人员失败");							// 处理失败的回调
   						return;
   					}
   		}
   		
   }

function coreStaffSubmit(){
	$("#fmcorestaff").submit();
}
// 处理成功回调方法
var handleSuccess = function ()
{
	// 关闭弹出层
	$corestaffModal.modal('hide');
	// 刷新核心人员列表
	DataGrid.__extQueryAll__(coreStaffOpt);
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
	 
	CommonFormVaildate.init(coreStaffValOpt);
});
</script>
