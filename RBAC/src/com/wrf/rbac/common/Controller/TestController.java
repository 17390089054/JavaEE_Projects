package com.wrf.rbac.common.Controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wrf.rbac.common.Util.ImageCode;
import com.wrf.rbac.common.Util.RandomValidateCode;

@Controller
@RequestMapping("/common")
public class TestController {
	/**
	 * 生成图片验证码
	 * @param request
	 * @param response
	 */
	@GetMapping("/VerifyCode")
	public void generate(HttpServletRequest request,HttpServletResponse response){
		ByteArrayOutputStream bao=new ByteArrayOutputStream();
		String codeVal = ImageCode.drawImg(bao);
		request.getSession().setAttribute("codeVal", codeVal);
		try {
			ServletOutputStream out = response.getOutputStream();
			bao.writeTo(out);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * 获取生成验证码显示到 UI 界面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/checkCode")
	public void checkCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置相应类型,告诉浏览器输出的内容为图片
		response.setContentType("image/jpeg");
		//设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);

		try {
			RandomValidateCode.getRandcode(request, response);//输出图片方法
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	@GetMapping("/test")
	public String test(){
		return "/view/test";
	}

	@PostMapping("/test")
	public void test (String verifyCode,HttpServletRequest request){
		System.out.println("input value:"+verifyCode);
		//System.out.println("sessopn value:"+request.getSession().getAttribute("codeVal").toString());
		System.out.println("session value:"+request.getSession().getAttribute("randomcode_key").toString());
	}



}
