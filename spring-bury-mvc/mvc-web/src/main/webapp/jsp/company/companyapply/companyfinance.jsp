<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<div class="tab-pane" id="tab_1">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<div class="portlet light bordered">
				<div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">工业总产值(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="industrialOutput" name="industrialOutput" value="${company.companyFinance.industrialOutput }" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">总收入(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="totalRevenue" name="totalRevenue" value="${company.companyFinance.totalRevenue}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">主营业务收入(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="mainProdIncome" name="mainProdIncome" value="${company.companyFinance.mainProdIncome}" />
								</div>
							</div>
						</div>
				  </div>
				  <div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">净利润(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="netProfit" name="netProfit" value="${company.companyFinance.netProfit}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">上缴税费总额(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="totalTaxes" name="totalTaxes" value="${company.companyFinance.totalTaxes}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">总资产(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="totalAssets" name="totalAssets" value="${company.companyFinance.totalAssets}" />
								</div>
							</div>
						</div>
				  </div>
				  <div class="row">
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">总负债(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="totalLiability" name="totalLiability" value="${company.companyFinance.totalLiability}" />
								</div>
							</div>
						</div>
					  <div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">净资产总额(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="totalNetAssets" name="totalNetAssets" value="${company.companyFinance.totalNetAssets}" />
								</div>
							</div>
						</div>
						<div class="col-md-6 col-lg-4">
							<div class="form-group">
								<label class="control-label col-md-3">企业R&D投入(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="rdPutin" name="rdPutin" value="${company.companyFinance.rdPutin}" />
								</div>
							</div>
						</div>
				  </div>
				  <div class="row">
					  <div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">高新技术转化的产品销售(服务)收入(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="highTechIncome" name="highTechIncome" value="${company.companyFinance.highTechIncome}" />
								</div>
							</div>
						</div>
					  
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">出口创汇(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="exports" name="exports" value="${company.companyFinance.exports}" />
								</div>
							</div>
						</div>
				  </div>
				  <div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">经由知识产权或专有技术转化的产品服务销售收入(万元)：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="0.00" id="intelPropIncome" name="intelPropIncome" value="${company.companyFinance.intelPropIncome}" />
								</div>
							</div>
						</div>
				  </div>
				  <div class="row">
					  <div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">开户银行：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<div id="accountBankDiv" class="input-group col-md-9 col-sm-12 col-xs-12">
										<script type="text/javascript">getSelect('accountBank','accountBank','2002','${company.companyFinance.accountBank}',true,'form-control','','accountBankDiv');</script>
									</div>
								</div>
							</div>
						</div>
					  <div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">开户账号：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="银行帐号" id="account" name="account" value="${company.companyFinance.account}" />
								</div>
							</div>
						</div>
						
				  </div>
				  <div class="row">
					  <div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">开户行地址：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="开户行地址" id="bankAddr" name="bankAddr" value="${company.companyFinance.bankAddr}" />
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">开户行联系电话：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<input type="text" class="form-control" placeholder="开户行电话" id="bankTel" name="bankTel" value="${company.companyFinance.bankTel}" />
								</div>
							</div>
						</div>
						
				  </div>
				</div>
			</div>
		</div>
	</div>
</div>