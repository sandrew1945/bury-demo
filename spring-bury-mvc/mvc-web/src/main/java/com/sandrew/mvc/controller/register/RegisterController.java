package com.sandrew.mvc.controller.register;

import com.sandrew.mvc.controller.BaseController;
import com.sandrew.mvc.core.common.AjaxResult;
import com.sandrew.mvc.core.exception.ActionException;
import com.sandrew.mvc.model.UserPO;
import com.sandrew.mvc.service.register.RegisterService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;


@Controller
@RequestMapping("/register")
public class RegisterController extends BaseController
{
	@Resource
	RegisterService registerService;

	/**
	 * 
	 * Function    : 注册
	 * LastUpdate  : 2014年5月30日
	 * @param user
	 * @param companyName
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/create")
	public @ResponseBody
	AjaxResult create(UserPO user, String companyName, Integer region) throws ActionException
	{
		try
		{
			registerService.createCompanyUser(user.getUserCode(), user.getPassword(), companyName, region);
			AjaxResult result = new AjaxResult();
			return result.requestSuccess();
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new ActionException("注册用户失败", e);
		}
	}
	
	@RequestMapping(value = "/validateUser")
	public @ResponseBody String validateUser(String userCode) throws ActionException
	{
		try
		{
			return registerService.validateUser(userCode);
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new ActionException("验证用户失败", e);
		}
	}
}
