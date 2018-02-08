
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 总代给下级充值页面 -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
<style type="text/css">		
		#publicAccount{
			background-color: white !important;
		}
		#cashPledge{
			background-color: white !important;
		}
		#hardwareAccount{
			background-color: white !important;
		}
		#minaAccount{
			background-color: white !important;
		}
		#vipAccount{
			background-color: white !important;
		}
	</style>
</head>
<body>
	<div class="row divControl">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<h3 class="cardTitle">代理商充值</h3>
					<hr class="m-t-0 m-b-40">
					<form action="${ctx}/agentSystem/SysUser/getAgentRecharge" method="post" style="width: 100%" id="refreshAgentForm">
					<input type="hidden" value="" id="id" name="id"> 
						<div class="form-body">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">账号：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" value="${agent.login_name}"
												readonly="readonly">
										</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">公司全称：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" value="${fn:escapeXml(agent.companyName)}" id="company"
												readonly="readonly">
										</div>
									</div>
								</div>
							</div>


							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">套餐折扣：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control height-control rightAngle" value="${agent.packageDiscount}" readonly>
												<span class="input-group-addon height-control leftAngle">折</span>
											</div>
										</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">公众号折扣：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control height-control rightAngle" value="${agent.publicDiscount}" readonly>
												<span class="input-group-addon height-control leftAngle">折</span>
											</div>
										</div>
									</div>
								</div>
								<!--/span-->
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">小程序折扣：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control height-control rightAngle" value="${agent.minaDiscount}" readonly>
												<span class="input-group-addon height-control leftAngle">折</span>
											</div>
										</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">所属上级：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" value="${fn:escapeXml(agent.companyParent.companyName)}"
												readonly="readonly">
										</div>
									</div>
								</div>

								<!--/span-->
							</div>
							<!--/row-->


							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">代理商等级：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" value="${fn:escapeXml(agent.agentLevel)}"
												readonly="readonly">
										</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">客户等级：</label>
										<div class="col-md-9">
											<c:if test="${agent.customerLevel == 1}">
												<input type="text" class="form-control" value="VIP用户" readonly>	
											</c:if>
											<c:if test="${agent.customerLevel == 0 }">
												<input type="text" class="form-control" value="普通用户" readonly>
											</c:if> 
										</div>
									</div>
								</div>



								<!--/span-->
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">时间范围：</label>
										<div class="col-md-9">
											<div class="input-daterange input-group" id="date-range">
												<input type="text" class="form-control height-control rightAngle" name="start"
													value="<fmt:formatDate value="${agent.startDate}" pattern="yyyy-MM-dd"/>" readonly> <span
													class="input-group-addon bg-info b-0 text-white height-control addCentreControl">至</span> <input
													type="text" class="form-control height-control leftAngle" name="end"
													value="<fmt:formatDate value="${agent.endDate}" pattern="yyyy-MM-dd"/>" readonly>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">平台押金：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control rightAngle" value="${agent.cashPledge}${'元'}" id="cashPledge"
													readonly="readonly"> 
													 <button type="button" class="btn waves-effect waves-light btn-info leftAngle" onclick="showcashPledgeModal('${agent.id}')"> 充值
                                                      </button>
											</div>

										</div>
									</div>
								</div>

							
							</div>

							<div class="row">


								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">公众号余额：</label>
										<div class="col-md-9">

											<div class="input-group">
												<input type="text" class="form-control rightAngle" value="${agent.publicAccount}${'元'}" id="publicAccount"
													readonly="readonly">
													<button type="button" class="btn waves-effect waves-light btn-info leftAngle" onclick="showAccountModal('${agent.id}','publicAccount')"> 充值
                                                      </button>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">硬件余额：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control rightAngle" value="${agent.hardwareAccount}${'元'}" id="hardwareAccount"
													readonly="readonly">
													<button type="button" class="btn waves-effect waves-light btn-info leftAngle" onclick="showAccountModal('${agent.id}','hardwareAccount')"> 充值
                                                      </button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--/row-->
							<div class="row">


								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">小程序余额：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control rightAngle" value="${agent.minaAccount}${'元'}" id="minaAccount"
													readonly="readonly"> 
													<button type="button" class="btn waves-effect waves-light btn-info leftAngle" onclick="showAccountModal('${agent.id}','minaAccount')"> 充值
                                                      </button>
											</div>
										</div>
									</div>
								</div>

								<div class="col-md-6">
									<div class="form-group row">
										<label class="col-3 col-form-label">VIP余额：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control rightAngle" value="${agent.vipAccount}${'元'}" id="vipAccount"
													readonly="readonly"> 
													<button type="button" class="btn waves-effect waves-light btn-info leftAngle" onclick="showVipModal('${agent.id}')"> 充值
                                                      </button>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="form-group row">
							<label class="col-3 col-form-label"></label>
							<div class="col-9">
								<div class="text-xs-right" style="text-align: right;">
									<button type="button" class="btn btn-default" onclick="jump()">返回</button>
								</div>
							</div>
						</div>
						
					
					</form>
				</div>

			</div>
		</div>
	</div>
	<!-- 模态框 -->

<div class="modal fade" id="cashPledgeModal" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 530px;">
            <div class="modal-header" style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
            <label class="modal-title" id="exampleModalLabel" style="font-size: 14px">押金账户充值</label>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <form id="cashPledgeForm">
                 <input type="hidden" value="" id="agentId" name="id"> 
                    <div class="form-group row">
                        <label for="recipient" class="col-4 col-form-label">公司名称：</label>
                        <div class="col-7">
                            <input type="text" class="form-control" id="companyName"  value="" readonly>
                        </div>
                    </div>
                    <div class="form-group row" id="hardwarerow">
                        <label for="recipient" class="col-4 col-form-label" >您的硬件账户扣款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle expendCash"   name="hardwareAccount" id="harewareVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            <span id="hardwareBalance" style="font-size:13px"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="publicrow">
                        <label for="recipient" class="col-4 col-form-label" >您的公众号账户扣款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle expendCash"   name="publicAccount" id="publicVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>       
                            <span id="publicBalance" style="font-size:13px"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="minarow">
                        <label for="recipient" class="col-4 col-form-label">您的小程序账户扣款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle expendCash"   name="minaAccount" id="minaVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            <span id="minaBalance" style="font-size:13px"></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="viprow">
                        <label for="recipient" class="col-4 col-form-label">您的VIP账户扣款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle expendCash"  name="vipAccount"  id="vipVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            <span id="vipBalance" style="font-size:13px"></span>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" >
                        <label for="recipient" class="col-4 col-form-label">备注：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <textarea class="form-control" style="word-break: break-all;" spellcheck="false" name="remarks" id="cashPledgeRemark" spellcheck="false" maxlength="50"></textarea>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
	                	<div class="col-11" >
	                		<div style="float: right; font-size:13px">您的账户扣款总额：<span id="totalcashPledgeMoney"></span>元</div>
	                	</div>
	                </div>
                </form>
            </div>
            
            <div class="modal-footer" style="text-align: right; background-color: #f4f5f9; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
                <button type="button" class="btn waves-effect waves-light btn-info" onclick="rechargeCashPledge()">确认</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="accountModal" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="margin-top: 120px;width:530px">
            <div class="modal-header" style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
            <label class="modal-title" id="accountTitle" style="font-size: 14px"></label>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <form id="accountForm">
                 <input type="hidden" value="" id="userId" name="id"> 
                 <input type="hidden" value="" id="sign" name="sign"> 
                    <div class="form-group row">
                        <label for="recipient" class="col-4 col-form-label">公司名称：</label>
                        <div class="col-7">
                            <input type="text" class="form-control" id="companyAccount"  value="" readonly>
                        </div>
                    </div>
                    <div class="form-group row" id="accountCharge">
                        <label for="recipient" class="col-4 col-form-label" id="recipient"></label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group" >
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle expendAccount"   name="price" id="price" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>                           
                            <span id="currentMoney" style="font-size:13px"></span>
                            </div>
                        </div>
                    </div>       
                
                    <div class="form-group row" id="vipCharge">
                        <label for="recipient" class="col-4 col-form-label">您的VIP账户扣款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle expendAccount"  name="vipAccount"  id="vipAccountCharge" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            <span id="vipMoney" style="font-size:13px"></span>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" >
                        <label for="recipient" class="col-4 col-form-label">备注：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <textarea class="form-control"  style="word-break: break-all;" name="remarks" id="accountRemarks" spellcheck="false" maxlength="50"></textarea>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
	                	<div class="col-11" >
	                		<div style="float: right; font-size:13px">您的账户扣款总额：<span id="totalAccountMoney"></span>元</div>
	                	</div>
	                </div>
                </form>
            </div>
            
            <div class="modal-footer" style="text-align: right; background-color: #f4f5f9; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
                <button type="button" class="btn waves-effect waves-light btn-info" onclick="saveAccount()">确认</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="vipModal" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="margin-top: 150px;">
            <div class="modal-header" style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
            <label class="modal-title" style="font-size: 14px">VIP账户充值</label>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <form id="vipForm">
                 <input type="hidden" value="" id="Id" name="id"> 
                    <div class="form-group row">
                        <label for="recipient" class="col-4 col-form-label" >公司名称：</label>
                        <div class="col-7">
                            <input type="text" class="form-control" id="name"  value="" readonly>
                        </div>
                    </div>
                     
                    <div class="form-group row" >
                        <label for="recipient" class="col-4 col-form-label"><span style='color: red'>*&nbsp;</span>您的VIP账户扣款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control rightAngle"  name="vipAccount"  id="vipChargeMoney" maxlength="9">
                                <span class="input-group-addon leftAngle">元</span>
                            </div>
                            <span id="vipAccountMoney" style="font-size:13px"></span>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" >
                        <label for="recipient" class="col-4 col-form-label">备注：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <textarea class="form-control" style="word-break: break-all;" name="remarks" id="vipRemarks" spellcheck="false" maxlength="50"></textarea>
                            </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <div class="modal-footer" style="text-align: right; background-color: #f4f5f9; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
                <button type="button" class="btn waves-effect waves-light btn-info" onclick="saveVipAccount()">确认</button>
            </div>
        </div>
    </div>
</div>
	<script type="text/javascript">
	
		$("document").ready(function() {
			//表单验证
			$("#cashPledgeForm").validate(
				{
					rules : {
						hardwareAccount:{
							required: true,
							number: true,
							
							minNumber: $("#harewareVal").val(),
							range: [0,'${genAgent.hardwareAccount}']
						},			
						publicAccount:{
							required: true,
							number: true,
							
							minNumber: $("#publicVal").val(),
							range: [0,'${genAgent.publicAccount}']
						},
						minaAccount:{
							required: true,
							number: true,
							
							minNumber: $("#minaVal").val(),
							range: [0,'${genAgent.minaAccount}']
						},
						vipAccount :{
							required: true,
							number: true,
							
							minNumber: $("#vipVal").val(),
							range: [0,'${genAgent.vipAccount}']
						},
					},
					
					//错误信息提示
					messages:{
						hardwareAccount:{
							required: "请填写扣款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到${genAgent.hardwareAccount}之间的金额范围"
						},
						publicAccount:{
							required: "请填写扣款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到${genAgent.publicAccount}之间的金额范围"
						},
						minaAccount:{
							required: "请填写扣款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到${genAgent.minaAccount}之间的金额范围"
						},
						vipAccount:{
							required: "请填写扣款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到${genAgent.vipAccount}之间的金额范围"
						},
					},
					errorPlacement : function(error, element) {	
		            	error.insertAfter( element.parent().parent()); 		            	         
					}
				});
			 jQuery.validator.addMethod("minNumber",function(value, element){
		            var returnVal = true;
		            inputZ=value;
		            var ArrMen= inputZ.split(".");    //截取字符串
		            if(ArrMen.length==2){
		                if(ArrMen[1].length>2){    //判断小数点后面的字符串长度
		                    returnVal = false;
		                    return false;
		                }
		            }
		            return returnVal;
		        },"小数点后最多为两位");
			 
			 $("#accountForm").validate(
						{
							rules : {
								 price:{
									required: true,
									number: true,
									minNumber: $("#price").val(),
									
								},	 	
								vipAccount :{
									required: true,
									number: true,
									minNumber: $("#vipVal").val(),
									range: [0,'${genAgent.vipAccount}']
								},
							},
							
							//错误信息提示
							messages:{
								price:{
									required: "请填写扣款金额",
									number: "请正确输入金额",
									length: "输入数字最多小数点后两位"
								},
								vipAccount:{
									required: "请填写扣款金额",
									number: "请正确输入金额",
									length: "输入数字最多小数点后两位",
									range: "请输入0到${genAgent.vipAccount}之间的金额范围"
								},
							},
							errorPlacement : function(error, element) {	
				            	error.insertAfter( element.parent().parent()); 		            	         
							}
						});
			 $("#vipForm").validate(
						{
							rules : { 	
								vipAccount :{
									required: true,
									number: true,
									minNumber: $("#vipVal").val(),
									range: [0.01,'${genAgent.vipAccount}']
								},
							},
							
							//错误信息提示
							messages:{
								vipAccount:{
									required: "请填写扣款金额",
									number: "请正确输入金额",
									length: "输入数字最多小数点后两位",
									range: "请输入0.01到${genAgent.vipAccount}之间的金额范围"
								},
							},
							errorPlacement : function(error, element) {	
				            	error.insertAfter( element.parent().parent()); 		            	         
							}
						});
	        
		});
		

		function showcashPledgeModal(agentId) {
			$("#cashPledgeForm").data("validator").resetForm();
			document.getElementById("cashPledgeForm").reset();
			$("#totalcashPledgeMoney").html(0);
			$("#agentId").val(agentId);
			$("#hardwarerow").show();
			$("#publicrow").show();
			$("#minarow").show();
			$("#viprow").show();
			$("#companyName").val($("#company").val());
			$("#hardwareBalance").text("您的硬件账户余额为"+'${genAgent.hardwareAccount}'+"元");
			$("#publicBalance").text("您的公众号账户余额为"+'${genAgent.publicAccount}'+"元");
			$("#minaBalance").text("您的小程序账户余额为"+'${genAgent.minaAccount}'+"元");
			$("#vipBalance").text("您的VIP账户余额为"+'${genAgent.vipAccount}'+"元");
			if(Number('${genAgent.hardwareAccount}') == 0 ){
				$("#harewareVal").rules("remove","range");
				$("#harewareVal").rules("add",{
					range: [0,0],
					messages : {  
                         range  : "您的硬件账户余额为0元,请先充值", 
                     } 
				});
			}
			if(Number('${genAgent.publicAccount}') == 0 ){
				$("#publicVal").rules("remove","range");
				$("#publicVal").rules("add",{
					range: [0,0],
					messages : {  
                         range  : "您的公众号账户余额为0元,请先充值", 
                     } 
				});
			}
			if(Number('${genAgent.minaAccount}') == 0 ){
				$("#minaVal").rules("remove","range");
				$("#minaVal").rules("add",{
					range: [0,0],
					messages : {  
                         range  : "您的小程序账户余额为0元,请先充值", 
                     } 
				});
			}
			if(Number('${genAgent.vipAccount}') == 0 ){
				$("#vipVal").rules("remove","range");
				$("#vipVal").rules("add",{
					range: [0,0],
					messages : {  
                         range  : "您的VIP账户余额为0元,请先充值", 
                     } 
				});
			}
			$("#cashPledgeModal").modal("show");
		
		}
		$('.expendCash').bind('input propertychange', function() {
			var total=0;
			$('.expendCash').each(
				function(){
					if(!isNaN(this.value)){
						total+=Number(this.value);
					}
			});
			$('#totalcashPledgeMoney').html(total.toFixed(2));
		});
		function rechargeCashPledge() {
			$("#id").val('${agent.id}');
			var isValid = $("#cashPledgeForm").valid();
			if(isValid) {
				var flag;
				if($("#harewareVal").val() == 0 && $("#publicVal").val() == 0 && $("#minaVal").val() == 0 && $("#vipVal").val() == 0) {
					flag = false;
					layer.msg("您还未输入一个非0的充值金额",{icon:7,time:1500});
				}else {
					flag = true;
				}
			}
			if(isValid && flag) {
				var locked = false;
				layer.confirm('是否确认充值?', {
					closeBtn : 0,
					skin : 'layui-layer-molv',
					icon : 3,
					btn : [ '确认', '取消' ]
				//按钮
				},function() {
					if(!locked) {
						locked = true;
						var index = layer.load(1, {shade: [0.1,'#fff']});
						$.ajax({
							url : "${ctx}/agentSystem/SysUser/updateCashPledgeAccount",
							type : "post",
							dataType : "json",
							data : $('#cashPledgeForm').serialize(),
							success : function(result) {
								if (result == 1) {
									layer.close(index);
									$("#cashPledgeModal").modal("hide");
									layer.msg("充值成功！", {
										icon : 1,
										time : 1000
									});
									setTimeout("sumbitForm()",1000);
								} else {
									$("#cashPledgeModal").modal("hide");
									layer.msg("充值失败！", {
										icon : 1,
										time : 1000
									});
								}
							}
						});
					}
				
				});
			}
		}
		
		function showAccountModal(agentId,sign) {
			$("#accountForm").data("validator").resetForm();
			document.getElementById("accountForm").reset();
			$("#totalAccountMoney").html(0);
			$("#accountCharge").show();
			$("#vipCharge").show();
			$("#userId").val(agentId);
			$("#sign").val(sign);
			$("#companyAccount").val($("#company").val());
			//动态添加验证
			if(sign == "hardwareAccount") {
				if(Number('${genAgent.hardwareAccount}') == 0.00) {
					$("#price").rules("remove","range");
					$("#price").rules("add",{
						range: [0,0],
						messages : {  
	                         range  : "您的硬件账户余额为0元,请先充值", 
	                     } 
					});
					$("#price").val(0);
				} else {
					$("#price").rules("add",{
						range: [0,'${genAgent.hardwareAccount}'],
						 messages : {  
                             range  : "请输入0到${genAgent.hardwareAccount}到之间的金额范围", 
                         } 
					});
					
				}
				$("#accountTitle").text("硬件账户充值");
				$("#recipient").html("您的硬件账户扣款:");
				$("#currentMoney").text("您的硬件账户余额为"+'${genAgent.hardwareAccount}'+"元");
			}
		
			if(sign == "publicAccount") {
				if(Number('${genAgent.publicAccount}') == 0.00) {
					$("#price").rules("remove","range");
					$("#price").rules("add",{
						range: [0,0],
						messages : {  
	                         range  : "您的公众号账户余额为0元,请先充值", 
	                     } 
					});
					$("#price").val(0);
				} else {
					$("#price").rules("add",{
						range: [0,'${genAgent.publicAccount}'],
						messages : {  
                            range  : "请输入0到${genAgent.publicAccount}到之间的金额范围", 
                        } 
					});
				}
				$("#accountTitle").text("公众号账户充值");
				$("#recipient").html("您的公众号账户扣款:");
				$("#currentMoney").text("您的公众号账户余额为"+'${genAgent.publicAccount}'+"元");
			}
			if(sign == "minaAccount") {
				if(Number('${genAgent.minaAccount}') == 0.00) {
					$("#price").rules("remove","range");
					$("#price").rules("add",{
						range: [0,0],
						messages : {  
	                         range  : "您的小程序账户余额为0元,请先充值", 
	                     } 
					});
					$("#price").val(0);
				} else {
					$("#price").rules("add",{
						range: [0,'${genAgent.minaAccount}'],
						messages : {  
                            range  : "请输入0到${genAgent.minaAccount}到之间的金额范围", 
                        } 
					});
				}
				$("#accountTitle").text("小程序账户充值");
				$("#recipient").html("您的小程序账户扣款:");
				$("#currentMoney").text("您的小程序账户余额为"+'${genAgent.minaAccount}'+"元");
			}
			if(Number('${genAgent.vipAccount}') == 0) {
				$("#vipAccountCharge").rules("remove","range");
				$("#vipAccountCharge").rules("add",{
					range: [0,0],
					messages : {  
                         range  : "您的VIP账户余额为0元,请先充值", 
                     } 
				});
				$("#vipAccountCharge").val(0);
			}else {
				$("#vipAccountCharge").rules("add",{
					range: [0,'${genAgent.vipAccount}'],
					messages : {  
                        range  : "请输入0到${genAgent.vipAccount}到之间的金额范围", 
                    } 
				});
			}
			$("#vipMoney").text("您的VIP账户余额为"+'${genAgent.vipAccount}'+"元");
			$("#accountModal").modal("show");
		}
		$('.expendAccount').bind('input propertychange', function() {
			var total=0;
			$('.expendAccount').each(
				function(){
					if(!isNaN(this.value)){
						total+=Number(this.value);
					}
			});
			$('#totalAccountMoney').html(total.toFixed(2));
		});
			
		function saveAccount() {
			$("#id").val('${agent.id}');
			var isValid = $("#accountForm").valid();
			if(isValid) {
				var flag;
				if($("#price").val() == 0 && $("#vipAccountCharge").val() == 0) {
					flag = false;
					layer.msg("您还未输入一个非0的充值金额",{icon:7,time:1500});
				}else {
					flag = true;
				}
			}
			if(isValid && flag) {
				var locked = false;
				layer.confirm('是否确认充值?', {
					closeBtn : 0,
					skin : 'layui-layer-molv',
					icon : 3,
					btn : [ '确认', '取消' ]
				//按钮
				},function() {
					if(!locked) {
						locked = true;
						var index = layer.load(1, {shade: [0.1,'#fff']});
						$.ajax({
							url : "${ctx}/agentSystem/SysUser/updateAccountCharge",
							type : "post",
							dataType : "json",
							data : $('#accountForm').serialize(),
							success : function(result) {
								if (result == 1) {
									layer.close(index);
									$("#accountModal").modal("hide");
									layer.msg("充值成功！", {
										icon : 1,
										time : 1000
									});
									setTimeout("sumbitForm()",1000);
								} else {
									$("#accountModal").modal("hide");
									layer.msg("充值失败！", {
										icon : 1,
										time : 1000
									});
								}
							}
						});
					}
				
				});
			}
			
		}
		function showVipModal(agentId) {
			$("#vipForm").data("validator").resetForm();
			document.getElementById("vipForm").reset();  
			$("#Id").val(agentId);
			$("#name").val($("#company").val());
			$("#vipAccountMoney").text("您的VIP账户余额为"+'${genAgent.vipAccount}'+"元");
			if(Number('${genAgent.vipAccount}') == 0 ){
				$("#vipChargeMoney").rules("remove","range");
				$("#vipChargeMoney").rules("add",{
					range: [0,0],
					messages : {  
                         range  : "您的VIP账户余额为0元,请先充值", 
                     } 
				});
			}
			$("#vipModal").modal("show");
		}
		function saveVipAccount() {
			$("#id").val('${agent.id}');
			var isValid = $("#vipForm").valid();
			if(isValid) {
				var locked = false;
				layer.confirm('是否确认充值?', {
					closeBtn : 0,
					skin : 'layui-layer-molv',
					icon : 3,
					btn : [ '确认', '取消' ]
				//按钮
				},function() {
					if(!locked) {
						var index = layer.load(1, {shade: [0.1,'#fff']});
						locked = true;
						$.ajax({
							url : "${ctx}/agentSystem/SysUser/updateVipCharge",
							type : "post",
							dataType : "json",
							data : $('#vipForm').serialize(),
							success : function(result) {
								layer.close(index);
								if (result == 1) {
									$("#vipModal").modal("hide");
									layer.msg("充值成功！", {
										icon : 1,
										time : 1000
									});
									setTimeout("sumbitForm()",1000);
								} else {
									$("#vipModal").modal("hide");
									layer.msg("充值失败！", {
										icon : 1,
										time : 1000
									});
								}
							}
						});
					}
				
				});
			}
		}
		function sumbitForm() {
			$("#refreshAgentForm").submit();
		}
		function jump() {
			window.location.href = "${ctx}/agentSystem/SysUser/list";
		}
	</script>
</body>
</html>