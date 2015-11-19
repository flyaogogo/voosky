/**

 */
package com.tmwrk.voosky.service.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tmwrk.voosky.database.vo.User;
import com.tmwrk.voosky.module.util.DateUtil;
import com.tmwrk.voosky.service.user.UserService;

/**
 * 用户 功能 测试用例    
 */
public class UserTest
{

	protected ApplicationContext ctx;
	private UserService userService;

	@Before
	public void init()
	{
		try
		{
			ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
			userService = (UserService) ctx.getBean("userService");
		}
		catch (Exception e)
		{
			// TODO: handle exception
		}

	}

	@Test
	public void addUser()
	{
		
		User u = new User() ;
//		u.setUserId("001");
		u.setUserName("user001");
		u.setPwd("123456"); 
		u.setLastLoginIp("192.168.1.12");
		u.setAddTime(DateUtil.converNowDate());
		u.setUserEmail("u@u.com");
		u.setUserState(0);
		try {
			userService.addUser(u);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("--------user add finish !----------");
		
	}

}
