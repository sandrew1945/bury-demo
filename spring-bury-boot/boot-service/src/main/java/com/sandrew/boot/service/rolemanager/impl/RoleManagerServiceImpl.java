/**********************************************************************
* <pre>
* FILE : RoleManagerServiceImpl.java
* CLASS : RoleManagerServiceImpl
*
* AUTHOR : Liutt
*
* FUNCTION : TODO
*
*
*======================================================================
* CHANGE HISTORY LOG
*----------------------------------------------------------------------
* MOD. NO.| DATE | NAME | REASON | CHANGE REQ.
*----------------------------------------------------------------------
* 		  |2016年5月30日| Liutt| Created |
* DESCRIPTION:
* </pre>
***********************************************************************/
/**
* $Id: RoleManagerServiceImpl.java,v 0.1 2016年5月30日 上午10:58:34 liutt Exp $
*/

package com.sandrew.boot.service.rolemanager.impl;

import com.sandrew.boot.bean.RoleFunctionBean;
import com.sandrew.boot.core.bean.AclUserBean;
import com.sandrew.boot.core.common.AjaxResult;
import com.sandrew.boot.core.common.Constants;
import com.sandrew.boot.core.exception.DAOException;
import com.sandrew.boot.core.exception.ServiceException;
import com.sandrew.boot.dao.CommonDAO;
import com.sandrew.boot.dao.RoleManagerDAO;
import com.sandrew.boot.service.rolemanager.RoleManagerService;
import com.sandrew.bury.bean.PageResult;
import com.sandrew.mvc.model.FunctionPO;
import com.sandrew.mvc.model.RoleFuncPO;
import com.sandrew.mvc.model.RolePO;
import com.sandrew.mvc.model.UserRolePO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


/**
 * Function    : 
 * @author     : liutt
 * CreateDate  : 2016年5月30日
 * @version    :
 */
@Service
@Slf4j
public class RoleManagerServiceImpl implements RoleManagerService
{
	@Resource
	CommonDAO commonDAO;

	@Resource
	RoleManagerDAO roleManagerDAO;

	@Override
	public List<RolePO> getRoleList() throws ServiceException
	{
		try
		{
			RolePO cond = new RolePO();
			List<RolePO> roleList = commonDAO.select(cond);
			log.debug("roleList : " + roleList);
			return roleList;
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("获取角色列表失败", e);
		}

	}

	/**
	 * Function    : 分页查询角色列表
	 * LastUpdate  : 2016年5月26日
	 * @author     ：liutt
	 * @param condition 查询条件
	 * @param curPage 分页信息
	 */
	@Override
	public PageResult<RolePO> roleManagerPageQuery(RolePO condition, int curPage) throws ServiceException
	{
		try
		{
			return roleManagerDAO.roleManagerPageQuery(condition, curPage);
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("角色列表查询失败", e);
		}
	}

	/**
	 * Function    : 创建角色
	 * LastUpdate  : 2016年5月30日
	 * @author     ：liutt
	 * @param role 角色
	 * @param aclUser 登录用户
	 */
	@Override
	public AjaxResult createRole(RolePO role, AclUserBean aclUser) throws ServiceException
	{
		AjaxResult result = new AjaxResult();
		try
		{
			boolean isExits = false;
			// 验证用户代码是否存在
			RolePO cond = new RolePO();
			cond.setRoleCode(role.getRoleCode());
			List<RolePO> list = commonDAO.select(cond);
			isExits = (null != list && list.size() > 0) ? true : false;
			if (!isExits)
			{
				role.setIsDelete(Constants.IF_TYPE_NO);
				role.setCreateBy(aclUser.getUserId());
				role.setCreateDate(new Date());
				commonDAO.insert(role);
				result.requestSuccess();
			}
			else
			{
				result.requestFailure("角色已经存在");
			}
			return result;
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("创建角色失败", e);
		}
	}

	/**
	 * Function    :根据角色id查询角色信息
	 * LastUpdate  : 2016年5月31日
	 * @author     ：liutt
	 * @param roleId 角色id
	 * @return
	 * @throws ServiceException
	 */
	@Override
	public RolePO findByroleId(Integer roleId) throws ServiceException
	{
		try
		{
			RolePO cond = new RolePO();
			cond.setRoleId(roleId);
			return commonDAO.selectById(cond);
		}
		catch (DAOException e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("查询角色失败", e);
		}
	}

	/**
	 * Function    :修改编辑角色信息
	 * LastUpdate  : 2016年5月31日
	 * @author     ：liutt
	 * @param role
	 * @param aclUser
	 * @return
	 * @throws ServiceException
	 */
	@Override
	public AjaxResult updateRole(RolePO role, AclUserBean aclUser) throws ServiceException
	{
		AjaxResult result = new AjaxResult();
		try
		{
			RolePO cond = new RolePO();
			cond.setRoleId(role.getRoleId());

			role.setUpdateDate(new Date());
			role.setUpdateBy(aclUser.getUserId());

			commonDAO.update(cond, role);
			result.requestSuccess();
			return result;
		}
		catch (Exception e)
		{
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new ServiceException("编辑角色失败", e);
		}

	}

	/**
	 * Function    : 删除角色
	 * LastUpdate  : 2016年5月31日
	 * @author     ：
	 * @param roleId 角色id
	 * @return
	 * @throws ServiceException
	 */
	@Override
	public AjaxResult deleteRole(Integer roleId, AclUserBean aclUser) throws ServiceException
	{
		try
		{
			AjaxResult result = new AjaxResult();
			UserRolePO cond = new UserRolePO();
			cond.setRoleId(roleId);
			List<UserRolePO> userRolePOs = commonDAO.select(cond);
			List<FunctionPO> functionPOs = roleManagerDAO.roleFuncByRoleId(roleId);

			if (userRolePOs.size() > 0 || functionPOs.size() > 0)
			{
				result.requestFailure("删除角色失败,请先解除关联关系");
				return result;
			}

			RolePO rCond = new RolePO();
			rCond.setRoleId(roleId);

			RolePO value = new RolePO();
			value.setIsDelete(Constants.IF_TYPE_YES);
			value.setUpdateBy(aclUser.getUserId());
			value.setUpdateDate(new Date());

			int count = commonDAO.update(rCond, value);
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
	public List<FunctionPO> queryRelationFunc(Integer roleId) throws ServiceException
	{
		try
		{
			return roleManagerDAO.roleFuncByRoleId(roleId);
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("查询功能失败", e);
		}
		
	}

	@Override
	public AjaxResult deleteRelationFunc(Integer roleId, Integer functionId) throws ServiceException
	{
		try
		{
			AjaxResult ajaxResult = new AjaxResult();
			RoleFuncPO cond = new RoleFuncPO();
			cond.setRoleId(roleId);
			cond.setFunctionId(functionId);
			int count = commonDAO.delete(cond);
			if(count > 0)
			{
				return ajaxResult.requestSuccess();
			}
			return ajaxResult.requestFailure("删除功能失败");
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("查询功能失败", e);
		}
		
	}

	@Override
	public List<FunctionPO> queryUnRelationFunc(Integer roleId, String functionName) throws ServiceException
	{
		try
		{
			RoleFunctionBean roleFunction = new RoleFunctionBean();
			roleFunction.setRoleId(roleId);
			roleFunction.setFunctionName(functionName);
			return roleManagerDAO.getFuncExistOwn(roleFunction);
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("查询功能失败", e);
		}
		
	}

	@Override
	public AjaxResult createRelation(Integer roleId, String funcsStr, AclUserBean loginUser) throws ServiceException
	{
		try
		{
			String[] funcs = funcsStr.split(",");
			for (String functionId : funcs)
			{
				RoleFuncPO roleFunc = new RoleFuncPO();
				roleFunc.setFunctionId(new Integer(functionId));
				roleFunc.setRoleId(roleId);
				roleFunc.setCreateBy(loginUser.getUserId());
				roleFunc.setCreateDate(new Date());
				commonDAO.insert(roleFunc);
			}
			AjaxResult ajaxResult = new AjaxResult();
			return ajaxResult.requestSuccess();
		}
		catch (Exception e)
		{
			log.error(e.getMessage(), e);
			throw new ServiceException("添加功能失败", e);
		}
	}
	
	

}
