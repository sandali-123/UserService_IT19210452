package com;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Users;

/**
 * Servlet implementation class AuthAPI
 */
@WebServlet("/AuthAPI")
public class AuthAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Users userObj = new Users();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		HttpSession session = request.getSession();
		 String authStatus = userObj.login(request.getParameter("txtUsername"),
		 request.getParameter("txtPassword"));
		 System.out.println("sttttttttt  :"+authStatus);
		 String output = "";
		if (authStatus.equals("success"))
		 {
		 output = "{\"status\":\"success\", \"data\": \"\"}";
		 session.setAttribute("username",
		 request.getParameter("txtUsername"));
		 }
		else
		 {
		 output = "{\"status\":\"error\", \"data\": \"" + authStatus + "\"}";
		 }
		 response.getWriter().write(output); 
	
	
	}
	
	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			 throws ServletException, IOException
			{
			 HttpSession session = request.getSession();
			session.invalidate();
			response.getWriter().write("success");
			}

}
