package cn.edu.ustb.web.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.ustb.dao.WorkFlowDao;
import cn.edu.ustb.entity.WorkFlow;


public class SearchWorkFlowServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private WorkFlowDao workFlowDao = new WorkFlowDao();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String info=request.getParameter("info");
		List<WorkFlow> workFlowList = workFlowDao.findWorkFlowBywfName(info);	
      //  request.setAttribute("list", res);
    	if(null==workFlowList || workFlowList.size()==0)
    	{	
    		List<WorkFlow> workList = workFlowDao.findWorkFlowBysame(info);
    		if (null==workList || workList.size()==0)
    		{
    			request.getRequestDispatcher("searchnull2.jsp").forward(request, response);
    		}
    		else 
    		{
    			request.setAttribute("workList", workList);
        		request.setAttribute("info", info);
        		request.getRequestDispatcher("searchnull.jsp").forward(request, response);
    			
    		}
    		
    	}
    	else
    	{
    		request.setAttribute("workFlowList", workFlowList);
        	request.setAttribute("info", info);
    		request.getRequestDispatcher("search.jsp").forward(request, response);
    	}
        
	}

}
