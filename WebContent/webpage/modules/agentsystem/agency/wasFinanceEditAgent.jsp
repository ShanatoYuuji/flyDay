
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 财务编辑代理商页面 -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
</head>
<body>
	<div class="row divControl">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<h3 class="cardTitle">代理商基本信息设置</h3>
					<hr class="m-t-0 m-b-40">
					<form action="#" method="post" style="width: 100%" id="editForm">
					<input type="hidden" value="" id="menuId" name="menuIdA"> 
						<div class="form-body">
							<div class="row">
								<input id="userId" name="id" type="hidden" value="${agent.id}" /> 
								<input id="oldName" name="oldName" type="hidden" value="${agent.login_name}" />
								<input id="oldCompanyName" name="company" type="hidden" value="${fn:escapeXml(agent.companyName)}" />  
								<input id="oldPassword" name="oldPassword" type="hidden" value="${agent.password}"/> 
								<input id="publicAccountDeduct" name="publicAccountDeduct" type="hidden" value="" /> 
								<input id="minaAccountDeduct" name="minaAccountDeduct" type="hidden" value="" /> 
								<input id="hardwareAccountDeduct" name="hardwareAccountDeduct" type="hidden" value="" /> 
								<input id="vipAccountDeduct" name="vipAccountDeduct" type="hidden" value="" /> 
								<input  name="operation" type="hidden" value="编辑" /> 
								<div class="col-md-6">
									<div class="form-group row">

										<label class="col-3 col-form-label">账号：</label>

										<div class="col-md-9">
											<input type="text" class="form-control" name="login_name" value="${agent.login_name}"
												readonly>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>联系方式：</label>
										<div class="col-md-9">
										<div>
											<input type="text" autocomplete="off" class="form-control height-control"
												name="mobile" value="${agent.mobile}">
										</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>公司全称：</label>
										<div class="col-md-9">
										<div>
											<input type="text" autocomplete="off" class="form-control height-control" id="companyName" name="companyName" value="${fn:escapeXml(agent.companyName)}" maxlength="30">
											</div>
										</div>
									</div>


									<div class="form-group row">
										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>公司地址：</label>
										<div class="col-md-9">
											<div>
											<input type="text" autocomplete="off" class="form-control height-control" name="address" value="${fn:escapeXml(agent.address)}" maxlength="50">
											</div>
										</div>
									</div>

									<div class="form-group row">
									
										<label class="col-3 col-form-label">QQ：</label>
										<div class="col-md-9">
											<div>
											<input type="text" autocomplete="off" class="form-control height-control" name="qq" value="${agent.qq}" maxlength="15" id="qq">
											</div>
										</div>
										
									</div>
									 
									<div class="form-group row">
										<label class="col-3 col-form-label" id="theaterspan"></label>
										<div class="col-md-9">
											<div>
											<input id="theaterRow" type="text" autocomplete="off" class="form-control height-control" name="theater" value="${fn:escapeXml(agent.theater)}" maxlength="10">
											<span class="help-block">二级代理商无需填写此项</span>
											</div>
										</div>
										
									</div>


									<div class="form-group row">
										<label class="col-3 col-form-label">套餐折扣：</label>
										<div class="col-md-9">
											<div>
											<div class="input-group">
												<input type="text" autocomplete="off" class="form-control height-control rightAngle" id="packageDiscountV" name="packageDiscount" value="${agent.packageDiscount}" maxlength="5"> <span
													class="input-group-addon height-control leftAngle">折</span>
											</div>
											<span id="packageDiscount" class="help-block"></span>
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-3 col-form-label">公众号折扣：</label>
										<div class="col-md-9">
											<div>
											<div class="input-group">
												<input type="text" autocomplete="off" class="form-control height-control rightAngle" id="publicDiscountV" name="publicDiscount" value="${agent.publicDiscount}" maxlength="5"> <span
													class="input-group-addon height-control leftAngle">折</span>
											</div>
											<span id="publicDiscount" class="help-block"></span>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label">小程序折扣：</label>
										<div class="col-md-9">
											<div>
											<div class="input-group">
												<input type="text" autocomplete="off" class="form-control height-control rightAngle" id="minaDiscountV" name="minaDiscount" value="${agent.minaDiscount}" maxlength="5"> <span
													class="input-group-addon height-control leftAngle">折</span>
											</div>
											<span id="minaDiscount" class="help-block"></span>
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>客户等级：</label>
											
										<div class="col-md-9">
											<input type="radio" class="check" id="square-radio-A" name="customerLevel" data-radio="iradio_square-blue" value="0" >
	                                        <label for="square-radio-1">普通客户</label>
	                                         <input type="radio" class="check" id="square-radio-B" name="customerLevel" data-radio="iradio_square-blue" value="1" >
	                                        <label for="square-radio-2">VIP客户</label>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-3 col-form-label">时间范围：</label>
										<div class="col-md-9">
											<div class="input-daterange input-group" id="date-range">
												<input type="text" class="form-control height-control rightAngle" name="startDateA"
													  readonly="readonly" value="<fmt:formatDate value="${agent.startDate}" pattern="yyyy-MM-dd"/>"> <span
													class="input-group-addon bg-info b-0 text-white height-control addCentreControl">至</span> <input
													type="text" class="form-control height-control" name="endDateA" readonly="readonly" value="<fmt:formatDate value="${agent.endDate}" pattern="yyyy-MM-dd"/>">
											</div>
										</div>
									</div>



								</div>


								<!--/span-->
								<div class="col-md-6">
									<div class="form-group has-danger row">
										<label class="col-3 col-form-label">密码：</label>
										<div class="col-md-9">
											<div>
											<input type="text" autocomplete="off"
												class="form-control form-control-danger height-control" name="password" placeholder="如不修改密码，请不要输入" >
												</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>负责人：</label>
										<div class="col-md-9">
										<div>
											<input type="text" autocomplete="off" class="form-control height-control"
												name="name" value="${fn:escapeXml(agent.name)}" maxlength="10">
											</div>
										</div>
									</div>
									
									<div class="form-group row " >
										<label class="col-3 col-form-label"><span
											style="color: red;height:27px">*&nbsp;</span>地区：</label>
											<div data-toggle="distpicker" class="col-md-9 area">
													<div class="row" style="height:35px">
													<div class="col-md-4 ">
														<div class="form-group row">
															<div class="col-sm-12 col-xs-12">
																<div>
																	<select class="form-control height-control" id="province" name="province"></select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group row">
															<div class="col-sm-12 col-xs-12">
																<div>
																	<select class="form-control height-control" id="city" name="city"></select>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group row">
															<div class="col-sm-12 col-xs-12">
																<div>
																	<select class="form-control height-control" id="county" name="county"></select>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
									</div>
									

									<div class="form-group row">
										<label class="col-3 col-form-label">邮箱：</label>
										<div class="col-md-9">
										<div>
											<input type="text" autocomplete="off" class="form-control height-control" name="email" value="${agent.email}" maxlength="30">
										</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label">微信号：</label>
										<div class="col-md-9">
											<div>
											<input type="text" autocomplete="off" class="form-control height-control" name="wechat" value="${agent.wechat}" maxlength="20">
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-3 col-form-label" id="principalspan"></label>
										<div class="col-md-9">
											<div>
											<input id="principalRow" type="text" autocomplete="off" class="form-control height-control" name="principal" value="${fn:escapeXml(agent.principal)}" maxlength="10">
											<span class="help-block">二级代理商无需填写此项</span>
											</div>
										</div>
			
									</div>

									<div class="form-group row">
										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>所属上级：</label>
										<div class="col-md-9">

											<div class="editable-input" style="position: relative;">
												<select class="form-control input-sm height-control" name="companyParentId" id="companyParentId" >
													<option value="">--请选择--</option>
													<option value="1">无锡微炫客</option>
													<c:forEach items="${agentUser}" var="agent">
													<c:if test="${agent.companyName!='无锡微炫客'}">
														<option value="${agent.id}">${fn:escapeXml(agent.companyName)}</option>
														</c:if>
													</c:forEach>
												</select>
											</div>

										</div>
									</div>

									<div class="form-group row" >
										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>代理商等级：</label>
										<div class="col-md-9">

											<div class="editable-input" style="position: relative;">
												<select class="form-control input-sm selectChange height-control" name="agentLevelIdA" id="agentLevelIdA">
												
												</select>
											</div>
											<div id="WasSalesPolicys" style="max-height:63px;overflow-y:auto;">
											
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-3 col-form-label">证书：</label>
										<div class="col-md-9">
											<div class="input-group">
											<input type="text" class="form-control singleGraph height-control leftAngle rightAngle" name="certificate" id="certificate" value="${agent.certificate}" readonly>
												<button type="button"
													class="btn waves-effect waves-light btn-info height-control leftAngle"  onclick="lopen('upImg','certificate','1')">上传</button>
											</div>
										</div>
									</div>

								</div>
							</div>
							<!--/row-->
						</div>
						<div class="form-group row">
							<label class="col-3 col-form-label"></label>
							<div class="col-9">
								<div class="text-xs-right" style="text-align: right;">
									<button type="button" class="btn btn-default" onclick="jump()">返回</button>
									<button type="button"
										class="btn waves-effect waves-light btn-info" onclick="save()">确认</button>
								</div>
							</div>
						</div>
					
					</form>
				</div>

			</div>
		</div>
	</div>
	<script src="${ctxStatic}/agentSystem/js/distpicker.data.js"></script>
	<script src="${ctxStatic}/agentSystem/js/distpicker.js"></script>
	<script src="${ctxStatic}/agentSystem/js/main.js"></script>
	<script type="text/javascript">
		packageDiscountV=0.01;
		publicDiscountV=0.01;  
		minaDiscountV=0.01;
		$("document").ready(function() {
			
			if(Number('${agent.customerLevel}') == 0) {
				$("#square-radio-A").iCheck('check');
			}else {
				$("#square-radio-B").iCheck('check');
			}
			
			//表单验证
			$("#editForm").validate(
				{
					rules : {
						password : {
							minlength : 6,
							maxlength : 20,
							alnum : true
						},
						companyName : {
							required : true,
							maxlength : 30,
							remote:{
							    type:"POST",
							    url:"${ctx}/agency/wasAgentApply/validateCompanyName",
							           
								data:{
									companyName:function(){return $("#companyName").val();},
									oldName:function(){return $("#oldCompanyName").val();},
									operation:"编辑"
							      }
								}
						},
						name : {
							required : true,
							minlength : 2,
							maxlength : 10
						},
						mobile:{
		    				required:true,
		    				isphone:true,
		    			},
		    			province:{
		    				validateArea:true,
		    			},
						address : {
							required : true,
							maxlength : 50
						},
						email : {
							maxlength : 30,
							email : true
						},
						qq :{
							isNumber : true
						},
						wechat :{
							isWeiXin:true
						},
						theater :{
							required : true,
						},
						principal :{
							required : true,
							minlength : 2,
						},
						packageDiscount :{
							oneValdate:true,
							range:[0.1,10],
							min:packageDiscountV*10,
							max:Number('${minPackageDiscount}')
						},
						agentLevelIdA :{
							required : true
						},
						publicDiscount :{
							oneValdate:true,
							range:[0.1,10],
							min:publicDiscountV*10,
							max:Number('${minPublicDiscount}')
						},
						minaDiscount :{
							oneValdate:true,
							range:[0.1,10],
							min:minaDiscountV*10,
							max:Number('${minMinaDiscount}')
						},
						customerLevel :{
							required : true
						},
						companyParentId :{
							required : true
						}
						
					},
					
					//错误信息提示
					messages:{
						password : {
							minlength : "密码最少为6位字符",
							maxlength : "密码最少为20位字符",
							alnum:"密码只能由数字和字母组成"
						},
						companyName : {
							required : "请输入公司名称",
							maxlength : "账户名称最多为30个字符",
							remote : "此公司名已经注册过"
						},
						name : {
							required : "请输入负责人名称",
							minlength : "负责人名称最少为2个字符",
							maxlength : "负责人名称最多为10个字符"
						},
						mobile:{
		    				required:"请输入联系方式",
		    			},
		    			select : {
							min : "请选省，市，区"
						},
						address : {
							required : "请输入公司地址",
							maxlength : "公司地址最多为50个字符"
						},
						email : {
							maxlength : "邮箱最多为30个字符",					
						},
						wechat :{
							maxlength : "微信最多为20个字符"
						},
						theater :{
							required : "请输入战区",
						},
						principal :{
							required : "请输入战区负责人",
							minlength : "战区负责人名称最少为2个字符",
						},
						packageDiscount :{
							oneValdate:"只能是大于0小于等于10的一位小数或一位整数",
							range:"只能是大于0小于等于10的一位小数或一位整数",
							min:"不能低于上级代理商折扣",
							max:"不能高于下级代理商${minPackageDiscount}折"
						},
						agentLevelIdA :{
							required : "请选择代理商等级"
						},
						publicDiscount :{
							oneValdate:"只能是大于0小于等于10的一位小数或一位整数",
							range:"只能是大于0小于等于10的一位小数或一位整数",
							min:"不能低于上级代理商折扣",
							max:"不能高于下级代理商${minPublicDiscount}折"
						},
						minaDiscount :{
							oneValdate:"只能是大于0小于等于10的一位小数或一位整数",
							range:"只能是大于0小于等于10的一位小数或一位整数",
							min:"不能低于上级代理商折扣",
							max:"不能高于下级代理商${minMinaDiscount}折"
						},
						customerLevel :{
							required : "请选择客户等级"
						},
						companyParentId:{
							required : "请选择所属上级"
						}
					},
					errorPlacement : function(error, element) {	
						if(element.attr("id")=="province"){
		            		$(".area").append(error);
		            	}else if(element.attr("type")=="radio"){
		            		error.insertAfter( element.parent().parent());
		            	}else if(element.attr("id")=="packageDiscountV"||element.attr("id")=="publicDiscountV"||element.attr("id")=="minaDiscountV"){
		            		error.insertAfter(element.parent().parent());
		            	}else{
		            		error.insertAfter(element.parent());
		            	}  				            	         
					}
				});
			
			if('${agent.certificate}' != null &&  '${agent.certificate}' != '') {
				if($("#certificatefile").length<=0){
			 		var attr='<div id="certificatefile">'
				 		+'&nbsp;&nbsp;&nbsp;'
				 		+'<img src="" id="picturefile" style="width:100px;margin-top:10px;">'
				 		+'&nbsp;&nbsp;'
				 		+'<a href="javascript:void(0);" onclick="singleFileDel(certificate)">×</a>'
				 		+'</div>';
				   document.getElementById('certificate').parentNode.insertAdjacentHTML('afterend', attr);
		 		}
				$("#picturefile").attr("src",'${vicmobAgentSystemFileUrl}${agent.certificate}');
			}
			//控制初始化折扣
			$("#packageDiscountV").rules("remove","min");
			$("#packageDiscountV").rules("add",{min:Number('${directAgent.packageDiscount}')*10});
			$("#publicDiscountV").rules("remove","min");
			$("#publicDiscountV").rules("add",{min:Number('${directAgent.publicDiscount}')*10});
			$("#minaDiscountV").rules("remove","min");
			$("#minaDiscountV").rules("add",{min:Number('${directAgent.minaDiscount}')*10});
			if('${directAgent.id}' == '1'){
				$('#packageDiscount').empty().html('当前上级代理商折扣0.1折');
				$('#publicDiscount').empty().html('当前上级代理商折扣0.1折');
				$('#minaDiscount').empty().html('当前上级代理商折扣0.1折');
			}else{
				$('#packageDiscount').empty().html('当前上级代理商折扣'+('${directAgent.packageDiscount}')*10+'折');
				$('#publicDiscount').empty().html('当前上级代理商折扣'+('${directAgent.publicDiscount}')*10+'折');
				$('#minaDiscount').empty().html('当前上级代理商折扣'+('${directAgent.minaDiscount}')*10+'折');
				
			}
			
			if('${directAgent.id }'  == 1) {
				$("#agentLevelIdA").append(
						'<option value="">--请选择--</option>'
						+'<c:forEach items="${allWasAgentLevel}" var="level">'
						+'<c:if test="${level.delegateAgent != 2}">'
						+'<option value="${level.salesPolicyIds}@${level.agentLevelId}">${fn:escapeXml(level.name)}</option>'
						+'</c:if>'
						+'</c:forEach>');
				$("#theaterspan").html('<span style="color: red">*&nbsp;</span>所属战区：');
				$("#principalspan").html('<span style="color: red">*&nbsp;</span>战区负责人：');
				
			}else {
				$("#agentLevelIdA").append(
						'<option value="">--请选择--</option>'
						+'<c:forEach items="${allWasAgentLevel}" var="level">'
						+'<c:if test="${level.delegateAgent == 2}">'
						+'<option value="${level.salesPolicyIds}@${level.agentLevelId}">${fn:escapeXml(level.name)}</option>'
						+'</c:if>'
						+'</c:forEach>');
				$("#theaterspan").html('所属战区：');
				$("#principalspan").html('战区负责人：');
				$("#theaterRow").rules('remove','required');
				$("#principalRow").rules('remove','required');
			}
				$.ajax({
					type : "POST",
					dataType : "json",
					url : "${ctx}/agency/wasAgentApply/getWasSalesPolicys",
					data : {'ids':'${currentAgentLevel.salesPolicyIds}'}, 
					success : function(result) {
						for(var i=0;i<result.length;i++){
							var attr=$('<div class="editable-input" style="position: relative;"></div>')
							attr.text(result[i].title);
							$('#WasSalesPolicys').append(attr);	
						}
					}
				});		
				jQuery.validator.addMethod("oneValdate", function(value, element) {					
					var reg = /^[0-9]+(.[0-9]{1})?$/;
					if(reg.test(value) || value == ""){
				   		return true;
				  	} else {
						return false;
					}   		   
				},"请输入正确格式");
			jQuery.validator.addMethod("isphone", function (value, element) {  
				  var isphone =  /^((0\d{2,3}-\d{7,8})|(1[3567984]\d{9}))$/;    
			    return this.optional(element) || (isphone.test(element.value));  
			}, $.validator.format("请输入正确的电话号码"));
			jQuery.validator.addMethod("alnum", function(value, element) {
				 return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
				 }, "只能包括英文字母和数字");
	        jQuery.validator.addMethod("isRightDecimalForm", function(value, element) {
	            var rightDecimalForm = /^(?=0\.[1-9]|[1-9]\.\d).{3}$|^([1-9])$/;
	            return (rightDecimalForm.test(value));
	        }, "折扣只能是大于0小于10的一位小数或一位整数");
	        $.validator.addMethod("isWeiXin",function(value, element) {
	    		if(element.value.indexOf("@")!=-1){
	    			return this.optional(element)||RegExp(/^([a-z0-9A-Z]+[-|.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?.)+[a-zA-Z]{2,}$/).test(element.value);
	    		}else{
	    			return this.optional(element)||RegExp(/^[1-9]\d{5,19}$/).test(element.value)||RegExp(/^1[3567984]\d{9}$/).test(element.value)||RegExp(/^[a-zA-Z][-_a-zA-Z0-9]{5,19}$/).test(element.value);
	    		}
	    	}, "请输入正确的微信号");
	        jQuery.validator.addMethod("validateArea", function(value, element) {
	            var str = "";
	            return (str != value);
	        }, "请选择地区");
	    	$.validator.addMethod("isNumber",function(value, element) {
	    		if($("#qq").val() == '') {
	    			return true;
	    		}else {
	    			return this.optional(element)||RegExp(/^[1-9][0-9]{4,14}$/).test(element.value);
	    		}
	    		
	    	}, "请输入正确的QQ号");
		});
		$(function(){
			 $("#companyParentId  option[value='${directAgent.id}'] ").attr("selected",true);
			 $("#agentLevelIdA option[value='${currentAgentLevel.salesPolicyIds}@${currentAgentLevel.agentLevelId}'] ").attr("selected",true);
			 
			 $("#province").val('${agent.province}');
			 $("#province").trigger("change");
			 $("#city").val('${agent.city}');
			 $("#city").trigger("change");
			 $("#county").val('${agent.county}');
			 $("#county").trigger("change");
		});
		//方针显示
		$(".selectChange").on("change",function(){
			$('#WasSalesPolicys').empty();
			if(this.value!='') {
				if(this.value.split("@")[0]!=''){
					$.ajax({
						type : "POST",
						dataType : "json",
						url : "${ctx}/agency/wasAgentApply/getWasSalesPolicys",
						data : {'ids':this.value.split("@")[0]}, 
						success : function(result) {
							for(var i=0;i<result.length;i++){
								var attr=$('<div class="editable-input" style="position: relative;"></div>')
								attr.text(result[i].title);
								$('#WasSalesPolicys').append(attr);
							}
						}
					});	
				}
			}
			
		});
		
		//折扣控制
		$("#companyParentId").on("change",function(){
			if(this.value!=''){
				$.ajax({
					type : "POST",
					dataType : "json",
					url : "${ctx}/agency/wasAgentApply/get",
					data : {'id':this.value}, 
					success : function(result) {
						packageDiscountV=result.packageDiscount;
						publicDiscountV=result.publicDiscount;
						minaDiscountV=result.minaDiscount;
						$("#packageDiscountV").rules("remove","min");
						$("#packageDiscountV").rules("add",{min:packageDiscountV*10});
						$("#publicDiscountV").rules("remove","min");
						$("#publicDiscountV").rules("add",{min:publicDiscountV*10});
						$("#minaDiscountV").rules("remove","min");
						$("#minaDiscountV").rules("add",{min:minaDiscountV*10});
						if(result.packageDiscount!=null){
							$('#packageDiscount').empty().html('当前上级代理商折扣'+result.packageDiscount*10+'折');
						}else{
							$('#packageDiscount').empty().html('当前上级代理商折扣0.1折');
						}
						if(result.publicDiscount!=null){
							$('#publicDiscount').empty().html('当前上级代理商折扣'+result.publicDiscount*10+'折');
						}else{
							$('#publicDiscount').empty().html('当前上级代理商折扣0.1折');
						}
						if(result.minaDiscount!=null){
							$('#minaDiscount').empty().html('当前上级代理商折扣'+result.minaDiscount*10+'折');
						}else{
							$('#minaDiscount').empty().html('当前上级代理商折扣0.1折');
						}
					}
				});	
			}
			$("#WasSalesPolicys").empty();
			$("#agentLevelIdA").empty();
			if(this.value == 1) {
				$("#agentLevelIdA").append(
						'<option value="">--请选择--</option>'
						+'<c:forEach items="${allWasAgentLevel}" var="level">'
						+'<c:if test="${level.delegateAgent != 2}">'
						+'<option value="${level.salesPolicyIds}@${level.agentLevelId}">${fn:escapeXml(level.name)}</option>'
						+'</c:if>'
						+'</c:forEach>');
				$("#theaterspan").html('<span style="color: red">*&nbsp;</span>所属战区：');
				$("#principalspan").html('<span style="color: red">*&nbsp;</span>战区负责人：');
				$("#theaterRow").rules('add',{required:true});
				$("#principalRow").rules('add',{required:true});
			}else {
				$("#agentLevelIdA").append(
						'<option value="">--请选择--</option>'
						+'<c:forEach items="${allWasAgentLevel}" var="level">'
						+'<c:if test="${level.delegateAgent == 2}">'
						+'<option value="${level.salesPolicyIds}@${level.agentLevelId}">${fn:escapeXml(level.name)}</option>'
						+'</c:if>'
						+'</c:forEach>');
				$("#theaterspan").html('所属战区：');
				$("#principalspan").html("战区负责人：");
				$("#theaterRow").rules('remove','required');
				$("#principalRow").rules('remove','required');
			}
		});
		
		function save() {			
			var isValid = $("#editForm").valid();
			var menuId = $("#btnId",parent.document).val();
			$("#menuId").val(menuId);
			var locked = false;
			if (isValid) {
				layer.confirm('是否确认保存？', { icon : 3 ,closeBtn : 0,
					 skin : 'layui-layer-molv',btn: ['确认','取消']},function(){
						 if(!locked){
							locked=true;
							var index = layer.load(1, {shade: [0.1,'#fff']});
								$.ajax({
										type : "POST",
										dataType : "json",
										url : "${ctx}/agency/wasAgentApply/save",
										data : $('#editForm').serialize(),
										success : function(result) {
											layer.close(index);
											if (parseInt(result) == 1) {
												layer.msg("编辑成功", {
													time:1000,
													icon:1,
												},function(data){
													window.location.href = "${ctx}/agentSystem/SysUser/list";	
												}
												);
											}else if(parseInt(result) == 0){
												layer.msg("编辑失败", {
													time:1000,
													icon:2,
												},function(data){
													location=location;
												});
											}
										}
									});
						 }
					 });
			}
		}
		function jump() {
			layer.confirm('确认放弃本次操作？', { icon : 3 ,closeBtn : 0,
				 skin : 'layui-layer-molv',btn: ['确认','取消']},function(){
					 window.location.href = "${ctx}/agentSystem/SysUser/list";
				 });
		}
	</script>
</body>
</html>