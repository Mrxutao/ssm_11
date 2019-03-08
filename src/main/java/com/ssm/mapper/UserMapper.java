package com.ssm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ssm.pojo.User;
import com.ssm.pojo.Role;
import com.ssm.util.Page;


public interface UserMapper {

	/**
	 * 查看所有 用户
	 * 
	 * @param page
	 * @return
	 */
	
	public List<User> findAll(Page page);

	/**
	 * 添加用户数据
	 */
	public int add(User user);

	/**
	 * 登录验证
	 */
	public int selectlogin(User user);

	/**
	 * 登录验证
	 */
	public User login(@Param("userCode") String userName, @Param("userPassword") String userPassword);

	/**
	 * 根据id查看
	 */
	public User get(@Param("id") Integer id);

	/**
	 * 根据id用户删除
	 */
	public int del(@Param("id") Integer id);

	/**
	 * 模糊查询
	 */
	public int findlist(@Param("userName") String userName, @Param("userRole") String userRole);

	public Integer countItem();

	/**
	 * 查询所有用户信息
	 */
	public List<User> findUserAll();

	/**
	 * 修改用户信息
	 */
	public int update(User user);
	
	/**
	 *分页
	 * @param userRole
	 * @param userName
	 * @param pages
	 * @return
	 */
	 public List<User> getUserList(@Param("userRole")int userRole,@Param("userName")String userName,@Param("pages")int pages);
	 /**
	  * 查询角色
	  * @return
	  */
	  public List<Role> getRoleList();
	  /**
	   * 模糊查询
	   * @param userName
	   * @param userRole
	   * @return
	   */
	  public int selectCount(@Param("userName")String userName,@Param("userRole")int userRole);
	  /**
	   * 用户编码唯一性
	   * @param map
	   * @return
	   */
	  public List<User>fingByMap(@Param(value="map")Map map);

}
