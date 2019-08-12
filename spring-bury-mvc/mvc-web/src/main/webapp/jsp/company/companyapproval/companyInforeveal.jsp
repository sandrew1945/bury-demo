<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@page import="com.hexnology.stes.model.TmCompanySourcePO"%>
<%@page import="com.hexnology.stes.core.common.Constants"%>

<% 
	List companySources = (List)request.getAttribute("companySources");
%>
<div class="tab-pane active" id="tab_0">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="alert alert-danger display-hide" id="formErr">
				<button class="close" data-close="alert"></button>表单填写错误,请重新填写.
			</div>
			<div class="form-body">
				<div class="portlet light bordered">
				<h4 class="caption-subject bold">企业基本信息</h4>
				<br>
				<!-- 
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label col-md-3">企业年检情况：</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input readonly="true" type="text" class="form-control" placeholder="企业年检情况" id="" name="" value="" />
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label class="control-label col-md-3">认定企业编号：</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input readonly="true" type="text" class="form-control" placeholder="认定企业编号" value="${company.companyInfo.authCode}" />
							</div>
						</div>
					</div>
					
				</div>
				 -->
				<div class="row">
				  <div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">企业名称：</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input type="text" class="form-control" placeholder="认企业名称" id="companyName" name="companyName" value="${company.companyInfo.companyName}" />
							</div>
						</div>
					</div>
				  <div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">企业类型：</label>
							<div id="companyTypeDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
								<script type="text/javascript">getSelect('companyType','companyType','2014','${company.companyInfo.companyType}',true,'form-control','','companyTypeDiv');</script>
							</div>
						</div>
					</div>
				  <div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">信用等级：</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input type="text" class="form-control" placeholder="信用等级" id="creditRating" name="creditRating" value="${company.companyInfo.creditRating}" />
							</div>
						</div>
					</div>
			  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">五证合一号码：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="五证合一号码" id="fiveInOne" name="fiveInOne" value="${company.companyInfo.fiveInOne}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">组织机构代码：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="组织机构代码" id="orgCode" name="orgCode" value="${company.companyInfo.orgCode}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">税务登记号：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="税务登记号" id="taxRegCode" name="taxRegCode" value="${company.companyInfo.taxRegCode}" />
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">所属地区：</label>
								<div id="regionDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('region','region','2006','${company.companyInfo.region}',true,'form-control','','regionDiv');</script>
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">注册资金（万元）：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="regCapital" name="regCapital" value="${company.companyInfo.regCapital}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">工商注册时间：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input id="regDate" name="regDate" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${company.companyInfo.regDate}" pattern="yyyy-MM-dd"/>"/>
								</div>
							</div>
						</div>
				</div>
				<div class="row">
					<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">行业类别：</label>
								<div id="industryDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">SelectUtil.getIndustryList('industryId','industryId','${company.companyInfo.industryId}',true,'form-control','','industryDiv');</script>
								</div>
							</div>
					</div>
					<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">上级主管单位：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="上级主管单位" id="parentOrg" name="parentOrg" value="${company.companyInfo.parentOrg}" />
								</div>
							</div>
					</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">注册地址：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="注册地址" id="regAddr" name="regAddr" value="${company.companyInfo.regAddr}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">注册地邮编：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="注册地邮编" id="regZip" name="regZip" value="${company.companyInfo.regZip}" />
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">办公地址：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="办公地址" id="officeAddr" name="officeAddr" value="${company.companyInfo.officeAddr}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">办公地邮编：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="办公地邮编" id="officeZip" name="officeZip" value="${company.companyInfo.officeZip}" />
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">生产地址：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="生产地址" id="prodAddr" name="prodAddr" value="${company.companyInfo.prodAddr}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">生产地邮编：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="生产地邮编" id="prodZip" name="prodZip" value="${company.companyInfo.prodZip}" />
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">所在孵化器：</label>
								<div id="incubatorDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">SelectUtil.getIncubatorList('incubatorId','incubatorId','${company.companyInfo.incubatorId}',true,'form-control','','incubatorDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">所在工业园区：</label>
								<div id="industrialAreaDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">SelectUtil.getIndustrialAreaList('industrialAreaId','industrialAreaId','${company.companyInfo.industrialAreaId}',true,'form-control','','industrialAreaDiv');</script>
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">所属科技企业类型：</label>
								<div id="techCompanyTypeDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('techCompanyType','techCompanyType','2015','${company.companyInfo.techCompanyType}',true,'form-control','','techCompanyTypeDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">企业网址：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="企业网址" id="website" name="website" value="${company.companyInfo.website}" />
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">企业来源：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<!-- <input type="hidden" id="companySource" name="companySource" class="form-control select2" /> -->
										<select id="companySource" name="companySource" class="select2_category form-control" tabindex="1" placeholder="....">
										<option value="">-Option-</option>
										<optgroup label="本地企业">
											<c:forEach items="${companySources}" var="source">
												<c:if test="${source.sourceType == 20011001}">
										    		<option value="1">${source.sourceName}</option>
										    	</c:if>
										    </c:forEach>
									  	</optgroup>
										<optgroup label="引进企业">
											<c:forEach items="${companySources}" var="source">
												<c:if test="${source.sourceType == 20011002}">
										    		<option value="2">${source.sourceName}</option>
										    	</c:if>
									    	</c:forEach>
									  	</optgroup>
										</select>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">认定途径及方式：</label>
								<div id="certPathDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('certPath','certPath','2016','${company.companyInfo.certPath}',true,'form-control','','certPathDiv');</script>
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">高新技术认定企业：</label>
								<div id="isCertCompanyDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('isCertCompany','isCertCompany','1003','${company.companyInfo.isCertCompany}',true,'form-control','','isCertCompanyDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">高新技术企业认定编号：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="高新技术企业认定编号" id="authCode" name="authCode" value="${company.companyInfo.certCode}" />
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">主要产品(服务)名称：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="主要产品(服务)名称" id="mainProName" name="mainProName" value="${company.companyInfo.mainProName}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">主要产品(服务)所属技术领域：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<!-- <select id="proDomain" name="proDomain" class="select2_category form-control" tabindex="1">
									</select> -->
									<input type="text" id="proDomain" name="proDomain" value=" " class="form-control select2">
								</div>
							</div>
						</div>
				</div>
				<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">主要产品(服务)个数：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="mainProCount" name="mainProCount" value="${company.companyInfo.mainProCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">主要产品(服务)销售收入(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="mainProIncome" name="mainProIncome" value="${company.companyInfo.mainProIncome}" />
								</div>
							</div>
						</div>
				</div>
				</div>
				<div class="portlet light bordered">
				<h4 class="caption-subject bold">企业法定代表人</h4>
				<div class="portlet light bordered">
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">姓名：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="企业法定代表人姓名" id="corporate" name="corporate" value="${company.companyInfo.corporate}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">性别：</label>
								<div id="corporateSexDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('corporateSex','corporateSex','1002','${company.companyInfo.corporateSex}',true,'form-control','','corporateSexDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">出生日期：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input id="corporateBirthday" name="corporateBirthday" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${company.companyInfo.corporateBirthday}" pattern="yyyy-MM-dd"/>"/>
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">学历：</label>
								<div id="corporateEduDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('corporateEdu','corporateEdu','2003','${company.companyInfo.corporateEdu}',true,'form-control','','corporateEduDiv');</script>
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">移动电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="移动电话" id="corporateMobile" name="corporateMobile" value="${company.companyInfo.corporateMobile}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">固定电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="固定电话" id="corporateTel" name="corporateTel" value="${company.companyInfo.corporateTel}" />
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">身份证号：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="身份证号" id="corporateIdcard" name="corporateIdcard" value="${company.companyInfo.corporateIdcard}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">电子邮箱：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="电子邮箱" id="corporateEmail" name="corporateEmail" value="${company.companyInfo.corporateEmail}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">QQ：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="QQ" id="corporateQq" name="corporateQq" value="${company.companyInfo.corporateQq}" />
								</div>
							</div>
						</div>
				  </div>
				</div>
				<h4 class="caption-subject bold">企业负责人</h4>
				  <div class="portlet light bordered">
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">姓名：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="企业负责人姓名" id="principal" name="principal" value="${company.companyInfo.principal}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">性别：</label>
								<div id="principalSexDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('principalSex','principalSex','1002','${company.companyInfo.principalSex}',true,'form-control','','principalSexDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">出生日期：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input id="principalBirthday" name="principalBirthday" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${company.companyInfo.principalBirthday}" pattern="yyyy-MM-dd"/>"/>
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">学历：</label>
								<div id="principalEduDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('principalEdu','principalEdu','2003','${company.companyInfo.principalEdu}',true,'form-control','','principalEduDiv');</script>
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">移动电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="移动电话" id="principalMobile" name="principalMobile" value="${company.companyInfo.principalMobile}" />
								</div>
							</div>
					  </div>
					  <div class="col-md-6 col-lg-4">
						<div class="form-group">
							<label class="control-label col-md-3">固定电话：</label>
							<div class="input-group col-md-9 col-sm-12 col-xs-12">
								<input type="text" class="form-control" placeholder="固定电话" id="principalTel" name="principalTel" value="${company.companyInfo.principalTel}" />
							</div>
						</div>
					  </div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">身份证号：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="身份证号" id="principalIdcard" name="principalIdcard" value="${company.companyInfo.principalIdcard}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">电子邮箱：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="电子邮箱" id="principalEmail" name="principalEmail" value="${company.companyInfo.principalEmail}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">QQ：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="QQ" id="principalQq" name="principalQq" value="${company.companyInfo.principalQq}" />
								</div>
							</div>
						</div>
				  </div>
				</div>
				<h4 class="caption-subject bold">企业财务负责人</h4>
				  <div class="portlet light bordered">
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">姓名：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="企业财务负责人姓名" id="financial" name="financial" value="${company.companyInfo.financial}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">性别：</label>
								<div id="financialSexDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('financialSex','financialSex','1002','${company.companyInfo.financialSex}',true,'form-control','','financialSexDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">出生日期：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input id="financialBirthday" name="financialBirthday" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${company.companyInfo.financialBirthday}" pattern="yyyy-MM-dd"/>"/>
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">学历：</label>
								<div id="financialEduDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('financialEdu','financialEdu','2003','${company.companyInfo.financialEdu}',true,'form-control','','financialEduDiv');</script>
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">移动电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="移动电话" id="financialMobile" name="financialMobile" value="${company.companyInfo.financialMobile}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">固定电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="固定电话" id="financialTel" name="financialTel" value="${company.companyInfo.financialTel}" />
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">身份证号：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="身份证号" id="financialIdcard" name="financialIdcard" value="${company.companyInfo.financialIdcard}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">电子邮箱：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="电子邮箱" id="financialEmail" name="financialEmail" value="${company.companyInfo.financialEmail}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">QQ：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="QQ" id="financialQq" name="financialQq" value="${company.companyInfo.financialQq}" />
								</div>
							</div>
						</div>
				  </div>
				  </div>
				  <h4 class="caption-subject bold">企业联系人</h4>
				  <div class="portlet light bordered">
				  <div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">姓名：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="姓名" id="linkman" name="linkman" value="${company.companyInfo.linkman}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">性别：</label>
								<div id="linkmanSexDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('linkmanSex','linkmanSex','1002','${company.companyInfo.linkmanSex}',true,'form-control','','linkmanSexDiv');</script>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">出生日期：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input id="linkmanBirthday" name="linkmanBirthday" class="form-control form-control-inline date-picker" placeholder="yyyy-mm-dd" size="16" type="text" readonly="readonly" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${company.companyInfo.linkmanBirthday}" pattern="yyyy-MM-dd"/>"/>
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">学历：</label>
								<div id="linkmanEduDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
									<script type="text/javascript">getSelect('linkmanEdu','linkmanEdu','2003','${company.companyInfo.linkmanEdu}',true,'form-control','','linkmanEduDiv');</script>
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">移动电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="移动电话" id="linkmanMobile" name="linkmanMobile" value="${company.companyInfo.linkmanMobile}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">固定电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="固定电话" id="linkmanTel" name="linkmanTel" value="${company.companyInfo.linkmanTel}" />
								</div>
							</div>
						</div>
				  </div>
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">身份证号：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="身份证号" id="linkmanIdcard" name="linkmanIdcard" value="${company.companyInfo.linkmanIdcard}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">电子邮箱：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="电子邮箱" id="linkmanEmail" name="linkmanEmail" value="${company.companyInfo.linkmanEmail}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">QQ：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="QQ" id="linkmanQq" name="linkmanQq" value="${company.companyInfo.linkmanQq}" />
								</div>
							</div>
						</div>
				  </div>
					</div>
				</div>
				<h4 class="caption-subject bold">研发机构数量</h4>
				<div class="portlet light bordered">
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">重点实验室：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="mainLabCount" name="mainLabCount" value="${company.companyInfo.mainLabCount}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">工程中心：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="centerCount" name="centerCount" value="${company.companyInfo.centerCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">生产力促进中心：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="promoteCenterCount" name="promoteCenterCount" value="${company.companyInfo.promoteCenterCount}" />
								</div>
							</div>
						</div>
				  </div>
				  <div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">科技企业孵化器：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="incubatorCount" name="incubatorCount" value="${company.companyInfo.incubatorCount}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">企业技术中心：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="techCenterCount" name="techCenterCount" value="${company.companyInfo.techCenterCount}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">博士后工作站：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="pwsCount" name="pwsCount" value="${company.companyInfo.pwsCount}" />
								</div>
							</div>
						</div>
				  </div>
				  <div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">院士工作站：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0" id="awsCount" name="awsCount" value="${company.companyInfo.awsCount}" />
								</div>
							</div>
						</div>
					  
				  </div>
				</div>
				<h4 class="caption-subject bold">企业经营场所面积</h4>
				<div class="portlet light bordered">
				<div class="row">
					  <div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">自有面积(平方米)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="ownArea" name="ownArea" value="${company.companyInfo.ownArea}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">租赁面积(平方米)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="leaseArea" name="leaseArea" value="${company.companyInfo.leaseArea}" />
								</div>
							</div>
						</div>
						
				 </div>
				</div>
				<h4 class="caption-subject bold">企业简介(限500字)</h4>
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-12">
								<textarea rows="7" cols="100" class="form-control" id="userCode" name="userCode" placeholder="企业简介(限500字）" >${company.companyInfo.introduction}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
jQuery(document).ready(function() {
	// 
	$("#proDomain").select2({
		minimumResultsForSearch: Infinity,
		multiple:"multiple",
		initSelection: function (element, callback) {
			//callback([{"id":2,"text":"电子信息技术"}]);
			return $.ajax({
	            type: "POST",
	            url: "companyapply/getSelectedDomain",
	            dataType: 'json',
	            data: { companyId: "${company.companyInfo.companyId}"},
	            success: function(data){
	                //results: data.results;
	            }
	        }).done(function(data) { 
	            //console.log(data);
	            callback(data);
	        });
	  	},
		ajax: {
		    url: "companyapply/queryProDomain",
		    dataType: 'json',
		    results: function (data) {
	            var myResults = [];
	            $.each(data, function (index, item) {
	                myResults.push({
	                    'id': item.id,
	                    'text': item.text
	                });
	            });
	            return {
	                results: myResults
	            };
	        },
		    cache: true
		  }
	});
});

</script>
