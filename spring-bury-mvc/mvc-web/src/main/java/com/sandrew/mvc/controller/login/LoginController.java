package com.sandrew.mvc.controller.login;

import com.sandrew.mvc.bean.RoleTreeNode;
import com.sandrew.mvc.controller.BaseController;
import com.sandrew.mvc.core.bean.Principal;
import com.sandrew.mvc.core.common.LoginResult;
import com.sandrew.mvc.core.exception.ActionException;
import com.sandrew.mvc.core.exception.ServiceException;
import com.sandrew.mvc.service.login.LoginService;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
@Slf4j
public class LoginController extends BaseController
{
	@Resource
	LoginService loginService;


	/**
	 * 系统默认进入页面
	 *
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping("/")
	public String loginPre(HttpServletRequest request, Model model) throws ActionException
	{
		try
		{
			return "login/login";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new ActionException("访问系统失败", e);
		}
	}


	/**
	 * 用户登录
	 *
	 * @param req
	 * @param model
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest req, Model model) throws ActionException
	{
		// 验证验证码是否正确
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated())
		{
			log.debug("==============已经登录,跳转到角色选择controller==============");
			return "forward:showRoleSelect";
		}
		String exceptionClassName = (String) req.getAttribute("shiroLoginFailure");
		if (UnknownAccountException.class.getName().equals(exceptionClassName))
		{
			model.addAttribute("isAuthenticate", "false");
		}
		else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName))
		{
			model.addAttribute("isAuthenticate", "false");
		}
		else if (exceptionClassName != null)
		{
			if ("captcha.error".equals(exceptionClassName))
			{
				model.addAttribute("captchaError", "false");
			}
			else
			{
				model.addAttribute("isAuthenticate", "false");
			}

		}
		return "login/login";
	}

	@RequestMapping(value = "/showRoleSelect")
	public String showRoleSelect(HttpServletRequest req, Model model) throws ActionException
	{
		try
		{

			Subject subject = SecurityUtils.getSubject();
			String userCode = ((Principal) subject.getPrincipal()).getName();
			// 验证登录用户
			LoginResult loginResult = loginService.postRoleHandler(userCode);
			// 生成登录记录
			if ("index".equals(loginResult.getReturnView()))
			{
				// 生成菜单
				String menuStr = loginService.generateMenu(getLoginUser().getRoleId());
				model.addAttribute("sessionUser", getLoginUser());
				model.addAttribute("menu", menuStr);
			}
			if (loginResult.getHasError())
			{
				model.addAttribute("noRole", "false");
			}
			return loginResult.getReturnView();
		}
		//catch (ServiceException e)
		catch (Exception e)
		{
			e.printStackTrace();
			model.addAttribute("isAuthenticate", "false");
			return "login/login";
		}
	}

	/**
	 *
	 * Function    : 根据用户获取可选岗位树
	 * LastUpdate  : 2014年5月30日
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/getRoleForChoice")
	public @ResponseBody
	List<RoleTreeNode> getRoleForChoice() throws ActionException
	{
		try
		{
			Integer userId = getLoginUser().getUserId();
			return loginService.choiceRoleTree(userId);
		}
		catch (ServiceException e)
		{
			e.printStackTrace();
			throw new ActionException("根据用户查询岗位失败", e);
		}
	}
	
	/**
	 * 
	 * Function    : 根据用户所选角色，转入到系统主页面，并将角色信息存入SESSION
	 * LastUpdate  : 2014年6月2日
	 * @param roleId
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/showIndex")
	public String showIndex(Integer roleId, Model model) throws ActionException
	{
		try
		{
			// 处理选择的角色信息,如果角色信息为空，那么到SESSION中获取
			if (null == roleId)
			{
				roleId = getLoginUser().getRoleId();
			}
			String returnStr = loginService.showIndex(roleId);
			// 生成菜单
			String menuStr = loginService.generateMenu(getLoginUser().getRoleId());
			model.addAttribute("menu", menuStr);
			return returnStr;
		}
		catch (ServiceException e)
		{
			e.printStackTrace();
			throw new ActionException("选择岗位、角色失败", e);
		}
	}

	/**
	 * 403错误页面
	 *
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/error403")
	public String showError403() throws ActionException
	{
		try
		{

			return "error/errorpage_403";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new ActionException("选择岗位、角色失败", e);
		}
	}

	/**
	 * 403错误页面
	 *
	 * @return
	 * @throws ActionException
	 */
	@RequestMapping(value = "/error500")
	public String showError500() throws ActionException
	{
		try
		{

			return "error/errorpage_500";
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new ActionException("选择岗位、角色失败", e);
		}
	}
	
}
