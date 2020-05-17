package com.mycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.dao.UserDao;
import com.mycart.daoImpl.UserDaoimpl;
import com.mycart.entities.User;
import com.mycart.util.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		UserDao userDao=new UserDaoimpl();
		try {
			
			String userName=request.getParameter("name").toString();
			String userEmail=request.getParameter("email").toString();
			String userPassword=request.getParameter("password").toString();
			String userPhone=request.getParameter("phone").toString();
			String userAddress=request.getParameter("address").toString();
			
			if(userName==null || userName.isEmpty()) {
				out.println("user name empty");
				return;
			}
			
			User user=new User(userName, userEmail, userPassword, userPhone, "userPic", userAddress,"Admin");
					
			int userId=userDao.registerUser(user);		
			/*
			 * Session hbSession=FactoryProvider.getFactory().openSession(); Transaction
			 * tx=hbSession.beginTransaction();
			 * 
			 * int userId=(Integer) hbSession.save(user);
			 * 
			 * tx.commit(); hbSession.close();
			 */
			
			HttpSession httpSession=request.getSession();
			if(userId!=0) {
				httpSession.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> User registered successfully with user id "+userId+"</div>");
			}else {
				httpSession.setAttribute("message", "<div class=\"alert alert-warning\" role=\"alert\">Email id is already exists!!</div>");
			}
			response.sendRedirect("register.jsp");
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
