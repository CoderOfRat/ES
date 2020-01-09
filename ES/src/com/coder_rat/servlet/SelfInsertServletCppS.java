package com.coder_rat.servlet;
/**
 * 手动添加试题的servlet处理逻辑；
 * @author Coder
 */
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coder_rat.mybeansandDAO.QuestionBankManager;

public class SelfInsertServletCppS extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 653025804233826031L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("========= 进入doPost ==========");
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("======== 进入doGet ==========");
		//设置HttpServletRequest的编码为UTF-8,解决了获取及数据库写入的乱码问题
		req.setCharacterEncoding("utf-8");
		String title = req.getParameter("title");
		String A = req.getParameter("A");
		String B = req.getParameter("B");
		String C = req.getParameter("C");
		String D = req.getParameter("D");
		String solution = req.getParameter("solution");
		
		QuestionBankManager qbm = new QuestionBankManager();
		qbm.leadInCppS(title, A, B, C, D, solution);
		req.getRequestDispatcher("/html/addquestionsuccess.jsp").forward(req, resp);
		System.out.println("============= 题库添加成功  ============");

	}
					
}
