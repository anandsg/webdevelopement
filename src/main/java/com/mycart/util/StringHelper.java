package com.mycart.util;

public class StringHelper {
public static String get10Words(String data,int position) {
	String[] strarr	=data.split(" ");
	if(strarr.length>position) {
		StringBuffer strbuffer=new StringBuffer();
		for(int i=0;i<position;i++) {
			strbuffer.append(" "+strarr[i]);
		}
		return strbuffer.toString()+"...";
	}else {
		return data+"...";
	}
}
}
