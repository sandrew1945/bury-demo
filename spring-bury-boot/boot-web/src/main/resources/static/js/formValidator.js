	/**
	 * 	表单验证公共方法
	 * 
	 * 	 使用示例
	 *   先定义一个formOption变量，formOption格式如下：
     *   var formOption = {
     *   		formId : "fmid",
     *   		formRoles : {
     *   					  bcType: { required: true },   // 需要验证的控件name及规则
     *   					  bcName: { required: true }    // 需要验证的控件name及规则
     *   					},
     *   		formMessages: { 
     *   					bcType: { required: "不可以为空" },		// 验证的控件的name及错误提示
     *   					bcName: { required: "不可以为空" }		// 验证的控件的name及错误提示
     *   					},
     *   		formCallBack: {
     *   					url:  "businesscodemg/createBusinessCode.action",	// 验证成功后调用的地址
     *   					type: "POST",  
     *   					dataType: "json", 
     *   					success: function(msg)
     *   					{
     *   						altConfirm(alt_param);							// 执行成功，处理执行成功的方法
     *   					},
     *   					error: function(data)
     *   					{
     *   						alertError("处理失败!");							// 执行失败，处理执行失败的方法
     *   						return;
     *   					}
     *   		}
     *   		
     *   }
     *   
     *   
     *   jQuery(document).ready(function() {
     *   
     *   	CommonFormVaildate.init(formOption);
     *   	
     *   });
	 */
	var CommonFormVaildate = function () {
		var commonFormValidation = function(formOption) {
	    	var fm = $('#'+formOption.formId);
	        var error = $('#formErr', fm);
	        var success = $('.alert-success', fm);
	        fm.validate({
				errorElement: 'span', 
				errorClass: 'help-block', 
				focusInvalid: false, 
				ignore: "",
				rules: formOption.formRoles,
				messages: formOption.formMessages,
				invalidHandler: function (event, validator) {
					success.hide();
					error.show();
					//App.scrollTo(error, -200);
				},
				highlight: function (element) {
					$(element).closest('.form-group').addClass('has-error');
				},
				unhighlight: function (element) {
					$(element).closest('.form-group').removeClass('has-error');
				},
				success: function (label) {
					label.closest('.form-group').removeClass('has-error');
				},
		        submitHandler: function (form) {
		            success.show();
		            error.hide();
					$(form).ajaxSubmit(formOption.formCallBack);
					return false;
				}
			});
		}
		var handleWysihtml5 = function() {
	        if (!jQuery().wysihtml5) {
	            return;
	        }
	        if ($('.wysihtml5').size() > 0) {
	            $('.wysihtml5').wysihtml5({
	                "stylesheets": ["<%=path%>/assets/global/plugins/bootstrap-wysihtml5/wysiwyg-color.css" ]
								});
			}
		}
		return {
			init : function(formOption) {
				handleWysihtml5();
				commonFormValidation(formOption);
			}
		};
	}();
