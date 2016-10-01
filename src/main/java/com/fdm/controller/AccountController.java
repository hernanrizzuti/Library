package com.fdm.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.User;
import com.fdm.model.dbstorage.UserDAO;

@Controller
@Scope("session")
public class AccountController {
	@Resource(name="userdao")
	private UserDAO userDao;
	
	@RequestMapping(value="/account.html", method = RequestMethod.GET)
	public String account(){
		return "account";
	}
	
	@RequestMapping(value="/mychanges.html", method = RequestMethod.GET)
	public String myAccountChanges(HttpServletRequest req){
		
		try {
			String username = (String) req.getSession().getAttribute("usersession");
			User user = userDao.getUser(username);
			req.setAttribute("user", user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "mychanges";
	}

}
