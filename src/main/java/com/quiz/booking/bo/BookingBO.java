package com.quiz.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.quiz.booking.dao.BookingDAO;
import com.quiz.booking.model.Booking;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}

	public int addBooking(String name, Date date, int day, int headcount, String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public Booking getLatestBooking(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingListByNamePhoneNumber(name, phoneNumber);  // [], 채워져있거나 (null이 나올 수 없음)
		if (CollectionUtils.isEmpty(bookingList)) {
			return null;
		} 
		
		return bookingList.get(bookingList.size() - 1); // 마지막(최신) 인덱스 데이터 가져옴
	}
}
