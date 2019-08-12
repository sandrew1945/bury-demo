package com.sandrew.mvc.shiro;

import com.sandrew.mvc.core.bean.Principal;
import com.sandrew.mvc.model.UserPO;
import com.sandrew.mvc.service.usermanager.UserManagerService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import javax.annotation.Resource;

/**
 * 管理员的认证,角色,权限控制
 */
public class AccountAuthorizationRealm extends AuthorizingRealm
{
	@Resource
	UserManagerService userManagerService;
	/**
	 * 查询获得用户信息
	 * AuthenticationToken 用于收集用户提交的身份（如用户名）及凭据（如密码）
	 *
	 * AuthenticationInfo有两个作用：
	 * 1、如果Realm 是AuthenticatingRealm 子类，则提供给AuthenticatingRealm 内部使用的
	 *    CredentialsMatcher进行凭据验证；（如果没有继承它需要在自己的Realm中自己实现验证）；
	 * 2、提供给SecurityManager来创建Subject（提供身份信息）；
	 *
	 * @param authcToken
	 * @return
	 * @throws AuthenticationException
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException
	{
		//HealthcareUsernamePasswordToken token = (HealthcareUsernamePasswordToken) authcToken;
		try
		{
			/*这里编写认证代码*/
			UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
			if (token.getUsername() == null)  
	        {  
	            throw new AccountException("用户名密码不正确");  
	        }
			//String password = null;
			UserPO user = userManagerService.getUserByCode(token.getUsername());
			if (user != null)
			{
				// 将用户信息存入到SESSION中
				Principal principal = new Principal();
				principal.setName(user.getUserCode());
				principal.setType(user.getUserType());
				return new SimpleAuthenticationInfo(principal, user.getPassword(), getName());
			}
			else
			{
				return null;
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
			throw new AuthenticationException("用户认证失败", e);
		}
	}

	/**
	 * 表示根据用户身份获取授权信息
	 * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用.在配有缓存的情况下，只加载一次.
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection)
	{
		/*String loginName = (String) principalCollection.getPrimaryPrincipal();
		Account account = accountDao.findByLoginName(loginName);
		List<Role> roleList = roleDao.getRoleByAcctId(account.getId());
		Set<String> roleNameList = Sets.newHashSet();
		for (Role role : roleList) {
		    roleNameList.add(role.getRoleName());
		}
		List<Permission> permissionList = permissionDao.getPermByRoleList(roleList);
		Set<String> permNameList = Sets.newHashSet();
		for (Permission permission : permissionList) {
		    permNameList.add(permission.getPermName());
		}*/
//		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
//		info.addRole("front");
		//        info.setStringPermissions(permNameList);
		return null;
	}

}
