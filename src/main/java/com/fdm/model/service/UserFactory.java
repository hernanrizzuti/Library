package com.fdm.model.service;

import javax.servlet.http.HttpServletRequest;

import com.fdm.model.User;

public class UserFactory {
	
	public User createUser(User user, HttpServletRequest req){
		user.setTitle(parseTitle(req.getParameter("title")));
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setFirstName(req.getParameter("firstName"));
		user.setLastName(req.getParameter("lastName"));
		user.setEmail(req.getParameter("email"));
		user.setEnabled(1);
		user.setAuthority("ROLE_USER");
		return user;
	}
	
	public int parseTitle(String reqString) {
		return Integer.parseInt(reqString);
	}

}
