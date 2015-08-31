package com.fdm.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.validation.RegisterValidation;
import com.fdm.model.User;
import com.fdm.model.dbstorage.UserDAO;
import com.fdm.model.service.UserFactory;

@Controller
@Scope("session")
public class Registration {

	@Resource(name="user")
	User user;

	@Resource(name="userFactory")
	UserFactory userFactory;

	@Resource(name="userdao")
	UserDAO userdao;
	@Resource (name="registerValidation")
	private RegisterValidation regval;

	@RequestMapping(value="/subscribe.html", method=RequestMethod.GET)
	public String registrationForm(){
		return "regform";
	}

	@RequestMapping(value="/regsubmission.html", method=RequestMethod.POST)
	public String registerSubmission(HttpServletRequest req){
		try {
			if (!regval.userDetailsAreValid(req)){
				return "regform";
				/*all EL needs to be set in regform.jsp... see Register for variables name*/
			}else{
				user = userFactory.createUser(user, req);
				userdao.addUser(user);
				req.setAttribute("user", user);
			}
		} catch (SQLException e) {
			req.setAttribute("error", "Oops Something went wrong :-(."
					+ " So unfortunatelly we couldn't subscribe you this"
					+ " time, please try again later.");
			e.printStackTrace();
		}
		return "index";
	}
}