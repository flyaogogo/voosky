package com.tmwrk.voosky.database.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tmwrk.voosky.database.dao.BaseDao;
import com.tmwrk.voosky.database.vo.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDao<User> {

	public boolean checkUser(User user) {
		boolean flag = false ;
		int count = (Integer)getSqlMapClientTemplate().queryForObject("user.checkUser", user) ;
		if(count>0){
			flag = true ;
		}
		return flag;
	}

	@Override
	public User add(User user) {
		getSqlMapClientTemplate().insert("user.insertUser",user) ;
		return null;
	}

	@Override
	public User update(User user) {
		getSqlMapClientTemplate().update("user.updateUserById", user) ;
		return null;
	}

	@Override
	public User findById(Map<String, Object> params) {
		User u = (User)getSqlMapClientTemplate().queryForObject("user.getUserInfoById", params) ;
		return u ;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> findAll(Map<String, Object> params) {
		List<User> userList = (List<User>)getSqlMapClientTemplate().queryForList("user.getAllUserInfo") ;
		return userList; 
	}
	public void removedUserById(Map<String, String> params) {
		
		getSqlMapClientTemplate().delete("user.deleteUserById",params) ;
	}

	
}
