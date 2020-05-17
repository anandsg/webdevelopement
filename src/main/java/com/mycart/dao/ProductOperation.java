package com.mycart.dao;

import java.util.List;

import com.mycart.entities.Category;
import com.mycart.entities.Product;

public interface ProductOperation {

	public int addCategory(Category category);
	
	public List<Category> categorylist();
	
	public Category getCategoryById(int categoryId);
	
	public int addProduct(Product product);
	
	public List<Product> productList();
	
	public List<Product> getProductByCategory(int categoryId);
	
	
	
}
