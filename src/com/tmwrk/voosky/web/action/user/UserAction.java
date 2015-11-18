package com.tmwrk.voosky.web.action.user;

import java.util.List;

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
	private String addTime ;
	private String lastLoginTime ;
	private String removedTime ;
	private int userState ;
	private String lastLoginIp ;
	
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

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

	public String getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(String lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getRemovedTime() {
		return removedTime;
	}

	public void setRemovedTime(String removedTime) {
		this.removedTime = removedTime;
	}

	public int getUserState() {
		return userState;
	}

	public void setUserState(int userState) {
		this.userState = userState;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

}
