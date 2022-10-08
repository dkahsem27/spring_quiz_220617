package com.quiz.booking;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.model.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;

	// 메인
	@RequestMapping("/main")
	public String bookingMain() {
		return "booking/main";
	}
	
	// 예약목록(view)
	@RequestMapping("/booking_list_view")
	public String bookingListView(Model model) {
		
		List<Booking> bookingList = bookingBO.getBooking();
		model.addAttribute("bookingList", bookingList);
		
		return "booking/bookingList";
	}
	
	// 예약하기(view)
	@RequestMapping("/add_booking_view")
	public String addBookingView() {
		return "booking/addBooking";
	}
	
	// 예약하기
	@ResponseBody
	@PostMapping("/add_booking")
	public String addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") @DateTimeFormat(pattern="yyyy-MM-dd") Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("state") String state) {
		
		bookingBO.addBooking(name, date, day, headcount, phoneNumber, state);
		
		return "성공";
	}
	
	// 삭제하기
	@ResponseBody
	@DeleteMapping("/delete_booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		
		Map<String, Object> result = new HashMap<>();
		
		int deleteRow = bookingBO.deleteBooking(id);
		if (deleteRow > 0) {
			result.put("code", 100); // 성공
			//result.put("result", "삭제 성공");
		} else {
			result.put("code", 500); // 실패
			//result.put("errorMessage", "삭제 실패");
		}
		
		return result;
	}
	
	// 조회하기
	@ResponseBody
	@PostMapping("/search_booking")
	public Map<String, List<Booking>> searchBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		List<Booking> result = bookingBO.getBookingByNameAndPhoneNumber(name, phoneNumber);
		Map<String, List<Booking>> map = new HashMap<>();
		map.put("result", result);
		
		return map;
	}
}
