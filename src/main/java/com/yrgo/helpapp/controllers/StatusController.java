package com.yrgo.helpapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yrgo.helpapp.entities.Status;
import com.yrgo.helpapp.services.StatusServiceImplementation;

@Controller
@RequestMapping(value = "status")
public class StatusController {
	
	@Autowired
	private StatusServiceImplementation statusService;
	
	//Shows all the statuses that are available
	@RequestMapping(value= {"", "index"}, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		modelMap.put("statuses", statusService.findAll());
		return "status.index";
	}
	
	//methods to add and save a new status
	@RequestMapping(value= "add", method = RequestMethod.GET)
	public String add(ModelMap modelMap) {
			Status status = new Status();
			status.setDisplay(true);
			modelMap.put("status", status);
			return "status.add";
	}
	
	@RequestMapping(value= "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("status") Status status ,ModelMap modelMap) {
		try {
			statusService.save(status);
			return "redirect:/status";
		}catch (Exception e) {
			modelMap.put("error", "Failed to save. The name is already on the list. No duplicates please!");
			return "status.add";
		}

	}
	
	//methods to edit and save an existing status
	@RequestMapping(value= "edit/{statusId}", method = RequestMethod.GET)
	public String edit(@PathVariable("statusId") int id, ModelMap modelMap) {
		Status status = statusService.find(id);
		modelMap.put("status", status);
		return "status.edit";
	}
	
	@RequestMapping(value= "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("status") Status status, ModelMap modelMap) {
		try {statusService.save(status);
			return "redirect:/status";
		}catch (Exception e) {
			modelMap.put("error", "Failed to edit. The name is already on the list. No duplicates please!");
			modelMap.put("status", status);
			return "status.edit";
		}

	}
	
	@RequestMapping(value= "delete/{statusId}", method = RequestMethod.GET)
	public String delete(@PathVariable("statusId") int id, RedirectAttributes redirectAttributes) {
		try {
			statusService.delete(id);
		}catch(Exception e) {
			redirectAttributes.addFlashAttribute("error", "Failed to delete");
		}
		
		return "redirect:/status";
	}

}
