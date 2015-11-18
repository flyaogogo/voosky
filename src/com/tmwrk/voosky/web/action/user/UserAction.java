package com.tmwrk.voosky.web.action.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tmwrk.voosky.database.vo.User;
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
	private String pwd ;
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
		u.setPwd(pwd); 
		u.setLastLoginIp(getIpAddr());
		u.setAddTime("2015-11-18 22:42:20");
		u.setUserEmail(userEmail);
		u.setUserState(userState);
		
		userService.addUser(u);
		
		return SUCCESS ;
	}
	
	public String updateUser(){
		User u = new User() ;
		u.setUserName(userId);
		u.setUserName(userName);
		u.setPwd(pwd); 
		u.setUserEmail(userEmail);
		u.setLastLoginTime("2015-11-18 23:52:20");
		
		userService.updateUserById(u);
		return SUCCESS ;
	}
	
	/**
	 * 移除用户
	 * @return
	 */
	public String removeUserById(){
		Map<String, String> param = new HashMap<String, String>() ;
		param.put("userId", userId) ;
		param.put("removedTime", "2015-11-18 23:52:20") ;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
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
