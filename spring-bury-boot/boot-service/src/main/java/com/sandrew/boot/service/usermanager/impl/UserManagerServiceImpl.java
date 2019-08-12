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

package com.sandrew.boot.service.usermanager.impl;


import com.sandrew.boot.core.bean.AclUserBean;
import com.sandrew.boot.core.common.AjaxResult;
import com.sandrew.boot.core.common.Constants;
import com.sandrew.boot.core.common.Fixcode;
import com.sandrew.boot.core.exception.DAOException;
import com.sandrew.boot.core.exception.ServiceException;
import com.sandrew.boot.core.exception.TooManyResultsException;
import com.sandrew.boot.dao.CommonDAO;
import com.sandrew.boot.dao.UserManagerDAO;
import com.sandrew.boot.service.usermanager.UserManagerService;
import com.sandrew.bury.bean.PageResult;
import com.sandrew.mvc.model.RolePO;
import com.sandrew.mvc.model.UserPO;
import com.sandrew.mvc.model.UserRolePO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Function    : 
 * @author     : SuMMeR
 * CreateDate  : 2014年5月3日
 * @version    :
 */
@Service
@Slf4j
public class UserManagerServiceImpl implements UserManagerService
{
	@Resource
	private UserManagerDAO userManagerDAO;

	@Resource
	private CommonDAO commonDAO;

	@Override
	public PageResult<UserPO> userManagerPageQuery(UserPO condition, int curPage) throws ServiceException
	{
		try
		{
			return userManagerDAO.userManagerPageQuery(condition, curPage);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new ServiceException("用户列表查询失败", e);
		}
	}


	@Override
	public AjaxResult createUserInfo(UserPO user, MultipartFile avatar, AclUserBean aclUser) throws ServiceException
	{
		AjaxResult result = new AjaxResult();
		try
		{
			boolean isExits = false;

			// 验证用户代码是否存在
			UserPO cond = new UserPO();
			cond.setUserCode(user.getUserCode());
			cond.setIsDelete(Fixcode.IF_TYPE_NO.getFixcode());
			List<UserPO> list = commonDAO.select(cond);
			isExits = (null != list && list.size() > 0) ? true : false;
			if (!isExits)
			{
				user.setIsDelete(Fixcode.IF_TYPE_NO.getFixcode());
				user.setCreateBy(aclUser.getUserId());
				user.setCreateDate(new Date());
				//user.setPassword(MD5Encrypt.MD5Encode(user.getPassword()));
				// 使用明文密码
				user.setPassword(user.getPassword());
				commonDAO.insert(user);
				result.requestSuccess();
			}
			else
			{
				result.requestFailure("用户已经存在");
			}
			return result;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new ServiceException("创建用户失败", e);
		}
	}

	@Override
	public AjaxResult deleteUserInfo(Integer userId, AclUserBean aclUser) throws ServiceException
	{
		try
		{
			AjaxResult result = new AjaxResult();
			// 将该用户IS_DELETE标记为是
			UserPO cond = new UserPO();
			cond.setUserId(userId);

			UserPO value = new UserPO();
			value.setIsDelete(Fixcode.IF_TYPE_YES.getFixcode());
			value.setUpdateBy(aclUser.getUserId());
			value.setUpdateDate(new Date());
			int count = commonDAO.update(cond, value);
			if (count > 0)
			{
				result.requestSuccess();
			}
			else
			{
				result.requestFailure("删用户失败");
			}
			return result;
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("删除用户失败", e);
		}
	}

	@Override
	public UserPO findByUserId(Integer userId) throws ServiceException
	{

		try
		{
			UserPO userPO = commonDAO.selectById(new UserPO(userId));
			return userPO;
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("查询失败", e);
		}
	}

	@Override
	public UserPO getUserByCode(String userCode) throws ServiceException
	{
		try
		{
			if (null == userCode || "".equals(userCode))
			{
				return null;
			}
			UserPO user = new UserPO();
			user.setUserCode(userCode);
			user.setIsDelete(Constants.IF_TYPE_NO);
			user.setUserStatus(Constants.STATUS_ENABLE);
			List<UserPO> userList = commonDAO.select(user);
			if (null != userList && userList.size() == 1)
			{
				return userList.get(0);
			}
			else
			{
				throw new TooManyResultsException("");
			}
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException(e.getMessage(), e);
		}
	}

	/**
	 * @liutt
	 * 修改编辑用户信息
	 * @param user
	 * @param avatar
	 * @param aclUser
	 * @return
	 * @throws ServiceException
	 */
	@Override
	public AjaxResult updateUserInfo(UserPO user, MultipartFile avatar, AclUserBean aclUser) throws ServiceException
	{
		AjaxResult result = new AjaxResult();
		try
		{
			int count = userManagerDAO.updateUserInfo(user);
			if (count > 0)
			{
				return result.requestSuccess();
			}
			return result.requestFailure("编辑用户失败");
		}
		catch (DAOException e)
		{
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new ServiceException("编辑用户失败", e);
		}
	}

	@Override
	public List<RolePO> getRelationRolesByUserId(Integer userId) throws ServiceException
	{
		try
		{
			return userManagerDAO.queryRelationRole(userId);
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("获取已有角色失败", e);
		}

	}

	@Override
	public AjaxResult deleteRoleRelation(Integer userId, Integer roleId) throws ServiceException
	{
		try
		{
			AjaxResult result = new AjaxResult();

			UserRolePO cond = new UserRolePO();
			cond.setRoleId(roleId);
			cond.setUserId(userId);
			int count = commonDAO.delete(cond);
			if (count > 0)
			{
				result.requestSuccess();
			}
			else
			{
				result.requestFailure("删除角色失败");
			}
			return result;
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("删除角色失败", e);
		}
	}

	@Override
	public List<RolePO> getUnRelationRoles(AclUserBean aclUser) throws ServiceException
	{
		try
		{
			List<RolePO> roles = userManagerDAO.getRoleExistOwn(aclUser);
			return roles;
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("获取未关联角色失败", e);
		}

	}

	@Override
	public AjaxResult createRelation(Integer userId, String rolesStr, AclUserBean aclUser) throws ServiceException
	{
		try
		{
			String[] roles = rolesStr.split(",");
			for (String roleId : roles)
			{
				UserRolePO userRole = new UserRolePO();
				userRole.setUserId(userId);
				userRole.setRoleId(new Integer(roleId));
				userRole.setCreateBy(aclUser.getUserId());
				userRole.setCreateDate(new Date());
				commonDAO.insert(userRole);
			}
			AjaxResult ajaxResult = new AjaxResult();
			return ajaxResult.requestSuccess();
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("添加角色失败", e);
		}

	}

	@Override
	public AjaxResult updateClearAvatar(Integer userId, AclUserBean loginUser) throws ServiceException {
		try {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("userId", userId);
			paramMap.put("updateBy", loginUser.getUserId());
			paramMap.put("updateDate", new Date());
			int count = userManagerDAO.updateClearAvatar(paramMap);
			AjaxResult ajaxResult = new AjaxResult();
			if (count > 0) {
				return ajaxResult.requestSuccess();
			} else {
				return ajaxResult.requestFailure("用户保存失败");
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			throw new ServiceException("用户保存失败", e);
		}
	}

}
