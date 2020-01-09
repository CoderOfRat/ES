package com.coder_rat.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coder_rat.mybeansandDAO.QuestionBankManager;

/**
 * Servlet implementation class DeleteQuestionServletJJQ
 */
@WebServlet("/deleteQuestionServletJJQ")
public class DeleteQuestionServletJJQ extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String number = request.getParameter("number");
		System.out.println(number);
		QuestionBankManager qbm = new QuestionBankManager();
		qbm.deleteQuestionJJQ(number);
		System.out.println("===============");	
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
