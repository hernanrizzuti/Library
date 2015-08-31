package com.fdm.model.validation;

import java.sql.SQLException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import com.fdm.model.dbstorage.UserDAO;

public class UserValidator {

	private Pattern pattern;
	private Matcher matcher;
	
	@Resource(name="userdao") 
	private UserDAO userdao;
	/*
	 * Whole combination is means, 6 to 20 characters 
	 * string with at least one digit, one upper case letter,
	 *  one lower case letter and one special symbol (“@#$%”)
	 */
	private final String PASSWORD_PATTERN = 
			"((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%]).{6,20})";
	/*
	 Whole combination is means, 3 to 15 characters 
	 with any lower case character, digit or special symbol “_-” only. 
	 */
	private final String USERNAME_PATTERN = "^[a-zA-Z0-9_.-]{3,15}$";
	/*
	 Whole combination is means, any number of characters
	 with any lower case character Or Capital latter, special symbol “-” only. 
	 */
	private final String NAME_PATTERN = "^[\\p{L} .'-]+$";
	/*
	 * The combination means, email address must start with “_A-Za-z0-9-\\+”, 
	 * optional follow by “.[_A-Za-z0-9-]“, and end with a “@” symbol. The 
	 * email’s domain name must start with “A-Za-z0-9-“, follow by first level 
	 * Tld (.com, .net) “.[A-Za-z0-9]” and optional follow by a second level 
	 * Tld (.com.au, .com.my) “\\.[A-Za-z]{2,}”, where second level Tld must 
	 * start with a dot “.” and length must equal or more than 2 characters.
	 */
	private final String EMAIL_PATTERN = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	public boolean isPasswordValid(String password){
		
		return isPatternValid(password, PASSWORD_PATTERN);
	}

	public boolean doPasswordsMatch(String password, String confirmPassword){
		return password.equals(confirmPassword);
	}

	public boolean isUsernameValid(String username){
		
		return isPatternValid(username, USERNAME_PATTERN);
	}

	public boolean isFullNameValid(String fullname){
		
		return isPatternValid(fullname, NAME_PATTERN);
	}

	public boolean isEmailValid(String email){

		return isPatternValid(email, EMAIL_PATTERN);
	}
	
	public boolean isPatternValid(String input, String regex) {
		pattern = Pattern.compile(regex);
		matcher = pattern.matcher(input);
		return matcher.matches();
	}
	
	public boolean usernameExist(String username) throws SQLException {
		/*returns true if the username is not null 
		(i.e the username already exist in the db)
		*/
		return userdao.getRole(username) != null;
	}
	

}