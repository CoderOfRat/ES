package com.coder_rat.mybeansandDAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelUtil {
	//模板导出试题逻辑
	public static Workbook fillExcelDataWithTemplate(ResultSet rs,String templateFileName)throws Exception{
		InputStream inp=ExcelUtil.class.getResourceAsStream("/com/coder_rat/template/"+templateFileName);
		POIFSFileSystem fs=new POIFSFileSystem(inp);
		Workbook wb=new HSSFWorkbook(fs);
		Sheet sheet=wb.getSheetAt(0);
		//获取列数
		int cellNums=sheet.getRow(0).getLastCellNum();
		int rowIndex=1;
		while(rs.next()){
			Row row=sheet.createRow(rowIndex++);
			for(int i=0;i<cellNums;i++){
				row.createCell(i).setCellValue(rs.getObject(i+1).toString());
			}
		}
		return wb;
	}
	//模板批量导入逻辑实现
	@SuppressWarnings("resource")
	public String importDataWithTemplateCJ(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){//迭代识别行数 以便于读单元格内容
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);//获取当前行
				if(hssfRow==null){//行的存在性检测
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));//格式化获取单元格内容
				String solution = formatCell(hssfRow.getCell(1));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInCJ(title, solution);//QuestionBankManager下的方法引用
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateCppJ(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String solution = formatCell(hssfRow.getCell(1));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInCppJ(title, solution);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateJJ(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String solution = formatCell(hssfRow.getCell(1));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInJJ(title, solution);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateCS(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String A = formatCell(hssfRow.getCell(1));
				String B = formatCell(hssfRow.getCell(2));
				String C = formatCell(hssfRow.getCell(3));
				String D = formatCell(hssfRow.getCell(4));
				String solution = formatCell(hssfRow.getCell(5));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInCS(title, A, B, C, D, solution);					
				}catch(Exception e){
					e.printStackTrace();
				}			
				
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateCppS(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String A = formatCell(hssfRow.getCell(1));
				String B = formatCell(hssfRow.getCell(2));
				String C = formatCell(hssfRow.getCell(3));
				String D = formatCell(hssfRow.getCell(4));
				String solution = formatCell(hssfRow.getCell(5));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInCppS(title, A, B, C, D, solution);					
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateJS(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String A = formatCell(hssfRow.getCell(1));
				String B = formatCell(hssfRow.getCell(2));
				String C = formatCell(hssfRow.getCell(3));
				String D = formatCell(hssfRow.getCell(4));
				String solution = formatCell(hssfRow.getCell(5));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInJS(title, A, B, C, D, solution);					
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateCJQ(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String solution = formatCell(hssfRow.getCell(1));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInCJQ(title, solution);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateCppJQ(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String solution = formatCell(hssfRow.getCell(1));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInCppJQ(title, solution);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	@SuppressWarnings("resource")
	public String importDataWithTemplateJJQ(InputStream in)throws Exception{
		POIFSFileSystem fs=new POIFSFileSystem(in);
		HSSFWorkbook wb=new HSSFWorkbook(fs);
		HSSFSheet hssfSheet=wb.getSheetAt(0);  // 获取第一个Sheet页
		if(hssfSheet!=null){
			for(int rowNum=1;rowNum<=hssfSheet.getLastRowNum();rowNum++){
				HSSFRow hssfRow=hssfSheet.getRow(rowNum);
				if(hssfRow==null){
					continue;
				}
				String title = formatCell(hssfRow.getCell(0));
				String solution = formatCell(hssfRow.getCell(1));
				@SuppressWarnings("unused")
				Connection connection=null;
				QuestionBankManager qbm = new QuestionBankManager();
				try{
					connection=DBManager.getConnection();
					qbm.leadInJJQ(title, solution);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	//对在Excel单元格中获取的数据进行类型格式化
	@SuppressWarnings("deprecation")
	public static String formatCell(HSSFCell hssfCell){
		if(hssfCell==null){
			return "";
		}else{
			if(hssfCell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
				return String.valueOf(hssfCell.getBooleanCellValue());
			}else if(hssfCell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
				return String.valueOf(hssfCell.getNumericCellValue());
			}else{
				return String.valueOf(hssfCell.getStringCellValue());
			}
		}
		
	}

}
