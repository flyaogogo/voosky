package com.tmwrk.voosky.service.user;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tmwrk.voosky.database.dao.impl.UserDaoImpl;
import com.tmwrk.voosky.database.vo.User;

@Service("userService")
@Transactional
public class UserService {
	
	@Autowired
	private UserDaoImpl userDao ;
	
	public User checkUser(String username,String pwd){
		User user = new User() ;
		user.setUserName(username);
		user.setPwd(pwd);
		
		return userDao.checkUser(user) ;
	}
	
	

	public List<User> getAllUserInfo(Map<String,Object> params){
		List<User> uList = userDao.findAll(params) ;
		
		return uList ;
	}
	public User getUserInfoById(Map<String,Object> params){
		User u = userDao.findById(params) ;
		
		return u ;
	}
	public void addUser(User u){
		
		userDao.add(u) ;
	}
	
	public void updateUserById(User u){
		userDao.update(u) ;
	}
	public void removedUser(Map<String, String> param){
		userDao.removedUserById(param);
	}
	
	public boolean updateUserLastLoginInfo(Map<String, String> params){
		userDao.updateUserLastlogin(params);
		return true ;
	}
}
