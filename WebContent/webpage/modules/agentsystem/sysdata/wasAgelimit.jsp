
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 服务年限 -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
<style type="text/css">
#year-error{
    margin-left:139px;
    color:red;
}
</style>
</head>
<body>
	<div class="divControl">
		<div class="card cardControl">
			<!-- Nav tabs -->
			
			<!-- Tab panes -->
			<div class="tab-content">
				<div class="tab-pane p-20 active" id="home2" role="tabpanel">
					<div class="row button-group col-3" style="float: left;">
						<shiro:hasPermission name="sysdata:wasAgelimit:add">
						 <button style="margin-bottom:16.35px;" type="button" class="btn btn-info" onclick="show(this)">
							<i class="fa fa-plus-circle"></i> 添加
						</button>  			
						</shiro:hasPermission>
					</div>
					
					<table id="contentTable" class="display nowrap table table-hover table-striped table-bordered">
						<thead>
							<tr>
								<th class="tableControl">年限/年</th>
								<th class="tableControl">添加时间</th>
								<th class="tableControl">操作</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${ageList}" var="ageLimit">
								<tr>
									<td class="tableControl">${ageLimit.year}</td>
									<td class="tableControl"><fmt:formatDate value="${ageLimit.createDate}" type="both" /></td>
									<td class="tableControl">
										 
										<shiro:hasPermission name="sysdata:wasAgelimit:del">
											<button type="button" data-toggle="tooltip" onclick="deleteAge(${ageLimit.agelimitId})" data-original-title="删除" class="btn btn-danger btn-circle btn-xs ">
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

	<!-- 模态框 -->
	<div class="modal fade" id="modal" data-backdrop="static">
		<div class="modal-dialog">
			<!--宽高、定位-->
			<div class="modal-content" style="margin-top:225px">
				<!--对话框头-->
				<div class="modal-header"
					style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
						<h6 id="title" class="modal-title">添加年限</h6>
				</div>
				<!--主体部分-->
				<div class="modal-body">
					<form id="inputForm" >
					<input type="hidden" id="softwareId" name="softwareId" />
					<input type="hidden" id="menuId" name="menuId" />
						<div class="form-group row">
							<label for="example-text-input" class="col-3 col-form-label"><span style="color:red">*&nbsp;</span>服务年限：</label>
							<div class="col-8 controls input-group">
								<input maxlength="2" style="border-radius:0.25rem 0 0 0.25rem ;height:35px"  id="year" autocomplete="off" type="text" name="year"
									class="form-control" >
								 <span class="input-group-addon height-control" style="border-radius:0 0.25rem 0.25rem 0;border-left:0px;" >年</span> 
							</div>
						</div>
						 <input type="text" style="display:none"> 
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
	
		
		//日期范围选择
		jQuery('#date-range').datepicker({
			toggleActive : true,
			autoclose: true,
			format : "yyyy-mm-dd"
		});
		//弹框显示
		function show(ob) {
			$(ob).blur();
			$("#year").val("");
		    $("#inputForm").data("validator").resetForm();
			$("#modal").modal("show");
		}
		
		//添加保存
		function save(){
			var isValid = $("#inputForm").valid();
			$("#menuId").val($("#btnId",parent.document).val());
			var lock=true;
			if(isValid){
			 layer.confirm('是否确认保存？', {closeBtn : 0, icon : 3 ,
				 skin : 'layui-layer-molv',btn: ['确认','取消']},function(){
					 if(lock){
						 lock=false;
					 $("#modal").modal("hide");
					 var index = layer.load(1, {shade: [0.1,'#fff']});
					 $.ajax({
							url : "${ctx}/agentSystem/wasAgelimit/save",
							dataType : "json",
							type : "post",
							data : $('#inputForm').serialize(),
							success : function(result) {
								layer.close(index);
								if (result >0) {
									layer.msg("保存成功",{icon:1,time:1000},function(){
										location.href="${ctx}/agentSystem/wasAgelimit/list";
									});
								}
							},error : function(){
								layer.close(index);
								layer.msg("保存失败",{icon:2,time:1000},function(){
									location.href="${ctx}/agentSystem/wasAgelimit/list";
								});
							}
						});  
					 }
				});
			}
		}
		//删除
		function deleteAge(id){
			var menuId=$("#btnId",parent.document).val();
			layer.confirm("确认要彻底删除数据吗?",{closeBtn:0,skin : "layui-layer-molv",btn : [ "确认","取消" ],icon:3},
					function() {
				var index = layer.load(1, {shade: [0.1,'#fff']});
				$.ajax({
					url :"${ctx}/agentSystem/wasAgelimit/delete",
					dataType : "json",
					Type : "post",
					data : {"agelimitId":id,"menuId":menuId},
					success : function(result){
						layer.close(index);
						if(result>0){
							layer.msg("删除成功",{icon:1,time:1000},function(){
								location.href="${ctx}/agentSystem/wasAgelimit/list";
							});
						}
					},
					error : function(){
						layer.close(index);
						layer.msg("删除失败",{icon:2,time:1000},function(){
							location.href="${ctx}/agentSystem/wasAgelimit/list";
						});
					}
				});
			});
			
		}
		//checkbox监听
		$('#ischange').on('ifChecked', function(event){ //ifCreated 事件应该在插件初始化之前绑定 
			$('.check').iCheck('check');
		});
		$('#ischange').on('ifUnchecked', function(event){ //ifUnchecked 事件应该在插件初始化之前绑定 
			$('.check').iCheck('uncheck');
		});
		
		
		
		
		jQuery.validator.addMethod("positiveinteger", function(value, element) {
			   var aint=parseInt(value);	
			    return aint>0&& (aint+"")==value;   
			  }, "请输入正整数。");   
		
		
		$("#inputForm").validate({
			rules : {
				year : {
					required : true,
					number : true,
					max : 99,
					positiveinteger : true,
					remote:{
						   url:"${ctx}/agentSystem/wasAgelimit/validate",
						   type:"post",
						  data :{
							 year:function(){
					          return $("#year").val();
					          }
			          		} 
						}
				},
				},messages : {
					year : {
						required : "请输入服务年限",
						number : "请输入正整数。",
						max : "最大有效数字为99.",
						remote: "此年限已存在，请勿重复添加.", 
					},
				},errorPlacement : function(error, element) {
					error.insertAfter(element.parent());
				}
			
		});
		
	</script>

</body>
</html>