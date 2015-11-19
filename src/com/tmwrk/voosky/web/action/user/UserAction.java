package com.tmwrk.voosky.web.action.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tmwrk.voosky.database.vo.User;
import com.tmwrk.voosky.module.util.DateUtil;
import com.tmwrk.voosky.service.user.UserService;
import com.tmwrk.voosky.web.action.BaseAction;

public class UserAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 378487488849979221L;
	
	@Autowired
	private UserService userService ;
	
	private List<User> puList ;
	
	private User user ;
	
	private String userId ;
	private String userName ;
	private String password ;
	private String userEmail ;
	private int userState ;
	
	/**
	 * 列出所有用户信息
	 * @return
	 */
	public String listUserInfo(){
		puList = userService.getAllUserInfo(null) ;
		
		return SUCCESS ;
	}

	/**
	 * 添加用户
	 * @return
	 */
	public String addUser(){
		User u = new User() ;
		u.setUserName(userName);
		u.setPwd(password); 
		u.setLastLoginIp(getIpAddr());
		System.out.println("ip:" + getIpAddr());
		u.setAddTime(DateUtil.converNowDate());
		u.setUserEmail(userEmail);
		u.setUserState(0);
		try {
			
			userService.addUser(u);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS ;
	}
	
	public String updateUser(){
		User u = new User() ;
		u.setUserId(userId);
		u.setUserName(userName);
		u.setPwd(password); 
		u.setUserEmail(userEmail);
//		u.setLastLoginTime("2015-11-18 23:52:20");
		try {
			
			userService.updateUserById(u);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS ;
	}
	
	/**
	 * 移除用户
	 * @return
	 */
	public String removeUserById(){
		Map<String, String> param = new HashMap<String, String>() ;
		param.put("userId", userId) ;
		param.put("removedTime", DateUtil.converNowDate()) ;
		userService.removedUser(param);
		return SUCCESS ;
	}
	
	/**
	 * 通过用户Id获取用户信息
	 * @return
	 */
	public String getUserInfoById(){
		Map<String, Object> param = new HashMap<String, Object>() ;
		param.put("userId", userId) ;
		user = userService.getUserInfoById(param) ;
		
//		JSONObject jo = new JSONObject();
//		jo.containsValue(user) ;
		return SUCCESS ;
	}
	public List<User> getPuList() {
		return puList;
	}

	public void setPuList(List<User> puList) {
		this.puList = puList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String pwd) {
		this.password = pwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}

}
