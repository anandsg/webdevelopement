package com.mycart.dao;

import com.mycart.entities.User;

public interface UserDao {

	public int registerUser(User user);
	
	public User authenticateUser(String userName,String password);
	
}
