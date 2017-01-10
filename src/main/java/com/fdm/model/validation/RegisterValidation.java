package com.fdm.model.validation;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;

public class RegisterValidation extends Validation{

	public boolean userDetailsAreValid(HttpServletRequest userreq) throws SQLException{
		int count = 0;
		if(usernameIsValid(userreq))
			count++;
		if(passwordIsValid(userreq))
			count++;
		if(fullnameisValid(userreq))
			count++;
		if(emailIsValid(userreq))
			count++;
		/*
		if all of the above are true then count will be 4. That way 
		we can guarantee that all of the values are going to be set 
		whether they are true or false. So feedback  will be given 
		to the regform.jsp or any other jsp that uses username...etc.
		 */
		if(count == 4){
			return true;
		}else {
			return false;
		}
	}
}