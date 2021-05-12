package com;

import java.io.IOException;


import model.Users;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UserAPI")
public class UserAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Users  usersobj = new Users();
	public UserAPI() {
		super();


	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//not used
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String output = usersobj.insertUser(request.getParameter("fname"), request.getParameter("lname"), request.getParameter("nic"), request.getParameter("addr"),
				request.getParameter("pno"), request.getParameter("email"), request.getParameter("uname"), request.getParameter("pwd"), request.getParameter("type"));

		response.getWriter().write(output);

	}


	// Convert request parameters to a Map
	private static Map getParasMap(HttpServletRequest request)
	{
		Map<String, String> map = new HashMap<String, String>();
		try
		{
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
			String queryString = scanner.hasNext() ?
					scanner.useDelimiter("\\A").next() : "";
					scanner.close();
					String[] params = queryString.split("&");
					for (String param : params)
					{

						String[] p = param.split("=");
						map.put(p[0], p[1]);
					}
		}
		catch (Exception e)
		{
		}
		return map;
	}

	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Map paras = getParasMap(request);

		String output = usersobj.updateUserinfo(paras.get("hidUserIDSave").toString(),paras.get("fname").toString(), paras.get("lname").toString(), paras.get("nic").toString(), paras.get("addr").toString(),
				paras.get("pno").toString(), paras.get("email").toString(), paras.get("uname").toString(), paras.get("pwd").toString(), paras.get("type").toString());
		response.getWriter().write(output);

		System.out.println("tynynu :"+paras.get("email"));


	}


	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Map paras = getParasMap(request);
		String output = usersobj.deleteUserinfo(paras.get("U_id").toString());
		response.getWriter().write(output);
	}

}