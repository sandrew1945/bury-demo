/**********************************************************************
* <pre>
* FILE : LoginService.java
* CLASS : LoginService
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
* 		  |2014年5月3日| SuMMeR| Created |
* DESCRIPTION:
* </pre>
***********************************************************************/
/**
* $Id: LoginService.java,v 0.1 2014年5月3日 上午10:58:34 SuMMeR Exp $
*/

package com.sandrew.boot.service.login.impl;

import com.sandrew.boot.bean.RoleTreeNode;
import com.sandrew.boot.core.bean.AclUserBean;
import com.sandrew.boot.core.common.Constants;
import com.sandrew.boot.core.common.LoginResult;
import com.sandrew.boot.core.exception.ServiceException;
import com.sandrew.boot.dao.CommonDAO;
import com.sandrew.boot.dao.LoginDAO;
import com.sandrew.boot.service.login.LoginService;
import com.sandrew.boot.service.usermanager.UserManagerService;
import com.sandrew.boot.service.util.TreeMaker;
import com.sandrew.boot.service.util.TreeNode;
import com.sandrew.boot.service.util.UserUtil;
import com.sandrew.mvc.model.RolePO;
import com.sandrew.mvc.model.UserPO;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * Function    : 
 * @author     : SuMMeR
 * CreateDate  : 2014年5月3日
 * @version    :
 */
@Service
@Slf4j
public class LoginServiceImpl implements LoginService
{
	@Resource
	private UserManagerService userManagerService;

	@Resource
	private LoginDAO loginDAO;

	@Resource
	private CommonDAO commonDAO;


	/**
	 * Function    : 用户角色选择处理器
	 * LastUpdate  : 2014年6月4日
	 * @param userCode
	 * @return
	 */
	public LoginResult postRoleHandler(String userCode) throws ServiceException
	{
		try
		{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			UserPO sessionUser = userManagerService.getUserByCode(userCode);
			AclUserBean aclUser = new AclUserBean();
			aclUser.setUserId(sessionUser.getUserId());
			aclUser.setUserCode(sessionUser.getUserCode());
			aclUser.setUserName(sessionUser.getUserName());
			aclUser.setUserType(sessionUser.getUserType());
			aclUser.setAvatarPath(sessionUser.getAvatar());
			session.setAttribute(Constants.LOGIN_USER, aclUser);

			// 如果已经选择完角色，那么直接进入系统首页
			if (UserUtil.hasRole(aclUser))
			{
				return new LoginResult("index", false);
			}
			// 判断用户可以选择的角色，如果只有一个，那么不进行选择，直接跳入系统首页
			List<AclUserBean> list = loginDAO.selectRoleByUserCode(userCode);
			if (null != list && list.size() > 1)
			{
				// 多角色
				return new LoginResult("login/postRoleChoice", false);
			}
			if (null != list && list.size() < 1)
			{
				// 无角色
				return new LoginResult("redirect:error403", true);
			}

			// 角色信息放入SESSION中
			AclUserBean tempAcl = list.get(0);
			aclUser.setRoleId(tempAcl.getRoleId());
			aclUser.setRoleName(tempAcl.getRoleName());
			aclUser.setRoleCode(tempAcl.getRoleCode());
			session.setAttribute(Constants.LOGIN_USER, aclUser);
			return new LoginResult("index", false);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new ServiceException("角色选择失败", e);
		}

	}


	/**
	 * 	根据用户ID获取角色选择树
	 */
	@Override
	public List<RoleTreeNode> choiceRoleTree(Integer userId) throws ServiceException
	{
		try
		{
			return loginDAO.selectRoleForChoice(userId);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new ServiceException("角色选择树获取失败", e);
		}
	}

	@Override
	public String generateMenu(Integer roleId) throws ServiceException
	{
		String treeStr = null;
		try
		{
			treeStr = TreeMaker.buildTree(loginDAO.getMenuInfo(roleId));
		}
		catch (Exception e)
		{
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new ServiceException("获取菜单失败", e);
		}
		return treeStr;
	}

	@Override
	public String showIndex(Integer roleId) throws ServiceException
	{
		try
		{
			Subject subject = SecurityUtils.getSubject();
			Session session = subject.getSession();
			AclUserBean aclUser = (AclUserBean) session.getAttribute(Constants.LOGIN_USER);
			// 通过roleId获取角色信息
			RolePO cond = new RolePO();
			cond.setRoleId(roleId);
			RolePO rolePO = commonDAO.selectById(cond);
			aclUser.setRoleId(roleId);
			aclUser.setRoleCode(rolePO.getRoleCode());
			aclUser.setRoleName(rolePO.getRoleName());
			session.setAttribute(Constants.LOGIN_USER, aclUser);
			return "index";
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("选择岗位、角色失败", e);
		}
	}

	@Override
	public List<TreeNode> getMenuTreeNode(Integer roleId) throws ServiceException {
		List<TreeNode> treeNodes;
		try{
			treeNodes = TreeMaker.handleNode(loginDAO.getMenuInfo(roleId));
		}catch (Exception e){
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new ServiceException("获取菜单失败", e);
		}
		return treeNodes;
	}
}
