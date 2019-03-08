package com.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ssm.mapper.ProviderMapper;
import com.ssm.pojo.Provider;
import com.ssm.service.ProviderService;

@Service(value="providerService")
public class ProviderServiceimpl implements ProviderService {
	@Resource
	private ProviderMapper providerMapper;
	/**
	 * 查询所有供应商列表
	 */
	public List<Provider> FindProvider() {
		return providerMapper.FindProvider();
	}
	/**
	 * 模糊查询
	 */
	public List<Provider> getProviderfindllike(String proCode, String proName) {
		return providerMapper.getProviderfindllike(proCode, proName);
	}
	/**
	 * 根据id查询
	 */
	public Provider get(Integer id) {
		return providerMapper.get(id);
	}
	/**
	 * 根据id删除
	 */
	public int delProvider(Integer id) {
		return providerMapper.delProvider(id);
	}
	/**
	 * 供应商修改
	 */
	public int updateProvider(Provider provider) {
		return providerMapper.updateProvider(provider);
	}
	/**
	 * 供应商添加
	 */
	public int addProvidr(Provider provider) {
		return providerMapper.addProvidr(provider);
	}
	/**
	 * 分页
	 */
	@Override
	public List<Provider> getmhcx(String proCode, String proName, int index) {
		return providerMapper.getmhcx(proCode, proName, index);
	}
	@Override
	public int getLikePro(String proCode, String proName) {
		return providerMapper.getLikePro(proCode, proName);
	}
	
	
}
