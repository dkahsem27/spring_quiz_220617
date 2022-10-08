package com.quiz.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.dao.BookingDAO;
import com.quiz.booking.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBooking() {
		return bookingDAO.selectBooking();
	}

	public void addBooking(String name, Date date, int day, int headcount, String phoneNumber, String state) {
		bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, state);
	}
	
	public int deleteBooking(int id) {
		return bookingDAO.deleteBooking(id);
	}
	
	public List<Booking> getBookingByNameAndPhoneNumber(String name, String phoneNumber) {
		return bookingDAO.selectBookingByNameAndPhoneNumber(name, phoneNumber);
	}
}
