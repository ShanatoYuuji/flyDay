/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.agentsystem.sysdata.dao;

import java.util.List;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.agentsystem.sysdata.entity.WasSalesPolicy;

/**
 * 销售方针DAO接口
 * @author HJT
 * @version 2017-10-09
 */
@MyBatisDao
public interface WasSalesPolicyDao extends CrudDao<WasSalesPolicy> {
	/**
	 * 根据ID查找数据
	 * @param salesPolicyId
	 * @return
	 */
	public WasSalesPolicy findBySalesPolicyId(Integer salesPolicyId);
	/**
	 * 根据ID查找数据
	 * @param salesPolicyId
	 * @return
	 */
	public WasSalesPolicy findPolicy(WasSalesPolicy wasSalesPolicy);
	/**
	 * 根据title查找
	 * @param title
	 * @return
	 */
	public Integer findByTitle(String title);
	/**
	 * 。。。
	 * @return
	 */
	public List<WasSalesPolicy> findUseablePolicies(WasSalesPolicy wasSalesPolicy);
	/**
	 * 查找未过期的方针
	 * @param wasSalesPolicy
	 * @return
	 */
	public List<WasSalesPolicy> findUnexpiredPolicy(WasSalesPolicy wasSalesPolicy);
}