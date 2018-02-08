
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<!-- 代理商首页页面 -->
<%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
<style type="text/css">
 td{
 	border-top: 0px !important;
 }
 #AccountInformation th{
 	text-algin: right;
 }
  table { width:500px;table-layout:fixed; }
        .col1 { width:100px; }
        .col2 { width:200px; }
        .col3 { width:100px; }
  td {
      white-space:nowrap;
      overflow:hidden;
      text-overflow:ellipsis;
     }
</style>
</head>
<body class="fix-header card-no-border">
	<div class="divControl">
		
			<div class="row" id="AccountBalance">
				<!-- Column -->
				<div style="width: 20% !important; padding: 0px 5px 0px 15px;">
					<div class="card"style="margin-bottom: 10px;">
						<div class="card-body">
							<div class="d-flex flex-row">
								<div class="round round-lg align-self-center round-info"style="width: 40px;height: 40px;"
									title="公众号余额">
									<i style="font-size: 25px;top: -12px;position: relative;" class="iconfont icon-qianbao"></i>
								</div>
								<div class="m-l-10 align-self-center">
									<p class="m-b-0 font-lgiht" style="font-size: 13px;"></p>
									<p class="text-muted m-b-0" style="font-size: 13px;">公众号余额</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Column -->
				<!-- Column -->
				<div style="width: 20% !important; padding: 0px 5px 0px 5px;">
					<div class="card"style="margin-bottom: 10px;">
						<div class="card-body">
							<div class="d-flex flex-row">
								<div class="round round-lg align-self-center round-warning"style="width: 40px;height: 40px;"
									title="硬件余额">
									<i style="font-size: 25px;top: -12px;position: relative;" class="iconfont icon-qianbao"></i>
								</div>
								<div class="m-l-10 align-self-center">
									<p class="m-b-0 font-lgiht" style="font-size: 13px;"></p>
									<p class="text-muted m-b-0" style="font-size: 13px;">硬件余额</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Column -->
				<!-- Column -->
				<div style="width: 20% !important; padding: 0px 5px 0px 5px;">
					<div class="card"style="margin-bottom: 10px;">
						<div class="card-body">
							<div class="d-flex flex-row">
								<div class="round round-lg align-self-center round-primary"style="width: 40px;height: 40px;"
									title="小程序余额">
									<i style="font-size: 25px;top: -12px;position: relative;" class="iconfont icon-qianbao"></i>
								</div>
								<div class="m-l-10 align-self-center">
									<p class="m-b-0 font-lgiht" style="font-size: 13px;"></p>
									<p class="text-muted m-b-0" style="font-size: 13px;">小程序余额</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Column -->
				<!-- Column -->
				<div style="width: 20% !important; padding: 0px 5px 0px 5px;">
					<div class="card"style="margin-bottom: 10px;">
						<div class="card-body">
							<div class="d-flex flex-row">
								<div class="round round-lg align-self-center round-success"style="width: 40px;height: 40px;"
									title="VIP余额">
									<i style="font-size: 25px;top: -12px;position: relative;" class="iconfont icon-qianbao"></i>
								</div>
								<div class="m-l-10 align-self-center">
									<p class="m-b-0 font-lgiht" style="font-size: 13px;"></p>
									<p class="text-muted m-b-0" style="font-size: 13px;">VIP余额</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Column -->
				<!-- Column -->
				<div style="width: 20% !important; padding: 0px 15px 0px 5px;">
					<div class="card"style="margin-bottom: 10px;">
						<div class="card-body">
							<div class="d-flex flex-row">
								<div class="round round-lg align-self-center round-danger"style="width: 40px;height: 40px;"
									title="平台押金">
									<i style="font-size: 25px;top: -12px;position: relative;" class="iconfont icon-qianbao"></i>
								</div>
								<div class="m-l-10 align-self-center">
									<p class="m-b-0 font-lgiht" style="font-size: 13px;"></p>
									<p class="text-muted m-b-0" style="font-size: 13px;">平台押金</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" id="AccountInformation">
				<div class="col-lg-4" style="padding: 0px 5px 0px 15px;">
					<div class="card" style="margin-bottom: 10px;">
						<div class="card-body">
							<h6 class="card-title"></h6>
							<div class="table-responsive">
								<table class="table table-hover">
									<tbody>
										<tr>
											<th style="font-size: 13px;">账号名称</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">负责人</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">联系方式</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">所属战区</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">公司地址</th>
											<td style="font-size: 13px;"data-toggle="tooltip"data-original-title=""></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">平台状态</th>
											<td style="font-size: 13px;"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4" style="padding: 0px 5px 0px 5px;">
					<div class="card" style="margin-bottom: 10px;">
						<div class="card-body">
							<h6 class="card-title"></h6>
							<!--<h6 class="card-subtitle">Add class <code>.full-color-table .full-primary-table .hover-table</code></h6>-->
							<div class="table-responsive">
								<table class="table table-hover">
									<tbody>
										<tr>
											<th style="font-size: 13px;">客户等级</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">公众号折扣</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">小程序折扣</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">套餐折扣</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">开始时间</th>
											<td style="font-size: 13px;"></td>
										</tr>
										<tr>
											<th style="font-size: 13px;">结束时间</th>
											<td style="font-size: 13px;"></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4" style="padding: 0px 15px 0px 5px;">
					<div class="card" style="margin-bottom: 10px;">
						<div class="card-body">
							<h6 class="card-title"></h6>
							<!--<h6 class="card-subtitle">Add class <code>.full-color-table .full-primary-table .hover-table</code></h6>-->
							<div class="table-responsive">
								<table class="table">
									<tbody>
										<tr>
											<td
												style="height: 110px; padding-bottom: 7px; padding-top: 25px;">
												<div class="ribbon-wrapper card"
													style="height: 100x; margin-bottom: 15px;font-size: 13px;">
													<div class="ribbon ribbon-danger ribbon-right">公众号消耗</div>
													<p style="font-size: 13px;" class="ribbon-content"></p>
												</div>
											</td>
											<td
												style="height: 110px; padding-bottom: 7px; padding-top: 25px;">
												<div class="ribbon-wrapper card"
													style="height: 100x; margin-bottom: 15px;font-size: 13px;">
													<div class="ribbon ribbon-success ribbon-right">硬件消耗</div>
													<p style="font-size: 13px;" class="ribbon-content"></p>
												</div>
											</td>
										</tr>
										<tr>
											<td style="height: 110px; padding-bottom: 2px;font-size: 13px;">
												<div class="ribbon-wrapper card"
													style="height: 100x; margin-bottom: 17px;font-size: 13px;">
													<div class="ribbon ribbon-info ribbon-right">小程序消耗</div>
													<p style="font-size: 13px;" class="ribbon-content"></p>
												</div>
											</td>
											<td style="height: 110px; padding-bottom: 2px;">
												<div class="ribbon-wrapper card"
													style="height: 100x; margin-bottom: 17px;font-size: 13px;">
													<div class="ribbon ribbon-warning ribbon-right">VIP消耗</div>
													<p style="font-size: 13px;" class="ribbon-content"></p>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Column -->
				<div class="col-lg-12" >
					<div class="card" style="width:100%;">
						<div class="card-body">

							<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
							<div id="main" style="height: 400px;"></div>


						</div>
					</div>
				</div>

			</div>
		</div>

	<div>
		<input id="id" value="${id}" hidden="hidden">
	</div>


	<!--Echarts-->
	<!-- ECharts单文件引入 -->
	<!-- <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script> -->
	
	<!-- <script src="http://echarts.baidu.com/dist/echarts.min.js"></script> -->
	<script type="text/javascript">
		var test;
		$("document").ready(
				function() {
					var id = $("#id").val();
					$.ajax({
						url : "${ctx}/agentSystem/SysUser/homePage",
						type : "post",
						dataType : "json",
						data : {
							id : id
						},
						success : function(data) {
							//账户余额
							if (data.publicAccount != 0){
								$("#AccountBalance p:eq(0)").html("￥" + data.publicAccount.toFixed(2));
							}else{
								$("#AccountBalance p:eq(0)").html("--");
							}
							if(data.hardwareAccount != 0){
								$("#AccountBalance p:eq(2)").html("￥" + data.hardwareAccount.toFixed(2));
							}else{
								$("#AccountBalance p:eq(2)").html("--");
							}
							if(data.minaAccount != 0){
								$("#AccountBalance p:eq(4)").html("￥" + data.minaAccount.toFixed(2));
							}else{
								$("#AccountBalance p:eq(4)").html("--");
							}
							if(data.vipAccount != 0){
								$("#AccountBalance p:eq(6)").html("￥" + data.vipAccount.toFixed(2));
							}else{
								$("#AccountBalance p:eq(6)").html("--");
							}
							if(data.cashPledge != 0){
								$("#AccountBalance p:eq(8)").html("￥" + data.cashPledge.toFixed(2));
							}else{
								$("#AccountBalance p:eq(8)").html("--");
							}
							
							//代理商账户信息
							$("#AccountInformation td:eq(0)").html(data.login_name);
							if(data.name != null&&data.name != ''){
								$("#AccountInformation td:eq(1)").html(data.name);
							}else{
								$("#AccountInformation td:eq(1)").html("--");
							}
							if(data.mobile != null&&data.mobile != ''){
								$("#AccountInformation td:eq(2)").html(data.mobile);
							}else{
								$("#AccountInformation td:eq(2)").html("--");
							}
							if(data.theater != null&&data.theater != ''){
								$("#AccountInformation td:eq(3)").html(data.theater);
							}else{
								$("#AccountInformation td:eq(3)").html("--");
							}
							if(data.address != null&&data.address != ''){
								$("#AccountInformation td:eq(4)").html(data.address);
								$("#AccountInformation td:eq(4)").attr("title",data.address);
							}else{
								$("#AccountInformation td:eq(4)").html("--");
							}
							switch(data.state){
								case 0:
									$("#AccountInformation td:eq(5)").html("冻结");
									break;
								case 1:
									$("#AccountInformation td:eq(5)").html("正常");
									break;
								case 2:
									$("#AccountInformation td:eq(5)").html("申请中");
									break;
								case 3:
									$("#AccountInformation td:eq(5)").html("驳回");
									break;
							}
							
							if(data.customerLevel != null){
								if(data.customerLevel==0){
									$("#AccountInformation td:eq(6)").html("普通客户");
								}else if(data.customerLevel==1){
									$("#AccountInformation td:eq(6)").html("VIP客户");
								}
							}else{
								$("#AccountInformation td:eq(6)").html("--");
							}
							
							if(data.publicDiscount!=null&&data.publicDiscount!=0){
								$("#AccountInformation td:eq(7)").html(data.publicDiscount*10+"折");
							}else{
								$("#AccountInformation td:eq(7)").html("--");
							}
							if(data.minaDiscount!=null&&data.minaDiscount!=0){
								$("#AccountInformation td:eq(8)").html(data.minaDiscount*10+"折");
							}else{
								$("#AccountInformation td:eq(8)").html("--");
							}
							if(data.packageDiscount!=null&&data.packageDiscount!=0){
								$("#AccountInformation td:eq(9)").html(data.packageDiscount*10+"折");
							}else{
								$("#AccountInformation td:eq(9)").html("--");
							}
							if(data.startDate != null){
								$("#AccountInformation td:eq(10)").html(data.startDate);
							}else{
								$("#AccountInformation td:eq(10)").html("--");
							}
							if(data.endDate != null){
								$("#AccountInformation td:eq(11)").html(data.endDate);
							}else{
								$("#AccountInformation td:eq(11)").html("--");
							}
							if(data.publicExpend != 0){
								$("#AccountInformation p:eq(0)").html("￥" + data.publicExpend.toFixed(2));
							}else{
								$("#AccountInformation p:eq(0)").html("--");
							}
							if(data.hardwareExpend != 0){
								$("#AccountInformation p:eq(1)").html("￥" + data.hardwareExpend.toFixed(2));
							}else{
								$("#AccountInformation p:eq(1)").html("--");
							}
							if(data.minaExpend != 0){
								$("#AccountInformation p:eq(2)").html("￥" + data.minaExpend.toFixed(2));
							}else{
								$("#AccountInformation p:eq(2)").html("--");
							}
							if(data.vipExpend != 0){
								$("#AccountInformation p:eq(3)").html("￥" + data.vipExpend.toFixed(2));
							}else{
								$("#AccountInformation p:eq(3)").html("--");
							}
							
							if(data.agentLevel!=null&&data.agentLevel!=''){
								$("#AccountInformation h6:eq(0)").html(data.agentLevel + "-基本信息");
							}else{
								$("#AccountInformation h6:eq(0)").html("基本信息");
							}
							if(data.agentLevel!=null&&data.agentLevel!=''){
								$("#AccountInformation h6:eq(1)").html(data.agentLevel + "-账户信息");
							}else{
								$("#AccountInformation h6:eq(1)").html("账户信息");
							}
							if(data.agentLevel!=null&&data.agentLevel!=''){
								$("#AccountInformation h6:eq(2)").html(data.agentLevel + "-消耗信息");
							}else{
								$("#AccountInformation h6:eq(2)").html("消耗信息");
							}
							
						},
						error : function(e) {
							layer.msg('系统数据出错！', {
								icon : 2
							});

						}
					});
					//发送请求到后台，返回折线图所需要的数据集合
					$.post("${ctx}/agentSystem/RecordExamine/homePageList", {
						userId : id
					}, function(data, status) {
						if (status == "success") {
							test = data;
							$(option.series).each(function(index, item) {
								item.data = test[index];
							})

							// 为echarts对象加载数据
							myChart.setOption(option);
						} else {
							layer.msg('系统数据出错！', {
								icon : 2
							});
						}

					})

					/* 		$.ajax({
					 url : "${ctx}/agentSystem/RecordExamine/homePageList",
					 type : "post",
					 async:false,
					 dataType:"text",
					 data : {userId : id},
					 success : function(data) {
					 test = data;
					 $(option.series).each(function(index,item){
					 item.data=test[index];
					 })
					
					 // 为echarts对象加载数据
					 myChart.setOption(option);
					 },
					 error : function(data) {
					 test = data;
					 $(option.series).each(function(index,item){
					 item.data=test[index];
					 })
					 // 为echarts对象加载数据
					 myChart.setOption(option);
					 layer.msg('系统数据出错！', { icon : 2 });

					 }
					 }); */

				});

		//echarts图表数据准备
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		month < 10 ? month = '0' + month : month;
		var days = year + '年 ' + month + '月 ';
		var software = '公众号消耗';
		var hardware = '硬件消耗';
		var miniapps = '小程序消耗';
		var VIP = 'VIP消耗';
		var legend = new Array(software, hardware, miniapps, VIP);

		var symbolSize = 5;

		
		var num = date.getDate();
		
		var xAxisData = new Array();
		for (var i = 0;i <= num; i++) {
				xAxisData[i] = i;
		}

		// 基于准备好的dom，初始化echarts图表
		var myChart = echarts.init(document.getElementById("main"));
		var option = {
			title : { //标题
				text : '消耗统计',
				subtext : days
			},
			tooltip : { //图标悬停的提示内容
				trigger : 'axis'
			},
			legend : { //图标
				data : legend
			},
			toolbox : {
				show : true,
				feature : {

					magicType : {
						show : true,
						type : [ 'line', 'bar'/* ,'stack','tiled' */]
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			grid : {
				top : '16%', //grid组件离容器顶部的距离，可以为像具体素值也可以为百分比
				left : '5px', //grid组件离容器左侧的距离，可以为像具体素值也可以为百分比
				right : '45px', //grid组件离容器右侧的距离，可以为像具体素值也可以为百分比
				bottom : '10%', //grid组件离容器底部的距离，可以为像具体素值也可以为百分比
				width : 'auto',
				containLabel : true
			},
			containLabel : true,
			xAxis : [ //X轴
			{
				type : 'category',
				boundaryGap : false,
				data : xAxisData
			} ],
			yAxis : [ // Y轴
			{
				type : 'value',
				axisLabel : {
					formatter : '{value} ￥'
				},
				boundaryGap : [ 0, 0.1 ],

			} ],
			dataZoom : [ {
				type : 'slider',
				xAxisIndex : 0,
				filterMode : 'filter'
			}, {
				type : 'slider',
				yAxisIndex : 0,
				filterMode : 'filter'
			}, {
				type : 'inside',
				xAxisIndex : 0,
				filterMode : 'empty'
			}/*  , {
				type : 'inside',
				yAxisIndex : 0,
				filterMode : 'empty'
			}  */
			],

			series : [ { //指定图标的类型（折线line、柱状bar）
				id : 'a',
				name : software,
				type : 'line',
				data : xAxisData,
				symbolSize : symbolSize
			}, {
				id : 'b',
				name : hardware,
				type : 'line',
				data : xAxisData,
				symbolSize : symbolSize
			}, {
				id : 'c',
				name : miniapps,
				type : 'line',
				data : xAxisData,
				symbolSize : symbolSize

			}, {
				id : 'd',
				name : VIP,
				type : 'line',
				data : xAxisData,
				symbolSize : symbolSize
			} ]

		};
		/*echarts窗口自适应*/
		$(window).resize(function(){
			myChart.resize();
		});
	</script>

</body>
</html>