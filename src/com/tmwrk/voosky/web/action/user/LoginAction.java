package com.tmwrk.voosky.web.action.user;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.tmwrk.voosky.database.vo.User;
import com.tmwrk.voosky.service.user.UserService;
import com.tmwrk.voosky.web.action.BaseAction;

/**
 * 用户登入操作实例
 * @author wfluo
 *
 */
public class LoginAction extends BaseAction{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4063165696034426723L;

	private String username;

	private String password;
	
	private String code ;
	
//	private User user ;
	
	@Autowired
	private UserService userService;

	@Override
	public String execute() throws Exception{
		
		User user = userService.checkUser(username, password) ;
		
		if(user != null){
			ActionContext context = ActionContext.getContext();
			// 将用户信息存入session中
			context.getSession().put("user", user) ;
			
			return SUCCESS ;
		}
		return ERROR ;
	}

	
	/**
	 * 用户注销
	 * 
	 * @return
	 */
	public String logOut()
	{
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(
				ServletActionContext.HTTP_REQUEST);
		request.getSession().removeAttribute("user");
		return SUCCESS;
	}
	
//	public User getUser() {
//		return user;
//	}
//
//
//	public void setUser(User user) {
//		this.user = user;
//	}


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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
