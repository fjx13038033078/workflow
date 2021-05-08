package cn.edu.ustb.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.ustb.dao.WorkFlowDao;
import cn.edu.ustb.entity.User;
import cn.edu.ustb.entity.WorkFlow;
import cn.edu.ustb.utils.MD5Utils;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;


public class LoginServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private WorkFlowDao workFlowDao = new WorkFlowDao();
       
	/**
	 * 登录功能
	 * @param request 
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
    public String login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    	User form = CommonUtils.toBean(request.getParameterMap(), User.class);
    	User user = workFlowDao.findUserByUsername(form.getUsername());
    	if(user == null) {
    		request.setAttribute("msg", "用户名不存在");
    		return "f:/login.jsp";
    	}
    	
    	//MD5加密
    	String t1 = MD5Utils.stringToMD5(form.getPassword());
    	String t2 = user.getPassword();
    	System.out.println("form:"+t1);
    	System.out.println("user:"+t2);
    	
    	if(!user.getPassword().equals(MD5Utils.stringToMD5(form.getPassword()))) {
    		request.setAttribute("msg", "密码错误");
    		return "f:/login.jsp";
    	}
    	request.getSession().setAttribute("session_user", user);
    	return "f:/index.jsp";
    }

   
}
