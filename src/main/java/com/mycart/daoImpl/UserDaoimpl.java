package com.mycart.daoImpl;

import com.mycart.dao.UserDao;
import com.mycart.entities.User;
import com.mycart.security.PasswordUtils;
import com.mycart.util.HibernateUtility;

public class UserDaoimpl implements UserDao {
	HibernateUtility hibernateUtility;

	public int registerUser(User user) {
		int userId = 0;
		try {
			this.hibernateUtility=new HibernateUtility();
			String encriptPassword=PasswordUtils.generatePass(user.getUserPassword());
			user.setUserPassword(encriptPassword);
			userId = hibernateUtility.registerUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userId;
	}

	@Override
	public User authenticateUser(String userName, String password) {
		User user=null;
		try {
			this.hibernateUtility=new HibernateUtility();
			String encriptPassword=PasswordUtils.generatePass(password);
			 user=this.hibernateUtility.authenticate(userName, encriptPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
