package com.ssm.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ssm.mapper.UserMapper;
import com.ssm.pojo.User;

public class UserTester {
	private UserMapper userMapper;
	@Before
	public void setUp() throws Exception {
		ApplicationContext context=new ClassPathXmlApplicationContext("applicationContext.xml");
		userMapper=(UserMapper)context.getBean("userMapper");
	}
/*
	@Test
	public void test() {
		List<User>find=userMapper.findAll();
		for (User user : find) {
			System.out.println("用户名称:"+user.getUserName());
		}
	}
*/
}
