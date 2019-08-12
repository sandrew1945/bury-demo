package com.sandrew.mvc.core.common;

public interface Constants
{
	public static int PAGE_SIZE = 10;// 页面显示条数

	public static String LOGIN_USER = "loginUser"; // 登录用户

	public static String CONDITION = "condition"; // 查询条件KEY
	
	public static String TECH_COMPANY_PREFIX = "KJQY";	// 科技认证企业认证编码前缀

	public static Integer STATUS_ENABLE = new Integer("10011001"); //有效

	public static Integer STATUS_DISABLE = new Integer("10011002"); //无效

	public static Integer SEX_MALE = new Integer("10021001"); //男

	public static Integer SEX_FEMALE = new Integer("10021002"); //女

	public static Integer SEX_UNKNOW = new Integer("10021003"); //未知

	public static Integer IF_TYPE_YES = new Integer("10031001"); //是

	public static Integer IF_TYPE_NO = new Integer("10031002"); //否

}
