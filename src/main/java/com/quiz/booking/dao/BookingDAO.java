package com.quiz.booking.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.booking.model.Booking;

@Repository
public interface BookingDAO {

	public List<Booking> selectBooking();
	
	public void insertBooking(
			@Param("name") String name, 
			@Param("date") Date date, 
			@Param("day") int day, 
			@Param("headcount") int headcount, 
			@Param("phoneNumber") String phoneNumber,
			@Param("state") String state);
	
	public int deleteBooking(int id);
	
	public List<Booking> selectBookingByNameAndPhoneNumber(
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
}
