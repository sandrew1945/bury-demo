<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false"%>
<div class="tab-pane" id="tab_5">
	<div class="portlet light">
		<div class="portlet-body">
			<div class="form-body">
				<div class="portlet light bordered">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">投融资需求：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reqInvFin" name="reqInvFin">${company.companyReqRecord.reqInvFin}</textarea>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">技术需求：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reqTech" name="reqTech">${company.companyReqRecord.reqTech}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">人才需求：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reqTalent" name="reqTalent">${company.companyReqRecord.reqTalent}</textarea>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">设施、设备需求：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reqEquipment" name="reqEquipment">${company.companyReqRecord.reqEquipment}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">中介服务需求：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reqIntermediary" name="reqIntermediary">${company.companyReqRecord.reqIntermediary}</textarea>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="control-label col-md-3">其他需求：</label>
								<div class="input-group col-md-9 col-sm-12 col-xs-12">
									<textarea rows="7" cols="100" class="form-control" id="reqOther" name="reqOther">${company.companyReqRecord.reqOther}</textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>