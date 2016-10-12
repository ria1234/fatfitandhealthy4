package fatfitandhealthy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import fatfitandhealthy.methods.sendemail;

@Controller

public class login {
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index()
	{
		return "index";
	}
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login()
	{
		return "login";
	}
	@RequestMapping(value="/contact",method=RequestMethod.POST)
	public String contact(@RequestParam(value="name") String name,@RequestParam(value="mail") String mail,@RequestParam(value="subject") String subject,@RequestParam(value="message") String message)
	{
		if (sendemail.email(name, mail, subject, message)) {
			return "redirect:/";
		} else {
			return "redirect:/";	
		}
		
		
	}
}
