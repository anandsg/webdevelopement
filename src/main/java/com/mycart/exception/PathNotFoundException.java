package com.mycart.exception;

public class PathNotFoundException  extends Exception{
	private static final long serialVersionUID = 1L;

	public PathNotFoundException(String path) {
		System.out.println("Path not found exception : "+path);
	}
}
