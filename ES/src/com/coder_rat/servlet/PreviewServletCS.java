package com.coder_rat.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coder_rat.mybeansandDAO.QuestionBankManager;
import com.coder_rat.mybeansandDAO.Questions;

public class PreviewServletCS extends HttpServlet{
	private Map<Integer,Questions> questionMap = new HashMap<Integer, Questions>();

	/**
	 * 
	 */
	private static final long serialVersionUID = 8727443610273519564L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	} 

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QuestionBankManager qbm = new QuestionBankManager();
		qbm.previewCS();
		questionMap = qbm.getQuestionMap();
		Iterator<Map.Entry<Integer, Questions>> it = questionMap.entrySet().iterator(); 
		while (it.hasNext()) {  
		    Map.Entry<Integer, Questions> entry = it.next();
		    int number = entry.getKey();
		    String title = entry.getValue().getTitle();
		    String answer = entry.getValue().getSolution();
		    //测试体
		    System.out.println("题号： " + number + " 题干： " + title+"答案为："+answer);  
		}
		//resp.sendRedirect(req.getContextPath()+"/html/preview.jsp");
		req.setAttribute("qst", questionMap);
		req.getRequestDispatcher("/html/previewCS.jsp").forward(req, resp);
		
		
		
	}	
	
}