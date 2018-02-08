package com.jeeplus.modules.agentsystem.sysdata.web;
/**
 * 软件管理Controller
 * @author HJT
 * @version 2017-10-09
 */
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.modules.agentsystem.sysdata.entity.WasAgentSystemLog;
import com.jeeplus.modules.agentsystem.sysdata.entity.WasSoftware;
import com.jeeplus.modules.agentsystem.sysdata.service.WasAgentSystemLogService;
import com.jeeplus.modules.agentsystem.sysdata.service.WasSoftwareService;
import com.jeeplus.modules.agentsystem.utils.StringChangeUtils;
import com.jeeplus.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.jeeplus.modules.sys.utils.UserUtils;
@Controller
@RequestMapping(value = "${adminPath}/agentSystem/Software")
public class WasSoftwareController {
	
	@Autowired
	private WasSoftwareService wasSoftwareService;
	
	@Autowired
	private WasAgentSystemLogService wasAgentSystemLogService;
	
	/**
	 * 
	 * @param classify
	 */
	@RequiresPermissions("sysdata:wasSoftware:list")
	@RequestMapping(value ="list")
	public String list(String name,Boolean classify,WasSoftware wasSoftware, HttpServletRequest request, HttpServletResponse response, Model model) {
		wasSoftware.setName(StringChangeUtils.specialStr(wasSoftware.getName()));
		Page<WasSoftware> page = wasSoftwareService.findPage(new Page<WasSoftware>(request, response), wasSoftware);
		model.addAttribute("page", page);
		model.addAttribute("classify", classify);
		model.addAttribute("name",name);
		return "modules/agentsystem/sysdata/wasSoftware";
	}
	/**
	 * 编辑保存
	 * @param wasSoftware
	 * @return
	 */
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	@RequiresPermissions("sysdata:wasSoftware:edit")
	@RequestMapping(value ="save")
	@ResponseBody
   public Integer updateSoftware(WasSoftware wasSoftware,String menuId){
	   wasSoftware.setUpdateDate(new Date());
	   Principal principal = UserUtils.getPrincipal();
	   wasSoftware.setUpdateId(principal.getId());
	   Integer result=wasSoftwareService.updateSoftware(wasSoftware);
	   if(wasSoftware.getIsNewRecord()) {
			wasAgentSystemLogService.insert(new WasAgentSystemLog(menuId,
			new Date(),principal.getId(),"用户"+principal.getLoginName()+"编辑了软件价格为"+wasSoftware.getPrice()));	
		}
	  return result;
   }
}