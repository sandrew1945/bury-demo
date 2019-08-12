/**********************************************************************
* <pre>
* FILE : PlainCredentialsMatcher.java
* CLASS : PlainCredentialsMatcher
*
* AUTHOR : SuMMeR
*
* FUNCTION : TODO
*
*
*======================================================================
* CHANGE HISTORY LOG
*----------------------------------------------------------------------
* MOD. NO.| DATE | NAME | REASON | CHANGE REQ.
*----------------------------------------------------------------------
* 		  |2016年9月21日| SuMMeR| Created |
* DESCRIPTION:
* </pre>
***********************************************************************/
/**
* $Id: PlainCredentialsMatcher.java,v 0.1 2016年9月21日 下午1:34:08 SuMMeR Exp $
*/

package com.sandrew.mvc.core.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;


/**
 * Function    : 明文密码验证,验证密码和用户类型
 * @author     : SuMMeR
 * CreateDate  : 2016年9月21日
 * @version    :
 */
public class PlainCredentialsMatcher extends HashedCredentialsMatcher
{
	@Override
	public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info)
	{
		try
		{
			MyUsernamePasswordToken userNamePasswordToken = (MyUsernamePasswordToken) token;
			String loginPassword = String.valueOf(userNamePasswordToken.getPassword());	// 登录时输入的密码
			String userPassword = info.getCredentials().toString();						// 数据库存储的密码
			//内容一致就返回true,不一致就返回false
			if(loginPassword.equals(userPassword))
			{
				return true;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return false;
	}
}
