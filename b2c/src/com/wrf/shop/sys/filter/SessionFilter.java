package com.wrf.shop.sys.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SessionFilter
 */
@WebFilter("*.do")
public class SessionFilter implements Filter {

    /**
     * Default constructor. 
     */
    public SessionFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("销毁了session过滤器");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		//向下转型获取子类请求对象
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		//获取session
		HttpSession session = req.getSession();
		//获取application
		ServletContext application = req.getServletContext();
		if(application.getAttribute("user")!=null){
			if(session.getAttribute("user")!=null){
				chain.doFilter(request, response);
			}else
			{
				if(req.getServletPath().endsWith("/TimeOut.do")){
					chain.doFilter(request, response);
				}else
				{
					resp.sendRedirect("TimeOut.do");
				}
			}
		}
		else{
			if(req.getServletPath().endsWith("/Login.do")){
				chain.doFilter(request, response);
			}else{
				resp.sendRedirect("Login.do");
			}
			
		}
			
	}
		
	

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("启用了session过滤器");
		// TODO Auto-generated method stub
	}

}
