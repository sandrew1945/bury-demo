/**********************************************************************
* <pre>
* FILE : SessionPager.java
* CLASS : SessionPager
*
* AUTHOR : Administrator
*
* FUNCTION : TODO
*
*
*======================================================================
* CHANGE HISTORY LOG
*----------------------------------------------------------------------
* MOD. NO.| DATE | NAME | REASON | CHANGE REQ.
*----------------------------------------------------------------------
* 		  |2017年5月8日| Administrator| Created |
* DESCRIPTION:
* </pre>
***********************************************************************/
/**
* $Id: SessionPager.java,v 0.1 2017年5月8日 下午5:11:00 Administrator Exp $
*/

package com.sandrew.boot.bean;

/**
 * Function    : 
 * @author     : Administrator
 * CreateDate  : 2017年5月8日
 * @version    :
 */
public class SessionPager
{
	private int start;

	private int size;

	public SessionPager(int start, int size)
	{
		this.start = start;
		this.size = size;
	}

	public int getStart()
	{
		return start;
	}

	public void setStart(int start)
	{
		this.start = start;
	}

	public int getSize()
	{
		return size;
	}

	public void setSize(int size)
	{
		this.size = size;
	}

}
