package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.mapper.BillMapper;
import com.ssm.pojo.Bill;
import com.ssm.pojo.Provider;
import com.ssm.service.BillService;

@Service(value="billService")
public class BillServiceimpl implements BillService {
	@Resource
	private BillMapper billMapper;
	
	/**
	 * 查询所有商品
	 */
	public List<Bill> Findmerchandise() {
		return billMapper.Findmerchandise();
	}

	/**
	 * 根据id删除商品
	 */
	public int billdel(Integer id) {
		return billMapper.del(id);
	}

	/**
	 * 根据id查看商品
	 */
	public Bill get(Integer id) {
		return billMapper.get(id);
	}

	/**
	 * 添加商品
	 */
	public int addbill(Bill bill) {
		return billMapper.addbill(bill);
	}

	@Override
	public List<Provider> getProviderF() {
		return billMapper.getProviderF();
	}

	@Override
	public int getLikeBill(String productName, Integer providerId, Integer isPayment) {
		return billMapper.getLikeBill(productName, providerId, isPayment);
	}

	@Override
	public List<Bill> getPageBill(String productName, Integer providerId, Integer isPayment, Integer index) {
		return billMapper.getPageBill(productName, providerId, isPayment, index);
	}


}
