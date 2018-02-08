
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 开票的已完成列表 -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
</head>
<style>
.space{
white-space: pre-wrap;
}
</style>
<body>
	<div class="divControl">
		<div class="card cardControl">
			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane p-20 active" id="home2" role="tabpanel">
					<div class="row button-group col-3" style="float: left;">						
					</div>
					<div class="row col-9" style="float: right;">
						<form action="${ctx}/agentSystem/wasInvoiceApplication/listFinishconfirm" method="post" style="width: 100%" id="searchForm">
							<button type="button" class="btn waves-effect waves-light btn-info" onclick="search()" style="float: right; margin-left: 15px">搜索</button>

							<input autocomplete="off" type="text" class="form-control height-control col-3" id="keywordOne" placeholder="请输入代理商名称关键字" autocomplete="off" value="${companyNameUser}" style="float: right;"/> 
								<input type="hidden" id="keyword" value="${fn:escapeXml(companyNameUser)}"  name="companyNameUser" />
								<input id="timeStartOne" value="<fmt:formatDate value="${wasInvoiceApplication.beginDate}" pattern="yyyy-MM-dd  HH:mm:ss"/>" type="hidden" name="beginDate"/>
								<input id="timeEndOne" value="<fmt:formatDate value="${wasInvoiceApplication.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" type="hidden" name="endDate"/>
								<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" /> 
								<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}" />
							<div class="form-group col-6" style="margin-bottom: 0px; float: right;">
								<div class=" input-group input-daterange" id="date-range">
									<div style="display:inline-block;padding-top: 8px;">申请时间范围:&nbsp;&nbsp;</div>
									<input id="timeStart" value="<fmt:formatDate value="${wasInvoiceApplication.beginDate}" pattern="yyyy-MM-dd"/>" type="text" class="form-control height-control rightAngle" placeholder="开始时间" autocomplete="off" style="text-align: left;" />
									<span class="input-group-addon bg-info b-0 text-white height-control addCentreControl">至</span>
									<input id="timeEnd" value="<fmt:formatDate value="${wasInvoiceApplication.endDate}" pattern="yyyy-MM-dd"/>" type="text" class="form-control height-control leftAngle" placeholder="结束时间" autocomplete="off" style="text-align: left;" />
								</div>
							</div>
						</form>
					</div>
					<table id="contentTable"
						class="display nowrap table table-hover table-striped table-bordered">
						<thead>
							<tr>
								<th class="tableControl">代理商</th>
								<th class="tableControl">开票公司名称</th>
								<th class="tableControl">发票内容</th>
								<th class="tableControl">发票类型</th>
								<th class="tableControl">开票金额/元</th>
								<th class="tableControl">申请时间</th>	
								<th class="tableControl">收票时间</th>							
								<th class="tableControl">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list}" var="log">
								<tr>
										<td class="tableControl space">${fn:escapeXml(log.companyNameUser)}</td>
										<td class="tableControl space">${fn:escapeXml(log.companyName)}</td>
										<td class="tableControl space">${fn:escapeXml(log.body)}</td>
										<td class="tableControl space">${fn:escapeXml(log.invoiceType)}</td>
										<td class="tableControl">${log.money}</td>
										<td class="tableControl"><fmt:formatDate
												value="${log.applyDate}" type="both" /></td>
										<td class="tableControl"><fmt:formatDate
												value="${log.receiveDate}" type="both" /></td>																				
										<td class="tableControl">
										<shiro:hasPermission name="agentsystem:wasInvoiceApplication:lookInform">
											<button type="button" data-toggle="tooltip"
												data-original-title="查看"
												class="btn btn-info btn-circle btn-xs"
												onclick="lookInform('${log.invoiceNo}');">
												<i class="fa fa-search-plus"></i>
											</button>
										</shiro:hasPermission >	
										<shiro:hasPermission name="agentSystem:wasRecordExamine:invoice:delete">
											<button type="button" data-toggle="tooltip"
												data-original-title="删除"
												class="btn btn-danger btn-circle btn-xs "
												onclick="deleteS('${log.invoiceId}','${log.state}')">
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
	<form  id="lookJump" hidden="hidden" action="${ctx}/agentSystem/wasInvoiceApplication/lookInform" method="post">
		<input name="sendFlag" value="5" />
		<input id="invoiceNoL" name="invoiceNo" value="" />
	</form>
	<script type="text/javascript">	
	//点击回车搜索
	$('#keywordOne').bind('keypress', function(event) {
		if (event.keyCode == "13") {
			search();
		}
	});
     //查看的页面跳转	
		function lookInform(invoiceNo){		
			$("#invoiceNoL").val(invoiceNo)
			$("#lookJump").submit();
		}
		var menuId = $("#btnId",parent.document).val();
		//删除对应的信息
		function deleteS(invoiceId,state){			
				layer.confirm("确认删除该订单？", {closeBtn: 0, icon : 3 ,skin : 'layui-layer-molv',btn: ['确认','取消']}, 
					function(){
						var index = layer.load(1, {shade: [0.1,'#fff']});
						$.ajax({
						    url:'${ctx}/agentSystem/wasInvoiceApplication/updateState',
						    type:'POST',
						    data:{
						    	invoiceId:invoiceId,
						    	state:state,
						    	menuId:menuId,
						    },
						    dataType:'json',
						    success:function(result){
						    	layer.close(index);
						    	var countSum = ${page.count};
						    	var countSize = ${page.pageSize};
						    	if(result > 0){
						    		var last = '${isLast}';//$("#isLast").val();
					    			if(last == '1'){
					    				var number = Number(countSum)%Number(countSize);
					    				if(number == 1){
					    					$("#pageNo").val($("#pageNo").val()-1);
					    					$("#pageSize").val($("#pageSize").val());
					    					layer.msg("操作成功！",{icon:1,time:1000},function(){
					    						$("#searchForm").submit();
											});					    				
					    				}else{
					    					layer.msg("操作成功！",{icon:1,time:1000},function(){
					    						$("#searchForm").submit();
											});	
					    				}			    				
					    			}else{
					    				layer.msg("操作成功！",{icon:1,time:1000},function(){
				    						$("#searchForm").submit();
										});	
					    			}	
						    		/* layer.msg("操作成功！",{icon:1,time:1000},function(){
						    			$("#searchForm").submit();
									});	 */
						    	}
						    },
						    error:function(xhr,textStatus){
						    	layer.close(index);
						    	layer.msg('操作失败！', { icon : 2 });
						    },
						})
					});
			
		}		
		//日期范围选择
		jQuery('#date-range').datepicker({
			toggleActive : true,
			autoclose: true,
			format : "yyyy-mm-dd"
		});
		//分页方法
		function page(n,s) {
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
			$("span.page-size").text(s);
		}
		//查询方法
		function search(){//查询，页码清零
			$("#keyword").val($("#keywordOne").val());
			$("#timeStartOne").val($("#timeStart").val());			
			$("#timeEndOne").val($("#timeEnd").val()+' 23:59:59');
			$("#pageNo").val(0);
			$("#searchForm").submit();
		}
		//checkbox监听
		$('#ischange').on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
			$('.check').iCheck('check');
		});
		$('#ischange').on('ifUnchecked', function(event){ //ifUnchecked 事件应该在插件初始化之前绑定 
			$('.check').iCheck('uncheck');
		});		
	</script>

</body>
</html>