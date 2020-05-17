package com.mycart.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycart.dao.UserDao;
import com.mycart.daoImpl.UserDaoimpl;
import com.mycart.entities.User;

/**
 * Servlet implementation class AuthServlet
 */
public class AuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthServlet() {
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
		HttpSession httpSession=request.getSession();
		try {
			
			String userName=(String)request.getParameter("email");
			String password=(String)request.getParameter("password");
			
			User user=userDao.authenticateUser(userName, password);
			
			if(user==null) {
				httpSession.setAttribute("message", "<div class=\"alert alert-success\" role=\"alert\"> Invalid user details </div>");
				response.sendRedirect("login.jsp");
			}else {
				httpSession.setAttribute("sid", "1");
				httpSession.setAttribute("logged-user", user);
				
				if(user.getUserType().equalsIgnoreCase("admin")) {
					response.sendRedirect("dashboard.jsp");
				}else {
					response.sendRedirect("normaldashboard.jsp");
				}
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
