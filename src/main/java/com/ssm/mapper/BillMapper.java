package com.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.Bill;
import com.ssm.pojo.Provider;

public interface BillMapper {
	
	/**
	 * 查询所有商品
	 */
	public List<Bill> Findmerchandise();
	
	
	/**
	 * 根据id删除
	 */
	public int del(@Param("id")Integer id);
	
	
	/**
	 * 根据id查看商品
	 */
	public Bill get(@Param("id") Integer id);
	
	/**
	 * 添加商品
	 */
	public int addbill(Bill bill);
	
	/**
	 * 查询供应商
	 */
	public List<Provider>getProviderF();
	
	/**
	 * 模糊查询
	 */
	public int getLikeBill(@Param("productName")String productName,@Param("providerId") Integer providerId,@Param("isPayment")Integer isPayment);
	
	
	public List<Bill> getPageBill(@Param("productName")String productName,@Param("providerId") Integer providerId,@Param("isPayment")Integer isPayment,@Param("index")Integer index);
	

	
}
