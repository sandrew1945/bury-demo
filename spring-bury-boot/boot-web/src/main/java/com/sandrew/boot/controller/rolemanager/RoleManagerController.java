/**********************************************************************
* <pre>
* FILE : RoleManagerController.java
* CLASS : RoleManagerController
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
* $Id: RoleManagerController.java,v 0.1 2016年5月30日 上午10:58:34 liutt Exp $
*/
package com.sandrew.boot.controller.rolemanager;


import com.sandrew.boot.core.bean.BaseCondition;
import com.sandrew.boot.core.common.AjaxResult;
import com.sandrew.boot.core.common.Constants;
import com.sandrew.boot.core.controller.BaseController;
import com.sandrew.boot.core.exception.ActionException;
import com.sandrew.boot.core.exception.JsonException;
import com.sandrew.boot.core.exception.ServiceException;
import com.sandrew.boot.service.rolemanager.RoleManagerService;
import com.sandrew.bury.bean.PageResult;
import com.sandrew.mvc.model.FunctionPO;
import com.sandrew.mvc.model.RolePO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;


/**
 * Function    : 
 * @author     : liutt
 * CreateDate  : 2016年5月30日
 * @version    :
 */
@Controller
@RequestMapping("/rolemanager")
@SessionAttributes(value = { Constants.CONDITION }, types = { BaseCondition.class })
public class RoleManagerController extends BaseController
{
	@Resource
	private RoleManagerService roleManagerService;//角色处理的service

	/**
	 * Function    : 进入角色查询页面,清空session中的条件回显
	 * LastUpdate  : 2016年5月30日
	 * @return String
	 */
	@RequestMapping(value = "/initRolemanagerPre")
	public String initRolemanagerPre(SessionStatus status) throws ActionException
	{
		status.setComplete();
		return "roleManager/rolemanager";
	}

	/**
	 *  Function    :进入角色查询页面
	 *  LastUpdate  : 2016年5月30日
	 * @return String
	 */
	@RequestMapping(value = "/rolemanagerPre")
	public String usermanagerPre() throws ActionException
	{

		return "roleManager/rolemanager";
	}

	/**
	 * Function    :角色信息查询所有
	 * LastUpdate  : 2016年5月30日
	 * @param condition 查询条件
	 * @param curPage 分页信息
	 * @return
	 */
	@RequestMapping(value = "/roleManagerPageQuery")
	public @ResponseBody
	PageResult<RolePO> userManagerPageQuery(RolePO condition, int curPage) throws JsonException
	{
		try
		{
			return roleManagerService.roleManagerPageQuery(condition, curPage);
		}
		catch (Exception e)
		{
			throw new JsonException(e.getMessage(), e);
		}

	}

	/**
	 * 
	 * Function    : 进入创建角色
	 * LastUpdate  : 2016年5月30日
	 * @return
	 */
	@RequestMapping(value = "/createRolePre")
	public String createRolePre() throws ActionException
	{
		return "roleManager/createrole";
	}

	/**
	 * 
	 * Function    : 编辑角色信息
	 * LastUpdate  : 2016年5月31日
	 * @return
	 */
	@RequestMapping(value = "/updateRolePre")
	public String updateRolePre(Integer roleId, Model model) throws ActionException
	{
		try
		{
			RolePO role = roleManagerService.findByroleId(roleId);
			model.addAttribute("role", role);
		}
		catch (ServiceException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "roleManager/updaterole";
	}

	/**
	 * Function    : 角色信息保存
	 * LastUpdate  : 2016年5月30日
	 * @param user 保存内容
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/createRole")
	public @ResponseBody
	AjaxResult createRole(RolePO user) throws JsonException
	{
		try
		{
			return roleManagerService.createRole(user, getLoginUser());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new JsonException(e.getMessage(), e);
		}
	}

	/**
	 * Function    :角色信息编辑
	 * LastUpdate  : 2016年5月31日
	 * @param role
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/updateRole")
	public @ResponseBody
	AjaxResult updateRole(RolePO role) throws JsonException
	{
		try
		{
			return roleManagerService.updateRole(role, getLoginUser());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new JsonException(e.getMessage(), e);
		}
	}

	/**
	 * 
	 * Function    : 删除角色
	 * LastUpdate  : 2016年5月31日
	 * @param roleId
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/deleteRole")
	public @ResponseBody
	AjaxResult deleteRole(Integer roleId) throws JsonException
	{
		try
		{
			//删除角色的时候 需要判断 该角色是否分配给其他人 如果未分配咋可以删除 如果已分配 则不可以删除
			return roleManagerService.deleteRole(roleId, getLoginUser());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new JsonException(e.getMessage(), e);
		}
	}

	/**
	 *  查询该角色所有的功能PRE
	 * @return
	 * @throws ActionException
     */
	@RequestMapping(value = "queryRelationFuncPre")
	public String queryRelationFuncPre() throws ActionException
	{
		return "roleManager/funcrelationmanager";
	}
	
	/**
	 * 
	 * Function    : 查询该角色所有的功能
	 * LastUpdate  : 2016年9月22日
	 * @param roleId
	 * @return
	 * @throws JsonException
	 */
	@RequestMapping(value = "/queryRelationFunc")
	public @ResponseBody
	List<FunctionPO> queryRelationFunc(Integer roleId) throws JsonException
	{
		try
		{
			return roleManagerService.queryRelationFunc(roleId);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new JsonException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	 * Function    : 删除该角色下功能
	 * LastUpdate  : 2016年9月22日
	 * @param roleId
	 * @param functionId
	 * @return
	 * @throws JsonException
	 */
	@RequestMapping(value = "/deleteFuncRelation")
	public @ResponseBody
	AjaxResult deleteFuncRelation(Integer roleId, Integer functionId) throws JsonException
	{
		try
		{
			return roleManagerService.deleteRelationFunc(roleId, functionId);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new JsonException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	 * Function    : 查询该角色所有未分配功能
	 * LastUpdate  : 2016年9月22日
	 * @param roleId
	 * @param functionName
	 * @return
	 * @throws JsonException
	 */
	@RequestMapping(value = "/queryUnRelationFunc")
	public @ResponseBody
	List<FunctionPO> queryUnRelationFunc(Integer roleId, String functionName) throws JsonException
	{
		try
		{
			return roleManagerService.queryUnRelationFunc(roleId, functionName);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new JsonException(e.getMessage(), e);
		}
	}
	
	/**
	 * 
	 * Function    : 创建角色与功能关系
	 * LastUpdate  : 2016年9月22日
	 * @param roleId
	 * @param funcsStr
	 * @return
	 * @throws JsonException
	 */
	@RequestMapping(value = "/createRelation")
	public @ResponseBody
	AjaxResult createRelation(Integer roleId, String funcsStr) throws JsonException
	{
		try
		{
			return roleManagerService.createRelation(roleId, funcsStr, getLoginUser());
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new JsonException(e.getMessage(), e);
		}
	}

}
