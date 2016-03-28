package com.tmwrk.voosky.web.action;

import org.apache.commons.lang.StringUtils;

import com.tmwrk.voosky.module.util.CommonUtil;

/**
 * 显示错误信息
 * @author Dunglas Lee
 * @version 2013-06-02
 */
public class ErrorAction extends BaseAction
{
	private static final long serialVersionUID = 7811023204041682554L;

	private String errorMsg;

	public String execute()
	{
		if (StringUtils.isBlank(errorMsg))
		{
			errorMsg = CommonUtil.DEFAULT_ERROR_MSG;
		}
		return SUCCESS;
	}

	/**
	 * @return the errorMsg
	 */
	public String getErrorMsg()
	{
		return errorMsg;
	}

	/**
	 * @param errorMsg the errorMsg to set
	 */
	public void setErrorMsg(String errorMsg)
	{
		this.errorMsg = errorMsg;
	}

}
