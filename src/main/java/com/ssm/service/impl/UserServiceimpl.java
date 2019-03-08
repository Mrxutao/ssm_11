package com.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.mapper.UserMapper;
import com.ssm.pojo.Role;
import com.ssm.pojo.User;
import com.ssm.service.UserService;
import com.ssm.util.Page;

@Service(value = "userService")
public class UserServiceimpl implements UserService {

	@Resource
	private UserMapper userMapper;

	/**
	 * 查询所有用户
	 */
	public void findAll(Page page) {
		//分页1.查询总条数
		Integer counItem=userMapper.countItem();
		page.setCountItem(counItem);
		//查询集合
		List<User>list=userMapper.findAll(page);
		page.setList(list);
	}

	/**
	 * 添加用户数据
	 */
	public int add(User user) {
		return userMapper.add(user);
	}

	/**
	 * 登录验证
	 */
	public User login(String userName, String userPassword) {
		return userMapper.login(userName, userPassword);
	}

	/**
	 * 根据id查询
	 */
	public User get(Integer id) {
		return userMapper.get(id);
	}

	/**
	 * 根据id删除用户
	 */
	public int del(Integer id) {
		return userMapper.del(id);
	}

	/**
	 * 模糊查询
	 */
	public int findlist(String userName, String userRole) {
		return userMapper.findlist(userName, userRole);
	}

	/**
	 * 查询所有用户
	 */
	public List<User> findUserAll() {
		return userMapper.findUserAll();
	}

	/**
	 * 修改用户数据
	 */
	public int update(User user) {
		return userMapper.update(user);
	}

	@Override
	public List<User> getUserList(int userRole, String userName, int pages) {
		return userMapper.getUserList(userRole, userName, pages);
	}

	@Override
	public List<Role> getRoleList() {
		return userMapper.getRoleList();
	}

	@Override
	public int selectCount(String userName, int userRole) {
		return userMapper.selectCount(userName, userRole);
	}

	/**
	 * 验证用户唯一性
	 */
	public boolean existsUserCode(String userCode) {
		Map map = new HashMap();
		map.put("userCode", userCode);
		List<User> list = userMapper.fingByMap(map);
		if(list!=null&&list.size()>0) {
			return true;
		}
		return false;
	}

	/**
	 * 验证用户姓名唯一性
	 */
	public boolean existsUserName(String userName) {
		Map map=new HashMap();
		map.put("userName", userName);
		List<User>list=userMapper.fingByMap(map);
		if(list!=null &&list.size()>0) {
			return true;
		}
		return false;
	}

	
	/**
	 * 验证密码
	 */
	@RequestMapping("topwd")
	public boolean findpwd(String userPassword,String id) {
		Map map=new HashMap();
		map.put("userPassword", userPassword);
		map.put("id", id);
		List<User>list=userMapper.fingByMap(map);
		if(list!=null &&list.size()>0) {
			return true;
		}
		return false;
	}

	@Override
	public User updatepwd(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 修改密码
	 */
	public int updatepwd(User user) {
		return userMapper.update(user);
	}

	



	
}
