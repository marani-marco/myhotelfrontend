package com.marco.myhotelfrontend.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.marco.myhotelfrontend.models.Booking;
import com.marco.myhotelfrontend.models.BookingCustomerRequestWrapper;
import com.marco.myhotelfrontend.models.Customer;
import com.marco.myhotelfrontend.models.CustomersListBinding;
import com.marco.myhotelfrontend.models.Room;

@Controller
public class BookingControllerFE {

	@RequestMapping(value = "/cerca-prenotazione", method = RequestMethod.POST)
	public String searchAndShowRoomsAvailable(ModelMap model, @RequestParam String dateStart,
			@RequestParam String dateEnd, @RequestParam String people) {

		final String uri = "http://localhost:8586/bookings?dateStart=" + changeDateFormat(dateStart) + "&dateEnd="
				+ changeDateFormat(dateEnd) + "&people=" + people;

		RestTemplate restTemplate = new RestTemplate();

		try {

			String result = restTemplate.getForObject(uri, String.class);
			ObjectMapper objectMapper = new ObjectMapper();

			List<Room> roomsAvailable = new ArrayList<Room>();

			if (result == null) {
				model.put("errorMessage", "Nessuna camera disponibile per le date selezionate. Riprova.");
			} else {
				roomsAvailable = objectMapper.readValue(result, new TypeReference<List<Room>>() {
				});
				
					
				
				
				List<Customer> customersList = new ArrayList<Customer>();
				
				for(int i = 0; i < Integer.parseInt(people); i++) {
					customersList.add(new Customer());
				}
					
				CustomersListBinding customersListBinding = new CustomersListBinding();
				customersListBinding.setCustomersList(customersList);
				
				Booking booking = new Booking();

				booking.setDateStart(LocalDate.of(2021,9,29));			
				booking.setDateEnd(LocalDate.of(2021,9,30));
		
				model.put("roomsAvailable", roomsAvailable);
				model.addAttribute("booking", booking);
				model.addAttribute("customersListBinding", customersListBinding);
				
				return "nuovaPrenotazione";
			}

		} catch (JsonMappingException e) {
			model.put("errorMessage", e.toString());
		} catch (JsonProcessingException e) {
			model.put("errorMessage", e.toString());
		} catch (Exception e) {
			model.put("errorMessage", e.toString());
		}

		return "index";
	}

	@RequestMapping(value = "/prenota", method = RequestMethod.POST)
	public String saveBooking(ModelMap model,
			Booking booking, 
			@ModelAttribute("customersListBinding") CustomersListBinding customersListBinding)  {
			

		final String uri = "http://localhost:8586//save-booking";

		RestTemplate restTemplate = new RestTemplate();

		try {

			BookingCustomerRequestWrapper bookingCustomerRequestWrapper = new BookingCustomerRequestWrapper();

			bookingCustomerRequestWrapper.setBooking(booking);

			bookingCustomerRequestWrapper.setCustomers(customersListBinding.getCustomersList());

			bookingCustomerRequestWrapper = restTemplate.postForObject(uri, bookingCustomerRequestWrapper,
					BookingCustomerRequestWrapper.class);
			
			model.put("mainCustomer", bookingCustomerRequestWrapper.getCustomers().get(0));
			model.put("booking", bookingCustomerRequestWrapper.getBooking());


		} catch (Exception e) {
			model.put("errorMessage", e.toString());
		}

		return "riepilogoPrenotazione";

	}

	
	@RequestMapping(value = "/modifica-prenotazione/{externalID}", method = RequestMethod.GET)
	public String manageBooking(ModelMap model, @PathVariable("externalID") String externalID){
		
		final String uri = "http://localhost:8586//get-booking-by-external-id//" + externalID;

		RestTemplate restTemplate = new RestTemplate();
		
		ResponseEntity<BookingCustomerRequestWrapper> response = restTemplate.getForEntity(uri, BookingCustomerRequestWrapper.class);

		CustomersListBinding customersListBinding = new CustomersListBinding();
		
		customersListBinding.setCustomersList(response.getBody().getCustomers());
		
		model.addAttribute("booking", response.getBody().getBooking());
		model.addAttribute("customersListBinding", customersListBinding);
		
		
		return "gestisciPrenotazione";
	}
	
	private String changeDateFormat(String date) {
		final String OLD_FORMAT = "yyyy-MM-dd";
		final String NEW_FORMAT = "dd/MM/yyyy";

		SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
		Date d = new Date();
		try {
			d = sdf.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sdf.applyPattern(NEW_FORMAT);
		return sdf.format(d);
	}

}
