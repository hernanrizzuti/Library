package com.fdm.model.validation;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

public abstract class Validation {
	
	private UserValidator userval;

	@Resource(name="userValidator")
	public void setUserval(UserValidator userval) {
		this.userval = userval;
	}

	public boolean passwordIsValid(HttpServletRequest userreq) {
		//checking username
		String password = userreq.getParameter("password");
		String confirmPassword = userreq.getParameter("confirmPassword");
		if(isEmpty(password)){
			userreq.setAttribute("passworderr", " Passwords is required");
			return false;
		}else{
		if(userval.isPasswordValid(password)){
			if(!userval.doPasswordsMatch(password, confirmPassword)){
				userreq.setAttribute("passworderr", " Passwords do not match");
				return false;
			}
		}else{
			userreq.setAttribute("passworderr", " Invalid password");
			return false;
		}
		return true;
		}
	}

	public boolean usernameIsValid(HttpServletRequest userreq) throws SQLException {
		//checking username
		String username = userreq.getParameter("username");
		if(isEmpty(username)){
			userreq.setAttribute("usernameerr", " Username is required");
			return false;
		}else{
			if(userval.isUsernameValid(username)){
				//if username does NOT exist set attribute just in case something fails afterwards 
				if(!userval.usernameExist(username)){
					userreq.setAttribute("username", username);
				}else{
					userreq.setAttribute("usernameerr", " Username already exist");
					return false;
				}
			}else{
				userreq.setAttribute("usernameerr", " Invalid username");
				return false;
			}
			return true;
		}
	}
	
	public boolean fullnameisValid(HttpServletRequest userreq) {
		//checking fullname
		String firtName = userreq.getParameter("firstName");
		String lastName = userreq.getParameter("lastName");
		String fullname = firtName +" "+ lastName;
		String temp = fullname.trim();
		if(isEmpty(temp)){
			userreq.setAttribute("firtNameOrLastNameerr", " Firstname and lastname are required");
			return false;
		}else{
			if(userval.isFullNameValid(fullname)){
				userreq.setAttribute("firtName", firtName);
				userreq.setAttribute("lastName", lastName);
			}else{
				userreq.setAttribute("firtNameOrLastNameerr", " Invalid firstname or lastname");
				return false;
			}
			return true;
		}
	}
	public boolean emailIsValid(HttpServletRequest userreq) {
		//checking email
		String email = userreq.getParameter("email");
		if(isEmpty(email)){
			userreq.setAttribute("emailerr", " email address is required");
			return false;
		}else{
			if(userval.isEmailValid(email)){
				userreq.setAttribute("email", email);
			}else{
				userreq.setAttribute("emailerr", " Invalid email address");
				return false;
			}
			return true;
		}
	}
	public boolean isEmpty(String input){
		return input.equals("");
	}

}
