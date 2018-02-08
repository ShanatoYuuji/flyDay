package com.jeeplus.modules.agentsystem.sysdata.entity;

import java.math.BigDecimal;

import org.springframework.web.util.HtmlUtils;
import com.jeeplus.common.persistence.DataEntity;
/**
 * 软件Entity类
 * @author hjt
 * 
 */
public class WasSoftware extends DataEntity<WasSoftware>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 主键ID
	 */
	private Integer softwareId;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 分类（0：公众号，1：小程序）
	 */
	private Boolean classify;
	/**
	 * 价格
	 */
	private BigDecimal price;
	/**
	 * 卖出数量
	 */
	private Integer sellNum;
	/**
	 * 状态（0：删除，1：正常）
	 */
	private Boolean state;
	/**
	 * 添加账号
	 */
	private String createId;
	/**
	 * 更新账号
	 */
	private String updateId;
	/**
	 *新旧版本（0：旧版， 1：新版） 
	 */
	private Integer newVersion; 
	
	
	public Integer getNewVersion() {
		return newVersion;
	}
	public void setNewVersion(Integer newVersion) {
		this.newVersion = newVersion;
	}
	public String getCreateId() {
		return createId;
	}
	public void setCreateId(String createId) {
		this.createId = createId;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public Integer getSoftwareId() {
		return softwareId;
	}
	public void setSoftwareId(Integer softwareId) {
		this.softwareId = softwareId;
	}
	public String getName() {
		return HtmlUtils.htmlUnescape(name);
	}
	public void setName(String name) {
		this.name = HtmlUtils.htmlUnescape(name);
	}
	public Boolean getClassify() {
		return classify;
	}
	public void setClassify(Boolean classify) {
		this.classify = classify;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public Integer getSellNum() {
		return sellNum;
	}
	public void setSellNum(Integer sellNum) {
		this.sellNum = sellNum;
	}
	public Boolean getState() {
		return state;
	}
	public void setState(Boolean state) {
		this.state = state;
	}
	

}
