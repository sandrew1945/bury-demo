package com.sandrew.mvc.core.shiro;

import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 用户和密码（包含验证码及移动端登录标识）令牌类
 * @author Think
 * @version 2013-5-19
 */
public class MyUsernamePasswordToken extends UsernamePasswordToken
{

	private static final long serialVersionUID = 1L;

	private String captcha;

	private boolean mobileLogin;

	public MyUsernamePasswordToken()
	{
		super();
	}

	public MyUsernamePasswordToken(String username, String password)
	{
		super(username, password, false, null);
		this.captcha = null;
		this.mobileLogin = false;
	}
	
	public MyUsernamePasswordToken(String username, String password, Integer userType, String captcha, boolean mobileLogin)
	{
		super(username, password, false, null);
		this.captcha = captcha;
		this.mobileLogin = mobileLogin;
	}


	public String getCaptcha()
	{
		return captcha;
	}

	public void setCaptcha(String captcha)
	{
		this.captcha = captcha;
	}

	public boolean isMobileLogin()
	{
		return mobileLogin;
	}

}