package cn.edu.ustb.web.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import cn.edu.ustb.entity.User;




@WebFilter(urlPatterns = { "/material.jsp", "/biological.jsp", "/chemical.jsp", "/detail.jsp", "/jmgj.jsp", "/jmgj2.jsp", "/look.jsp", "/mechanical.jsp", "/myWorkFlow.jsp", "/saves.jsp", "/shuomingshu.jsp" }, servletNames = {
		"BServlet", "WorkFlowServlet" })
public class LoginFilter implements Filter {

   
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		User user = (User) httpServletRequest.getSession().getAttribute(
				"session_user");
		if (user == null) {
			httpServletRequest.setAttribute("msg", "请输入用户名和密码");
			httpServletRequest.getRequestDispatcher("/login.jsp")
					.forward(httpServletRequest, response);
			;
		} else {
			chain.doFilter(httpServletRequest, response);
		}
		
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
