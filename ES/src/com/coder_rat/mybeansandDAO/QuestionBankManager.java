package com.coder_rat.mybeansandDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class QuestionBankManager {
	
	private Map<Integer,Questions> questionMap;
	
	// 设置connection对象
	Connection connection = DBManager.getConnection();
	
	public Map<Integer, Questions> getQuestionMap() {
		return questionMap;
	}

	public void setQuestionMap(Map<Integer, Questions> questionMap2) {
		this.questionMap = questionMap2;
	}

	// 手动插入
	//判断题
	public void leadInCJ(String title, String solution) {
		String sql = "insert into question_bank.c_bank_judge(title,solution) values('" + title + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void leadInCppJ(String title, String solution) {
		String sql = "insert into question_bank.cpp_bank_judge(title,solution) values('" + title + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void leadInJJ(String title, String solution) {
		String sql = "insert into question_bank.java_bank_judge(title,solution) values('" + title + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//单选题
	public void leadInCS(String title,String A,String B,String C,String D,String solution) {
		String sql = "insert into question_bank.c_bank_single(title,A,B,C,D,solution) "
				+ "values('" + title + "','" + A + "','"+ B + "','" + C + "','" + D + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void leadInCppS(String title,String A,String B,String C,String D,String solution) {
		String sql = "insert into question_bank.cpp_bank_single(title,A,B,C,D,solution) "
				+ "values('" + title + "','" + A + "','"+ B + "','" + C + "','" + D + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void leadInJS(String title,String A,String B,String C,String D,String solution) {
		String sql = "insert into question_bank.java_bank_single(title,A,B,C,D,solution) "
				+ "values('" + title + "','" + A + "','"+ B + "','" + C + "','" + D + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//简答题
	public void leadInCJQ(String title, String solution) {
		String sql = "insert into question_bank.c_bank_jqquiz(title,solution) values('" + title + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void leadInCppJQ(String title, String solution) {
		String sql = "insert into question_bank.cpp_bank_jqquiz(title,solution) values('" + title + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void leadInJJQ(String title, String solution) {
		String sql = "insert into question_bank.java_bank_jqquiz(title,solution) values('" + title + "','" + solution + "')";
		try {
			Statement st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//预览题库
	//判断题
	public void previewCJ() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from c_bank_judge";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}
	public void previewCppJ() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from cpp_bank_judge";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}

	public void previewJJ() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from java_bank_judge";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}
	//单选题
	public void previewCS() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from c_bank_single";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setA(rs.getString("A"));
				questions.setB(rs.getString("B"));
				questions.setC(rs.getString("C"));
				questions.setD(rs.getString("D"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}
	public void previewCppS() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from cpp_bank_single";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setA(rs.getString("A"));
				questions.setB(rs.getString("B"));
				questions.setC(rs.getString("C"));
				questions.setD(rs.getString("D"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}
	public void previewJS() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from java_bank_single";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setA(rs.getString("A"));
				questions.setB(rs.getString("B"));
				questions.setC(rs.getString("C"));
				questions.setD(rs.getString("D"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}
	//简答题
	public void previewCJQ() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from c_bank_jqquiz";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}
	public void previewCppJQ() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from cpp_bank_jqquiz";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}

	public void previewJJQ() {
		
		Map<Integer,Questions> questionMap = new HashMap<Integer,Questions>();
		String sql = "select * from java_bank_jqquiz";
		try {
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				Questions questions = new Questions();
				int number = rs.getInt("number");				
				questions.setTitle(rs.getString("title"));
				questions.setSolution(rs.getString("solution"));
				questionMap.put(number, questions);	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		this.setQuestionMap(questionMap);		
	}

	public void deleteQuestionCJ(String number){
		
		String sql = "delete from c_bank_judge where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
				
	}

	public void deleteQuestionCppJ(String number){
		
		String sql = "delete from cpp_bank_judge where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void deleteQuestionJJ(String number){
		
		String sql = "delete from java_bank_judge where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void deleteQuestionCS(String number){
		
		String sql = "delete from c_bank_single where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteQuestionCppS(String number){
		
		String sql = "delete from cpp_bank_single where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void deleteQuestionJS(String number){
		
		String sql = "delete from java_bank_single where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void deleteQuestionCJQ(String number){
		
		String sql = "delete from c_bank_jqquiz where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void deleteQuestionCppJQ(String number){
		
		String sql = "delete from cpp_bank_jqquiz where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void deleteQuestionJJQ(String number){
		
		String sql = "delete from java_bank_jqquiz where number="+number;
		Statement st;
		try {
			st = connection.createStatement();
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
