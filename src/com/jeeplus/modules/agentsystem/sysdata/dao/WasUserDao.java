package com.jeeplus.modules.agentsystem.sysdata.dao;


import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.agentsystem.agency.entity.WasSysUser;
/**
 * 用户DAO接口
 * @author WB
 * @date: 2017-09-27
 * @version 1.0
 */
@MyBatisDao
public interface WasUserDao extends CrudDao<WasSysUser>{
	
	/**
	 * 验证用户登录名唯一性
	 * @param name
	 * @return
	 */
	public WasSysUser getByLoginName(String name);
	
	/**
	 *添加用户和角色关联数据
	 * @param userId
	 * @param roleId
	 * @return
	 */
	public Integer	insertUserRole(String userId,String roleId);
	
	/**
	 *  删除用户和角色关联表数据 
	 * @param userId
	 * @return
	 */
	public Integer   deleteUserRole(String userId);
	
	/**
	 * 根据id更新账号余额和押金 
	 * @param wasSysUser
	 * @return
	 */
	public Integer	updateAccountMoney(WasSysUser wasSysUser);
	
	/**
	 * 根据id获取账号余额和押金
	 * @param id
	 * @return
	 */
	public 	WasSysUser getUserAccountMoney(String id);
	
	/**
	 * 更新用户头像
	 * @param wasSysUser
	 * @return
	 */
	public Integer updateUserPhoto(WasSysUser wasSysUser);
}
