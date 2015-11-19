package com.tmwrk.voosky.web.action.user;

import org.springframework.beans.factory.annotation.Autowired;

import com.tmwrk.voosky.database.vo.User;
import com.tmwrk.voosky.service.user.UserService;
import com.tmwrk.voosky.web.action.BaseAction;

public class LoginAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4063165696034426723L;

	private String username;

	private String password;
	@Autowired
	private UserService userService;

	@Override
	public String execute() throws Exception{
		
		System.out.println("good!!!username:" + username + ",password:" + password);
		User user = userService.checkUser(username, password) ;
		return SUCCESS ;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
