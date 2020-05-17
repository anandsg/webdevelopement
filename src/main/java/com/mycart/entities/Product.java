package com.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	
	private String productName;
	@Column(length = 3500)
	private String productDescription;
	private String prodcutPhoto;
	private String productPrice;
	private int productDiscount;
	private int productQuantity;
	
	@ManyToOne
	private Category category;
	
	
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProdcutPhoto() {
		return prodcutPhoto;
	}
	public void setProdcutPhoto(String prodcutPhoto) {
		this.prodcutPhoto = prodcutPhoto;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductDiscount() {
		return productDiscount;
	}
	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}
	public int getProductQuantity() {
		return productQuantity;
	}
	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int productId, String productName, String productDescription, String prodcutPhoto,
			String productPrice, int productDiscount, int productQuantity, Category category) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.productDescription = productDescription;
		this.prodcutPhoto = prodcutPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.category = category;
	}
	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", prodcutPhoto=" + prodcutPhoto + ", productPrice=" + productPrice
				+ ", productDiscount=" + productDiscount + ", productQuantity=" + productQuantity + ", category="
				+ category + "]";
	}
	
	
	
	
	
	
	
}
