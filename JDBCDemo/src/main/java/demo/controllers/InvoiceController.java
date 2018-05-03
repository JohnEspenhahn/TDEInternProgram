package demo.controllers;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import demo.repositories.InvoiceRepository;

@Controller
public class InvoiceController {
	Logger log = LogManager.getLogger(InvoiceController.class);
	
	@Autowired
	private InvoiceRepository invoiceRepository;

	@RequestMapping(value = "/invoiceList", method = RequestMethod.GET)
	public String invoiceList(
			@RequestParam(value = "page", required = false, defaultValue = "0") Integer page, 
			ModelMap model) 
	{
		int page_size = 3;
		
		model.addAttribute("page", page);
		model.addAttribute("page_size", page_size);
		model.addAttribute("invoices", invoiceRepository.findAll(page, page_size));
		
		return "invoiceList";
	}
}
