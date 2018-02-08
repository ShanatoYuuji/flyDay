package com.jeeplus.modules.agentsystem.utils;

import com.jeeplus.common.utils.CacheUtils;
import com.jeeplus.modules.agentsystem.agency.entity.WasSysUser;

/**
 *模糊查询字符串处理工具类
 * @author Wb
 * @date  2017-10-20
 * @version 1.0
 */
public class StringChangeUtils {

	public static final String USER_CACHE = "userCache";
	public static final String USER_CACHE_ID_ = "id_";
	public static final String USER_CACHE_LOGIN_NAME_ = "ln";
	public static final String USER_CACHE_LIST_BY_OFFICE_ID_ = "oid_";

	public static final String CACHE_ROLE_LIST = "roleList";
	public static final String CACHE_MENU_LIST = "menuList";
	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";
	
	public static final String  EDIT="编辑";
	public static final String  ADD="添加";
	public static final String  OPERATION_SUCCESS="操作成功";
	
	public static String specialStr(String str){
		if(str==null||str==""){
			return null;
		}
		StringBuffer stringBuffer = new StringBuffer(str);
		int length=str.length();
		for (int i = 0; i <length; i++) {
			char chari=stringBuffer.charAt(i); 
			if(i==0){
				if(chari=='%'||chari=='_'||chari=='\\'){
					stringBuffer.insert(i, "\\");
					i++;
					length++;
				}
			}else{
				if(chari=='%'||chari=='_'||chari=='\\'){
					stringBuffer.insert(i, "%\\");
					i+=2;
					length+=2;
				}else{
					stringBuffer.insert(i, "%");
					i++;
					length++;
				}
			}
		}
		return stringBuffer.toString();
		
	}
	
	/**
	 * 清除指定用户缓存
	 * @param user
	 */
	public static void clearCache(WasSysUser sysUser,String oldName){
		CacheUtils.remove(USER_CACHE, USER_CACHE_ID_ + sysUser.getId());
		CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + sysUser.getLogin_name());
		if(oldName!=null){
			CacheUtils.remove(USER_CACHE, USER_CACHE_LOGIN_NAME_ + oldName);
		}
	}
}
