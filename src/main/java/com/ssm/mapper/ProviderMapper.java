package com.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.Provider;

public interface ProviderMapper {
	
	/**
	 * 查询所有供应商
	 */
	public List<Provider>FindProvider();
	
	/**
	 * 模糊查询，根据供应商编码、供应商名称
	 */
	public List<Provider> getProviderfindllike(@Param("proCode")String proCode,@Param("proName")String proName);
	
	
	/**
	 * 根据id查询
	 */
	public Provider get(@Param("id") Integer id);
	
	
	/**
	 * 根据id删除供应商
	 */
	public int delProvider(@Param("id") Integer id);
	
	
	/**
	 * 供应商修改
	 */
	public int updateProvider(Provider provider);
	
	/**
	 * 添加供应商
	 */
	public int addProvidr(Provider provider) ;
	
	/**
	 * 分页、模糊查询
	 */
	public List<Provider>getmhcx(@Param("proCode") String proCode,@Param("proName") String proName,@Param("index")int index);
	
	public int getLikePro(@Param("proCode")String proCode,@Param("proName")String proName);
}
