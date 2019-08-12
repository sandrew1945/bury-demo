/**********************************************************************
* <pre>
* FILE : JsonExceptionHandler.java
* CLASS : JsonExceptionHandler
*
* AUTHOR : Administrator
*
* FUNCTION : TODO
*
*
*======================================================================
* CHANGE HISTORY LOG
*----------------------------------------------------------------------
* MOD. NO.| DATE | NAME | REASON | CHANGE REQ.
*----------------------------------------------------------------------
* 		  |2016年5月31日| Administrator| Created |
* DESCRIPTION:
* </pre>
***********************************************************************/
/**
* $Id: JsonExceptionHandler.java,v 0.1 2016年5月31日 下午4:31:35 Administrator Exp $
*/

package com.sandrew.mvc.core.exception.handler;

import com.sandrew.mvc.core.common.AjaxResult;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * Function    : 
 * @author     : Administrator
 * CreateDate  : 2016年5月31日
 * @version    :
 */
public class JsonExceptionHandler implements HandlerExceptionResolver
{

	/* (non-Javadoc)
	 * @see org.springframework.web.servlet.HandlerExceptionResolver#resolveException(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.Object, java.lang.Exception)
	 */
	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception exception)
	{
		ModelAndView mv = new ModelAndView();
		try
		{
			if(handler instanceof HandlerMethod)
			{
				Method method = ((HandlerMethod)handler).getMethod();
				ResponseBody responseBodyAnn = AnnotationUtils.findAnnotation(method, ResponseBody.class);
				if (responseBodyAnn != null)
				{
					AjaxResult result = new AjaxResult();
					result.requestFailure(exception.getMessage());
					response.setContentType(MediaType.APPLICATION_JSON_VALUE); //设置ContentType  
		            response.setCharacterEncoding("UTF-8"); //避免乱码  
					response.getWriter().write(result.toString());
				}
			}
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
		return mv;
	}

}
