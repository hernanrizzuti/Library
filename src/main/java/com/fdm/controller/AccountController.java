package com.fdm.controller;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Scope("session")
public class AccountController {
	
	@RequestMapping(value="/account.html", method = RequestMethod.GET)
	public String account(){
		return "account";
	}

}
