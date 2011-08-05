package com.java.dao;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts.upload.FormFile;

public class ManageCover {
	
	public boolean saveCover(FormFile ff, int id,String root){
		
		boolean b = false;
		try {
			FileOutputStream fos = new FileOutputStream(root+"res/"+id+".jpg");
			fos.write(ff.getFileData());
			fos.close();
			b = true;
//			System.out.println("...."+"   "+root+"res/"+bid+".jpg");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
