package com.yrgo.helpapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yrgo.helpapp.entities.Account;
import com.yrgo.helpapp.services.AccountService;

@Controller
@RequestMapping(value = "account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("accounts", accountService.findAll());
		return "account.index";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(Authentication authentication, ModelMap modelMap) {
		modelMap.put("account", accountService.findByUsername(authentication.getName()));
		return "account.profile";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String profile(@ModelAttribute("account") Account account) {
		Account currentAccount = accountService.findByUsername(account.getUsername());
		if(!account.getPassword().isEmpty()) {
			currentAccount.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
		}
		currentAccount.setUsername(account.getUsername());
		currentAccount.setEmail(account.getEmail());
		currentAccount.setFullName(account.getFullName());
		accountService.save(currentAccount);
		return "redirect:/account/profile";
	}
	
	
	//methods for adding and saving a student account
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
		Account account = new Account();
		modelMap.put("account", account);
		return "account.add";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("account") Account account, ModelMap modelMap) {
		try {
			account.setPassword(new BCryptPasswordEncoder().encode(account.getPassword()));
			accountService.save(account);
			return "redirect:/account";
			
		}catch(Exception e) {
			modelMap.put("error", "Failed to save new student");
			return "account.add";
			
		}

	}

}
