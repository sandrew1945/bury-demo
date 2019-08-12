/**********************************************************************
* <pre>
* FILE : AjaxResult.java
* CLASS : AjaxResult
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
* 		  |2016年5月9日| SuMMeR| Created |
* DESCRIPTION:
* </pre>封装Ajax请求处理结果
* 		一般情况下，Ajax请求不管处理是否成功，系统层面都会认识是成功的请求，
* 		所以使用该类进行封装，再通过前台处理进行成功或失败的判断
***********************************************************************/
/**
* $Id: AjaxResult.java,v 0.1 2016年5月9日 下午12:53:19 SuMMeR Exp $
*/

package com.sandrew.mvc.core.common;

/**
 * Function    : 
 * @author     : SuMMeR
 * CreateDate  : 2016年5月9日
 * @version    :
 */
public class AjaxResult
{
	private boolean result;

	private String msg;

	public AjaxResult requestSuccess()
	{
		this.result = true;
		return this;
	}

	public AjaxResult requestFailure(String errMsg)
	{
		this.result = false;
		this.msg = errMsg;
		return this;
	}
	
	public boolean isResult()
	{
		return result;
	}

	public void setResult(boolean result)
	{
		this.result = result;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	@Override
	public String toString()
	{
		return "{\"result\":0,\"msg\":\"" + msg + "\"}";
	}
}
