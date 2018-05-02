package main.java.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

import main.java.demo.models.Invoice;
import main.java.demo.repositories.InvoiceRepository;

@ImportResource({"classpath:applicationContext.xml"})
@SpringBootApplication
public class Main implements CommandLineRunner {

	@Autowired
	private InvoiceRepository invoiceRepository;

	public static void main(String[] args) {
		SpringApplication.run(Main.class, args).close();
	}

	@Override
	public void run(String... args) throws Exception {
		System.out.println("PostConstruct");
		System.out.println("Full List:");
		for (Invoice i : invoiceRepository.findAll()) {
			System.out.println(i.toString());
		}
		System.out.println("Searching by Carrier 'test':");
		for (Invoice i : invoiceRepository.findByCarrier("test")) {
			System.out.println(i.toString());
		}
	}

}
