package com.tmwrk.voosky.web.filter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tmwrk.voosky.module.util.DateUtil;

public class JspsFilter implements Filter
{
	private static Log log = LogFactory.getLog(JspsFilter.class);

	@Override
	public void destroy()
	{
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException,
			IOException
	{
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		ArrayList<String> excludedPage = new ArrayList<String>();
		excludedPage.add("/error/404.jsp");
		excludedPage.add("/admin/login.jsp");
		excludedPage.add("/ueditor/jsp/controller.jsp");
		String servletPath = req.getServletPath();//当前请求url，去掉几个可以直接访问的页面  
		if (excludedPage.contains(servletPath))
		{
			log.info(DateUtil.converNowDate() + "有用户自行输入访问地址请求，输入地址为" + servletPath + "，用户ip为" + request.getRemoteAddr());
			chain.doFilter(request, response);
		}
		else
		{
			log.info(DateUtil.converNowDate() + "有用户自行输入访问地址请求，且地址无效，用户ip为" + request.getRemoteAddr());
			resp.sendRedirect("/error/404.jsp");//跳往错误页面
		}

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException
	{
		// TODO Auto-generated method stub

	}

}
