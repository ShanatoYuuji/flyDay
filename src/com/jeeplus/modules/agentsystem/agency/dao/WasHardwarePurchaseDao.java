package com.jeeplus.modules.agentsystem.agency.dao;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.agentsystem.agency.entity.WasHardwarePurchase;

/**
 * 硬件购买记录Dao
 * @author: YeJR
 * @date: 2017年9月28日 下午2:51:32
 * @version 1.0
 */
@MyBatisDao
public interface WasHardwarePurchaseDao extends CrudDao<WasHardwarePurchase> {
	/**
	 * 删除硬件购买记录
	 * @param hardwarePurchase
	 * @return
	 */
	public int deleteByLogic(WasHardwarePurchase hardwarePurchase);

}