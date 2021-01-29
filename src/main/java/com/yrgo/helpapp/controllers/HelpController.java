package com.yrgo.helpapp.controllers;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yrgo.helpapp.entities.Account;
import com.yrgo.helpapp.entities.Help;
import com.yrgo.helpapp.services.AccountService;
import com.yrgo.helpapp.services.CategoryService;
import com.yrgo.helpapp.services.HelpServiceImplementation;

@Controller
@RequestMapping(value = "help")
public class HelpController{

	@Autowired
	private HelpServiceImplementation helpService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private AccountService accountService;
	

	@RequestMapping(value = "send", method = RequestMethod.GET)
	public String send(ModelMap modelMap) {
		Help help = new Help();
		modelMap.put("help", help);
		modelMap.put("categories", categoryService.findAll());
		return "help.send";
	}
	
	@RequestMapping(value = "send", method = RequestMethod.POST)
	public String send(@ModelAttribute("help") Help help, 
			Authentication authentication, RedirectAttributes redirectAttributes) {
		try {
			Account account = accountService.findByUsername(authentication.getName());
			help.setAccount(account);
			help.setCreatedDate(new Date());
			helpService.save(help);
			redirectAttributes.addFlashAttribute("success", "Request sent");
			
		}catch(Exception e) {
			redirectAttributes.addFlashAttribute("error", "Failed to send");
		}
		return "redirect:/help/send";
	}
	
	@RequestMapping(value = "history" , method = RequestMethod.GET)
	public String history(Authentication authentication, ModelMap modelMap) {
		modelMap.put("requests", helpService.findHelpByUsername(authentication.getName()));
		return "help.history";
	}
	
	@RequestMapping(value = "details/{id}", method = RequestMethod.GET)
	public String details(@PathVariable("id") int id, ModelMap modelMap) {
		modelMap.put("request", helpService.find(id));
		return "help.details";
	}


}
