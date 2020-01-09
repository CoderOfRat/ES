package com.coder_rat.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coder_rat.mybeansandDAO.UserManager;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("===== 进入doGet方法 =====");
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("===== 进入doPost方法 =====");
		////设置HttpServletRequest的编码为UTF-8,解决了获取及数据库写入的乱码问题
		req.setCharacterEncoding("utf-8");
		String userName = req.getParameter("uname");
		String password = req.getParameter("password");
		req.setAttribute("userName",userName);

		// 管理员登录代码
		if (userName.equals("admin") && password.equals("gwh888")) {
			// 请求的重定向，登进管理员界面
			System.out.println("========== 管理员登录  ===========");
			resp.sendRedirect(req.getContextPath() + "/html/manager.jsp");
		} else if (userName != "" && password != "") {
			// 一般用户界面以及错误处理的逻辑
			UserManager um = new UserManager();
			um.findUser(userName);
			String pwd = um.getPassword();
			if (pwd == null) {
				System.out.println("========= 用户不存在 ==========");
				//请求重定向
				resp.sendRedirect(req.getContextPath() + "/html/nousererror.jsp");
			} else if (!password.equals(pwd)) {
				System.out.println("你输入的密码是 ：" + password+ "======== 用户存在但是密码错误 ========");
				resp.sendRedirect(req.getContextPath() + "/html/pwderror.jsp");
			} else {
				System.out.println("========= 密码正确 ==========");
				resp.sendRedirect(req.getContextPath() + "/html/chooser.jsp");
			}
		} else {
			System.out.println("========= 用户名为空或者密码为空 ==========");
			resp.sendRedirect(req.getContextPath() + "/html/nulltips.jsp");
		}

	}

}
