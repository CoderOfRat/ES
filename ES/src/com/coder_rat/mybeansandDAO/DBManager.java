package com.coder_rat.mybeansandDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
	private static final String URL = "jdbc:mysql://localhost:3306/question_bank?useUnicode=true&characterEncoding=utf8&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "gwh888";
    private static Connection conn;


    static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL,USER,PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection(){
        return conn;
    }
	
}
