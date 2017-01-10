package com.fdm.controller;

import java.security.Principal;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fdm.model.User;
import com.fdm.model.dbstorage.UserDAO;
import com.fdm.model.validation.RegisterValidation;

@Controller
@Scope("session")
public class AccountController {
	@Resource(name="userdao")
	private UserDAO userDao;
	@Resource (name="registerValidation")
	private RegisterValidation regval;

	@RequestMapping(value="/account.html", method = RequestMethod.GET)
	public String account(){
		return "account";
	}

	@RequestMapping(value="/mychanges.html", method = RequestMethod.GET)
	public String myAccountChanges(HttpServletRequest req){
		try {
			String username = (String) req.getSession().getAttribute("usersession");
			User user = userDao.getUser(username);
			req.getSession().setAttribute("user", user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "mychanges";
	}

	@RequestMapping(value="/accountLogin.html", method=RequestMethod.GET)
	public String getAccountLoginForm(HttpServletRequest req, Principal principal){
		return "accountLogin";
	}

	@RequestMapping(value="/edit-{acccountAttr}.html", method=RequestMethod.GET)
	public String accountDetailForm(@PathVariable String acccountAttr,HttpServletRequest req){
		User user = (User) req.getSession().getAttribute("user");
		switch(acccountAttr){
		case "title":
			req.setAttribute("title", user.getTitle());
			break;
		case "name":
			req.setAttribute("firstName", user.getFirstName());
			req.setAttribute("lastName", user.getLastName());
			break;
		case "email":
			req.setAttribute("email", user.getEmail());
			break;
		case "password":
			req.setAttribute("password", "");
			break;
		default:
			//need to set up this attribute in
			req.setAttribute("error", " Account Attribute Not Recognised");
			return "mychanges";
		}
		req.setAttribute("acccountAttr", acccountAttr);
		return "accountdetailform";
	}

	@RequestMapping(value="/new-{acccountAttr}.html", method=RequestMethod.POST)
	public String changeAccountDetails(@PathVariable String acccountAttr,HttpServletRequest req){
		User user = (User) req.getSession().getAttribute("user");
		switch(acccountAttr){
		case "title":
			user.setTitle_id(Integer.parseInt(req.getParameter("title")));
			break;
		case "name":
			if(regval.fullnameisValid(req)){
				user.setFirstName(req.getParameter("firstName"));
				user.setLastName(req.getParameter("lastName"));
			}else{
				req.setAttribute("acccountAttr", acccountAttr);
				//set in page a firtNameOrLastNameerr var to display error.
				return "accountdetailform";
			}
			break;
		case "email":
			if(regval.emailIsValid(req)){
				String email = req.getParameter("email");
				if(email.equals(req.getParameter("confirmEmail"))){
					user.setEmail(email);
				}else{
					req.setAttribute("acccountAttr", acccountAttr);
					req.setAttribute("emailerr", "Email does not match re-entered email address.");
					return "accountdetailform";
				}
			}else{
				req.setAttribute("acccountAttr", acccountAttr);
				//set in page a emailerr var to display error.
				return "accountdetailform";
			}
			break;
		case "password":
			if(regval.passwordIsValid(req)){
				user.setPassword(req.getParameter("password"));
			}else{
			//set in page a passworderr var to display error.
			return "accountdetailform";
			}
			break;
		default:
			//need to set up error this attribute in
			req.setAttribute("error", " Account Attribute Not Recognised");
			return "mychanges";
		}
		userDao.updateUser(user);
		return null;
	}

}
