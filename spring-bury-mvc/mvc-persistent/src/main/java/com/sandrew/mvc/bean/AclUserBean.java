/**********************************************************************
* <pre>
* FILE : AclUserBean.java
* CLASS : AclUserBean
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
* 		  |2010-11-11| SuMMeR| Created |
* DESCRIPTION:
* </pre>
***********************************************************************/
/**
* $Id: AclUserBean.java,v 1.1 2013/07/31 08:32:41 xin.jin Exp $
*/

package com.sandrew.mvc.bean;

import com.sandrew.mvc.core.bean.BaseBean;
import lombok.Data;

import java.util.Locale;


/**
 * Function    : 系统用户
 * @author     : SuMMeR
 * CreateDate  : 2010-11-11
 * @version    :
 */
@Data
public class AclUserBean extends BaseBean
{
	private Integer userId;

	private String userCode;

	private String userName;

	private Locale locale;

	private Integer roleId;

	private String roleName;

	private String roleCode;

	private Integer companyId;
	
	private Integer sex;
	
	private Integer userType;
	
	private String phone;
	
	private String mobile;
	
	private String email;
	
	private String avatarPath;
	
	private String userStatus;

}
