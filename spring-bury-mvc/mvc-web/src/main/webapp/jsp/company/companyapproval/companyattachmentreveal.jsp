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
								<div id="pageAttachments" class="alert alert-warning" style="margin-top: 15px; display: none;" align="center">没有满足条件的数据</div>
								<div id="gridAttachments" class="table-responsive table-scrollable">
								<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
								<thead>
								<tr>
									<th style="text-align:center;" width="40%">附件名称</th>
									<th style="text-align:center;" width="30%">路径</th>
									<th style="text-align:center;" width="25%">操作</th>
								</tr>
								</thead>
								<tbody>
									<c:forEach items="${company.companyAttachments}" var="attachment">
									<tr class="odd gradeX"  style="">
									<td style="vertical-align: middle;">${attachment.typeName }</td>
									<td style="vertical-align: middle;">
										<c:choose>
										    <c:when test="${attachment.path==null}">
										     	未上传文件
										    </c:when>
										    <c:otherwise>
										        ${attachment.path}
										    </c:otherwise>
										</c:choose>
									</td>
									<td style="vertical-align: middle;">
									    <c:if test="${attachment.path!=null}">
									    	<a class="btn default btn blue" href="javascript:void(0)" onclick="showAttachment(${attachment.companyAttachmentId})"><i class="fa fa-eye"></i> 查看</a>
									    </c:if>
									</td>
									</tr>
									</c:forEach>
								</tbody>
								</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
	<!-- 查看附件modal -->
<div class="modal fade container" id="showattachment-modal">
<script type="text/javascript">
	function showAttachment(attachmentId)
	{
		var $showAttachmentModal = $("#showattachment-modal");
		$showAttachmentModal.load('jsp/company/companyapproval/modals/showattachmentmodal.jsp', '', function(){
			$showAttachmentModal.modal();
			$("#pdfWindow").attr("src", "companyapply/showAttachment?attachmentId="+attachmentId);
		});
	}
</script>