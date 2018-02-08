
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!--总代申请代理商页面-->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
	<style type="text/css">
		select.error{
			color:#67757c;
		}
		#startDateA-error{
			width: 55%;
   			text-align: left;
   			display:inline-block!important;
		}
		input {
			font-size:13px!important;
		}
	</style>
</head>
<body>
	<div class="row divControl">
		<div class="col-md-12">
			<div class="card">
				<div class="card-body">
					<h3 class="box-title cardTitle">代理商基本信息设置</h3>
					<hr class="m-t-0 m-b-40">
					<form action="#" method="post"
						style="width: 100%" id="addForm">
						<div class="form-body">

							<div class="row">
								<input id="userId" name="id" type="hidden" value="" /> 
								<input id="oldName" name="oldName" type="hidden" value="" /> 
								<input id="oldPassword" name="oldPassword" type="hidden" value="" /> 
								<input  name="operation" type="hidden" value="申请" /> 
								<input id="publicAccountDeduct" name="publicAccountDeduct" type="hidden" value="" /> 
								<input id="minaAccountDeduct" name="minaAccountDeduct" type="hidden" value="" /> 
								<input id="hardwareAccountDeduct" name="hardwareAccountDeduct" type="hidden" value="" /> 
								<input id="vipAccountDeduct" name="vipAccountDeduct" type="hidden" value="" /> 
								<input id="menuIdA" name="menuIdA" type="hidden" value="" /> 
								<div class="col-md-6">
									<div class="form-group row">

										<label class="col-3 col-form-label"><span
											style="color: red">*&nbsp;</span>账号：</label>

										<div class="col-md-9">
											<input type="text" class="form-control height-control" id="agentin_name" name="login_name" maxlength="15">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>负责人：</label>
										<div class="col-md-9">
											<div>
												<input type="text" class="form-control" maxlength="10" name="name">
												<span class="help-block">公司负责人或企业法人</span>	
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>公司全称：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" id="companyName" maxlength="30"
												name="companyName">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>公司地址：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" maxlength="50"
												name="address">

										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label">QQ：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" maxlength="20"
												name="qq">
										</div>
									</div>
										
									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>套餐折扣：</label>
										<div class="col-md-9">
											<div>
												<div class="input-group">
													<input type="text" class="form-control rightAngle height-control"  name="packageDiscount" id="packageDiscountV" maxlength="5"> 
													<span class="input-group-addon height-control leftAngle">折</span>
												</div>
												<span id="packageDiscount" class="help-block">当前上级代理商折扣<fmt:formatNumber value=" ${sysUser.packageDiscount*10}" type="currency" pattern="#0.0#"/>折</span>
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>公众号折扣：</label>
										<div class="col-md-9">
											<div>
												<div class="input-group">
													<input type="text" class="form-control rightAngle height-control"  name="publicDiscount" id="publicDiscountV" maxlength="5"> 
													<span class="input-group-addon height-control leftAngle">折</span>
												</div>
												<span id="publicDiscount" class="help-block">当前上级代理商折扣<fmt:formatNumber value="${sysUser.publicDiscount*10}" type="currency" pattern="#0.0#"/>折</span>
											</div>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>小程序折扣：</label>
										<div class="col-md-9">
											<div>
												<div class="input-group">
													<input type="text" class="form-control rightAngle height-control"  name="minaDiscount" id="minaDiscountV" maxlength="5">
													<span class="input-group-addon height-control leftAngle">折</span>
												</div>
												<span id="minaDiscount" class="help-block">当前上级代理商折扣<fmt:formatNumber value="${sysUser.minaDiscount*10}" type="currency" pattern="#0.0#"/>折</span>
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>客户等级：</label>
										<div class="col-md-9">
											<input type="radio" class="check"  name="customerLevel" data-radio="iradio_square-blue" value="0" checked>
	                                        <label for="square-radio-A">普通客户</label>
	                                         <input type="radio" class="check"  name="customerLevel" data-radio="iradio_square-blue" value="1">
	                                        <label for="square-radio-B">VIP客户</label>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>时间范围：</label>
										<div class="col-md-9">
											<div class="input-daterange input-group" id="date-range">
												<input type="text" autocomplete="off" class="form-control rightAngle height-control" name="startDateA">
												<span class="input-group-addon bg-info b-0 text-white height-control leftAngle rightAngle">至</span>
												<input type="text" autocomplete="off" class="form-control height-control leftAngle" name="endDateA">
											</div>
											<label id="startDateA-error" class="error" for="startDateA" style=""></label>
											<label id="endDateA-error" class="error" for="endDateA" style=""></label>
										</div>

									</div>

								</div>


								<!--/span-->
								<div class="col-md-6">
									<div class="form-group has-danger row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>密码：</label>
										<div class="col-md-9">
											<input type="text" maxlength="20"
												class="form-control form-control-danger" name="password">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>联系方式：</label>
										<div class="col-md-9">
											<div>
												<input type="text" class="form-control" name="mobile">
												<span class="help-block">公司负责人或企业法人联系方式</span>
											</div>
										</div>
									</div>
									
									<div class="form-group row " >
										<label class="col-md-3 col-form-label"><span
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
										<label class="col-md-3 col-form-label">邮箱：</label>
										<div class="col-md-9">
											<input type="text" class="form-control"  maxlength="30"
												name="email">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-md-3 col-form-label">微信号：</label>
										<div class="col-md-9">
											<input type="text" class="form-control"  maxlength="20"
												name="wechat">
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>所属上级：</label>
										<div class="col-md-9">
											<input type="text" class="form-control" value="${sysUser.companyName}" readOnly>
											<input name="companyParentId" type="hidden" value="${sysUser.id}" /> 
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label"><span
											style="color: red">*&nbsp;</span>代理商等级：</label>
										<div class="col-md-9">
											<div class="editable-input" style="position: relative;">
												<select class="form-control input-sm selectChange height-control" name="agentLevelIdA">
													<option value="">--请选择--</option>
													<c:forEach items="${allWasAgentLevel}" var="agent">
														<c:if test="${agent.delegateAgent==2}">
															<option value="${agent.salesPolicyIds}@${agent.agentLevelId}">${fn:escapeXml(agent.name)}</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
											<div id="WasSalesPolicys" style="max-height:63px;overflow-y:auto;">
											
											</div>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-md-3 col-form-label">证书：</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="text" class="form-control singleGraph height-control rightAngle" name="certificate" id="certificate" readonly>
												<button type="button"
													class="btn btn-default leftAngle height-control btn-info" style=" height: 36px;font-size: 12px;" onclick="lopen('upImg','certificate','1')">上传</button>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
						<div class="form-group row">
							<div class="col-12">
								<div class="text-xs-right" style="text-align: right;">
									<button type="button" class="btn btn-default" onclick="jump()">返回</button>
									<button type="button"
										class="btn waves-effect waves-light btn-info" onclick="save()">保存</button>
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
		$("document").ready(function() {
			$('#menuIdA').val($('#btnId',parent.document).val()); 			
			//表单验证
			$("#addForm").validate(
					{
						rules : {
							login_name : {
								required : true,
								minlength : 5,
								isRightLoginNameForm : true,
								 remote:{
									    type:"POST",
									    url:"${ctx}/agentsystem/user/checkName",           
										data:{
											name:function(){return $("#agentin_name").val();},
											operation:"添加"
									      }
										}
							},
							password : {
								required : true,
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
											operation:"添加"
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
								isQQ:true
							},
							wechat :{
								isWeiXin : true
							},
							packageDiscount :{
								required : true,
								isRightDecimalForm : true,
								min:Number("${sysUser.packageDiscount*10}")
							},
							agentLevelIdA :{
								required : true
							},
							publicDiscount :{
								required : true,
								isRightDecimalForm : true,
								min: Number("${sysUser.publicDiscount*10}")
							},
							minaDiscount :{
								required : true,
								isRightDecimalForm : true,
								min: Number("${sysUser.minaDiscount*10}")
							},
							customerLevel :{
								required : true
							},
							startDateA :{
								required : true,
								isTime:true
							},
							endDateA : {
								required : true
							}
						},
						
						//错误信息提示
						messages:{
							login_name : {
								required : "请输入账户名称",
								minlength : "账户名称最少为5个字符",
								remote : "此账户名已经注册过"
							},
							password : {
								required : "请输入密码",
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
								email :"请填写正确邮箱格式"
							},
							packageDiscount :{
								required : "请输入套餐折扣",
								min:"不能低于上级代理商折扣"
							},
							agentLevelIdA :{
								required : "请选择代理商等级"
							},
							publicDiscount :{
								required : "请输入公众号折扣"	,
								min:"不能低于上级代理商折扣"
							},
							minaDiscount :{
								required : "请输入小程序折扣",
								min:"不能低于上级代理商折扣"
							},
							customerLevel :{
								required : "请选择客户等级"
							},
							startDateA :{
								required : "请选择开始时间"
							},
							endDateA :{
								required : "请选择结束时间"
							},
							companyParentId:{
								required : "请选择所属上级"
							}
						},
						errorPlacement : function(error, element) {	
							if(element.attr("id")=="province"){
			            		$(".area").append(error)
			            	}else if(element.attr("type")=="radio"){
			            		error.insertAfter( element.parent().parent());
			            	}else if(element.attr("name")=="startDateA"){
			            		$("#startDateA-error").append(error)
			            	}else if(element.attr("name")=="endDateA"){
			            		$("#endDateA-error").append(error)
			            	}else if(element.attr("id")=="packageDiscountV"||element.attr("id")=="publicDiscountV"||element.attr("id")=="minaDiscountV"){
			            		error.insertAfter(element.parent().parent());
			            	}else if(element.attr("name")=="mobile"||element.attr("name")=="name"){
			            		error.insertAfter(element.parent());
			            	}else{
			            		error.insertAfter(element);
			            	}  		            	         
						}
					});	
			jQuery.validator.addMethod("isphone", function (value, element) {  
			    var isphone =  /^((0\d{2,3}-\d{7,8})|(1[3567984]\d{9}))$/;   
			    return this.optional(element) || (isphone.test(element.value));  
			}, $.validator.format("请输入正确的电话号码"));
			 jQuery.validator.addMethod("alnum", function(value, element) {
				 return this.optional(element) || /^[a-zA-Z0-9]+$/.test(element.value);
				 }, "只能包括英文字母和数字");
	        jQuery.validator.addMethod("isRightDecimalForm", function(value, element) {
	            var rightDecimalForm = /^(?=0\.[1-9]|[1-9]\.\d).{3}$|^([1-9])$/;
	            return (rightDecimalForm.test(value));
	        }, "折扣只能是大于0小于10的一位小数或一位整数");
	        jQuery.validator.addMethod("validateArea", function(value, element) {
	            var str = "";
	            return (str != value);
	        }, "请选择地区");
	        $.validator.addMethod("isQQ",function(value, element) {
	    		return this.optional(element)||RegExp(/^[1-9][0-9]{4,14}$/).test(element.value);
	    	}, "请输入正确的QQ号");
	    	$.validator.addMethod("isWeiXin",function(value, element) {
	    		if(element.value.indexOf("@")!=-1){
	    			return this.optional(element)||RegExp(/^([a-z0-9A-Z]+[-|.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?.)+[a-zA-Z]{2,}$/).test(element.value);
	    		}else{
	    			return this.optional(element)||RegExp(/^[1-9]\d{4,14}$/).test(element.value)||RegExp(/^1[3567984]\d{9}$/).test(element.value)||RegExp(/^[a-zA-Z][-_a-zA-Z0-9]{5,19}$/).test(element.value);
	    		}
	    	}, "请输入正确的微信号");
	    	$.validator.addMethod("minNumber",function(value, element) {
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
			},"最多支持两位小数");
		});
		
		 jQuery.validator.addMethod("isRightLoginNameForm", function(value, element) {
	            var rightLoginNameForm = /^[a-zA-Z][a-zA-Z0-9]{4,14}$/;
	            return (rightLoginNameForm.test(element.value));
	        }, "账号只能由字母数字组成，且只能以字母开头"); 
		 
		 jQuery.validator.addMethod("isTime", function(value, element) {
	            var startTime=$("input[name='startDateA']").val();
	            var endTime=$("input[name='endDateA']").val();
	         if(startTime!=''&&startTime!=null&&endTime!=''&&endTime!=null){
		         if(new Date(startTime).getTime()>=new Date(endTime).getTime()){
		            return false;
		         }
			  }
	        return true;
	      }, "结束时间必须大于开始时间"); 
		 
		//日期范围选择
		jQuery('#date-range').datepicker({
			toggleActive : true,
			autoclose : true, 
			startDate:new Date(),
			format : "yyyy-mm-dd",
			
		});
	
		//方针显示
		$(".selectChange").on("change",function(){
			$('#WasSalesPolicys').empty();
			if(this.value!=''&&this.value.split("@")[0]!=''){
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
		});
		
		
		function jump() {
			layer.confirm('确认放弃本次操作？', { icon : 3 ,closeBtn : 0,
				 skin : 'layui-layer-molv',btn: ['确认','取消']},function(){
					 window.location.href = "${ctx}/agency/wasAgentApply/list";
				 });
		}
		
		function save(){
			var locked = false;
			var isValid = $("#addForm").valid();
			if (isValid) {
				layer.confirm('是否确认保存？', { icon : 3 ,closeBtn: 0,
					 skin : 'layui-layer-molv',btn: ['确认','取消']},function(){
					if(!locked){
						$('#ModalSure').modal("hide");	
						locked=true;
						var index = layer.load(1, {shade: [0.1,'#fff']});
						$.ajax({
							type : "POST",
							dataType : "json",
							url : "${ctx}/agency/wasAgentApply/save",
							data : $('#addForm').serialize(),
							success : function(result) {
								layer.close(index);
								if (parseInt(result) == 1) {
									layer.msg("保存成功", {
											time:1000,
											icon:1,
									},function(data){
										 window.location.href = "${ctx}/agency/wasAgentApply/list";	
									}
									);
									}else if(parseInt(result) == 0){
										layer.msg("保存失败", {
											time:1000,
											icon:2,
										},function(data){
											location=location;
										});
									}
								},
							error:function(){
								layer.msg("保存失败", {
									time:1000,
									icon:2,
								},function(data){
									location=location;
								});
							}
							});
					}
				});
			}
		}
	</script>
</body>
</html>