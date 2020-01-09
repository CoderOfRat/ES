package com.coder_rat.test;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.model.FieldsDocumentPart;
import org.apache.poi.hwpf.usermodel.Field;
import org.apache.poi.hwpf.usermodel.Fields;
import org.apache.poi.hwpf.usermodel.Range;

public class MSWordPoi4 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("${title}", "你是好人。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。是的哈还是");
		map.put("${item1.A}", "是");
		map.put("${item1.B}", "不是");
		map.put("${item1.C}", "你说是就是");
		map.put("${item1.D}", "你说不是就不是");
		String srcPath = "e:\\template.doc";
		readwriteWord(srcPath, map);
	}

	/**
	 * 实现对word读取和修改操作
	 * 
	 * @param filePath
	 *            word模板路径和名称
	 * @param map
	 *            待填充的数据，从数据库读取
	 */
	public static void readwriteWord(String filePath, Map<String, String> map) {
		// 读取word模板
		// String fileDir = new
		// File(base.getFile(),"http://www.cnblogs.com/http://www.cnblogs.com/../doc/").getCanonicalPath();
		FileInputStream in = null;
		try {
			in = new FileInputStream(new File(filePath));
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		HWPFDocument hdt = null;
		try {
			hdt = new HWPFDocument(in);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		Fields fields = hdt.getFields();
		Iterator<Field> it = fields.getFields(FieldsDocumentPart.MAIN).iterator();
		while (it.hasNext()) {
			System.out.println(it.next().getType());
		}

		// 读取word文本内容
		Range range = hdt.getRange();
		System.out.println(range.text());
		// 替换文本内容
		for (Map.Entry<String, String> entry : map.entrySet()) {
			range.replaceText(entry.getKey(), entry.getValue());
		}
		ByteArrayOutputStream ostream = new ByteArrayOutputStream();
		String fileName = "" + System.currentTimeMillis();
		fileName += ".doc";
		FileOutputStream out = null;
		try {
			out = new FileOutputStream("E:/" + fileName, true);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		try {
			hdt.write(ostream);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 输出字节流
		try {
			out.write(ostream.toByteArray());
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		try {
			ostream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
