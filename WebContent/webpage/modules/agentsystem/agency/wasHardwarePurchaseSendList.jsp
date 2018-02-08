
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 硬件购买待发货列表 -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
</head>
<body>
	<div class="divControl">
		<div class="card cardControl">
			<div class="card-body">
				<div class="tab-content">
						<div class="row col-9" style="float: right;">
							<form action="${ctx}/hardware/hardwarePurchase/sendList" method="post" style="width: 100%" id="searchForm">
								<button type="button" class="btn waves-effect waves-light btn-info" onclick="search()" style="float: right; margin-left: 15px">搜索</button>
		
								<input id="searchName" autocomplete="off" type="text" class="form-control height-control col-3" placeholder="请输入代理商公司名称关键字" value="${fn:escapeXml(wasHardwarePurchase.purchasedCompanyName)}" style="float: right;"> 
								<input id="purCompanyName" name="purchasedCompanyName" type="hidden" value="${fn:escapeXml(wasHardwarePurchase.purchasedCompanyName)}"> 
								<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" /> 
								<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
								<input id="beginDate" name="beginDate" type="hidden"  value="<fmt:formatDate value="${wasHardwarePurchase.beginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
								<input id="endDate" name="endDate" type="hidden" value="<fmt:formatDate value="${wasHardwarePurchase.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" />
								<div class="form-group col-6" style="margin-bottom: 0px; float: right;">
									<div class=" input-group input-daterange" id="dateRange">
										<div style="display:inline-block;padding-top: 8px;">下单时间范围：&nbsp;&nbsp;</div>
										<input autocomplete="off" id="searchBeginDate" value="<fmt:formatDate value="${wasHardwarePurchase.beginDate}" pattern="yyyy-MM-dd"/>" type="text" class="form-control height-control rightAngle" placeholder="开始时间"  style="text-align: left;" />
										<span class="input-group-addon bg-info b-0 text-white height-control addCentreControl">至</span>
										<input autocomplete="off" id="searchEndDate" value="<fmt:formatDate value="${wasHardwarePurchase.endDate}" pattern="yyyy-MM-dd"/>" type="text" class="form-control height-control" placeholder="结束时间"  style="text-align: left;" />
									</div>
								</div>
							</form>
						</div>
					<table id="contentTable" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="tableControl">公司名称</th>
								<th class="tableControl">商品名称</th>
								<th class="tableControl">购买数量</th>
								<th class="tableControl">消费总额/元</th>
								<th class="tableControl">收货人</th>
								<th class="tableControl">联系电话</th>
								<th class="tableControl">下单时间</th>
								<th class="tableControl">备注</th>
								<th class="tableControl">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list}" var="wasHardwarePurchase">
								<tr>
									<td class="tableControl" style="white-space: pre-wrap;">${fn:escapeXml(wasHardwarePurchase.purchasedCompanyName)}</td>
									<td class="tableControl" style="white-space: pre-wrap;">${fn:escapeXml(wasHardwarePurchase.hardwareName)}</td>
									<td class="tableControl">${fn:escapeXml(wasHardwarePurchase.number)}</td>
									<td class="tableControl">${fn:escapeXml(wasHardwarePurchase.payMoney)}</td>
									<td class="tableControl" style="white-space: pre-wrap;">${fn:escapeXml(wasHardwarePurchase.name)}</td>
									<td class="tableControl">${fn:escapeXml(wasHardwarePurchase.phone)}</td>
									<td class="tableControl"><fmt:formatDate value="${wasHardwarePurchase.createDate}" type="both" /></td>
									<td class="tableControl" style="max-width:300px;overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><c:choose><c:when test="${fn:escapeXml(wasHardwarePurchase.remarks) ne null and fn:escapeXml(wasHardwarePurchase.remarks) ne ''}">${fn:escapeXml(wasHardwarePurchase.remarks)}</c:when><c:otherwise>--</c:otherwise></c:choose></td>
									<td class="tableControl">
										<shiro:hasPermission name="agency:wasHardwarePurchase:sendView">
											<button type="button" data-toggle="tooltip" data-original-title="查看" class="btn btn-info btn-circle btn-xs" onclick="show('${wasHardwarePurchase.hardwarePurchaseId}',this)">
												<i class="fa fa-search-plus"></i>
											</button>
										</shiro:hasPermission> 
										<shiro:hasPermission name="agency:wasHardwarePurchase:sendOut">
											<button type="button" data-toggle="tooltip" data-original-title="发货" class="btn btn-info btn-circle btn-xs" onclick="send('${wasHardwarePurchase.hardwarePurchaseId}',this)">
												<i class="iconf icon-fahuo1"></i>
											</button>
										</shiro:hasPermission> 
										<shiro:hasPermission name="agency:wasHardwarePurchase:sendDelete">
											<button type="button" data-toggle="tooltip" data-original-title="删除" class="btn btn-danger btn-circle btn-xs" onclick="del('${wasHardwarePurchase.hardwarePurchaseId}',0)">
												<i class="fa fa-times"></i>
											</button>
										</shiro:hasPermission>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 分页代码 -->
					<c:if test="${page.count gt 10}">
						<table:page page="${page}"></table:page>
					</c:if>	
				</div>
			</div>
		</div>
	</div>

	<!-- 查看模态框 -->
	<div class="modal fade" id="modal" data-backdrop="static">
		<div class="modal-dialog">
			<!--宽高、定位-->
			<div class="modal-content">
				<!--对话框头-->
				<div class="modal-header" style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
					<span style="font-size: 14px">查看</span>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<!--主体部分-->
				<div class="modal-body" style="overflow-y:scroll; max-height: 600px;">
					<form>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">公司名称：</label>
							<div class="col-8 divMiddle">
								<div id="purchasedCompanyName" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">购买商品：</label>
							<div class="col-8 divMiddle">
								<div id="hardwareName" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">购买数量：</label>
							<div class="col-8 divMiddle">
								<div id="number" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">消费总额：</label>
							<div class="col-8 divMiddle">
								<div id="payMoney" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">收货人：</label>
							<div class="col-8 divMiddle">
								<div id="name" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">联系电话：</label>
							<div class="col-8 divMiddle">
								<div id="phone" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">收货地址：</label>
							<div class="col-8 divMiddle">
								<div id="address" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">下单时间：</label>
							<div class="col-8 divMiddle">
								<div id="createDate" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
						<div class="form-group row" id="remarksRow">
							<label for="example-text-input" class="col-3 col-form-label">备注：</label>
							<div class="col-8 divMiddle">
								<div id="remarks" class="divFont" style="white-space: pre-wrap;word-break: break-all;"></div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 发货模态框 -->
	<div class="modal fade" id="modalSendOut" data-backdrop="static">
		<div class="modal-dialog">
			<!--宽高、定位-->
			<div class="modal-content">
				<!--对话框头-->
				<div class="modal-header" style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
					<span style="font-size: 14px">发货</span>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				</div>
				<!--主体部分-->
				<div class="modal-body" style="overflow-y:scroll; max-height: 600px;">
					<form id="sendForm">
						<div class="form-group row" hidden="hidden">
							<label for="example-text-input" class="col-3 col-form-label"></label>
							<div class="col-8 controls">
								<input id="sendHardwarePurchaseId" autocomplete="off" type="text" name="text" class="form-control height-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">公司名称：</label>
							<div class="col-8 controls">
								<input id="sendPurchasedCompanyName" style="white-space: pre-wrap;" autocomplete="off" type="text" name="text" class="form-control height-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">购买商品：</label>
							<div class="col-8 controls">
								<input id="sendHardwareName" style="white-space: pre-wrap;" autocomplete="off" type="text" name="text" class="form-control height-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">购买数量：</label>
							<div class="col-8 controls">
								<input id="sendNumber" autocomplete="off" type="text" name="text" class="form-control height-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">收货人：</label>
							<div class="col-8 controls">
								<input id="sendName" style="white-space: pre-wrap;" autocomplete="off" type="text" name="text" class="form-control height-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">联系电话：</label>
							<div class="col-8 controls">
								<input id="sendPhone" autocomplete="off" type="text" name="text" class="form-control height-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label">收货地址：</label>
							<div class="col-8 controls">
								<input id="sendAddress" style="white-space: pre-wrap;" autocomplete="off" type="text" name="text" class="form-control height-control" readonly="readonly">
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label"><span style="color: red">* </span>快递公司：</label>
							<div class="col-8 controls">
								<select class="custom-select height-control col-12" id="sendExpress" name="sendExpress">
									<option value="" selected>选择快递公司</option>
									<!-- <option value="SF">顺丰快递</option> -->
									<option value="HHTT">天天快递</option>
									<option value="HOAU">天地华宇</option>
									<option value="HTKY">百世快递</option>
									<option value="ZTO">中通快递</option>
									<option value="STO">申通快递</option>
									<option value="YTO">圆通快递</option>
									<option value="YD">韵达快递</option>
									<option value="YZPY">邮政平邮</option>
									<option value="EMS">EMS</option>
									<option value="DBL">德邦物流</option>
								</select>
							</div>
						</div>
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label"><span style="color: red">* </span>快递单号：</label>
							<div class="col-8 controls">
								<input id="sendExpressNumber" name="sendExpressNumber" autocomplete="off" type="text" name="text" maxlength="20" class="form-control height-control">
							</div>
						</div>
					</form>
				</div>
				<!--对话框尾-->
				<div class="modal-footer" style="text-align: right; background-color: #f4f5f9; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
					<button type="button" class="btn btn-info" onclick="save()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$(function() {
			
			//表单验证
			$("#sendForm").validate({
				rules : {
					sendExpress : {
						required : true,
					},
					sendExpressNumber : {
						required : true,
					},
				},
				messages : {
					sendExpress : {
						required : "请选择快递平台",
					},
					sendExpressNumber : {
						required : "请输入快递单号",
					},
				},
				errorPlacement : function(error, element) {
					error.insertAfter(element);
				}
			});
		})
	
		//分页方法
		function page(n,s) {
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
			$("span.page-size").text(s);
		}
		//日期范围选择
		jQuery('#dateRange').datepicker({
			toggleActive : true,
			autoclose: true,
			format : "yyyy-mm-dd"
		});
		
		//查询方法
		function search(){//查询，页码清零
			$("#purCompanyName").val($("#searchName").val());
			$("#beginDate").val($("#searchBeginDate").val());
			$("#endDate").val($("#searchEndDate").val() + " 23:59:59");
			$("#pageNo").val(0);
			$("#searchForm").submit();
		}
		//点击回车进行搜索		
		$('#searchName').bind('keypress', function(event) {
			if (event.keyCode == "13") {
				search();
			}
		});
		//自提查看方法
		function show(hardwarePurchaseId,obj){
			$(obj).blur();
			var index = layer.load(1, {shade: [0.1,'#fff']});
			$.ajax({
			    url:'${ctx}/hardware/hardwarePurchase/form',
			    type:'POST',
			    data:{
			    	hardwarePurchaseId:hardwarePurchaseId,
			    },
			    dataType:'json',
			    success:function(result){
			    	$("#purchasedCompanyName").text(result.purchasedCompanyName);
			    	$("#hardwareName").text(result.hardwareName);
			    	$("#number").text(result.number);
			    	var money = result.payMoney.toFixed(2) + "元";
			    	$("#payMoney").text(money);
			    	$("#name").text(result.name);
			    	$("#phone").text(result.phone);
			    	$("#address").text(result.address);
			    	$("#createDate").text(result.createDate);
			    	if (result.remarks != null && result.remarks != "") {
				    	$("#remarks").text(result.remarks);
					} else {
						$("#remarks").text("--");
					}
			    	layer.close(index);
			    	$("#modal").modal("show");
			    },
			    error:function(xhr,textStatus){
			    	layer.msg('查看失败！', { icon : 2 });
			    },
			})
		}
		
		//删除订单
		function del(hardwarePurchaseId,state) {
			layer.confirm("确认删除数据吗？", {closeBtn: 0, icon : 3 ,skin : 'layui-layer-molv',btn: ['确认','取消']}, 
					function(){
						var index = layer.load(1, {shade: [0.1,'#fff']});
						$.ajax({
						    url:'${ctx}/hardware/hardwarePurchase/updateState',
						    type:'POST',
						    data:{
						    	menuId:$('#btnId',parent.document).val(),
						    	hardwarePurchaseId:hardwarePurchaseId,
						    	state:state,
						    },
						    dataType:'json',
						    success:function(result){
						    	layer.close(index);
						    	if(result > 0){
						    		layer.msg("操作成功！",{icon:1,time:1000},function(){
						    			$("#searchForm").submit();
									});	
						    	}
						    },
						    error:function(xhr,textStatus){
						    	layer.close(index);
						    	layer.msg('操作失败！', { icon : 2 });
						    },
						})
					});
		}
		
		//点击发送按钮触发
		function send(hardwarePurchaseId,obj){
			$(obj).blur();
			var index = layer.load(1, {shade: [0.1,'#fff']});
			$.ajax({
			    url:'${ctx}/hardware/hardwarePurchase/form',
			    type:'POST',
			    data:{
			    	hardwarePurchaseId:hardwarePurchaseId,
			    },
			    dataType:'json',
			    success:function(result){
			    	$("#sendHardwarePurchaseId").val(hardwarePurchaseId);
			    	$("#sendPurchasedCompanyName").val(result.purchasedCompanyName);
			    	$("#sendHardwareName").val(result.hardwareName);
			    	$("#sendNumber").val(result.number);
			    	$("#sendName").val(result.name);
			    	$("#sendPhone").val(result.phone);
			    	$("#sendAddress").val(result.address);
			    	
			    	$("#sendExpress").removeClass("error");
			    	$("#sendExpress-error").remove();
			    	$("#sendExpressNumber-error").remove();
			    	$("#sendExpress option:first").prop("selected", 'selected');  
			    	$("#sendExpressNumber").val("");
			    	layer.close(index);
			    	$("#modalSendOut").modal("show");
			    },
			    error:function(xhr,textStatus){
			    	layer.msg('查看失败！', { icon : 2 });
			    },
			});
		}
		//发货保存按钮
		function save() {
			var isValid = $("#sendForm").valid();
			if (isValid) {
				layer.confirm("确认发货？", {closeBtn: 0, icon : 3 ,skin : 'layui-layer-molv',btn: ['确认','取消']}, 
						function(){
							var index = layer.load(1, {shade: [0.1,'#fff']});
							$.ajax({
							    url:'${ctx}/hardware/hardwarePurchase/sendOut',
							    type:'POST',
							    data:{
							    	hardwarePurchaseId:$("#sendHardwarePurchaseId").val(),
							    	expressCompany:$("#sendExpress").find("option:selected").text(),
							    	expressCoding:$('#sendExpress').val(),
							    	expressNumber:$('#sendExpressNumber').val(),
							    },
							    dataType:'json',
							    success:function(result){
							    	layer.close(index);
							    	$("#modalSendOut").modal('hide');
							    	if(result > 0){
							    		layer.msg("操作成功！",{icon:1,time:1000},function(){
							    			$("#searchForm").submit();
										});	
							    	}
							    },
							    error:function(xhr,textStatus){
							    	layer.close(index);
							    	layer.msg('操作失败！', { icon : 2 });
							    },
							})
						});
			}
		}
	</script>

</body>
</html>