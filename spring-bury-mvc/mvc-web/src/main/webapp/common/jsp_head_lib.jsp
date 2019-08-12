<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
	String path = request.getContextPath();
%>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="<%=path%>/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>

<!-- END GLOBAL MANDATORY STYLES -->

<!-- BEGIN THEME STYLES -->
<!-- DOC: To use 'rounded corners' style just load 'components-rounded.css' stylesheet instead of 'components.css' in the below style tag -->
<link href="<%=path%>/assets/global/css/components-rounded.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/style/layout.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/style/themes/dark.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/select2/select2.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css"/>
<link href="<%=path%>/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css"/>



<link href="<%=path%>/style/page-info.css" rel="stylesheet" type="text/css"/>

<!-- 这里用来覆盖框架原有样式 -->
<link href="<%=path%>/style/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->


<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=path%>/assets/global/plugins/respond.min.js"></script>
<script src="<%=path%>/assets/global/plugins/excanvas.min.js"></script> 
<![endif]-->
<script src="<%=path%>/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<%=path%>/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery-validation/js/jquery.form.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui.min.js for drag & drop support -->
<script src="<%=path%>/assets/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script src="<%=path%>/assets/global/plugins/select2/select2.min.js"></script>
<script src="<%=path%>/assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>


<script src="<%=path%>/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script src="<%=path%>/assets/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>


<script src="<%=path%>/js/metronic.js" type="text/javascript"></script>
<script src="<%=path%>/js/layout.js" type="text/javascript"></script>
<script src="<%=path%>/js/bootbox.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN CUSTOM PLUGINS -->
<script type="text/javascript" src="<%=path%>/js/json2.js"></script>
<script type="text/javascript" src="<%=path%>/js/dataGrid.js"></script>
<script type="text/javascript" src="<%=path%>/js/paginator.js"></script>
<script type="text/javascript" src="<%=path%>/js/ajaxAnyWhere.js"></script>
<script type="text/javascript" src="<%=path%>/js/common.js"></script>
<script type="text/javascript" src="<%=path%>/js/formValidator.js"></script>
<script type="text/javascript" src="<%=path%>/js/selectUtil.js"></script>
<script type="text/javascript" src="<%=path%>/js/fixcode/fixcode.js"></script>
<script type="text/javascript" src="<%=path%>/js/fixcode/codeTranser.js"></script>
<!-- END CUSTOM PLUGINS -->

<!-- END JAVASCRIPTS -->




