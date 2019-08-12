package com.sandrew.mvc.service.register;

import com.sandrew.mvc.core.exception.ServiceException;

/**
 * Function    : 角色管理处理service
 * @author     : liutt
 * CreateDate  : 2016-5-30
 * @version    :
 */
public interface RegisterService
{
	/**
	 * 
	 * Function    : 注册用户
	 * LastUpdate  : 2016年9月20日
	 * @return
	 * @throws ServiceException
	 */
	public void createCompanyUser(String userCode, String password, String companyName, Integer region) throws ServiceException;
	
	/**
	 * 
	 * Function    : 验证用户是否存在
	 * LastUpdate  : 2016年9月21日
	 * @param userCode
	 * @throws ServiceException
	 */
	public String validateUser(String userCode) throws ServiceException;
}
