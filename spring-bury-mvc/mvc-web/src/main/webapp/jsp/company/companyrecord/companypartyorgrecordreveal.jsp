<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="tab-pane" id="tab_6">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<h4 class="caption-subject bold">1、企业法人情况</h4>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">是否党员:</label>
								<div id="isPartyDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isParty','isParty','1003','${company.companyPartyOrgRecord.isParty}',true,'form-control','','isPartyDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">是否兼任党组织书记:</label>
								<div id="isPartySecDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isPartySec','isPartySec','1003','${company.companyPartyOrgRecord.isPartySec}',true,'form-control','','isPartySecDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">是否担任区县级以上(含区县)"两代表一委员":</label>
								<div id="isRomDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isRom','isRom','1003','${company.companyPartyOrgRecord.isRom}',true,'form-control','','isRomDiv');</script>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<h4 class="caption-subject bold">2、党组织设置情况</h4>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">是否建立党组织:</label>
								<div id="hasOrgDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('hasOrg','hasOrg','1003','${company.companyPartyOrgRecord.hasOrg}',true,'form-control','','hasOrgDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党组织成立时间:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input id="orgDate" name="orgDate" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${company.companyPartyOrgRecord.orgDate}" pattern="yyyy-MM-dd"/>" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党组织组建形式:</label>
								<div id="orgFormDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('orgForm','orgForm','2008','${company.companyPartyOrgRecord.orgForm}',true,'form-control','','orgFormDiv');</script>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党组织类别:</label>
								<div id="orgTypeDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('orgType','orgType','2009','${company.companyPartyOrgRecord.orgType}',true,'form-control','','orgTypeDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">上一级党组织名称:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="" id="parentOrgName" name="parentOrgName" value="${company.companyPartyOrgRecord.parentOrgName}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党组织书记姓名:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="" id="orgSecName" name="orgSecName" value="${company.companyPartyOrgRecord.orgSecName}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">专职党务工作者:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="" id="ftWorker" name="ftWorker" value="${company.companyPartyOrgRecord.ftWorker}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">未建党组织的是否选派党建工作指导员:</label>
								<div id="hasGuiderDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('hasGuider','hasGuider','1003','${company.companyPartyOrgRecord.hasGuider}',true,'form-control','','hasGuiderDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党组织联系电话:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="" id="contactTel" name="contactTel" value="${company.companyPartyOrgRecord.contactTel}" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4 class="caption-subject bold">3、群团部门设置情况</h4>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">建立何种群团组织:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<div id="groupTypeDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
										<script type="text/javascript">getSelect('groupType','groupType','2010','${company.companyPartyOrgRecord.groupType}',true,'form-control','','groupTypeDiv');</script>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4 class="caption-subject bold">4、党员队伍建设情况</h4>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党员总数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="partyMemberCount" name="partyMemberCount" value="${company.companyPartyOrgRecord.partyMemberCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">（ 其中35岁以下党员数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="underThirtyFive" name="underThirtyFive" value="${company.companyPartyOrgRecord.underThirtyFive}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">中层管理人员党员数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="midMngCount" name="midMngCount" value="${company.companyPartyOrgRecord.midMngCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">中高级专业技术人员党员数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="techStaffCount" name="techStaffCount" value="${company.companyPartyOrgRecord.techStaffCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">生产经营一线职工党员数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="basicLevelCount" name="basicLevelCount" value="${company.companyPartyOrgRecord.basicLevelCount}" />
								</div> 
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">）  近三年新发展党员数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="newMemberCount" name="newMemberCount" value="${company.companyPartyOrgRecord.newMemberCount}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">近三年处置不合格党员数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="unqualifiedCount" name="unqualifiedCount" value="${company.companyPartyOrgRecord.unqualifiedCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">是否每年对党员轮训一遍:</label>
								<div id="isRotationDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isRotation','isRotation','1003','${company.companyPartyOrgRecord.isRotation}',true,'form-control','','isRotationDiv');</script>
								</div>
							</div>
						</div>
					</div>
				</div>
				<h4 class="caption-subject bold">5、落实相关制度情况</h4>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">每季度召开一次党员大会的党支部数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="branchPerQuarter" name="branchPerQuarter" value="${company.companyPartyOrgRecord.branchPerQuarter}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">每月召开一次支部委员会的党支部数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="branchPerMonth" name="branchPerMonth" value="${company.companyPartyOrgRecord.branchPerMonth}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">每月召开1-2次党小组会的党支部数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="branchPerTwoWeeks" name="branchPerTwoWeeks" value="${company.companyPartyOrgRecord.branchPerTwoWeeks}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">每年组织党员听1-2次党课的党支部数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="branchPerYear" name="branchPerYear" value="${company.companyPartyOrgRecord.branchPerYear}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">每季度或每半年至少召开一次组织生活会的党支部数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="branchPerHalfYear" name="branchPerHalfYear" value="${company.companyPartyOrgRecord.branchPerHalfYear}" />
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">每年开展民主评议党员的党支部数:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="branchDemocracyPerYear" name="branchDemocracyPerYear" value="${company.companyPartyOrgRecord.branchDemocracyPerYear}" />
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党组织最近一次换届时间:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input id="orgChangeDate" name="orgChangeDate" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${company.companyPartyOrgRecord.orgChangeDate}" pattern="yyyy-MM-dd"/>"/>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党员组织关系是否及时转接:</label>
								<div id="isTimelyTransDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isTimelyTrans','isTimelyTrans','1003','${company.companyPartyOrgRecord.isTimelyTrans}',true,'form-control','','isTimelyTransDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党员是否按时足额主动交纳党费:</label>
								<div id="isTimelyPaymentDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isTimelyPayment','isTimelyPayment','1003','${company.companyPartyOrgRecord.isTimelyPayment}',true,'form-control','','isTimelyPaymentDiv');</script>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党建工作经费是否纳入企业年度预算:</label>
								<div id="isInAnnBudDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isInAnnBud','isInAnnBud','1003','${company.companyPartyOrgRecord.isInAnnBud}',true,'form-control','','isInAnnBudDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">党员是否有单独的活动场所:</label>
								<div id="hasActAreaDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('hasActArea','hasActArea','1003','${company.companyPartyOrgRecord.hasActArea}',true,'form-control','','hasActAreaDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6  col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">如果否，在什么场所以什么方式活动:</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="" id="actArea" name="actArea" value="${company.companyPartyOrgRecord.actArea}" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>