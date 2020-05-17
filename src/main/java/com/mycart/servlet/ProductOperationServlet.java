package com.mycart.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycart.dao.ProductOperation;
import com.mycart.daoImpl.ProductOperationImpl;
import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.util.FileOperationUtility;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession httpSession=request.getSession();
		ProductOperation po=new ProductOperationImpl();
		FileOperationUtility fo=new FileOperationUtility();
		try {
			
			String operation=request.getParameter("operation");
			if(operation.equalsIgnoreCase("category")) {
				String categoryTitle=request.getParameter("categoryTitle");
				String categoryDescription=request.getParameter("categoryDescription");
				Category category=new Category();
				category.setCategoryTitle(categoryTitle);
				category.setCategoryDescription(categoryDescription);
				int categoryId=po.addCategory(category);
				httpSession.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> Category added successfully with Category ID "+categoryId+"</div>");
				response.sendRedirect("dashboard.jsp");
			}else {
				String productName=request.getParameter("productName");
				int categoryId=Integer.parseInt(request.getParameter("category"));
				String productPrice=request.getParameter("productPrice");
				int productDiscount=Integer.parseInt(request.getParameter("productDiscount"));
				int productQuantity=Integer.parseInt(request.getParameter("productQuantity"));
				String productDescription=request.getParameter("productDescription");
				Part part=request.getPart("productpic");
				
				Product product=new Product();
				product.setProductName(productName);
				product.setProductPrice(productPrice);
				product.setProductQuantity(productQuantity);
				product.setProductDiscount(productDiscount);
				product.setProductDescription(productDescription);
				product.setProdcutPhoto(part.getSubmittedFileName());
				
				Category category=po.getCategoryById(categoryId);
				product.setCategory(category);
				fo.writeFileOnSpecifiedPath(part, part.getSubmittedFileName());
				int productId=po.addProduct(product);
				httpSession.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> Product added successfully with Product ID "+productId+"</div>");
				response.sendRedirect("dashboard.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
