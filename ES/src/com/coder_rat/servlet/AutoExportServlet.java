package com.coder_rat.servlet;
/**
 * 自动导出试题；
 * @author Coder
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;

import com.coder_rat.mybeansandDAO.DBManager;
import com.coder_rat.mybeansandDAO.DownUtils;
import com.coder_rat.mybeansandDAO.ExcelUtil;

public class AutoExportServlet extends HttpServlet{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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
		// 设置connection对象
		Connection connection = DBManager.getConnection();
		//String sql = "select title,A,B,C,D,solution from c_bank_single";
		//String course = "C语言";
		String sql = req.getParameter("sql");
		String course = req.getParameter("course");
		System.out.println(sql);
		
		try {
			String templateFileName = "questionsExportTemplate"+course+".xls";
			//设置模板导出的文件名
			String fileName = "模版导出"+course+"题库"+System.currentTimeMillis()+".xls";
			//获取模板路径
			String filePath = "/com/coder_rat/template/"+templateFileName;
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(sql);
			//rs的内容写进wb中，返回一个Workbook对象
			Workbook wb=ExcelUtil.fillExcelDataWithTemplate(rs,templateFileName );
			String mimeType = req.getServletContext().getMimeType(filePath);
			//设置导出文件的类型为原始文件的类型
			resp.setHeader("Content-Type", mimeType);
			//设置导出文件的名字编码
			resp.setHeader("Content-Disposition", "attachment;filename="+DownUtils.filenameEncoding(fileName, req));
			resp.setContentType("application/vnd.ms-excel;charset=UTF-8");
			ServletOutputStream out=resp.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				//connection.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
