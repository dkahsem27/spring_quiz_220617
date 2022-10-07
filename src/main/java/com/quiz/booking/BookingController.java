package com.quiz.booking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/booking")
@Controller
public class BookingController {

	// 메인
	@RequestMapping("/main")
	public String bookingMain() {
		return "booking/main";
	}
	
	// 예약 목록
	@RequestMapping("/booking_list_view")
	public String bookingListView() {
		return "booking/bookingList";
	}
	
	// 예약 하기
	@RequestMapping("/add_booking_view")
	public String addBookingView() {
		return "booking/addBooking";
	}
}
