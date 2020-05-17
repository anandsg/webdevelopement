package com.mycart.util;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.entities.User;

public class HibernateUtility {
	Session hbSession=null;
	Transaction tx=null;
	
	public int registerUser(User user) {
		hbSession=FactoryProvider.getFactory().openSession();
		tx=hbSession.beginTransaction();
		int userId=(Integer) hbSession.save(user);
		tx.commit();
		hbSession.close();
		return userId;
	}
	
	public User authenticate(String userName,String password) {
		User user=null;
		try {
			String query="from User u where u.userEmail=:uname and u.userPassword=:upassword";
			hbSession=FactoryProvider.getFactory().openSession();
			Query q=hbSession.createQuery(query);
			q.setParameter("uname",userName);
			q.setParameter("upassword", password);
			user=(User)q.uniqueResult();
			hbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	
	public int saveCategory(Category category) {
		hbSession=FactoryProvider.getFactory().openSession();
		tx=hbSession.beginTransaction();
		int categoryId=(Integer) hbSession.save(category);
		tx.commit();
		hbSession.close();
		return categoryId;
	}
	
	
	public List<Category> getCategories() {
		hbSession=FactoryProvider.getFactory().openSession();
		Query q=hbSession.createQuery("from Category");
		List<Category> list=q.list();
		hbSession.close();
		return list;
	}
	
	public Category getCategoryById(int categoryId) {
		Category category=null;
		try {
			
			hbSession=FactoryProvider.getFactory().openSession();
			category=hbSession.get(Category.class, categoryId);
			hbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}
	
	
	
	public int saveProduct(Product product) {
		int productId=0;
		try {
			hbSession=FactoryProvider.getFactory().openSession();
			tx=hbSession.beginTransaction();
			productId=(Integer)hbSession.save(product);
			tx.commit();
			hbSession.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productId;
	}
	
	public List<Product> getProducts() {
		hbSession=FactoryProvider.getFactory().openSession();
		Query q=hbSession.createQuery("from Product");
		List<Product> list=q.list();
		hbSession.close();
		return list;
	}
	
	
	public List<Product> getProductsByCategory(int categoryID) {
		hbSession=FactoryProvider.getFactory().openSession();
		Query q=hbSession.createQuery("from Product as p where p.category.categoryId=:id");
			  q.setParameter("id", categoryID);
		List<Product> list=q.list();
		hbSession.close();
		return list;
	}
}
