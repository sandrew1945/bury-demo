<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane" id="tab_8">
	<div class="portlet light">
		<div class="portlet-body">
			<form action="#" id="fmpritechdetail" name="fmpritechdetail" class="form-horizontal" method="post">
				<div class="form-body">
					<div class="portlet light bordered">
						<div class="portlet-title">
							<div class="caption font-grey-gallery">
								
								<span class="caption-subject bold">附件信息</span>
							</div>
						</div>
						<div class="portlet-body">
							<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
								<div id="pageAttachments" class="alert alert-warning" style="margin-top:15px;" align='center'>没有满足条件的数据</div>
								<div id="gridAttachments" class="table-responsive table-scrollable"></div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	/**
	 *    附件列表 start
	 */
	var companyAttachmentOpt =
	{
		 url:"companyapply/queryCompanyAttachments",
		 choiceType:null,
		 formId:"fm",
		 gridId:"gridAttachments",
		 blankId:"pageAttachments",
		 columns : [
			{header: "序号", width: "5%", renderer:DataGrid.getIndex},//设置序号的方式
			{header: "附件名称", width: "40%", dataIndex: "typeName"},
			{header: "路径", width: "30%", dataIndex: "path", renderer: hasAttachment},
			{header: "操作", width: "25%", dataIndex: "companyAttachmentId", renderer: attaOptLink}
		]
	};
	
	var $attachmentModal = $("#attachment-modal");
	
	var $showAttachmentModal = $("#showattachment-modal");
	
	function showAttachment(attachmentId)
	{
		$showAttachmentModal.load('jsp/company/companyapply/modals/showattachmentmodal.jsp', '', function(){
			$showAttachmentModal.modal();
			$("#pdfWindow").attr("src", "companyapply/showAttachment?attachmentId="+attachmentId);
		});
	}
	function showAddAttachment(attachmentTypeId)
	{
		if (browserCfg.ie) {
			bootbox.confirm("IE浏览器无法验证文件大小，请确保上传附件小于10M?", function(result){
				if(result)
				{
					$attachmentModal.load('jsp/company/companyapply/modals/addattachmentsmodal.jsp?attachmentTypeId='+attachmentTypeId, '', function(){
						$attachmentModal.modal();
						$("#attachmentType").val(attachmentTypeId);
					});
				}
			});
		}
		else
		{
			$attachmentModal.load('jsp/company/companyapply/modals/addattachmentsmodal.jsp?attachmentTypeId='+attachmentTypeId, '', function(){
				$attachmentModal.modal();
				$("#attachmentType").val(attachmentTypeId);
			});
		}
	}
	function hasAttachment(value,metaDate,record){
		if(""==value)
		{
			return "未上传文件";
		}
		else
		{
			return value;
		}
	}
	function attaOptLink(value,metaDate,record){
		var hide = "";
		if(""==value)
		{
			hide = "hide";
		}
		var link = "";
	    var modifyFlag = ${company.companyInfo.companyStatus!=20071002};
	    if(modifyFlag)
	    {
			link = "<a class=\"btn default btn blue \" href=\"javascript:void(0)\" onclick=\"showAddAttachment("+record.data.attachmentTypeId+")\"><i class=\"fa fa-file-pdf-o\"></i> 上传文件</a>" +
				   "<a class=\"btn default btn blue "+hide+ "\" href=\"javascript:void(0)\" onclick=\"showAttachment("+value+")\"><i class=\"fa fa-eye\"></i> 查看</a>" + 
		           "<a class=\"btn default btn black "+hide+ "\" href=\"javascript:void(0)\" onclick=\"deleteAttachment("+value+")\"><i class=\"fa fa-trash-o\"></i> 删除</a>";
	    }
	   else{
		   link = "<a class=\"btn default btn blue "+hide+"\" href=\"javascript:void(0)\" onclick=\"showAttachment("+value+")\"><i class=\"fa fa-eye\"></i> 查看</a>";
	   }
	    return link;
	}
	function deleteAttachment(attachmentId){
		bootbox.confirm("是否删该附件?", function(result){
			if(result)
			{
				AjaxAnyWhere.sendRequestByData("companyapply/deleteCompanyAttachment","attachmentId="+attachmentId, deleteAttachmentCallback);
			}
		});
	}
	function deleteAttachmentCallback(ajaxResult)
	{
		AjaxAnyWhere.handleResult(ajaxResult, function(){
			DataGrid.__extQueryAll__(companyAttachmentOpt);
		});
	}
	/**
	 *    附件列表 end
	 */
	 

	var  browserCfg = {};
	var ua = window.navigator.userAgent;
	if (ua.indexOf("MSIE")>=1)
	{
		browserCfg.ie = true;
	}
	else if(ua.indexOf("Firefox")>=1)
	{
		browserCfg.firefox = true;
	}
	else if(ua.indexOf("Chrome")>=1)
	{
		browserCfg.chrome = true;
	}

</script>