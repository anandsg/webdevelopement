package com.mycart.util;

import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.Part;

public class FileOperationUtility {

	final static String PATH="D:\\mystudy.com\\Web Tech\\JAVA TRAINING\\Hibernate_Practical\\mycart\\src\\main\\webapp\\resources\\images\\products\\";
	//final static String PATH="D:\\mystudy.com\\Web Tech\\JAVA TRAINING\\Hibernate_Practical\\Products\\";
	public void writeFileOnSpecifiedPath (Part part,String fileName) {
		
		try {
			String filePath=PATH+fileName;
			FileOutputStream fos=new FileOutputStream(filePath);
			
			InputStream is=part.getInputStream();
			
			byte []data=new byte[is.available()];
			
			is.read(data);
			
			fos.write(data);
			
			fos.close();
			is.close();
		} catch (Exception  e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void name() {
		
	}
}
