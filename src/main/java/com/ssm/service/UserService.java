package com.ssm.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.User;
import com.ssm.pojo.Role;
import com.ssm.util.Page;


public interface UserService {
	
	/**
	 * 查看所有 用户
	 * @return
	 */
	public void findAll(Page page);
	
	
	/**
	 * 添加用户数据
	 */
	public int add(User user);
	
	
	/**
	 * 登录验证
	 */
	public User login(String userName,String userPassword);
	
	/**
	 * 根据id查看
	 */
	public User get(@Param("id")Integer id);
	
	
	/**
	 * 根据id用户删除
	 */
	public int del(@Param("id") Integer id);
	
	/**
	 * 模糊查询
	 */
	public int findlist(@Param("userName") String userName, @Param("userRole") String userRole);
	
	/**
	 * 查询所有用户信息
	 */
	public List<User>findUserAll();
	
	/**
	 * 修改用户数据
	 */
	public int update(User user);
	
	 public List<User> getUserList(int userRole,String userName,int pages);
	 
	 public List<Role> getRoleList();


	 public int selectCount(String userName,int userRole);
	 
	 /**
	  * 用户编码唯一性验证
	  * @param userCode
	  * @return
	  */
	 public boolean existsUserCode(String userCode);
	 
	 /**
	  * 用户姓名唯一性验证
	  */
	 public boolean existsUserName(String userName);
	 
	 
	 /**
	  * 修改密码
	  */
	 public User updatepwd(Map map);
	 
	 /**
	  * 查询密码唯一性
	  */
	 public boolean findpwd(String userPassword,String id);
	 
	 public int updatepwd(User user);
}
