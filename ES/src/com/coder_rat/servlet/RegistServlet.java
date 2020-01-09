package com.coder_rat.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coder_rat.mybeansandDAO.DBManager;
import com.coder_rat.mybeansandDAO.UserManager;

public class RegistServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5238111995468653819L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("===== 进入doPost方法 =====");
		//设置HttpServletRequest的编码为UTF-8,解决了获取及数据库写入的乱码问题
		req.setCharacterEncoding("utf-8");
		String userName = req.getParameter("uname");
		String password = req.getParameter("password");
		Connection connection = DBManager.getConnection();
		Statement st = null;
		String sql = "insert into question_bank.users(name,password) values('" + userName + "','" + password + "')";

		if (userName != "" && password != "") {
			// 一般用户界面以及错误处理的逻辑
			UserManager um = new UserManager();
			um.findUser(userName);
			String pwd = um.getPassword();
			if (pwd == null) {
				System.out.println("========= 没有重复可以注册 ==========");
				try {
					st = connection.createStatement();
					st.executeUpdate(sql);
					//请求转发
					req.getRequestDispatcher("/html/success.jsp").forward(req, resp);
					//resp.sendRedirect(req.getContextPath()+"/html/success.jsp?uname="+userName+"&password="+password);
					System.out.println("============ 注册成功！ =============");
				} catch (SQLException e) {
					System.out.println("========= 增加新用户失败 =========");
					e.printStackTrace();
				} finally {
					System.out.println("=========================");
					if (st != null) {
						try {
							st.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			} else {
				System.out.println( "======== 用户存在，注册失败  ========");
//				resp.sendRedirect(req.getContextPath() + "/html/registfail.jsp?uname="+userName+"&password="+password);
				//请求转发
				req.getRequestDispatcher("/html/registfail.jsp").forward(req, resp);
			}
		}else{
			System.out.println( "======== 注册失败  ========");
			resp.sendRedirect(req.getContextPath() + "/html/nulltips.jsp");
			//请求转发
			//req.getRequestDispatcher("/html/nulltips.jsp").forward(req, resp);
			
		}

	}

}
