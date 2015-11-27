package com.tmwrk.voosky.web.action.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.tmwrk.voosky.database.vo.User;
import com.tmwrk.voosky.module.util.DateUtil;
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
	private String msg ;
	
	@Autowired
	private UserService userService;

	@Override
	public String execute() throws Exception{
		if (code == null && username == null && password == null){
			msg = "请输入正确的信息！";
		}
		
		ActionContext context = ActionContext.getContext();
		
		// 校验验证码
		String _code = (String) context.getSession().get("rand");
		if (_code == null || _code.equals("")) {
			msg = "验证码失效！" ;
			return "login";
		}else{
			if (_code.equalsIgnoreCase(code)){
				User user = userService.checkUser(username, password) ;
				
				if(user != null){
					
					// 将用户信息存入session中
					context.getSession().put("user", user) ;
					//修改用户登陆信息
					Map<String, String> params = new HashMap<String, String>() ;
					params.put("userId", user.getUserId()) ;
					params.put("lastLoginTime", DateUtil.converNowDate()) ;
					params.put("lastLoginIp", getIpAddr()) ;
					userService.updateUserLastLoginInfo(params) ;
					
					return SUCCESS ;
				}
			}else{
				msg = "验证码输入错误！" ;
			}
		}
		return "login" ;
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

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
