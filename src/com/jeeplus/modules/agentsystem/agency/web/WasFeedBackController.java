package com.jeeplus.modules.agentsystem.agency.web;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.agentsystem.agency.entity.WasFeedBack;
import com.jeeplus.modules.agentsystem.agency.service.WasFeedBackService;
import com.jeeplus.modules.sys.security.SystemAuthorizingRealm.Principal;
import com.jeeplus.modules.sys.utils.UserUtils;

/**
 * 反馈Controller
 * @author SZP
 * @version 2017-10-20
 */
@Controller
@RequestMapping(value = "${adminPath}/agentSystem/FeedBack")
public class WasFeedBackController extends BaseController {
	@Autowired
	WasFeedBackService feedBackService;
	
	
	/**
	 * 问题反馈页面入口
	 * @author SZP
	 * @version 2017-10-20
	 */
	@RequestMapping(value = "list")
	public String feeedBackEntrance( Model model,WasFeedBack wasFeedBack,HttpServletRequest request, HttpServletResponse response) {
		Principal principal = UserUtils.getPrincipal();
		String quizBy = principal.toString();
		wasFeedBack.setQuizBy(quizBy);
		Page<WasFeedBack> page = feedBackService.findPage(new Page<WasFeedBack>(request, response), wasFeedBack);
		model.addAttribute("wasFeedBack",wasFeedBack );
		model.addAttribute("page",page );
		model.addAttribute("quizBy",quizBy );
		
		return "modules/agentsystem/agency/wasFeedBackProblem";
	}

	/**
	 * 反馈问题保存
	 * @author SZP
	 * @version 2017-10-20
	 */
	@ResponseBody
	@RequestMapping(value = "insertFeedBack")
	public int insertFeedBack(WasFeedBack feedBack){
		int result = 0;
		//获取当前日期
		Date quizDate = new Date();
		feedBack.setQuizDate(quizDate);
		result = feedBackService.insertFeedBack(feedBack);
		return result;
		
	}
	
	/**
	 * 查看
	 * @author SZP
	 * @version 2017-10-21
	 */
	@ResponseBody
	@RequestMapping(value = "feedBackLook")
	public WasFeedBack feedBackLook(WasFeedBack feedBack){
		
		feedBack = feedBackService.get(feedBack);
		return feedBack;
		
	}
	
}
