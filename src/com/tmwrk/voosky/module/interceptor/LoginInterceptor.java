package com.tmwrk.voosky.module.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 登录拦截器
 * @author wfluo
 * @version 2016.04.01
 */
@SuppressWarnings("serial")
public class LoginInterceptor extends AbstractInterceptor
{
	public static final String GOING_TO_URL_KEY = "goingToUrl";

//	private Log log = LogFactory.getLog(this.getClass());

	@Override
	public String intercept(ActionInvocation invocation) throws Exception
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String actionName = invocation.getProxy().getActionName();
		if (actionName.equals("verifyAccount") || actionName.equals("IndexMgrAction") || actionName.equals("getProInfoById")
				|| actionName.equals("getArticleInfoById") || actionName.equals("getSPInfoById")|| actionName.equals("index")|| actionName.equals("listAllParentNavInfo")
				|| actionName.equals("getSPInfoByName")||actionName.equals("getProductsInfo")||actionName.endsWith("getArticlesInfo"))
			return invocation.invoke();

		if (request.getSession().getAttribute("user") == null) {
			return "login";
		} else {
			if (request.getSession(false) == null)
				return "login";
			else
				return invocation.invoke();
		}

	}
}
