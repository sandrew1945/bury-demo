package com.sandrew.boot.service.login;


import com.sandrew.boot.bean.RoleTreeNode;
import com.sandrew.boot.core.common.LoginResult;
import com.sandrew.boot.core.exception.ServiceException;
import com.sandrew.boot.service.util.TreeNode;

import java.util.List;


/**
 * Function    : 
 * @author     : zhao.feng
 * CreateDate  : 2010-11-5
 * @version    :
 */
public interface LoginService
{

	/**
	 *
	 * Function    : 处理用户的角色及Session信息
	 * LastUpdate  : 2017年5月24日
	 * @param userCode
	 * @return
	 * @throws ServiceException
	 */
	public LoginResult postRoleHandler(String userCode) throws ServiceException;

	/**
	 *
	 * Function    : 根据用户ID获取角色选择树
	 * LastUpdate  : 2016年4月16日
	 * @param userId
	 * @return
	 * @throws ServiceException
	 */
	public List<RoleTreeNode> choiceRoleTree(Integer userId) throws ServiceException;

	/**
	 *
	 * Function    :
	 * LastUpdate  : 2016年4月16日
	 * @param roleId
	 * @return
	 * @throws ServiceException
	 */
	public String generateMenu(Integer roleId) throws ServiceException;

	
	/**
	 * 获取菜单树
	 * @param roleId
	 * @return
	 * @throws ServiceException
	 */
	public List<TreeNode> getMenuTreeNode(Integer roleId) throws ServiceException;
	/**
	 *
	 * Function    : 用户选择完角色进入主界面
	 * LastUpdate  : 2016年4月16日
	 * @param roleId
	 * @return
	 * @throws ServiceException
	 */
	public String showIndex(Integer roleId) throws ServiceException;
	
}
