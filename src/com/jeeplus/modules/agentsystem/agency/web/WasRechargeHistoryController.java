package com.jeeplus.modules.agentsystem.agency.web;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.agentsystem.agency.entity.WasRechargeHistory;
import com.jeeplus.modules.agentsystem.agency.service.WasRechargeHistoryService;
import com.jeeplus.modules.agentsystem.sysdata.entity.WasAgentSystemLog;
import com.jeeplus.modules.agentsystem.sysdata.service.WasAgentSystemLogService;
import com.jeeplus.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.jeeplus.modules.sys.utils.UserUtils;

/**
 * 代理商充值记录Controller
 * @author SZP
 * @version 2017-09-27
 */
@Controller
@RequestMapping(value = "${adminPath}/agentSystem/RechargeHistory")
public class WasRechargeHistoryController  extends BaseController{
	@Autowired
	private WasRechargeHistoryService rechargeHistoryService;
	@Autowired
	private WasAgentSystemLogService agentSystemLogService;
	/**
	 * 记录查看页面
	 */
	
	@RequestMapping(value = {"list", ""})
	public String list(WasRechargeHistory rechargeHistory, HttpServletRequest request, HttpServletResponse response, Model model,String companyName) {
		Page<WasRechargeHistory> page = rechargeHistoryService.findPage(new Page<WasRechargeHistory>(request, response), rechargeHistory);
		model.addAttribute("companyName",companyName);
		model.addAttribute("page", page);
		return "modules/agentsystem/agency/wasRecordExamine";
	}
	

	/**
	 * 删除充值记录
	 */
	@ResponseBody
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	@RequiresPermissions("agentSystem:wasRecordExamine:recharge:delete")
	@RequestMapping(value = "deleteByLogic")
	public Integer deleteByLogic(WasRechargeHistory rechargeHistory,String menuId) {
		Principal principal = UserUtils.getPrincipal();
		Integer result;
		result = rechargeHistoryService.deleteByLogic(rechargeHistory);
		//删除成功插入日志
		agentSystemLogService.insert(new WasAgentSystemLog(menuId, new Date(), principal.toString(), "用户"+principal.getLoginName()+"删除了充值记录Id："+rechargeHistory.getRechargeId()));
		return result;
	}
	
	/**
	 * 历史记录充值列表
	 */
	@RequiresPermissions("agency:wasSelfRecharge:list")
	@RequestMapping(value = {"myList", ""})
	public String myList(WasRechargeHistory rechargeHistory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Subject subject = SecurityUtils.getSubject();
		Principal principal = (Principal)subject.getPrincipal();
		rechargeHistory.setReceivedUserId(principal.getId());
		Page<WasRechargeHistory> page = rechargeHistoryService.findPage(new Page<WasRechargeHistory>(request, response), rechargeHistory);
		model.addAttribute("rechargeHistory", rechargeHistory);
		model.addAttribute("page", page);
		return "modules/agentsystem/agency/wasRechargeHistory";
	}
}
