
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 查看按钮的显示表单和订单编号list -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
</head>
<style>
table tbody {
		display: block;
		overflow-y: scroll;
	}
	
	table thead, tbody tr {
		display: table;
		width: 100%;
		table-layout: fixed;
		
	}
	

::-webkit-scrollbar {
	width: 4px !important;
	height : 4px !important;
	background-color: white;
}

::-webkit-scrollbar-track {
	/* -webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3); */
	border-radius: 10px;
	background-color: white;
}
/*定义滑块 内阴影+圆角*/
::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
	background-color: #f4f5f9;
}
.blank {
 white-space:pre-wrap;
} 
</style>
<body>
	<div class="row divControl">
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<form action="#" class="form-horizontal">
						<div class="form-body">
							<p class="box-title" style="font-size: 14px">发票基本信息</p>
							<hr class="m-t-0 m-b-40">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">开票金额：</label>
										<div class="col-md-9">${page.list[0].money}</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group has-danger row">
										<label class="control-label text-right col-md-3">发票内容：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].body)}</div>
									</div>
									<!--/span-->
								</div>
							</div>
							<!--/row-->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">发票类型：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].invoiceType)}</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">公司名称：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].companyName)}</div>
									</div>
								</div>
								<!--/span-->
							</div>
							<!--/row-->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">发票收货地址：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].address)}</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">纳税人识别号：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].dutyParagraph)}</div>
									</div>
								</div>								
								<!--/span-->
							</div>
							<!--/row-->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">快递公司：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].expressCompany) =="" ? '--' : page.list[0].expressCompany}</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">快递单号：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].expressNumber) =="" ? '--' : page.list[0].expressNumber}</div>
									</div>
								</div>								
								<!--/span-->
							</div>
							<c:if test="${page.list[0].invoiceType == '专用发票'}">
							<!--/row-->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">注册地址：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].registerAddress)}</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">注册电话：</label>
										<div class="col-md-9">${page.list[0].registerPhone}</div>
									</div>
								</div>								
								<!--/span-->
							</div>
							<!--/row-->
							<div class="row">
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">开户行：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].registerBank)}</div>
									</div>
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3">银行账户：</label>
										<div class="col-md-9 blank">${page.list[0].account}</div>
									</div>
								</div>								
								<!--/span-->
							</div>	
							</c:if>
							<!--/row-->
							<div class="row">
								<div class="col-md-6">								
									<div class="form-group row">
										<label class="control-label text-right col-md-3">备注：</label>
										<div class="col-md-9 blank">${fn:escapeXml(page.list[0].reason) =="" ? '--' :fn:escapeXml(page.list[0].reason)}</div>
									</div>  								 
								</div>
								<!--/span-->
								<div class="col-md-6">
									<div class="form-group row">
										<label class="control-label text-right col-md-3"></label>
										<div class="col-md-9"></div>
									</div>
								</div>								
								<!--/span-->
							</div>	
							
						</div>
					</form>
					<c:if test="${fn:length(pageB)!= 0}">					
					<h6 class="box-title">订单详情</h6>					
					
						<table class="display nowrap table table-hover table-striped table-bordered">
						<thead>
							<tr>
								<th class="tableControl">订单编号</th>
								<th class="tableControl">金额/元</th>
								<th class="tableControl">支付日期</th>
								<th class="tableControl">消费账户</th>								
							</tr>
						</thead>
												
						<tbody style="max-height:165px;">
							<c:forEach items="${pageB}" var="log">
								<tr>

									<td class="tableControl blank">${log.orderNo}</td>
									<td class="tableControl">${log.payMoney}</td>
									<td class="tableControl"><fmt:formatDate
											value="${log.createDate}" type="both" /></td>
									<td class="tableControl blank">${fn:escapeXml(log.expendSum)}</td>									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					</c:if>
					
					<c:if test="${finish==1}">
					<form action="${ctx}/agentSystem/wasInvoiceApplication/list" method="post">										
					<button type="submit" class="btn btn-default" style="float: right;" >返回</button>	
					</form>
					</c:if>	
					<c:if test="${finish==0}">
					<form action="${ctx}/agentSystem/wasInvoiceApplication/listFinish" method="post">										
					<button type="submit" class="btn btn-default" style="float: right;" >返回</button>	
					</form>
					</c:if>	
					<c:if test="${finish==3}">
					<form action="${ctx}/agentSystem/wasInvoiceApplyForIn/list" method="post">										
					<button type="submit" class="btn btn-default" style="float: right;" >返回</button>	
					</form>
					</c:if>	
					<c:if test="${finish==4}">
					<form action="${ctx}/agentSystem/wasInvoiceApplyForIn/listFinish" method="post">										
					<button type="submit" class="btn btn-default" style="float: right;" >返回</button>	
					</form>
					</c:if>
					<c:if test="${finish==5}">
					<form action="${ctx}/agentSystem/wasInvoiceApplication/listFinishconfirm" method="post">										
					<button type="submit" class="btn btn-default" style="float: right;" >返回</button>	
					</form>
					</c:if>						
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">	
	
	</script>
</body>
</html>