package com.mycart.daoImpl;

import java.util.List;

import com.mycart.dao.ProductOperation;
import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.util.HibernateUtility;

public class ProductOperationImpl implements ProductOperation {

	HibernateUtility hibernateUtility;
	
	@Override
	public int addCategory(Category category) {
		int categoryId=0;
	try {
		this.hibernateUtility=new HibernateUtility();
		categoryId=this.hibernateUtility.saveCategory(category);
	} catch (Exception e) {
		e.printStackTrace();
	}
		return categoryId;
	}

	@Override
	public List<Category> categorylist() {
		List<Category> categories=null;
		try {
			this.hibernateUtility=new HibernateUtility();
			categories=this.hibernateUtility.getCategories();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return categories;
	}

	@Override
	public Category getCategoryById(int categoryId) {
		Category category=null;
		try {
			this.hibernateUtility=new HibernateUtility();
			category=this.hibernateUtility.getCategoryById(categoryId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}

	@Override
	public int addProduct(Product product) {
		int productId=0;
		try {
			this.hibernateUtility=new HibernateUtility();
			productId=this.hibernateUtility.saveProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productId;
	}

	@Override
	public List<Product> productList() {
		List<Product> products=null;
		try {
			this.hibernateUtility=new HibernateUtility();
			products=this.hibernateUtility.getProducts();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	@Override
	public List<Product> getProductByCategory(int categoryId) {
		List<Product> products=null;
		try {
			this.hibernateUtility=new HibernateUtility();
			products=this.hibernateUtility.getProductsByCategory(categoryId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}


}
