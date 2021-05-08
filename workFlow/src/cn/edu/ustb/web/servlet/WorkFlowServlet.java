package cn.edu.ustb.web.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.edu.ustb.dao.MailDao;
import cn.edu.ustb.dao.WorkFlowDao;
import cn.edu.ustb.entity.Record;
import cn.edu.ustb.entity.User;
import cn.edu.ustb.entity.WorkFlow;
import cn.edu.ustb.utils.MD5Utils;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class WorkFlowServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	private WorkFlowDao workFlowDao = new WorkFlowDao();

	/**
	 * 登录功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		User user = workFlowDao.findUserByUsername(form.getUsername());
		if (user == null) {
			request.setAttribute("msg", "用户名不存在");
			return "f:/login.jsp";
		}

		// MD5加密
		String t1 = MD5Utils.stringToMD5(form.getPassword());
		String t2 = user.getPassword();
		System.out.println("form:" + t1);
		System.out.println("user:" + t2);
		if (!user.getPassword()
				.equals(MD5Utils.stringToMD5(form.getPassword()))) {
			request.setAttribute("msg", "密码错误");
			return "f:/login.jsp";
		}
		request.getSession().setAttribute("session_user", user);
		return "f:/index.jsp";
	}

	/**
	 * 模板库功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String listByPublic(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("session_user");
		List<WorkFlow> workFlowList = workFlowDao.findWorkFlowByUid(0);
		request.setAttribute("userAccount",
				workFlowDao.findUserByUid(user.getUid()).getMoney());
		request.setAttribute("workFlowList", workFlowList);
		return "f:/material.jsp";
	}

	/**
	 * 我的工作流功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String listByUser(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("session_user");
		if (user != null) {
			if (user.getUsername().equals("admin")) {
				List<WorkFlow> workFlowList = workFlowDao
						.findWorkFlowByStatus(0);
				request.setAttribute("workFlowList", workFlowList);
				return "f:/myWorkFlow.jsp";
			} else {
				List<WorkFlow> workFlowList = workFlowDao
						.findWorkFlowByUid(user.getUid());
				request.setAttribute("workFlowList", workFlowList);
				return "f:/myWorkFlow.jsp";
			}
		}

		return "f:/myWorkFlow.jsp";
	}

	/**
	 * 用户登出功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String logout(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("session_user");
		if (user != null) {
			request.getSession().invalidate();
		}

		return "f:/index.jsp";
	}

	/**
	 * 用户收藏功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String collect(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Integer wid = Integer.parseInt(request.getParameter("wid"));
		// 根据id获得对应的workflow
		WorkFlow workFlow = workFlowDao.findWorkFlowByWid(wid);
		// 购买者的用户
		User buyer = (User) request.getSession().getAttribute("session_user");

		if (buyer != null) {

			// 防止重复收藏
			List<WorkFlow> workFlowList = workFlowDao.findWorkFlowByUid(buyer
					.getUid());
			for (WorkFlow myWorkFlow : workFlowList) {
				if (myWorkFlow.getWfName().equals(workFlow.getWfName())) {
					request.setAttribute("msg", "您已经收藏过了，请勿重复收藏！");
					return listByPublic(request, response);
				}
			}

			// 购买者的用户减钱
			workFlowDao.updateAccountByUid(-workFlow.getWfPrice(),
					buyer.getUid());
			// 售卖者的用户加钱
			workFlowDao.updateAccountByUid(workFlow.getWfPrice(),
					workFlow.getWfUser());

			// 新增交易记录
			Record record = new Record();
			record.setTime(new Date());
			record.setWid(wid);
			record.setUid(buyer.getUid());
			record.setValue(-workFlow.getWfPrice());

			workFlowDao.addRecord(record);

			record.setUid(workFlow.getWfUser());
			record.setValue(workFlow.getWfPrice());

			workFlowDao.addRecord(record);

			// 新增收藏的工作流记录
			workFlow.setUser(buyer);
			workFlow.setWid(null);
			workFlow.setWfUser(null);
			workFlowDao.addWorkFlow(workFlow);
		}
		request.setAttribute("msg", "收藏成功！");
		// 获取购买者的领域信息
		String field1 = buyer.getField1();
		String field2 = buyer.getField2();
		String field3 = buyer.getField3();
		System.out.println(field1 + field2 + field3);
		// 邮件内容
		StringBuffer buffer = new StringBuffer();
		if (null != field1 && !field1.equals("")) {
			List<WorkFlow> list = workFlowDao.findWorkFlowByFiled(field1);
			for (WorkFlow workFlow2 : list) {
				String string = buffer.toString();
				String[] strs = string.split("、");
				boolean flag = false;
				for (int i = 0; i < strs.length; i++) {
					if (!strs[i].equals(workFlow2.getWfName())
							&& !strs[i].equals(workFlow.getWfName())
							&& i == strs.length - 1) {
						flag = true;
					}
				}
				if (flag || buffer.length() == 0) {
					buffer.append(workFlow2.getWfName());
					buffer.append("、");
				}
			}
		}
		if (null != field2 && !field2.equals("")) {
			List<WorkFlow> list = workFlowDao.findWorkFlowByFiled(field2);
			for (WorkFlow workFlow2 : list) {
				String string = buffer.toString();
				String[] strs = string.split("、");
				boolean flag = false;
				for (int i = 0; i < strs.length; i++) {
					if (!strs[i].equals(workFlow2.getWfName())
							&& !strs[i].equals(workFlow.getWfName())
							&& i == strs.length - 1) {
						flag = true;
					}
				}
				if (flag || buffer.length() == 0) {
					buffer.append(workFlow2.getWfName());
					buffer.append("、");
				}
			}
		}
		if (null != field3 && !field3.equals("")) {
			List<WorkFlow> list = workFlowDao.findWorkFlowByFiled(field3);
			for (WorkFlow workFlow2 : list) {
				String string = buffer.toString();
				String[] strs = string.split("、");
				boolean flag = false;
				for (int i = 0; i < strs.length; i++) {
					if (!strs[i].equals(workFlow2.getWfName())
							&& !strs[i].equals(workFlow.getWfName())
							&& i == strs.length - 1) {
						flag = true;
					}
				}
				if (flag || buffer.length() == 0) {
					buffer.append(workFlow2.getWfName());
					buffer.append("、");
				}
			}
		}
		if (!workFlow.getField().equals(field1)
				&& !workFlow.getField().equals(field2)
				&& !workFlow.getField().equals(field3)) {
			List<WorkFlow> list = workFlowDao.findWorkFlowByFiled(workFlow
					.getField());
			for (WorkFlow workFlow2 : list) {
				String string = buffer.toString();
				String[] strs = string.split("、");
				boolean flag = false;
				for (int i = 0; i < strs.length; i++) {
					if (!strs[i].equals(workFlow2.getWfName())
							&& !strs[i].equals(workFlow.getWfName())
							&& i == strs.length - 1) {
						flag = true;
					}
				}
				if (flag || buffer.length() == 0) {
					buffer.append(workFlow2.getWfName());
					buffer.append("、");
				}
			}
		}
		String[] buf = buffer.toString().split("、");
		for (int j = 0; j < buf.length; j++) {
			if (buf[j].equals(workFlow.getWfName())) {
				buf[j] = "";
			}
		}
		StringBuffer buffer2 = new StringBuffer("");
		for (int y = 0; y < buf.length; y++) {
			if (!buf[y].equals("")) {
				buffer2.append(buf[y] + "、");
			}
		}
		int i = buffer2.lastIndexOf("、");
		buffer2.replace(i, i + 1, "。");
		// 调用邮件发送
		if (MailDao.SendMail(buyer.getEmail(), buyer.getUsername(),
				buffer2.toString())) {
			System.out.println("邮件发送成功");
			System.out.println(buffer2);
		}

		return listByPublic(request, response);
	}

	/**
	 * 模板详情功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String detail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Integer wid = Integer.parseInt(request.getParameter("wid"));
		WorkFlow workFlow = workFlowDao.findWorkFlowByWid(wid);
		User user = workFlowDao.findUserByUid(workFlow.getUser().getUid());
		workFlow.setUser(user);
		request.setAttribute("workFlow", workFlow);

		return "f:/detail.jsp";
	}

	/**
	 * 审核通过功能，审核不通过功能，发布功能，取消发布功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String updateStatus(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		WorkFlow form = CommonUtils.toBean(request.getParameterMap(),
				WorkFlow.class);

		// 更新状态
		workFlowDao.updateStatusByWid(form.getWfStatus(), form.getWid());
		// 添加一条记录
		if (form.getWfStatus() == 1) {
			User user = new User();
			user.setUid(0);
			form.setWfUser(Integer.parseInt(request.getParameter("uid")));
			form.setUser(user);
			form.setWid(null);

			workFlowDao.addWorkFlow(form);
		}
		// System.out.println("wid为：" + form.getWid());
		// System.out.println("状态为：" + form.getWfStatus());

		return listByUser(request, response);
	}

	/**
	 * 删除功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteWorkFlow(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		WorkFlow form = CommonUtils.toBean(request.getParameterMap(),
				WorkFlow.class);
		workFlowDao.deleteWorkFlowByWid(form.getWid());

		return listByUser(request, response);
	}

	/**
	 * 管理員删除功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String deleteWorkFlow2(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		WorkFlow form = CommonUtils.toBean(request.getParameterMap(),
				WorkFlow.class);
		workFlowDao.deleteWorkFlowByWid(form.getWid());

		return listByPublic(request, response);
	}

	/**
	 * 修改功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String editWorkFlow(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		WorkFlow form = CommonUtils.toBean(request.getParameterMap(),
				WorkFlow.class);
		WorkFlow workFlow = workFlowDao.findWorkFlowByWid(form.getWid());
		request.setAttribute("workFlow", workFlow);

		return "f:/look.jsp"; // 跳转至修改页面（页面需加）
	}

	/**
	 * 执行功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String executeWorkFlow(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		WorkFlow form = CommonUtils.toBean(request.getParameterMap(),
				WorkFlow.class);
		WorkFlow workFlow = workFlowDao.findWorkFlowByWid(form.getWid());
		request.setAttribute("workFlow", workFlow);

		return "f:/execute.jsp"; // 跳转至执行页面（页面需加）
	}

	/**
	 * 跳转到保存界面
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String toSavePage(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String jcontext = request.getParameter("jcontext");
		System.out.println(jcontext);
		request.setAttribute("jcontext", jcontext);
		return "f:/saves.jsp";
	}

	/**
	 * 保存功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String save(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String wfImagePath = null;
		Map<String, String> map = new HashMap<String, String>();
		try {
			// request.getParameter(""); //创建磁盘文件工厂
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			// 创建磁盘文件项
			ServletFileUpload fileUpload = new ServletFileUpload(
					fileItemFactory);
			// fileUpload.setHeaderEncoding("utf-8");
			fileUpload.setHeaderEncoding("UTF-8");// 解决中文文件名上传乱码.
			// 解析上传项
			List<FileItem> list = fileUpload.parseRequest(request);
			String fileName = null;
			for (FileItem fileItem : list) {
				if (fileItem.isFormField()) {
					// 如果是表单项
					String name = fileItem.getFieldName();
					String string = fileItem.getString("utf-8");
					// 表单项的集合
					map.put(name, string);
				} else {
					// 上传项
					fileName = fileItem.getName();
					InputStream is = fileItem.getInputStream();
					// 获得文件要上传的路径（后面的路径可以自定义）:
					String path = this.getServletContext().getRealPath(
							"/myImages");
					OutputStream os = new FileOutputStream(path + "/"
							+ fileName);// cs.jpg
					byte[] byts = new byte[1024];
					int len = 0;
					while ((len = is.read(byts)) != -1) {
						os.write(byts, 0, len);
						os.flush();
					}
					wfImagePath = "myImages/" + fileName;
					is.close();
					os.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		WorkFlow workFlow = CommonUtils.toBean(map, WorkFlow.class);
		if (wfImagePath == null) {
			System.out.println("上传失败！");
		} else {
			workFlow.setWfImagePath(wfImagePath);
		}
		// System.out.println("去空格前：" + workFlow.getWfJson());
		// System.out.println("去空格后：" + workFlow.getWfJson().trim());
		if (workFlow.getWfName() == null
				|| workFlow.getWfName().trim().isEmpty()) {
			request.setAttribute("name", "模板名称不能为空！");
			request.setAttribute("jcontext", workFlow.getWfJson());
			return toSavePage(request, response);
		}
		if (workFlow.getField() == null || workFlow.getField().trim().isEmpty()) {
			request.setAttribute("field", "领域不能为空！");
			request.setAttribute("jcontext", workFlow.getWfJson());
			return toSavePage(request, response);
		}
		if (workFlow.getWfName() == null
				|| workFlow.getWfName().trim().isEmpty()) {
			request.setAttribute("price", "模板价钱不能为空！");
			request.setAttribute("jcontext", workFlow.getWfJson());
			return toSavePage(request, response);
		}
		workFlow.setWfJson(workFlow.getWfJson().trim());
		User user = (User) request.getSession().getAttribute("session_user");
		workFlow.setUser(user);
		workFlowDao.addWorkFlow(workFlow);
		return listByUser(request, response);
	}
}
