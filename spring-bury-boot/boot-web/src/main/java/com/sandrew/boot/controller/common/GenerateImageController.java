package com.sandrew.boot.controller.common;

import com.sandrew.boot.core.captcha.RandCodeImageUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping(value = "/generate")
public class GenerateImageController {

	/**
	 * 生成验证码图片io流
	 */
	@RequestMapping(value = "image", method = RequestMethod.GET)
	public void generateImage(HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException
	{
       RandCodeImageUtils.generateImage(response, request);
	}
}
