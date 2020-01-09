package com.coder_rat.mybeansandDAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class UserManager {

	private String password;
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * 获取用户信息使用HashMap承载用户对象信息 通过HashMap.put(Key,Value)设置键值对
	 * 通过HashMap.get(Key)获取密码 通过this.setPassword()设置对外调用的密码
	 * 
	 */
	public void findUser(String uname) {

		Connection connection = DBManager.getConnection();
		HashMap<String, String> userMap = new HashMap<>();
		Statement st = null;
		ResultSet rs = null;

		/**
		 * 如果数据库中存在此用户，则可以获取用户名和密码，并且将name，password写入Map；
		 * 如果不存在，则name和password均为null
		 */
		String sql = "SELECT * FROM question_bank.users where name='" + uname + "'";
		try {
			st = connection.createStatement();
			rs = st.executeQuery(sql);
			System.out.println("读取开始。。。。。。");
			while (rs.next()) {
				System.out.println("======== 光标移动（说明查到了数据），读写中 =======");
				String name = rs.getString("name");
				String password = rs.getString("password");
				userMap.put(name, password);
			}
		} catch (SQLException e) {
			System.out.println("========== 查询失败 ==========");
			e.printStackTrace();
		} finally {
			System.out.println("======== 数据库操作完成 ========");
			try {
				if (rs != null) {
					rs.close();
				}

			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				if (st != null) {
					st.close();
				}

			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		/*
		 * 如果SQL执行st.executeQuery()并且rs.next()为真，用户存在，rs能获取对应信息，
		 * 从userMap可以获取到对应的密码，
		 * 如果rs.next()为false，说明没有查询到改用户信息，用户不存在，获得的密码为空，以此来作为用户不存在判断
		 */
		String pwd = userMap.get(uname);
		this.setPassword(pwd);

	}

}
