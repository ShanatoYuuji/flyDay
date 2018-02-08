
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<head>
    <!-- 终端续费 -->
    <%@ include file="/webpage/modules/agentsystem/include/head.jsp"%>
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
        table thead {
            width: calc(100% - 1em)
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
    </style>
</head>

<body>
<div class="divControl" >
    <div class="container-fluid">
        <div class="row" >
            <!-- 列表区 -->
            <div class="col-12">
                <div class="card" style="margin-bottom:10px">
                    <div class="card-body">
                        <div class="col-12">
                            <div class="row">
                                <div id="baseInfo" class="col-6">
                                    <h4 class="card-title" style="font-size:14px">基本信息</h4>
                                    <div class="table-responsive">
                                        <table class="table noneBorder" style="font-size:13px">
                                            <tr>
                                                <td>企业名称</td>
                                                <td>${fn:escapeXml(wasTerminalUser.companyName)}</td>
                                            </tr>
                                            <tr>
                                                <td >所属代理商</td>
                                                <td>${fn:escapeXml(wasSysUser.companyName)}</td>
                                            </tr>
                                            <tr>
                                                <td>公众号余额</td>
                                                <td><span>${wasSysUser.publicAccount}</span>元</td>
                                            </tr>
                                            <tr>
                                                <td >vip余额</td>
                                                <td><span>${wasSysUser.vipAccount}</span>元</td>
                                            </tr>
                                            <tr>
                                                <td >小程序</td>
                                                <td><span>${wasSysUser.minaAccount}</span>元</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <h4 class="card-title" style="font-size:14px">已有版本</h4>
                                    <div  class="table-responsive" >
                                        <table class="table noneBorder" style="font-size:13px;border-top: 1px solid #f0eeee;">
                                            <thead>
                                            <tr>
                                                <th>版本名称</th>
                                                <th>版本类型</th>
                                                <th>到期时间</th>
                                            </tr>
                                            </thead>
                                            <tbody  style="max-height:210px;">
                                            <c:forEach items="${productList}" var="product">
                                                <tr>
                                                    <td >${fn:escapeXml(product.id)}</td>
                                                    <td class="">${(product.classify)?"小程序":"公众号"}</td>
                                                    <td ><fmt:formatDate value="${product.endDate}" pattern="yyyy-MM-dd"/></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="col-12">
                            <div class="row">
                                <div class="col-12">
                                    <h4 class="card-title" style="font-size:14px">续费</h4>
                                    <div class="table-responsive">
                                        <table id="recharge" class="display nowrap table table-hover table-striped table-bordered"  style="font-size:13px">
                                            <thead>
                                            <tr>
                                                <th style="width: 100px;"  class="tableControl"><input type="checkbox" class="check" id="ischange" data-checkbox="icheckbox_square-blue"></th>
                                                <th>方针名</th>
                                                <th>价格</th>
                                                <th>折扣价格</th>
                                                <th>详情</th>
                                                <th>数量</th>
                                                <th>总价</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${policies}" var="policy">
                                                <c:choose>
                                                    <c:when test="${policy.id <=0}"><!-- 失效方针 -->
                                                        <tr class="outTime" style="background-color:silver">
                                                            <td style="width: 100px;"  class="tableControl"><input type="checkbox" class="check" id="${fn:escapeXml(policy.salesPolicyId) }" data-checkbox="icheckbox_square-blue"></td>
                                                            <td class="tableControl" style="max-width:200px;white-space: pre-wrap;word-wrap: break-word;">${fn:escapeXml(policy.title)}</td>
                                                            <td class="tableControl">${policy.price}</td>
                                                            <td class="tableControl">${policy.renewDiscount}</td>
                                                            <td class="tableControl" style="max-width:200px;white-space: pre-wrap;word-wrap: break-word;">${fn:escapeXml(policy.remarks)}</td>
                                                            <td class="tableControl">
                                                                <select name="rechargeNum" class="form-control input-sm selectChange height-control valid"  style="width:70px">
                                                                </select>
                                                            </td>
                                                            <td class="tableControl">0.00</td>
                                                            <td hidden>${policy.salesPolicyId}</td>
                                                            <td hidden>${policy.classify}</td>
                                                        </tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <tr>
                                                            <td style="width: 100px;"  class="tableControl"><input type="checkbox" class="check" id="${fn:escapeXml(policy.salesPolicyId) }" data-checkbox="icheckbox_square-blue"></td>
                                                            <td class="tableControl" style="max-width:200px;white-space: pre-wrap;word-wrap: break-word;">${fn:escapeXml(policy.title)}</td>
                                                            <td class="tableControl">${policy.price}</td>
                                                            <td class="tableControl">${policy.renewDiscount}</td>
                                                            <td class="tableControl" style="max-width:200px;white-space: pre-wrap;word-wrap: break-word;">${fn:escapeXml(policy.remarks)}</td>
                                                            <td class="tableControl">
                                                                <select name=rechargeNum" class="form-control input-sm selectChange height-control valid"  style="width:70px">
                                                                    <!-- 如果方针失效，另做处理 -->
                                                                    <c:forEach var="s"  begin="0" end="${policy.id}">
                                                                        <option value="${s}" >${s }</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </td>
                                                            <td class="tableControl">0.00</td>
                                                            <td hidden>${policy.salesPolicyId}</td>
                                                            <td hidden>${policy.classify}</td>
                                                        </tr>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                </div>
                                <div class="col-6">
                                    <div class="row">
                                        <div class="col-9"></div>
                                        <div class="col-3" id="totalMoney">总价格：<span>0.00</span>元</div>
                                        <div class="col-9"></div>
                                        <div class="col-3">
                                            <button type="button" class="btn btn-default" onclick="back()">返回</button>
                                            <button type="button" class="btn btn-info" onclick="show()">购买</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal" data-backdrop="static">
    <div class="modal-dialog">
        <!--宽高、定位-->
        <div class="modal-content">
            <!--对话框头-->
            <div class="modal-header"
                 style="float: right; display: block; background-color: #f4f5f9; border-top-left-radius: 5px; border-top-right-radius: 5px;">
                <label class="modal-title" id="" style="font-size: 14px">扣款确认</label>
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×</button>
            </div>
            <!--主体部分-->
            <div class="modal-body">
                <table class="table noboder" style="font-size: 13px;">
                    <thead>
                    <tr>
                        <td>商品名称</td>
                        <td>商品单价</td>
                        <td>折扣单价</td>
                        <td>商品数量</td>
                        <td>商品总价</td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>微爱</td>
                        <td>1000</td>
                        <td>800</td>
                        <td>1</td>
                        <td>10000.00元</td>
                    </tr>
                    </tbody>
                </table>
                <p style="width:100px;display: inline-block;margin-bottom:0px;  margin-left: 10px;;font-size: 13px">总价：</p><p  style="font-size: 13px;    display: inline-block;"><span></span>元</p>
                <div id="infoBox"  style="font-size: 13px; margin-left: 10px;">
                </div>
            </div>
            <!--对话框尾-->
            <div class="modal-footer" style="text-align: right; background-color: #f4f5f9; border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
                <button type="button" class="btn btn-info save">确认</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    //checkbox监听
    $('#ischange').on('ifChecked', function(event){
        $('.check').iCheck('check');
    });
    $('#ischange').on('ifUnchecked', function(event){
        $('.check').iCheck('uncheck');
    });
    //select标签激活
    $("#recharge>tbody .check").on('ifChecked', function(event){
        $(this).parent().parent().parent().addClass('checked')
        totalMoney()
    });
    //失选checkbox
    $('#recharge>tbody .check').on('ifUnchecked', function(event){
        $(this).parent().parent().parent().removeClass("checked")
        totalMoney();
    });
    $('#companyNameB').bind('keypress', function(event) {
        if (event.keyCode == "13") {
            search();
        }
    });
    //监听下拉框
    $("select").change(function () {
        var num = $(this).find("option:selected").text();
        var price = parseFloat($(this).parent().parent().children(":eq(3)").text())
        //单个方针总价
        var singleProductTotalMoney = parseFloat(price * num).toFixed(2);
        $(this).parent().parent().children(":eq(6)").text(singleProductTotalMoney);
        //所有产品总价 
        totalMoney();
    })
    //计算所有产品总价
    function totalMoney(){
        var allProductsTotalMoney = 0.00;
        var elements = $("#recharge>tbody>tr.checked:not(.outTime)");
        $(elements).each(function(index,element){
            var totalMoney = parseFloat($(element).children(":eq(6)").text())
            if($(element).find("option:selected").text()!=0){
                allProductsTotalMoney += totalMoney;
            }
        })
        $("#totalMoney span").text(allProductsTotalMoney.toFixed(2));
    }
    //方针类型变量
    var classilies;
    function show() {
        classilies="";
        var selectedTrs = $("#recharge>tbody>tr.checked:not(.outTime)");
        if(selectedTrs.length==0){
            layer.alert('请选择续费方针', {skin: 'layui-layer-molv',closeBtn: 0,anim: 4});
            return;
        }
        var numOption = 0;
        $(selectedTrs).each(function(index,item){
            var text = $(item).find("option:selected").text()
            if(Number(text)!=0){
                numOption++
            }
        })
        if(numOption==0){
            layer.alert('请选择续费数量', {skin: 'layui-layer-molv',closeBtn: 0,anim: 4});
            return;
        }
        //类型拼接
        var tempClassies = $("#recharge>tbody>tr.checked  :nth-child(9)");
        $(tempClassies).each(function(index,element){
            classilies += $(element).text();
        })
        var pubA = parseFloat($("#baseInfo td:eq(5) span").text());
        var vipA = parseFloat($("#baseInfo td:eq(7) span").text());
        var minaA = parseFloat($("#baseInfo td:eq(9) span").text());
        //算账结果信息
        var elements = $("#recharge>tbody>tr.checked:not(.outTime)");
        //三种方针各个总价
        var pubMoney = 0.00;
        var minaMoney = 0.00;
        var packageMoney = 0.00;
        //显示table信息
        $("#modal tbody").empty()
        //var str1 = null;
        $(elements).each(function(index,element){
            var name = $(element).children(":eq(1)").text()
            var price = $(element).children(":eq(2)").text()
            var renewMoney = $(element).children(":eq(3)").text()
            var num = $(element).find("option:selected").text()
            var totalMoney = parseFloat($(element).children(":eq(6)").text())
            var elementClass = $(element).children(":eq(8)").text()
            if($(element).find("option:selected").text()!=0){
                //str1 += "<tr><td>"+ name +"</td><td>"+ price +"</td><td>"+ renewMoney +"</td><td>"+ num +"</td><td>"+ totalMoney.toFixed(2) +"元</td><td hidden>" +elementClass +"</td></tr>"
                var str1 = null;
				str1 = "<tr><td id=name" + index + "></td><td>"+ price +"</td><td>"+ renewMoney +"</td><td>"+ num +"</td><td>"+ totalMoney.toFixed(2)  +"</td><td hidden>" +elementClass +"</td></tr>"
				$("#modal tbody").append(str1);
				$('#' + 'name' + index).text(name)
            }
            if(elementClass=='0'){
                pubMoney += totalMoney
            }else if(elementClass=='1'){
                minaMoney += totalMoney
            }else if(elementClass=='2'){
                packageMoney += totalMoney
            }
        })
        var resultInfo = accountMoney(pubMoney,minaMoney,packageMoney,pubA,minaA,vipA);
        if(resultInfo==""){
            layer.alert('余额不足，请重新选择', {skin: 'layui-layer-molv',closeBtn: 0,anim: 4});
            return;
        }
        $("#infoBox").empty()
        $("#infoBox").append(resultInfo);
        $("#modal .modal-body  span:eq(0)").text($("#totalMoney span").text())
        //$("#modal tbody").empty().append(str1);
        $("#modal").modal("show");
    }
    //生成购买价格信息
    function accountMoney(pubMoney,minaMoney,packageMoney,pubA,minaA,vipA){
        var str = "";
        var pubExtend = 0.00;
        var minaExtend = 0.00;
        var vipExtend =0.00;
        
        if(pubMoney<=pubA){
            pubExtend += pubMoney
            pubA -= pubMoney
        }else if(pubMoney<=(pubA+vipA)){
            pubExtend += pubA;
            vipExtend += (pubMoney - pubA)
            vipA = vipA - (pubMoney - pubA)
            pubA = 0.00;
        }else{
            return str;
        }
        
        if(minaMoney<=minaA){
            minaExtend += minaMoney
            minaA -= minaMoney
        }else if(minaMoney<=(minaA+vipA)){
            minaExtend += minaA;
            vipExtend += (minaMoney - minaA)
            vipA = vipA - (minaMoney - minaA)
            minaA = 0.00;
        }else{
            return str;
        }
        
        if(packageMoney<=pubA){
            pubExtend += packageMoney
            pubA -= packageMoney
        }else if(packageMoney<=(pubA+minaA)){
            pubExtend += pubA
            minaExtend += (packageMoney - pubA)
            minaA = minaA - (packageMoney - pubA)
            pubA = 0.00;
        }else if(packageMoney<=(pubA+minaA+vipA)){
            pubExtend += pubA
            minaExtend += minaA
            vipExtend += (packageMoney - pubA - minaA)
            vipA = vipA - (packageMoney - pubA - minaA)
            pubA = 0.00;
            minaA = 0.00;
        }else {
            return str;
        }
        
        str =  "<div><p style='width:100px;display: inline-block;'>公众号扣款：</p><span>" + pubExtend.toFixed(2) + "</span>元</div>"+"<div><p style='width:100px;display: inline-block;'>小程序扣款：</p><span>" + minaExtend.toFixed(2)  + "</span>元</div>"+"<div><p style='width:100px;display: inline-block;'>VIP扣款：</p><span>" + vipExtend.toFixed(2)  + "</span>元</div>"
        return str;
    }
    //支付
    $("#modal .save").click(function(){
        var locked = false;
        if(!locked){
            locked = true;
            var arr = $("#recharge>tbody>tr.checked:not(.outTime)");
			var elements = new Array()
            $(arr).each(function(index,item){
                if($(item).find("option:selected").text()!=0){
                	elements.push(item)
                }
            })
            var length = elements.length;
            //layer.confirm('确认购买所选方针？', {closeBtn : 0,icon : 3 ,skin : 'layui-layer-molv',btn: ['确认','取消']},function(){
                $(elements).each(function(index,element){
                        var num = $(element).find("option:selected").text()
                        var policyId = $(element).children(":eq(7)").text()
                        var elementClass = $(element).children(":eq(8)").text()
                        if(elementClass == "0"){
                            payAllPublic(policyId,num,"方针续费",length,index+1)
                        }else if(elementClass == "1"){
                            payAllMina(policyId,num,"方针续费",length,index+1)
                        }else if(elementClass == "2"){
                            payPublicAndMina(policyId,num,"方针续费",length,index+1)
                        }
                    if(length==index+1){
                        locked = false
                    }
                })
            //})
        }
    })
    //公众号
    function payAllPublic(salesPolicyId,policyNumber,recharge,length,time){
        var index = layer.load(1, {shade: [0.1,'#fff']});
        $.ajax({
            url : "${ctx}/agentSystem/terminal/wasRecharge/payAllPublic",type : "post",dataType : "text",async:false,
            data : {"salesPolicyId":salesPolicyId,"policyNumber":policyNumber,"terminalUserId":'${wasTerminalUser.terminalUserId}',"behavior":recharge},
            success : function(result) {
                if("success"==result){
                	$("#modal").modal("hide");
                    if(length==time){
                        layer.close(index);
                        layer.msg("续费成功", {icon : 1,time : 1000},function(){
                            var btn = window.parent.document.getElementById("07b4d0f6f7bc4d6e9541591a484e4fa9")
                            btn.click()
                        });
                    }
                }else{
                    layer.close(index);
					layer.msg("保存失败",{icon:2,time:1000},function(){
						return;  
					}); 
			}
            },
            error : function(result){
           		layer.close(index);
				layer.msg("保存失败",{icon:2,time:1000},function(){
					return;  
				}); 
            }
        });
    }
    //小程序
    function payAllMina(salesPolicyId,policyNumber,recharge,length,time){
        var index = layer.load(1, {shade: [0.1,'#fff']});
        $.ajax({
            url : "${ctx}/agentSystem/terminal/wasRecharge/payAllMina",type : "post",dataType : "text",async:false,
            data : {"salesPolicyId":salesPolicyId,"policyNumber":policyNumber,"terminalUserId":'${wasTerminalUser.terminalUserId}',"behavior":recharge},
            success : function(result) {
                if("success"==result){
                    if(length==time){
                        layer.close(index);
                        layer.msg("续费成功", {icon : 1,time : 1000},function(){
                            var btn = window.parent.document.getElementById("07b4d0f6f7bc4d6e9541591a484e4fa9")
                            btn.click()
                        });
                    }
                }else{
                    layer.close(index);
					layer.msg("保存失败",{icon:2,time:1000},function(){
						return;  
					}); 
			}
            },
            error : function(result){
           		layer.close(index);
				layer.msg("保存失败",{icon:2,time:1000},function(){
					return;  
				}); 
            }
        });
    }
    //混合
    function payPublicAndMina(salesPolicyId,policyNumber,recharge,length,time){
        var index = layer.load(1, {shade: [0.1,'#fff']});
        $.ajax({
            url : "${ctx}/agentSystem/terminal/wasRecharge/payPublicAndMina",type : "post",dataType : "text",async:false,
            data : {"salesPolicyId":salesPolicyId,"policyNumber":policyNumber,"terminalUserId":'${wasTerminalUser.terminalUserId}',"behavior":recharge},
            success : function(result) {
                if("success"==result){
                    if(length==time){
                        layer.close(index);
                        layer.msg("续费成功", {icon : 1,time : 1000},function(){
                            var btn = window.parent.document.getElementById("07b4d0f6f7bc4d6e9541591a484e4fa9")
                            btn.click()
                        });
                    }
                }else{
                    layer.close(index);
					layer.msg("保存失败",{icon:2,time:1000},function(){
						return;  
					}); 
			}
            },
            error : function(result){
           		layer.close(index);
				layer.msg("保存失败",{icon:2,time:1000},function(){
					return;  
				}); 
            }
        });
    }
    //失效方针不能用
    $(document).ready(function(){
        $(".outTime .check").attr("disabled",true);
    })
    //返回终端产品页面
    function back(){
        layer.confirm('确认放弃本次操作？', {closeBtn : 0,icon : 3 ,skin : 'layui-layer-molv',btn: ['确认','取消']},function(){
            window.location.href="${ctx}/agentSystem/terminal/wasTerminalProduct/productList"
        })
    }
</script>
</body>
</html>