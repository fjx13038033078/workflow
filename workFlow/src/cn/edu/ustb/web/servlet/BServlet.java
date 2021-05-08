package cn.edu.ustb.web.servlet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");	//�������(POST)
		response.setContentType("text/html;charset=utf-8");	//��Ӧ����
		FileReader fr = new FileReader("/usr/local/tomcat/apache-tomcat-8.5.40/webapps/workFlow/demo/babel.txt");
		//FileReader fr = new FileReader("C:/Users/cuihan/Desktop/ģ��/babel1.txt");
		BufferedReader br = new BufferedReader(fr);
		StringBuilder sb = new StringBuilder();
		String str = new String();
		while ((str = br.readLine()) != null) {
			sb.append(str).append("\r\n");
		}
		System.out.println(sb.toString());
		request.setAttribute("json", sb.toString());
		request.getRequestDispatcher("/look.jsp").forward(request, response);
		br.close();
	}
}