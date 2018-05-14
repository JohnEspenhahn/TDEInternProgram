package demo.controllers;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import demo.models.Carrier;
import demo.models.Client;
import demo.models.Invoice;
import demo.repositories.ClientRepository;
import demo.repositories.InvoiceRepository;
import demo.repositories.CarrierRepository;

@Controller
public class InvoiceController {
	Logger log = LogManager.getLogger(InvoiceController.class);
	
	@Autowired
	private InvoiceRepository invoiceRepository;
	
	@Autowired
	private ClientRepository clientRepository;
	
	@Autowired
	private CarrierRepository carrierRepository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:invoiceList";
	}
	
	@RequestMapping(value = "/invoiceList", method = RequestMethod.GET)
	public String invoiceList(
			@RequestParam(value = "page", required = false, defaultValue = "0") Integer page, 
			ModelMap model) 
	{
		int page_size = 3;
		

		
		// `model` is a collection of variable_name -> variable_values
		// we can reference `variable_name` in the view (see invoiceList.html)
		model.addAttribute("page", page);
		model.addAttribute("page_size", page_size);
		model.addAttribute("invoices", invoiceRepository.findAll(page, page_size));
		
		return "invoiceList"; // which view from "webapp/WEB-INF/views" to use
	}
	
	@RequestMapping(value ="/invoiceEdit", method = RequestMethod.GET)
	public String invoiceEdit(
			@RequestParam(value = "fbnumber", required = false, defaultValue = "-1") Long fbnumber,
			ModelMap model)
	{
		Invoice inv = null;
		if (fbnumber >= 0) {
			// Try to find the existing fbnumber
			inv = invoiceRepository.findByFbnumber(fbnumber);
			if (inv == null) {
				// Failed to find, go back to list
				return "redirect:invoiceList";
			}
		} else {
			// Creating a new invoice
			inv = new Invoice();
		}
		
		//load the carriers/clients
		List<Carrier> carriers = carrierRepository.getAll();
		List<Client> clients = clientRepository.getAll();
		
		
		
		// Add to let view see the variable
		model.addAttribute("inv", inv);
		model.addAttribute("carriers", carriers);
		model.addAttribute("clients", clients);
		
		return "invoiceEdit";
	}
}
