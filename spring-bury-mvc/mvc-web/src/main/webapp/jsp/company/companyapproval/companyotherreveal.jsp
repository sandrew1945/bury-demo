<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tab-pane" id="tab_7">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">享受研究开发费用价计扣除减免税（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="developTaxRelief" name="developTaxRelief" value="${company.companyOther.developTaxRelief}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">享受高新技术企业减免税（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="highTechTaxRelief" name="highTechTaxRelief" value="${company.companyOther.highTechTaxRelief}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">企业近三年内有无安全生产或环境污染重大责任事故：</label>
								<div id="hasAccidentsDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('hasAccidents','hasAccidents','1003','${company.companyOther.hasAccidents}',true,'form-control','','hasAccidentsDiv');</script>
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">企业获得各级政府科技奖励情况：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reward" name="reward">${company.companyOther.reward}</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4 class="caption-subject bold" style="text-align:left">享受其它政策</h4>
				<!-- BEGIN OTHER DETAIL PORTLET -->
				<div class="portlet light bordered">
					<div class="portlet-title">
						
						<div class="actions">
							<a href="javascript:;" class="btn btn-circle btn-default btn-icon-only fullscreen"></a>
						</div>
					</div>
					<div class="portlet-body">


						<div class="scroller" style="height:100%" data-rail-visible="1" data-rail-color="yellow" data-handle-color="#a1b2bd">
							<div id="gridOtherDetail" class="table-responsive table-scrollable">
							<table id="myTable" class="table table-bordered table-condensed table-striped table-advance table-hover">
								<thead>
									<tr>
										<th style="text-align:center;" width="20%">政策名称</th>
										<th style="text-align:center;" width="10%">政策代码</th>
										<th style="text-align:center;" width="10%">免税金额(万元)</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${company.companyOtherDetails}" var="other">
									<tr class="odd gradeX" onclick="javascript:DataGrid.selectTheRrRadio(this)" ondblclick="javascript:DataGrid.checkYouSee(this)" style="">
										<td style="vertical-align: middle;">${other.policyName }</td>
										<td style="vertical-align: middle;">${other.policyCode }</td>
										<td style="vertical-align: middle;">${other.taxRelief}</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
							</div>
						</div>
					</div>
						
						
				</div>
				<!-- END OTHER DETAIL PORTLET-->
			</div>		
		</div>
	</div>
</div>
<script type="text/javascript">
</script>