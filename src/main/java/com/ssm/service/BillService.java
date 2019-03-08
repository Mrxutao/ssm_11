package com.ssm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.Bill;
import com.ssm.pojo.Provider;

public interface BillService {

	/**
	 * 查询所有商品
	 * 
	 * @return
	 */
	public List<Bill> Findmerchandise();
	
	
	/**
	 * 根据id删除商品
	 */
	public int billdel(@Param("id")Integer id);
	
	/**
	 * 根据id查看商品
	 */
	public Bill get(@Param("id") Integer id);
	
	/**
	 * 添加商品
	 */
	public int addbill(Bill bill);
	
	public List<Provider>getProviderF();

	public int getLikeBill(String productName,Integer providerId,Integer isPayment);
	
	public List<Bill>getPageBill(String productName,Integer providerId,Integer isPayment,Integer index);

}
