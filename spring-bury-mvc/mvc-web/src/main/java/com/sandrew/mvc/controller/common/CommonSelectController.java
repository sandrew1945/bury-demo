package com.sandrew.mvc.controller.common;

import com.sandrew.mvc.controller.BaseController;
import com.sandrew.mvc.core.exception.ActionException;
import com.sandrew.mvc.core.exception.ServiceException;
import com.sandrew.mvc.model.RolePO;
import com.sandrew.mvc.service.rolemanager.RoleManagerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;



/**
 * 
 * Function    : 公共的下拉框生成
 * @author     : Administrator
 * CreateDate  : 2016年5月27日
 * @version    :
 */
@Controller
@RequestMapping(value = "/select")
public class CommonSelectController extends BaseController
{

	@Resource
	RoleManagerService roleManagerService;


	/**
	 * 
	 * Function    : 根据用户获取可选岗位树
	 * LastUpdate  : 2014年5月30日
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/getRoleList")
	public @ResponseBody List<RolePO> getRoleList() throws ActionException
	{
		try
		{
			return roleManagerService.getRoleList();
		}
		catch (ServiceException e)
		{
			e.printStackTrace();
			throw new ActionException(e.getMessage(), e);
		}
	}
}
