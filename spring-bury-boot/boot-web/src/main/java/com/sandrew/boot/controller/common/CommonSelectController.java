package com.sandrew.boot.controller.common;

import com.sandrew.boot.core.controller.BaseController;
import com.sandrew.boot.core.exception.ActionException;
import com.sandrew.boot.core.exception.JsonException;
import com.sandrew.boot.core.exception.ServiceException;
import com.sandrew.boot.service.rolemanager.RoleManagerService;
import com.sandrew.mvc.model.RolePO;
import lombok.extern.log4j.Log4j2;
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
@Log4j2
@RequestMapping(value = "/select")
public class CommonSelectController extends BaseController
{

	@Resource
	RoleManagerService roleManagerService;

	/**
	 * 
	 * Function    : 查询全部角色
	 * LastUpdate  : 2014年5月30日
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/getRoleList")
	public @ResponseBody
	List<RolePO> getRoleList() throws JsonException
	{
		try
		{
			return roleManagerService.getRoleList();
		}
		catch (ServiceException e)
		{
			e.printStackTrace();
			log.error(e.getMessage(), e);
			throw new JsonException(e.getMessage(), e);
		}
	}

}
