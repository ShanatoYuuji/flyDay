package com.jeeplus.modules.agentsystem.agency.web;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.agentsystem.agency.entity.WasHardwarePurchase;
import com.jeeplus.modules.agentsystem.agency.entity.WasPolicyPurchase;
import com.jeeplus.modules.agentsystem.agency.entity.WasRechargeHistory;
import com.jeeplus.modules.agentsystem.agency.entity.WasSysUser;
import com.jeeplus.modules.agentsystem.agency.service.WasHardwarePurchaseService;
import com.jeeplus.modules.agentsystem.agency.service.WasPolicyPurchaseService;
import com.jeeplus.modules.agentsystem.agency.service.WasRechargeHistoryService;
import com.jeeplus.modules.agentsystem.agency.service.WasSysUserService;
import com.jeeplus.modules.agentsystem.sysdata.entity.WasAgentLevel;
import com.jeeplus.modules.agentsystem.sysdata.entity.WasHardware;
import com.jeeplus.modules.agentsystem.sysdata.entity.WasSalesPolicy;
import com.jeeplus.modules.agentsystem.sysdata.service.WasAgentLevelService;
import com.jeeplus.modules.agentsystem.sysdata.service.WasHardwareService;
import com.jeeplus.modules.agentsystem.sysdata.service.WasSalesPolicyService;
import com.jeeplus.modules.agentsystem.sysdata.service.WasSoftwareService;
import com.jeeplus.modules.agentsystem.terminal.entity.WasTerminalProduct;
import com.jeeplus.modules.agentsystem.terminal.entity.WasTerminalUser;
import com.jeeplus.modules.agentsystem.terminal.service.WasTerminalProductService;
import com.jeeplus.modules.agentsystem.terminal.service.WasTerminalUserService;
import com.jeeplus.modules.agentsystem.utils.MoneyOperation;
import com.jeeplus.modules.agentsystem.utils.OrderNumberUtils;
import com.jeeplus.modules.agentsystem.utils.StringChangeUtils;
import com.jeeplus.modules.agentsystem.utils.TerminalPermissionUtils;
import com.jeeplus.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.jeeplus.modules.sys.utils.UserUtils;

/**
 * 代理商下单管理Controller
 * @author Ricky
 * @version 2017-10-16
 */

@Controller
@RequestMapping(value = "${adminPath}/agency/wasAgentOrder")
public class WasAgentOrderController extends BaseController{
	@Autowired
	private WasHardwareService wasHardwareService;
	@Autowired
	private WasHardwarePurchaseService wasHardwarePurchaseService;
	@Autowired
	private WasAgentLevelService wasAgentLevelService;
	@Autowired
	private WasSalesPolicyService wasSalesPolicyService;
	@Autowired
	private WasPolicyPurchaseService policyPurchaseService;
	@Autowired
	private WasTerminalUserService wasTerminalUserService;
	@Autowired
	private WasTerminalProductService wasTerminalProductService;
	@Autowired
	private WasSysUserService wasSysUserService;
	@Autowired
	private WasRechargeHistoryService wasRechargeHistoryService;
	@Autowired
	private WasSoftwareService wasSoftwareService;
	
	
	
	//获取硬件下拉框
	@RequestMapping(value = {"list", ""})
	@ResponseBody
	public List<WasHardware> findHardware(WasHardware wasHardware) {
		List<WasHardware> list = wasHardwareService.findList(wasHardware);
		return list;
	}
	
	//硬件下单
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	@RequestMapping(value = "insertHardware")
	@ResponseBody
	public Integer insertHardware(WasHardwarePurchase wasHardwarePurchase,String listHardware) throws ParseException{
		int result = -1;
		String[] str = listHardware.split("Ч");
		List<WasHardwarePurchase> lista = new ArrayList<WasHardwarePurchase>();
		//获取所有硬件四个账户的扣款金额
		BigDecimal hardwareExpendHardware = wasHardwarePurchase.getHardwareExpend();
		BigDecimal publicExpendHardware = wasHardwarePurchase.getPublicExpend();
		BigDecimal minaExpendHardware = wasHardwarePurchase.getMinaExpend();
		BigDecimal vipExpendHardware = wasHardwarePurchase.getVipExpend();
		/*-------------更新用户表(当前代理商)-------------*/
		String resultM = MoneyOperation.getInstance().moneyOperation(null,wasHardwarePurchase.getPublicExpend(), 
				wasHardwarePurchase.getMinaExpend(), wasHardwarePurchase.getHardwareExpend(), wasHardwarePurchase.getVipExpend(), wasHardwarePurchase.getId(), "扣钱");
		if(!StringChangeUtils.OPERATION_SUCCESS.equals(resultM)){
			result = -1;
			return result;
		}
		int cycle = 5;
		for(int i = 0; i < str.length; i+=cycle){
			WasHardwarePurchase hardwarePurchase = new WasHardwarePurchase();
			//循环每条硬件产品的信息
			hardwarePurchase.setHardwareId(Integer.parseInt(str[i]));
			hardwarePurchase.setNumber(Integer.parseInt(str[i+2]));
			hardwarePurchase.setPayMoney(new BigDecimal(str[i+4]));
			
			hardwarePurchase.setUserId(wasHardwarePurchase.getId());
			Principal principal = UserUtils.getPrincipal();
			hardwarePurchase.setCreateId(principal.toString());
			Date date = new Date();
			//硬件购买单号=H+时间戳(13位)
			hardwarePurchase.setOrderNo("H"+OrderNumberUtils.orderNumber( ));
			hardwarePurchase.setCreateDate(date);
			hardwarePurchase.setBehavior("硬件购买");
			hardwarePurchase.setDeliveryMethod(wasHardwarePurchase.getDeliveryMethod());
			hardwarePurchase.setName(wasHardwarePurchase.getName());
			hardwarePurchase.setPhone(wasHardwarePurchase.getPhone());
			hardwarePurchase.setAddress(wasHardwarePurchase.getAddress());
			hardwarePurchase.setRemarks(wasHardwarePurchase.getRemarks());
			
			//获取当前单个硬件产品的总价
			BigDecimal payMoney = hardwarePurchase.getPayMoney();
			//扣款顺序：硬件账户扣款-公众号扣款-小程序扣款-VIP扣款
			//compareTo比较大小 ：-1表示小于,0是等于,1是大于
			//判断payMoney需付金额与硬件的扣款金额
			
			//硬件+公众号
			BigDecimal two = hardwareExpendHardware.add(publicExpendHardware);
			//硬件+公众号+小程序
			BigDecimal three = hardwareExpendHardware.add(publicExpendHardware.add(minaExpendHardware));
			//硬件+公众号+小程序+VIP
			BigDecimal four = hardwareExpendHardware.add(publicExpendHardware.add(minaExpendHardware.add(vipExpendHardware)));
			if(payMoney.compareTo(hardwareExpendHardware) == -1 || payMoney.compareTo(hardwareExpendHardware) == 0){
				hardwarePurchase.setHardwareExpend(payMoney);
				hardwarePurchase.setPublicExpend(new BigDecimal(0));
				hardwarePurchase.setMinaExpend(new BigDecimal(0));
				hardwarePurchase.setVipExpend(new BigDecimal(0));
				hardwareExpendHardware=hardwareExpendHardware.subtract(payMoney);
				
				//判断payMoney需付金额与硬件+公众号的扣款金额
			}else if(payMoney.compareTo(two) == -1 || payMoney.compareTo(two) == 0){    
				hardwarePurchase.setHardwareExpend(hardwareExpendHardware);
				hardwarePurchase.setPublicExpend(payMoney.subtract(hardwareExpendHardware));
				hardwarePurchase.setMinaExpend(new BigDecimal(0));
				hardwarePurchase.setVipExpend(new BigDecimal(0));
				hardwareExpendHardware = new BigDecimal(0);
				publicExpendHardware = two.subtract(payMoney);
				
				//判断payMoney需付金额与硬件+公众号+小程序的扣款金额
			}else if(payMoney.compareTo(three) == -1 || payMoney.compareTo(three) == 0){   
				hardwarePurchase.setHardwareExpend(hardwareExpendHardware);
				hardwarePurchase.setPublicExpend(publicExpendHardware);
				hardwarePurchase.setMinaExpend(payMoney.subtract(publicExpendHardware.add(hardwareExpendHardware)));
				hardwarePurchase.setVipExpend(new BigDecimal(0));
				hardwareExpendHardware = new BigDecimal(0);  
				publicExpendHardware = new BigDecimal(0);
				minaExpendHardware = three.subtract(payMoney);
				
				//判断payMoney需付金额与硬件+公众号+小程序+VIP的扣款金额
			}else if(payMoney.compareTo(four) == -1 || payMoney.compareTo(four) == 0){    
				hardwarePurchase.setHardwareExpend(hardwareExpendHardware);
				hardwarePurchase.setPublicExpend(publicExpendHardware);
				hardwarePurchase.setMinaExpend(minaExpendHardware);
				hardwarePurchase.setVipExpend(payMoney.subtract(publicExpendHardware.add(hardwareExpendHardware.add(minaExpendHardware))));
				hardwareExpendHardware = new BigDecimal(0);
				publicExpendHardware = new BigDecimal(0);
				minaExpendHardware = new BigDecimal(0);
				vipExpendHardware = four.subtract(payMoney);
			}
			lista.add(hardwarePurchase);
		}
		for(int j = 0 ;j < lista.size();j++){
			wasHardwarePurchaseService.save(lista.get(j));
			WasHardware wasHardware = wasHardwareService.get(lista.get(j).getHardwareId().toString());
			wasHardware.setSellNum(wasHardware.getSellNum()+lista.get(j).getNumber());
			wasHardwareService.updateSellNum(wasHardware);
		}
		result = 1;
		return result;
	}
	
	//根据代理商等级ID获取销售方针
	@RequestMapping(value = "findPolicy")
	@ResponseBody
	public Set<WasSalesPolicy> findAgentLevelIds(Integer agentLevelId){
		WasAgentLevel wasAgentLevel = wasAgentLevelService.getEnity(agentLevelId);
		String list = wasAgentLevel.getSalesPolicyIds();
		String[] idsA = null;
		if(list != null && list != "") {
			idsA = list.split(",");
		}
		
		Set<WasSalesPolicy> wasSalesPolicys=new TreeSet<WasSalesPolicy>(new Comparator<WasSalesPolicy>() {
				@Override  
			    public int compare(WasSalesPolicy o1, WasSalesPolicy o2) {  
			        if(o2.getSort()!=o1.getSort()){
			        	//降序排列  
			        	return o1.getSort().compareTo(o2.getSort());
			        }else{
			        	//升序排列  
			        	return o2.getSalesPolicyId().compareTo(o1.getSalesPolicyId());
			        }
			    }  
		});
		for (String id : idsA) {
			WasSalesPolicy wasSalesPolicy=wasSalesPolicyService.findWasSalesPolicy(new Integer(id));
			if((new Date().getTime()) <= (wasSalesPolicy.getEndDate().getTime()) && (new Date().getTime())>= (wasSalesPolicy.getStartDate().getTime())) {
				wasSalesPolicys.add(wasSalesPolicy);
			}
		}
		return wasSalesPolicys;
	}
	
	//获取方针价格
	@RequestMapping(value = "getPolicy")
	@ResponseBody
	public WasSalesPolicy getter(WasSalesPolicy wasSalesPolicy){
		Integer id = wasSalesPolicy.getSalesPolicyId();
		wasSalesPolicy = wasSalesPolicyService.findWasSalesPolicy(id);
		return wasSalesPolicy;
	}
	
	//方针下单
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	@RequestMapping(value = "insertPolicy")
	@ResponseBody
	public Integer insertPolicy(WasPolicyPurchase wasPolicyPurchase,String listPolicy,WasTerminalUser wasTerminalUser,String companyParentId) throws ParseException {
		int result = -1;
		String[] str = listPolicy.split("Ч");
		int cycle = 10;
		/*-------------判断软件新旧版-------------*/
		Set<String> softwareIds=new TreeSet<String>(new Comparator<String>() {
			@Override  
		    public int compare(String o1, String o2) {  
		        return o1.compareTo(o2);
		    }  
		});
		
		for(int i = 0; i < str.length; i+=cycle){
			int salesPolicyId = Integer.parseInt(str[i]);
			WasSalesPolicy wasSalesPolicy = new WasSalesPolicy();
			wasSalesPolicy = wasSalesPolicyService.findWasSalesPolicy(salesPolicyId);
			 String[] softwareId = wasSalesPolicy.getSoftwareIds().split(",");
			 for (String string : softwareId) {
				 softwareIds.add(string);
			}
		}
		List<String> newVersion  =  new ArrayList<String>();
		for (String  softwareId: softwareIds) {
			if((wasSoftwareService.findSoftwareById(new Integer(softwareId)).getNewVersion()) == 0){
				newVersion.add(softwareId);
			}
		}
		if(newVersion.size()>1){
			result = 3;
			return result;
		}
		
		/*-------------更新用户表(当前代理商)-------------*/
		String resultM = MoneyOperation.getInstance().moneyOperation(null,wasPolicyPurchase.getPublicExpend(), 
				wasPolicyPurchase.getMinaExpend(), wasPolicyPurchase.getHardwareExpend(), wasPolicyPurchase.getVipExpend(), wasTerminalUser.getParentId(), "扣钱");
		if(!StringChangeUtils.OPERATION_SUCCESS.equals(resultM)){
			result = -1;
			return result;
		}
		
		/*-------------终端用户表插入记录-------------*/
		int terminalUserId = wasTerminalUserService.insertWasTerminal(wasTerminalUser);
		
		/*-------------终端产品表插入记录-------------*/
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		for(int i = 0; i < str.length; i+=cycle){
			int salesPolicyId = Integer.parseInt(str[i]);
			int yearT = Integer.parseInt(str[i+6]);
			WasSalesPolicy wasSalesPolicy = new WasSalesPolicy();
			wasSalesPolicy = wasSalesPolicyService.findWasSalesPolicy(salesPolicyId);
			String[] ids = wasSalesPolicy.getSoftwareIds().split(",");
			for(int j = 0;j<ids.length;j++){
				WasTerminalProduct terminalProduct =  wasTerminalProductService.findByTerminalUserIdAndSoftWareId(terminalUserId,Integer.parseInt(ids[j]));
				if (terminalProduct == null) {
					WasTerminalProduct wasTerminalProduct = new WasTerminalProduct();
					wasTerminalProduct.setSoftwareId(Integer.parseInt(ids[j]));
					wasTerminalProduct.setTerminalUserId(terminalUserId);
					//开始时间
					wasTerminalProduct.setStartDate(date);
			        calendar.setTime(date);
			        calendar.add(Calendar.YEAR, +yearT);
			        Date dateafter = calendar.getTime();
			        //结束时间
			        wasTerminalProduct.setEndDate(dateafter);
			        wasTerminalProduct.setState(1);
			        wasTerminalProductService.insertProduct(wasTerminalProduct);
				}else{
					//还未过期
					if(terminalProduct.getEndDate().getTime() > System.currentTimeMillis()){        
						calendar.setTime(terminalProduct.getEndDate());
				        calendar.add(Calendar.YEAR, +yearT);
				        Date dateafter = calendar.getTime();
				        terminalProduct.setEndDate(dateafter);
						wasTerminalProductService.updateProduct(terminalProduct);
					//已过期
					}else{                                                                    
						terminalProduct.setStartDate(date);
						calendar.setTime(date);
				        calendar.add(Calendar.YEAR, +yearT);
				        Date dateafter = calendar.getTime();
				        terminalProduct.setEndDate(dateafter);
						wasTerminalProductService.updateProduct(terminalProduct);
					}
				}
			}
		}
		
		/*-------------方针购买表插入记录-------------*/
		List<WasPolicyPurchase> lista = new ArrayList<WasPolicyPurchase>();
		//获取所有方针四个账户的扣款金额
		BigDecimal hardwareExpendPolicy = wasPolicyPurchase.getHardwareExpend();
		BigDecimal publicExpendPolicy = wasPolicyPurchase.getPublicExpend();
		BigDecimal minaExpendPolicy = wasPolicyPurchase.getMinaExpend();
		BigDecimal vipExpendPolicy = wasPolicyPurchase.getVipExpend();
		Principal principal = UserUtils.getPrincipal();
		for(int i = 0; i < str.length; i+=cycle){
			WasPolicyPurchase policyPurchase = new WasPolicyPurchase();
			policyPurchase.setSalesPolicyId(Integer.parseInt(str[i]));
			policyPurchase.setClassify(Integer.parseInt(str[i+2]));
			policyPurchase.setPolicyNumber(Integer.parseInt(str[i+3]));
			policyPurchase.setTotalMoney(new BigDecimal(str[i+8]));
			policyPurchase.setPayMoney(new BigDecimal(str[i+9]));
			
			policyPurchase.setRemarks(wasPolicyPurchase.getRemarks());
			policyPurchase.setUserId(principal.toString());
			policyPurchase.setTerminalUserId(terminalUserId);
			//方针购买单号=H+时间戳(13位)
			
			policyPurchase.setNumber("P"+OrderNumberUtils.orderNumber());
			policyPurchase.setCreateDate(date);
			
			int yearP = Integer.parseInt(str[i+6]);
	        calendar.setTime(date);
	        calendar.add(Calendar.YEAR, +yearP);
	        Date dateafter = calendar.getTime();
	        policyPurchase.setEndDate(dateafter);
	        
			policyPurchase.setType(1);
			policyPurchase.setBehavior("方针购买");
			policyPurchase.setState(1);
			//获取当前方针的支付价格
			BigDecimal payMoney = policyPurchase.getPayMoney();
			//硬件+公众号
			BigDecimal two = hardwareExpendPolicy.add(publicExpendPolicy);
			//硬件+公众号+小程序
			BigDecimal three = hardwareExpendPolicy.add(publicExpendPolicy.add(minaExpendPolicy));
			//硬件+公众号+小程序+VIP
			BigDecimal four = hardwareExpendPolicy.add(publicExpendPolicy.add(minaExpendPolicy.add(vipExpendPolicy)));
			if(payMoney.compareTo(hardwareExpendPolicy) == -1 || payMoney.compareTo(hardwareExpendPolicy) == 0){
				policyPurchase.setHardwareExpend(payMoney);
				policyPurchase.setPublicExpend(new BigDecimal(0));
				policyPurchase.setMinaExpend(new BigDecimal(0));
				policyPurchase.setVipExpend(new BigDecimal(0));
				hardwareExpendPolicy=hardwareExpendPolicy.subtract(payMoney);
				
				//判断payMoney需付金额与硬件+公众号的扣款金额
			}else if(payMoney.compareTo(two) == -1 || payMoney.compareTo(two) == 0){    
				policyPurchase.setHardwareExpend(hardwareExpendPolicy);
				policyPurchase.setPublicExpend(payMoney.subtract(hardwareExpendPolicy));
				policyPurchase.setMinaExpend(new BigDecimal(0));
				policyPurchase.setVipExpend(new BigDecimal(0));
				hardwareExpendPolicy = new BigDecimal(0);
				publicExpendPolicy = two.subtract(payMoney);
				
				//判断payMoney需付金额与硬件+公众号+小程序的扣款金额
			}else if(payMoney.compareTo(three) == -1 || payMoney.compareTo(three) == 0){   
				policyPurchase.setHardwareExpend(hardwareExpendPolicy);
				policyPurchase.setPublicExpend(publicExpendPolicy);
				policyPurchase.setMinaExpend(payMoney.subtract(publicExpendPolicy.add(hardwareExpendPolicy)));
				policyPurchase.setVipExpend(new BigDecimal(0));
				hardwareExpendPolicy = new BigDecimal(0);  
				publicExpendPolicy = new BigDecimal(0);
				minaExpendPolicy = three.subtract(payMoney);
				
				//判断payMoney需付金额与硬件+公众号+小程序+VIP的扣款金额
			}else if(payMoney.compareTo(four) == -1 || payMoney.compareTo(four) == 0){    
				policyPurchase.setHardwareExpend(hardwareExpendPolicy);
				policyPurchase.setPublicExpend(publicExpendPolicy);
				policyPurchase.setMinaExpend(minaExpendPolicy);
				policyPurchase.setVipExpend(payMoney.subtract(publicExpendPolicy.add(hardwareExpendPolicy.add(minaExpendPolicy))));
				hardwareExpendPolicy = new BigDecimal(0);
				publicExpendPolicy = new BigDecimal(0);
				minaExpendPolicy = new BigDecimal(0);
				vipExpendPolicy = four.subtract(payMoney);
			}
			lista.add(policyPurchase);
		}
		String parentId = "1";
		for(int j = 0 ;j < lista.size();j++){
			//循环插入方针购买记录
			policyPurchaseService.save(lista.get(j));            
			/*-------------代理商充值插入记录-------------*/
			if(!companyParentId.equals(parentId)) {
				int delegateAgent = wasSysUserService.findDelegateAgent(companyParentId); 
				//能下放代理商(增加其上级代理商的账户余额并增加充值记录)
				//判断是否能够下放代理商（0：是）
				if(delegateAgent == 0){      
					WasSysUser wasSysUser = wasSysUserService.get(companyParentId);
					WasSysUser wasSysUserNow = wasSysUserService.get(wasTerminalUser.getParentId());
					//套餐折扣
					BigDecimal packageDiscount = wasSysUser.getPackageDiscount(); 
					//公众号折扣
					BigDecimal publicDiscount = wasSysUser.getPublicDiscount();
					//小程序折扣
					BigDecimal minaDiscount = wasSysUser.getMinaDiscount();  
					//当前总价(未打折)
					BigDecimal totalMoney = lista.get(j).getTotalMoney(); 
					//返点的钱
					BigDecimal recharge ;       
					WasRechargeHistory wasRechargeHistory = new WasRechargeHistory();
					//分类（0：公众号,1：小程序，2：混合套餐）
					// 0:公众号    返给   公众号
					if(lista.get(j).getClassify() == 0){                
						//recharge = lista.get(j).getPayMoney().subtract(totalMoney.multiply(publicDiscount));
						recharge = totalMoney.multiply((wasSysUserNow.getPublicDiscount()).subtract(publicDiscount));
						wasRechargeHistory.setPublicRecharge(recharge);                       
						wasRechargeHistory.setMinaRecharge(new BigDecimal(0));
						wasRechargeHistory.setHardwareRecharge(new BigDecimal(0));
						wasRechargeHistory.setVipRecharge(new BigDecimal(0));
						wasRechargeHistory.setCashRecharge(new BigDecimal(0));
						// 1:小程序    返给   小程序
					}else if(lista.get(j).getClassify() == 1){
						//recharge = lista.get(j).getPayMoney().subtract(totalMoney.multiply(minaDiscount));
						recharge = totalMoney.multiply((wasSysUserNow.getMinaDiscount()).subtract(minaDiscount));
						wasRechargeHistory.setPublicRecharge(new BigDecimal(0));              
						wasRechargeHistory.setMinaRecharge(recharge);
						wasRechargeHistory.setHardwareRecharge(new BigDecimal(0));
						wasRechargeHistory.setVipRecharge(new BigDecimal(0));
						wasRechargeHistory.setCashRecharge(new BigDecimal(0));
						// 2:套餐    返给   公众号
					}else if(lista.get(j).getClassify() == 2){
						//recharge = lista.get(j).getPayMoney().subtract(totalMoney.multiply(packageDiscount));
						recharge = totalMoney.multiply((wasSysUserNow.getPackageDiscount()).subtract(packageDiscount));
						wasRechargeHistory.setPublicRecharge(recharge);      
						wasRechargeHistory.setMinaRecharge(new BigDecimal(0));
						wasRechargeHistory.setHardwareRecharge(new BigDecimal(0));
						wasRechargeHistory.setVipRecharge(new BigDecimal(0));
						wasRechargeHistory.setCashRecharge(new BigDecimal(0));
					}
					wasRechargeHistory.setRechargeNo("R"+OrderNumberUtils.orderNumber());
					wasRechargeHistory.setReceivedUserId(companyParentId);
					wasRechargeHistory.setPolicyPurchaseId(lista.get(j).getPolicyPurchaseId());
					wasRechargeHistory.setCreateDate(date);
					wasRechargeHistory.setOperateBy(principal.toString());
					//循环插入充值记录
					if((new BigDecimal(0)).compareTo(wasRechargeHistory.getPublicRecharge())==-1||(new BigDecimal(0)).compareTo(wasRechargeHistory.getHardwareRecharge())==-1||(new BigDecimal(0)).compareTo(wasRechargeHistory.getMinaRecharge())==-1||(new BigDecimal(0)).compareTo(wasRechargeHistory.getVipRecharge())==-1){
						
						wasRechargeHistoryService.save(wasRechargeHistory);    
						
						/*-------------更新用户表(上级代理商)-------------*/
						MoneyOperation.getInstance().moneyOperation(null,wasRechargeHistory.getPublicRecharge(), 
								wasRechargeHistory.getMinaRecharge(), wasRechargeHistory.getHardwareRecharge(), wasRechargeHistory.getVipRecharge(), wasRechargeHistory.getReceivedUserId(), "充值");
					}
				}
			}
		}
		boolean returnValue = TerminalPermissionUtils.sendTerminalPermissions(wasTerminalUser);
		if(returnValue){
			result = 1;
		}else{
			result = 2;
		}
		return result ;
	}
	
}
