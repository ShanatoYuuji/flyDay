
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 代理商列表展示页面 -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
<style type="text/css">
	/*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
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
.btn-sml{
	width:10px;
	height:10px;
}
</style>
</head>
<body>
	<div class="divControl">
		<div class="card cardControl">

			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane p-20 active" id="home" role="tabpanel">
					<div class="row button-group col-3" style="float: left;">
					<shiro:hasPermission name="agency:wasSysUser:add">
						<button type="button" class="btn btn-info height-control" onclick="addAgent()">
							<i class="fa fa-plus-circle"></i> 添加
						</button>
						</shiro:hasPermission>
					</div>
					<div class="row col-9" style="float: right;">
						<form action="${ctx}/agentSystem/SysUser/list" method="post"
							style="width: 100%" id="searchForm">
							<button type="button"
								class="btn waves-effect waves-light btn-info height-control" onclick="search()"
								style="float: right; margin-left: 15px">搜索</button>
							<input id="nameId" name="companyName" type="hidden" value="${fn:escapeXml(companyName)}"/> 
							<input id="StartTime" name="startDate" type="hidden"  value="<fmt:formatDate value="${sysUser.startDate}" pattern="yyyy-MM-dd HH:mm:ss"/>" /> 
							<input id="endTime" name="endDate" type="hidden" value="<fmt:formatDate value="${sysUser.endDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"/> 	
							<input autocomplete="off" type="text" id="companyNameId"
								class="form-control height-control col-3" value="${fn:escapeXml(companyName)}"
								placeholder="请输入代理商公司名称关键字" style="float: right;"> 
							<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" /> 
							<input id="pageSize"name="pageSize" type="hidden" value="${page.pageSize}" />
							<div class="form-group col-6"
								style="margin-bottom: 0px; float: right;">
								<div class=" input-group input-daterange" id="date-range">
									<div style="display:inline-block;padding-top: 8px;">添加时间范围:&nbsp;&nbsp;</div>
									<input id="startDate" autocomplete="off" type="text" class="form-control height-control rightAngle"
										value="<fmt:formatDate value="${sysUser.startDate}" pattern="yyyy-MM-dd"/>" placeholder="开始时间" style="text-align: left;" /> 
										<span class="input-group-addon bg-info b-0 text-white height-control addCentreControl">至</span>
									<input id="endDate" type="text" autocomplete="off" class="form-control height-control"
										value="<fmt:formatDate value="${sysUser.endDate}" pattern="yyyy-MM-dd"/>" placeholder="结束时间"  style="text-align: left;" />
								</div>
							</div>
						</form>
					</div>
					<table id="contentTable"
						class="display nowrap table table-hover table-striped table-bordered"
						cellspacing="0" width="100%">
						<thead>
							<tr>
								<th class="tableControl">公司名称</th>
								<th class="tableControl">添加时间</th>
								<th class="tableControl">到期时间</th>
								<th class="tableControl">所属上级</th>
								<th class="tableControl">硬件余额/元</th>
								<th class="tableControl">公众号余额/元</th>
								<th class="tableControl">小程序余额/元</th>
								<th class="tableControl">VIP余额/元</th>
								<th class="tableControl">平台押金/元</th>
								<th class="tableControl">代理商等级</th>
								<th class="tableControl">状态</th>
								<th class="tableControl">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${page.list}" var="log" varStatus="status">
								<tr>
									<td class="tableControl" style="white-space:pre-wrap">${fn:escapeXml(log.companyName)}</td>
									<td class="tableControl"><fmt:formatDate
											value="${log.create_date}" type="both" pattern="yyyy-MM-dd"/></td>
									<td class="tableControl"><fmt:formatDate
											value="${log.endDate}" type="both" pattern="yyyy-MM-dd" /></td>
									<td class="tableControl" style="white-space:pre-wrap">${fn:escapeXml(log.companyParent.companyName)}</td>
									<td class="tableControl">${log.hardwareAccount}</td>
									<td class="tableControl">${log.publicAccount}</td>
									<td class="tableControl">${log.minaAccount}</td>
									<td class="tableControl">${log.vipAccount}</td>
									<td class="tableControl">${log.cashPledge}</td>
									<td class="tableControl" style="white-space:pre-wrap">${fn:escapeXml(log.agentLevel)}</td>
									<c:set var="nowDate" value="<%=System.currentTimeMillis()%>"></c:set> 
									<c:choose>
										<c:when test="${nowDate-log.endDate.time > 0}" >
										<td class="tableControl" style="color:red">已过期</td>
										</c:when>
										<c:when test="${log.state == 0 }">
											<td class="tableControl">冻结</td>
										</c:when>
										<c:when test="${log.state == 1 }">
											<td class="tableControl">正常</td>
										</c:when>
									</c:choose>
									
									<td class="tableControl">
										<div class="dropdown">
											<button class="btn btn-default dropdown-toggle" type="button"
												id="dropdownMenu" data-toggle="dropdown"
												aria-haspopup="true" aria-expanded="true" style="font-size:13px">
												操作 <span class="caret"></span>
											</button>
											<ul class="dropdown-menu" aria-labelledby="dropdownMenu"
												style="overflow-y: scroll; max-height: 150px; min-width: 98px;">
												<shiro:hasPermission name="agency:wasSysUser:view">
													<li><a href="javascript:void(0)"
														onclick="lookup('${log.id}')"><button type="button"
																class="btn btn-info btn-circle btn-sml">
																<i
																	style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																	class="iconfont icon-chakandatu"></i>
															</button>
															<span
															style="vertical-align: middle; margin-left: 10px; font-size: 13px;">查看</span></a></li>
												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:edit">
														<li><a href="javascript:void(0)"
															onclick="editAgent('${log.id}')"><button
																	type="button" class="btn btn-info btn-circle btn-sml">
																	<i
																		style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																		class="iconfont icon-redact"></i>
																</button>
																<span
																style="vertical-align: middle; margin-left: 10px; font-size: 13px;">编辑</span></a></li>
												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:recharge">
														<c:if test="${nowDate-log.endDate.time <= 0}">
															<c:if test="${log.state == 1 }">
																<li><a href="javascript:void(0)"
																	onclick="recharge('${log.id}')"><button
																			type="button" class="btn btn-info btn-circle btn-sml">
																			<i
																				style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																				class="iconfont icon-chongzhi"></i>
																		</button>
																		<span
																		style="vertical-align: middle; margin-left: 10px; font-size: 13px;">充值</span></a></li>
															</c:if>
														</c:if>
												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:renew">
														<li><a href="javascript:void(0)"
															onclick="renew('${log.id}')"><button type="button"
																	class="btn btn-info btn-circle btn-sml">
																	<i
																		style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																		class="iconfont icon-xuqian"></i>
																</button>
																<span
																style="vertical-align: middle; margin-left: 10px; font-size: 13px;">续签</span></a></li>
												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:order">
													<c:if test="${nowDate-log.endDate.time <= 0}">
														<c:if test="${log.state == 1 }">
															<li><a href="javascript:void(0)"
																onclick="order('${log.id}')"><button type="button"
																		class="btn btn-info btn-circle btn-sml">
																		<i
																			style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																			class="iconfont icon-gouwuchekong"></i>
																	</button>
																	<span
																	style="vertical-align: middle; margin-left: 10px; font-size: 13px;">下单</span></a></li>
														</c:if>
													</c:if>
												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:transfer">
													<c:if test="${nowDate-log.endDate.time <= 0}">
														<c:if test="${log.state == 1 }">
														<li><a href="javascript:void(0)"
															onclick="transfer('${log.id}')"><button type="button"
																	class="btn btn-info btn-circle btn-sml">
																	<i
																		style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																		class="iconfont icon-zhuanyi"></i>
																</button>
																<span
																style="vertical-align: middle; margin-left: 10px; font-size: 13px;">转移</span></a></li>
															</c:if>	
													</c:if>
												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:updateState">
													<c:if test="${nowDate-log.endDate.time <= 0}">
														<c:if test="${log.state == 0 }">
															<li><a href="javascript:void(0)"
																onclick="unfreeze('${log.id}',this)"><button
																		type="button" class="btn btn-info btn-circle btn-sml">
																		<i
																			style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																			class="${ log.state == 1 ? 'iconfont icon-dongjie':'iconfont icon-jiechudongjie'}"></i>
																	</button>
																	<span
																	style="vertical-align: middle; margin-left: 10px; font-size: 13px;">解冻</span></a></li>
														</c:if>
														<c:if test="${log.state == 1 }">
															<li><a href="javascript:void(0)"
																onclick="freeze('${log.id}',this)"><button type="button"
																		class="btn btn-info btn-circle btn-sml">
																		<i
																			style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																			class="${ log.state == 1 ? 'iconfont icon-dongjie':'iconfont icon-jiechudongjie'}"></i>
																	</button>
																	<span
																	style="vertical-align: middle; margin-left: 10px; font-size: 13px;">冻结</span></a></li>
														</c:if>
													</c:if>

												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:drawback">
													<c:if test="${nowDate-log.endDate.time <= 0}">
														<c:if test="${log.state == 1 }">
														<li><a href="javascript:void(0)"
															onclick="showDrawBackModal('${log.id}','${fn:escapeXml(log.companyName)}',this)"><button
																	type="button" class="btn btn-info btn-circle btn-sml">
																	<i
																		style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																		class="iconfont icon-tuikuan"></i>
																</button>
																<span
																style="vertical-align: middle; margin-left: 10px; font-size: 13px;">退款</span></a></li>
																</c:if>
													</c:if>
												</shiro:hasPermission>
												<shiro:hasPermission name="agency:wasSysUser:del">
													<li><a href="javascript:void(0)"
														onclick="deleteBylogic('${log.id}')"><button
																type="button" class="btn btn-info btn-circle btn-sml">
																<i
																	style="font-size: 13px; position: relative; bottom: 7px; right: 6px;"
																	class="iconfont icon-shanchu"></i>
															</button>
															<span
															style="vertical-align: middle; margin-left: 10px; font-size: 13px;">删除</span></a></li>
												</shiro:hasPermission>
											</ul>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 分页代码 -->
					<c:if test="${page.count gt 10 }">
					<table:page page="${page}"></table:page>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<!-- 模态框 -->
	<div class="modal fade" id="modifyState" data-backdrop="static">
		<div class="modal-dialog">
			<!--宽高、定位-->
			<div class="modal-content" style="margin-top:230px">
				<!--对话框头-->
				<div class="modal-header"
					style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
					<label class="modal-title" id="exampleModalLabel" style="font-size: 14px">编辑代理商状态</label>
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
				</div>
				<!--主体部分-->
				<div class="modal-body">
					<form id="stateForm" >
					<input type="hidden" value="" id="agentId" name="id">
					<input type="hidden" value="" id="agentState" name="state">
					<input type="hidden" value="" id="menuState" name="menuId"> 
						<div class="form-group row">
							<label id="reason" for="example-text-input" class="col-4 col-form-label"></label>
							<div class="col-7 controls">
								<textarea   name="remarks" style="white-space: pre-wrap;word-break: break-word;	word-wrap:break-word;"
									class="form-control" spellcheck="false" maxlength="100"></textarea>
							</div>
						</div>
						
					</form>
				</div>
				<!--对话框尾-->
				<div class="modal-footer"
					style="text-align: right; background-color: #f4f5f9; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
					<button type="button" class="btn btn-info" onclick="updateState()">保存</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="drawBackModal"  data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="margin-top: 50px;">
            <div class="modal-header" style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
            <span id="modal-header-title">退款页面</span>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body">
                <form id="drawBackForm">
                 <input type="hidden" value="" id="userId" name="id"> 
                 <input type="hidden" value="" id="menu" name="menuId"> 
                    <div class="form-group row">
                        <label for="recipient" class="col-4 col-form-label">公司名称：</label>
                        <div class="col-7">
                            <input type="text" class="form-control" id="agentName"  value="" name="companyName" readonly>
                        </div>
                    </div>
                    <div class="form-group row" id="hardwarerow">
                        <label for="recipient" class="col-4 col-form-label">硬件退款：</label>
                        <div class="col-7">
                        <div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle"   name="hardwareAccount" id="harewareVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="publicrow">
                        <label for="recipient" class="col-4 col-form-label">公众号退款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle"   name="publicAccount" id="publicVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="minarow">
                        <label for="recipient" class="col-4 col-form-label">小程序退款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle"   name="minaAccount" id="minaVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="viprow">
                        <label for="recipient" class="col-4 col-form-label">VIP退款：</label>
                        <div class="col-7">
                        	<div>
                            <div class="input-group">
                                <input type="text" autocomplete="off" class="form-control height-control rightAngle"  name="vipAccount"  id="vipVal" value="0" maxlength="9">
                                <span class="input-group-addon height-control leftAngle">元</span>
                            </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" >
                        <label for="recipient" class="col-4 col-form-label">
                        <span style="color: red">*&nbsp;</span>退款原因：</label>
                        <div class="col-7">
                       		<div>
                            <div class="input-group">
                                <textarea class="form-control valid"  name="remarks" id="drawBackRemarks" spellcheck="false" style="white-space: pre-wrap;word-break: break-word;	word-wrap:break-word;" maxlength="100"></textarea>
                            </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
	                	<div class="col-11" >
	                		<div style="float: right;font-size:13px">总价格：<span id="totalDrawBackMoney"></span>元</div>
	                	</div>
	                </div>
                </form>
            </div>
            
            <div class="modal-footer" style="text-align: right; background-color: #f4f5f9; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
                <button type="button" class="btn waves-effect waves-light btn-info" onclick="drawBackAccount()">确认</button>
            </div>
        </div>
    </div>
</div>
	<form id="jump" name="myform" hidden="hidden" action="" method="post">
		<input id="id" name="id" value=""/>
		<input type="hidden" value="" id="menuId" name="menuId"> 
	</form>
	

	<script type="text/javascript">
		$("tbody>tr").each(function(index,element){
			if(index >= $('tbody>tr').length/2){
				$(this).find('.dropdown').addClass("dropup");
			}
		}) 
		$("document").ready(function(){
			//表单验证
			$("#stateForm").validate({
				rules: {
					remarks : {
						required : true,
					},	
				},
				messages : {
					remarks : {
						required : "请填写更改代理商状态理由",
					},		
				},
				errorPlacement : function(error, element) {
					error.appendTo(element.parent());
				}
			});
			
			//表单验证
			$("#drawBackForm").validate(
				{
					rules : {
						hardwareAccount:{
							required: true,
							number: true,
							minNumber: $("#harewareVal").val(),
							range: [0,999999.99]
						},			
						publicAccount:{
							required: true,
							number: true,
							minNumber: $("#publicVal").val(),
							range: [0,999999.99]
						},
						minaAccount:{
							required: true,
							number: true,
							minNumber: $("#minaVal").val(),
							range: [0,999999.99]
						},
						vipAccount :{
							required: true,
							number: true,
							minNumber: $("#vipVal").val(),
							range: [0,999999.99]
						},
						remarks:{
							required: true,
						}
					},
					
					//错误信息提示
					messages:{
						hardwareAccount:{
							required: "请填写退款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到999999.99之间的金额范围"
						},
						publicAccount:{
							required: "请填写退款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到999999.99之间的金额范围"
						},
						minaAccount:{
							required: "请填写退款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到999999.99之间的金额范围"
						},
						vipAccount:{
							required: "请填写退款金额",
							number: "请正确输入金额",
							length: "输入数字最多小数点后两位",
							range: "请输入0到999999.99之间的金额范围"
						},
						remarks:{
							required: "请输入退款原因",
						}
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
		});
		
		//日期范围选择
		jQuery('#date-range').datepicker({
			toggleActive : true,
			autoclose : true,
			format : "yyyy-mm-dd"
		});
		//分页方法
		function page(n, s) {
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
			$("span.page-size").text(s);
		}
		//查询方法
		function search() {//查询，页码清零
			$("#pageNo").val(0);
			$("#nameId").val($("#companyNameId").val());
			$("#StartTime").val($("#startDate").val());
			$("#endTime").val($("#endDate").val() + " 23:59:59");
			$("#searchForm").submit();
		}
		
		$('#companyNameId').bind('keypress', function(event) {
			if (event.keyCode == "13") {
				search();
			}
		});
		function addAgent() {
			window.location.href = "${ctx}/agency/wasAgentApply/addAgent";
		}
		//查看代理商详情
		function lookup(userId) {
		$("#jump").attr("action", "${ctx}/agentSystem/SysUser/get");
		$("#id").val(userId);
		$("#jump").submit();	
			
		}
		
		//编辑代理商
		function editAgent(userId) {
			$("#jump").attr("action", "${ctx}/agentSystem/SysUser/edit");
			$("#id").val(userId);
			$("#jump").submit();
		}
		
		//修改代理商状态
		function freeze(userId,obj) {
			$(obj).blur();
			document.getElementById("stateForm").reset();
			$("#stateForm").data("validator").resetForm();  
			$("#reason").html("<span style='color: red'>*&nbsp;</span>冻结原因：");
			$("#agentId").val(userId);
			$("#modifyState").modal("show");
			
			
		}
		function unfreeze(userId,obj) {
			$(obj).blur();
			document.getElementById("stateForm").reset(); 
			$("#stateForm").data("validator").resetForm();
			$("#reason").html("<span style='color: red'>*&nbsp;</span>解冻原因：");
			$("#agentId").val(userId);
			$("#modifyState").modal("show");
			
			
		}
	
		function updateState() {
			var isValid = $("#stateForm").valid();
			var menuId = $("#btnId",parent.document).val();
			$("#menuState").val(menuId);
			if (isValid) {
				var locked = false;
				layer.confirm('是否确认修改代理商状态?', {
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
							url : "${ctx}/agentSystem/SysUser/updateState",
							type : "post",
							dataType : "json",
							data : $('#stateForm').serialize(),
							success : function(result) {
								if (result == 1) {
									layer.close(index);
									$("#modifyState").modal("hide");
									layer.msg("修改状态成功！", {
										icon : 1,
										time : 1000
									});
									setTimeout("sumbitForm()",1000);
								} else {
									$("#modifyState").modal("hide");
									layer.msg("修改状态失败！", {
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
		
		function renew(agentId) {
			$("#jump").attr("action", "${ctx}/agentSystem/SysUser/getAgent");
			$("#id").val(agentId);
			$("#jump").submit();
		}
		//充值
		function recharge(agentId) {
			$("#jump").attr("action", "${ctx}/agentSystem/SysUser/getAgentRecharge");
			$("#id").val(agentId);
			$("#jump").submit();
		}
		//财务退款
		function showDrawBackModal(agentId,companyName,obj) {
			$(obj).blur();
			$("#drawBackForm").data("validator").resetForm();
			document.getElementById("drawBackForm").reset();  
			$("#totalDrawBackMoney").html(0);
			$("#userId").val(agentId);
			$("#agentName").val(companyName);
			$("#agentId").val(agentId);
			$("#drawBackModal").modal("show");
		}
		var hardwareMoney=0;var publicMoney = 0;var minaMoney=0; var vipMoney= 0;
		$('#harewareVal').bind('input propertychange', function() {
			if(!isNaN($('#harewareVal').val())) {
				hardwareMoney = $('#harewareVal').val();
				$('#totalDrawBackMoney').text(Number(hardwareMoney)+Number(publicMoney)+Number(minaMoney)+Number(vipMoney));
			}
			
		});
		
		$('#publicVal').bind('input propertychange', function() {
			if(!isNaN($('#publicVal').val())) {
				publicMoney = $('#publicVal').val();
				$('#totalDrawBackMoney').html(Number(hardwareMoney)+Number(publicMoney)+Number(minaMoney)+Number(vipMoney));
			}
			
		});
		$('#minaVal').bind('input propertychange', function() {
			if(!isNaN($('#minaVal').val())) {
				minaMoney = $('#minaVal').val();
				$('#totalDrawBackMoney').html(Number(hardwareMoney)+Number(publicMoney)+Number(minaMoney)+Number(vipMoney));
			}
			
		});
		$('#vipVal').bind('input propertychange', function() {
			if(!isNaN($('#vipVal').val())) {
				vipMoney = $('#vipVal').val();
				$('#totalDrawBackMoney').html(Number(hardwareMoney)+Number(publicMoney)+Number(minaMoney)+Number(vipMoney));
			}
			
		});
		function drawBackAccount() {
			var isValid = $("#drawBackForm").valid();
			var menuId = $("#btnId",parent.document).val();
			$("#menu").val(menuId);
			if(isValid) {
				var flag;
				if($("#harewareVal").val() == 0 && $("#publicVal").val() == 0 && $("#minaVal").val() == 0 && $("#vipVal").val() == 0) {
					flag = false;
					layer.msg("您还未输入一个非0的退款金额",{icon:7,time:1500});
				}else {
					flag = true;
				}
			}
			if(isValid && flag) {
				var locked = false;
				layer.confirm('是否确认退款?', {
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
							url : "${ctx}/agentSystem/SysUser/updateDrawBackAccount",
							type : "post",
							dataType : "json",
							data : $('#drawBackForm').serialize(),
							success : function(result) {
								if (result == 1) {
									layer.close(index);
									$("#drawBackModal").modal("hide");
									layer.msg("退款成功！", {
										icon : 1,
										time : 1000
									});
									setTimeout("sumbitForm()",1000);
								} else {
									$("#drawBackModal").modal("hide");
									layer.msg("退款失败！", {
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
		function deleteBylogic(agentId) {
			
			$("#id").val(agentId);
			var menuId = $("#btnId",parent.document).val();
			$("#menuId").val(menuId);
			layer.confirm('确认要删除该代理商吗?', {
				closeBtn : 0,
				skin : 'layui-layer-molv',
				icon : 3,
				btn : [ '确认', '取消' ]
			//按钮
			},function() {
				var index = layer.load(1, {shade: [0.1,'#fff']});
				$.ajax({
					url : "${ctx}/agentSystem/SysUser/updateDelState",
					type : "post",
					dataType : "json",
					data : $('#jump').serialize(),
					success : function(result) {
						if (result == 1) {
							layer.close(index);
							if('${record}'=='1'){
								$("#pageNo").val($("#pageNo").val()-1);
							}
							layer.msg("删除成功！", {
								icon : 1,
								time : 1000
							});
							setTimeout("sumbitForm()",1000);
						} else if(result == 0){
							layer.close(index);
							layer.msg("删除失败，该代理商仍有下级代理商存在！", {
								icon : 2,
								time : 1000
							});
						}
					}
				});
		
			});
		}
		function order(agentId) {
			$("#jump").attr("action", "${ctx}/agentSystem/SysUser/getOrderAgent");
			$("#id").val(agentId);
			$("#jump").submit();
		}
		
		function transfer(agentId) {
			$("#jump").attr("action", "${ctx}/agentSystem/SysUser/getTransferAgent");
			$("#id").val(agentId);
			$("#jump").submit();
		}
		
		function sumbitForm() {
			$("#searchForm").submit();
		}
	</script>

</body>
</html>